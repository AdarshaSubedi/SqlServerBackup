USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductProductRateInsTsk]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpProductProductRateInsTsk]
(
	@json nvarchar(max)
)
AS
	BEGIN
		EXEC [dbo].[SpProductIns] @json = @json output
		EXEC [dbo].[SpProductRateIns] @json
	END
GO
