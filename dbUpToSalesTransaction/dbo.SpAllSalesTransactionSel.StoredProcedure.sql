USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAllSalesTransactionSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[SpAllSalesTransactionSel]
AS
	BEGIN
		SET NOCOUNT ON;

		select
		(
			select
			(
				select distinct st.SalesTransactionId as salesTransactionId,
					c.CustomerId as customerId,
					concat(c.FirstName, ' ', c.LastName) as customerName,
					p.ProductId as productId,
					p.ProductName as productName,
					cast(st.Quantity as int) as quantity,
					st.Rate as rate,
					st.TotalAmount as totalAmount,
					st.InvoiceId as invoiceId
				from SalesTransaction as st
				inner join Customer as c
				on st.CustomerId = c.CustomerId
				inner join Product as p
				on st.ProductId = p.ProductId
				order by 1
				for json path, include_null_values
			) as 'data' for json path, without_array_wrapper
		 ) as 'Json'

	END;


GO
