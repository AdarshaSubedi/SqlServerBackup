USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAllProductSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpAllProductSel]
AS
	BEGIN
		SET NOCOUNT ON;

		select
	(
		select
		(
			select distinct p.ProductId as 'productId'
			, p.ProductName as 'productName', 
			p.Brand as 'brand',
			p.ProductIdentifier as 'productIdentifier',
			pr.Rate as 'rate',
			cast(pr.StartDate as date) as 'startDate',
			cast(pr.EndDate as date) as 'endDate'
			from product as p
			inner join ProductRate as pr
			on p.ProductId=pr.ProductId
			order by 1
			for json path, include_null_values
		) as 'data' for json path, without_array_wrapper
	) as 'Json'

	END;
GO
