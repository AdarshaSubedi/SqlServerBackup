USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpInvoiceSalesTransactionTsk]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpInvoiceSalesTransactionTsk]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON
		exec [dbo].[SpInvoiceIns] @json = @json output
		exec [dbo].[SpSalesTransactionInvoiceIdUpd] @json
	END;

GO
