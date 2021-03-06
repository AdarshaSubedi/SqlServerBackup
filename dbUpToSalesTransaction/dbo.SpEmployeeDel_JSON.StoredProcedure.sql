USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeDel_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpEmployeeDel_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
				delete e
				from openjson(@json)
				with(employeeId int) as oj
				inner join dbo.Employee as e
				on 
					e.EmployeeId = oj.employeeId
	END;

GO
