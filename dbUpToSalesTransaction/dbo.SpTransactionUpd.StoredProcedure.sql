USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpTransactionUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============================================
-- Author:		<Adarsha>
-- Create date: <09/04/2020>
-- Description: <insert into Jov Table>
-- ===============================================

CREATE PROCEDURE [dbo].[SpTransactionUpd]
(
	@TransactionId int,
	@AssignmentId int = null,
	@Amount money = null
)
AS
	BEGIN
		SET NOCOUNT ON;
		DECLARE @InsertPersonId int = 1;
		IF (@InsertPersonId = 0)
			BEGIN
				RAISERROR('Insert person not found', 16, 1);
			END;

		ELSE
			BEGIN

				update [dbo].[Transaction]
				set 
					AssignmentId = isnull(@AssignmentId, AssignmentId),
					Amount = isnull(@Amount, Amount),
					InsertPersonId = @InsertPersonId
				where TransactionId = @TransactionId
					
			END;
	END;

GO
