USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAssignmentIns_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpAssignmentIns_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.Assignment(
			[JobId],
			[EmployeeId],
			[InsertPersonId],
			[AssignmentStartDate],
			[AssignmentEndDate]
		)
		select 
			JobId, EmployeeId, InsertPersonId, AssignmentStartDate, AssignmentEndDate
		from openjson(@json)
		with(
			JobId int '$.jobId',
			EmployeeId int '$.employeeId',
			InsertPersonId int '$.insertPersonId',
			AssignmentStartDate smalldatetime '$.assignmentStartDate',
			AssignmentEndDate smalldatetime '$.assignmentEndDate'
		)

	END;


GO
