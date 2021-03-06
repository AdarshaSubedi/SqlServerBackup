USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpSalesTransactionUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpSalesTransactionUpd]
(
	@json nvarchar(max)
)
AS
	BEGIN
		--SET NOCOUNT 
		declare @TodayDate date = getdate();

		update SalesTransaction
				set 
					CustomerId = oj.customerId,
					ProductId = oj.productId,
					Quantity = oj.quantity,
					Rate = pr.Rate,
					TotalAmount = pr.Rate*oj.quantity,
					InsertPersonId = oj.insertPersonId
			from openjson(@json)
				with
				(
					salesTransactionId int,
					customerId int,
					productId int,
					quantity int,
					insertPersonId int
				) as oj
				inner join dbo.ProductRate as pr on pr.ProductId = oj.ProductId
			where
				@TodayDate between pr.StartDate and pr.EndDate
				and
				SalesTransaction.SalesTransactionId = oj.salesTransactionId
				and 
				SalesTransaction.InvoiceId is null

	END;

GO
