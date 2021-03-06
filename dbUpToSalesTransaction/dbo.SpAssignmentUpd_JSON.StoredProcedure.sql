USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAssignmentUpd_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpAssignmentUpd_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
				UPDATE A
				SET	
					JobId = oj.jobId,
					EmployeeId = oj.employeeId,
					InsertPersonId = oj.insertPersonId,
					AssignmentStartDate = oj.assignmentStartDate,
					AssignmentEndDate = oj.assignmentEndDate
				from dbo.Assignment as A
				join	openjson(@json)
				with
					(
						assignmentId int,
						jobId int,
						employeeId int,
						insertPersonId int,
						assignmentStartDate smalldatetime,
						assignmentEndDate smalldatetime
					) as oj
				ON
				A.AssignmentId = oj.assignmentId

	END;

GO
