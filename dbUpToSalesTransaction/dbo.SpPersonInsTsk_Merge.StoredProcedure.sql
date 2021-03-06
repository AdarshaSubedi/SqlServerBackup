USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpPersonInsTsk_Merge]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpPersonInsTsk_Merge]
(
	@json nvarchar(max)
)
AS
	BEGIN
		EXEC [dbo].[SpPersonIns_Merge] @json = @json output
		EXEC [dbo].[SpPersonAddressIns_Merge] @json
		EXEC [dbo].[SpPersonContactIns_Merge] @json
	END
GO
