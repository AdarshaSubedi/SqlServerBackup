USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerUpdTsk]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpCustomerUpdTsk]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		exec [dbo].[SpCustomerUpd] @json = @json output
		exec [dbo].[SpCustomerAddressUpd] @json 

	END;


GO
