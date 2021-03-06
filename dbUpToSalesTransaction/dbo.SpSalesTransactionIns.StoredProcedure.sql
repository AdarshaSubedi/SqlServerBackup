USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpSalesTransactionIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpSalesTransactionIns]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON
		declare @TodayDate date = getdate();
		insert into dbo.SalesTransaction(
			[CustomerId],
			[ProductId],
			[InsertPersonId],
			[Quantity],
			[Rate],
			[TotalAmount]
		)
		select 
			oj.CustomerId,
			oj.ProductId, 
			oj.InsertPersonId, 
			oj.Quantity, 
			pr.Rate,
			oj.Quantity*pr.Rate
		from openjson(@json)
		with(
			CustomerId int '$.customerId',
			ProductId int '$.productId',
			InsertPersonId int '$.insertPersonId',
			Quantity int '$.quantity'
		) as oj
		inner join dbo.ProductRate as pr on pr.ProductId = oj.ProductId


	END;

GO
