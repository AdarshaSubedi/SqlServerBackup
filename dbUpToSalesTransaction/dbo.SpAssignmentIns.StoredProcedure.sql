USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAssignmentIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpAssignmentIns]
(
	@JobId int,
	@EmployeeId int,
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

				insert into dbo.Assignment(JobId, EmployeeId, InsertPersonId, AssignmentStartDate, AssignmentEndDate) 
				values(@JobId, @EmployeeId, @InsertPersonId, @AssignmentStartDate, @AssignmentEndDate)
					
			END;
	END;


GO
