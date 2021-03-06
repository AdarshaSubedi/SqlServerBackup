USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpInvoiceIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpInvoiceIns]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON

		declare @myTable table (
			ID int identity,
			CustomerId int,
			InsertPersonId int
		)
		insert into @myTable (
			[CustomerId],
			[InsertPersonId]
		)
		select 
			CustomerId, InsertPersonId
		from openjson(@json)
		with (
			CustomerId int '$.customerId',
			InsertPersonId int '$.insertPersonId'
		)
		set @json = (
			select st.CustomerId as 'customerId',
					sum(st.TotalAmount) as 'amount',
					m.InsertPersonId as 'insertPersonId',
					dbo.SfAmountAfterDiscountGet(st.CustomerId) as 'amountAfterDiscount'
			from @myTable as m
			inner join SalesTransaction as st
			on m.CustomerId = st.CustomerId
			where m.CustomerId = st.CustomerId and st.InvoiceId is null
			group by st.CustomerId, m.InsertPersonId
			for json path
		)

		insert into dbo.Invoice(
			[CustomerId],
			[Amount],
			[InsertPersonId],
			[AmountAfterDiscount]
		)
		select 
			CustomerId, Amount, InsertPersonId, AmountAfterDiscount
		from openjson(@json) 
		with(
			CustomerId int '$.customerId',
			Amount money '$.amount',
			InsertPersonId int '$.insertPersonId',
			AmountAfterDiscount money '$.amountAfterDiscount'
		) as oj

		select @json = (
			select i.InvoiceId as 'invoiceId',
					i.customerId as 'customerId'
			from Invoice as i
			for json path
		)
		 
	END;

GO
