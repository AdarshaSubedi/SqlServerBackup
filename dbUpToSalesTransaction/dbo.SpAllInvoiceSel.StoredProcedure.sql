USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAllInvoiceSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpAllInvoiceSel]
AS
	BEGIN
		SET NOCOUNT ON;

	select
	(
		select
		(
			select distinct i.InvoiceId as 'invoiceId',
			c.CustomerId as 'customerId',
			concat(c.LastName, ', ',c.FirstName, ' ', c.MiddleName ) as 'customerName',
			i.Amount as 'amount',
			i.AmountAfterDiscount as 'amountAfterDiscount',
			cast(i.InsertDate as date) as 'insertDate'
			from Invoice as i
			inner join Customer as c
			on i.CustomerId=c.CustomerId
			order by 1
			for json path, include_null_values
		) as 'data' for json path, without_array_wrapper
	) as 'Json'

	END;
GO
