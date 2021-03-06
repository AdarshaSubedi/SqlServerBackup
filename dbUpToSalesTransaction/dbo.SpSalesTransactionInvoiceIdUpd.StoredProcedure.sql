USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpSalesTransactionInvoiceIdUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpSalesTransactionInvoiceIdUpd]
(
	@json nvarchar(max)
)
AS
	BEGIN
		--SET NOCOUNT ON
		UPDATE st
				SET	
					st.InvoiceId = oj.invoiceId
				from dbo.SalesTransaction as st
				join	openjson(@json)
				with
					(
						customerId int,
						invoiceId int
					) as oj
				ON
					st.CustomerId = oj.customerId
	END;

GO
