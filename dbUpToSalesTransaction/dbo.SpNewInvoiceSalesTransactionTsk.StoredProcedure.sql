USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpNewInvoiceSalesTransactionTsk]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpNewInvoiceSalesTransactionTsk]
(
	@json nvarchar(max)
)
AS
	BEGIN
		--SET NOCOUNT ON
		exec [dbo].[SpNewInvoiceIns] @json = @json output
		exec [dbo].[SpNewSalesTransactionInvoiceIdUpd] @json
	END;

GO
