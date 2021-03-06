USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpTransactionIns_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpTransactionIns_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.[Transaction](
			[AssignmentId],
			[InsertPersonId],
			[Amount]
		)
		select 
			AssignmentId, InsertPersonId, Amount
		from openjson(@json)
		with(
			AssignmentId int '$.assignmentId',
			InsertPersonId int '$.insertPersonId',
			Amount money '$.amount'
		)

	END;


GO
