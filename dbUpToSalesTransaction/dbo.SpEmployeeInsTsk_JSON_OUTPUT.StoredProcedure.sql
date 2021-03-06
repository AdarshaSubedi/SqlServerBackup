USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeInsTsk_JSON_OUTPUT]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpEmployeeInsTsk_JSON_OUTPUT]
(
	@json nvarchar(max)
)
AS
	BEGIN
		EXEC [dbo].[SpEmployeeIns_JSON_OUTPUT] @json = @json output
		EXEC [dbo].[SpEmployeeAddressIns_JSON_OUTPUT] @json
		EXEC [dbo].[SpEmployeeContactIns_JSON_OUTPUT] @json
	END
GO
