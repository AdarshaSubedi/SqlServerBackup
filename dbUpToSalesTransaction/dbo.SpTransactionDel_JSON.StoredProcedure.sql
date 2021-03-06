USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpTransactionDel_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpTransactionDel_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
				delete t
				from openjson(@json)
				with(transactionId int) as oj
				inner join dbo.[Transaction] as t
				on 
					t.TransactionId = oj.transactionId
	END;

GO
