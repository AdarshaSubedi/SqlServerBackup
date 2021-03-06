USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductRateUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpProductRateUpd]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON;

		UPDATE pr
				SET	
					ProductId = oj.productId,
					Rate = oj.rate,
					InsertPersonId = oj.insertPersonId,
					StartDate = oj.startDate,
					EndDate = oj.endDate
				from dbo.ProductRate as pr
				join	openjson(@json)
				with
					(
						productId int,
						rate money,
						insertPersonId int,
						startDate smalldatetime,
						endDate smalldatetime
					) as oj
				ON
				pr.ProductId = oj.productId
				where pr.StartDate = oj.StartDate

	END;


GO
