USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpProductUpd]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON;

		UPDATE p
				SET	
					ProductName = oj.productName,
					Brand = oj.brand,
					ProductIdentifier = oj.productIdentifier,
					InsertPersonId = oj.insertPersonId
				from dbo.Product as p
				join	openjson(@json)
				with
					(
						productId int,
						productName nvarchar(50),
						brand nvarchar(50),
						productIdentifier varchar(20),
						insertPersonId int
					) as oj
				ON
				p.ProductId = oj.productId


	END;


GO
