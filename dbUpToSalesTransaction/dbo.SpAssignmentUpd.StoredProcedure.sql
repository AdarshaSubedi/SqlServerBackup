USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAssignmentUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpAssignmentUpd]
(
	@AssignmentId int,
	@JobId int = null,
	@EmployeeId int = null,
	@AssignmentStartDate smalldatetime,
	@AssignmentEndDate smalldatetime = null
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

				update [dbo].[Assignment]
				set 
					JobId = isnull(@JobId, JobId),
					EmployeeId = isnull(@EmployeeId, EmployeeId),
					InsertPersonId = @InsertPersonId,
					AssignmentStartDate = isnull(@AssignmentStartDate, AssignmentStartDate),
					AssignmentEndDate = isnull(@AssignmentEndDate, AssignmentEndDate)		
				where AssignmentId = @AssignmentId
					
			END;
	END;

GO
