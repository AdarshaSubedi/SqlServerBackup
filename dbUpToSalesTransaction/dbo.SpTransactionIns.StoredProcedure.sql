USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpTransactionIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============================================
-- Author:		<Adarsha>
-- Create date: <09/04/2020>
-- Description: <insert into Jov Table>
-- ===============================================

CREATE PROCEDURE [dbo].[SpTransactionIns]
(
	@AssignmentId int,
	@Amount money
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

				insert into [dbo].[Transaction](AssignmentId, InsertPersonId, Amount) 
				values(@AssignmentId, @InsertPersonId, @Amount)
					
			END;
	END;


GO
