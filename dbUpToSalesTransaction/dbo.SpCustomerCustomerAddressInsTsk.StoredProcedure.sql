USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerCustomerAddressInsTsk]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpCustomerCustomerAddressInsTsk]
(
	@json nvarchar(max)
)
AS
	BEGIN
		EXEC [dbo].[SpCustomerIns] @json = @json output
		EXEC [dbo].[SpCustomerAddressIns] @json
	END
GO
