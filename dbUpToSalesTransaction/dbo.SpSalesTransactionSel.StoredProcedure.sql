USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpSalesTransactionSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpSalesTransactionSel](@json nvarchar(max))
AS
	BEGIN
		--SET NOCOUNT ON;
		select
		(
			select
			(
				select distinct st.SalesTransactionId as 'salesTransactionId',
							p.ProductName as 'productName',
							st.Quantity as 'quantity',
							st.Rate as 'rate',
							st.TotalAmount as 'totalAmount',
							st.InvoiceId as 'invoiceId'
					from SalesTransaction as st
					inner join Product as p
					on st.ProductId = p.ProductId
					where 
						InvoiceId in (
							select oj.invoiceId
							from openjson(@json)
							with(
								invoiceId int
							)as oj
						)
					for json path, include_null_values
				) as 'data' for json path, without_array_wrapper
		)as 'Json'

	END;


GO
