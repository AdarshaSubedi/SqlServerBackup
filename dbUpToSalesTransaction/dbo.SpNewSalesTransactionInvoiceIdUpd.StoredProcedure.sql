USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpNewSalesTransactionInvoiceIdUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpNewSalesTransactionInvoiceIdUpd]
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
						salesTransactionId int,
						invoiceId int
					) as oj
				ON
					st.SalesTransactionId = oj.salesTransactionId
	END;

GO
