USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductProductRateUpdTsk]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpProductProductRateUpdTsk]
(
	@json nvarchar(max)
)
AS
	BEGIN
		--SET NOCOUNT ON;

		exec [dbo].[SpProductUpd] @json = @json output
		exec [dbo].[SpProductRateUpd] @json


	END;


GO
