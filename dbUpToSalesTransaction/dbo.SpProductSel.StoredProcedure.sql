USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpProductSel] (@json nvarchar(max))
AS
	BEGIN
		SET NOCOUNT ON;

		select * from Product
		where
		ProductId in(
			select oj.productId
			from openjson(@json)
			with(
				productId int
			) as oj
		)

	END;


GO
