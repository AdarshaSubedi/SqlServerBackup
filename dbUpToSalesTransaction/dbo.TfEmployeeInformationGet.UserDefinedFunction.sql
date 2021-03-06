USE [Adarsha]
GO
/****** Object:  UserDefinedFunction [dbo].[TfEmployeeInformationGet]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TfEmployeeInformationGet](@EmployeeId int)
RETURNS TABLE
AS 
	Return 
		select j.JobId, j.JobTitle, a.AssignmentId, a.AssignmentStartDate, a.AssignmentEndDate, 
		CONCAT(e.LastName , ', ' , e.FirstName , ' ' , e.MiddleName) as EmployeeName
		from Employee as e 
		inner join Assignment as a
		on e.EmployeeId = a.EmployeeId
		inner join Job as j
		on a.JobId = j.JobId
		where
			e.EmployeeId = @EmployeeId

GO
