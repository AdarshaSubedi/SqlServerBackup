USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductRateIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpProductRateIns]
(
	@json nvarchar(max)
)
AS
	BEGIN
		--SET NOCOUNT ON;
		insert into dbo.ProductRate(
			[ProductId],
			[Rate],
			[InsertPersonId],
			[StartDate],
			[EndDate]
		)
		select 
			ProductId, Rate, InsertPersonId, StartDate, EndDate
		from openjson(@json)
		with(
			ProductId int '$.productId',
			Rate money '$.rate',
			InsertPersonId int '$.insertPersonId',
			StartDate smalldatetime '$.startDate',
			EndDate smalldatetime '$.endDate'
		) 

	END;


GO
