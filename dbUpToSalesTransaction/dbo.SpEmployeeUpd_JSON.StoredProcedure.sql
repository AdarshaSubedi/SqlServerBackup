USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeUpd_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpEmployeeUpd_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		--DECLARE @employeeId INT= json_value(@json, '$.employeeId')
		--IF(@employeeId IS NULL OR @employeeId = 0)
			--BEGIN
				--RAISERROR('Employee ID not found', 16, 1)
			--END

		--ELSE
			--BEGIN
				UPDATE E 
				SET
					FirstName = oj.firstName,
					MiddleName = oj.middleName,
					LastName = oj.lastName,
					InsertPersonId = oj.insertPersonId,
					Email = oj.email,
					Contact = oj.contact

				from dbo.Employee as E
				join	openjson(@json)
				with
					(
						employeeId int,
						firstName nvarchar(50),
						middleName nvarchar(50),
						lastName nvarchar(50),
						insertPersonId int,
						email nvarchar(100),
						contact varchar(15)
					) as oj
				ON
				E.EmployeeId = oj.employeeId

			--END
	END;

GO
