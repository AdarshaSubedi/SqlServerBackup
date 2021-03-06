USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpNewInvoiceIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpNewInvoiceIns]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON
		DECLARE @InsertPersonId int = 1;

		declare @invoiceTable table(
			Id int identity,
			InvoiceId int
		)
		declare @salesTable table (
			Id int identity,
			SalesTransactionId int
		)
		insert into @salesTable (
			[SalesTransactionId]
		)
		select 
			SalesTransactionId
		from openjson(@json)
		with (
			SalesTransactionId int '$.salesTransactionId'
		)

		declare @customerId int;
		declare @amount money;
		declare @amountAfterDiscount money;

		set @customerId = (
			select CustomerId from SalesTransaction
			where SalesTransactionId in (
				select oj.salesTransactionId
				from openjson(@json)
				with(
					salesTransactionId int
				) as oj
			) group by CustomerId
		)

		set @amount = (
			select sum(st.TotalAmount)
			from SalesTransaction as st
			where SalesTransactionId in (
				select oj.salesTransactionId
				from openjson(@json)
				with(
					salesTransactionId int
				) as oj
			)
		)

		set @amountAfterDiscount = dbo.SfNewAmountAfterDiscountGet(@amount)

		insert into Invoice(
			CustomerId,
			Amount,
			AmountAfterDiscount,
			InsertPersonId
		)
		output inserted.InvoiceId into @invoiceTable(InvoiceId)
		values(
			@customerId,
			@amount,
			@amountAfterDiscount,
			@InsertPersonId
		)

		set @json = (
			select  
					s.SalesTransactionId as 'salesTransactionId',
					i.InvoiceId as 'invoiceId'
			from @salesTable as s
			cross apply @invoiceTable as i
			inner join Invoice as inv on inv.InvoiceId = i.InvoiceId
			inner join SalesTransaction as st on st.SalesTransactionId = s.SalesTransactionId
			for json path
		)

		select @json
		 
	END;

GO
