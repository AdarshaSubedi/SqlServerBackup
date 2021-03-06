USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpTransactionUpd_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpTransactionUpd_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
				UPDATE T
				SET
					AssignmentId = oj.assignmentId,
					InsertPersonId = oj.insertPersonId,
					Amount = oj.amount
				from dbo.[Transaction] as T
				join	openjson(@json)
				with
					(
						transactionId int,
						assignmentId int,
						insertPersonId int,
						amount money
					) as oj
				ON
				T.TransactionId = oj.transactionId

	END;
GO
