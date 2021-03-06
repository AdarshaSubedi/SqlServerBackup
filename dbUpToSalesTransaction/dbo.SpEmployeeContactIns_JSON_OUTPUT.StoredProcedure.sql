USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeContactIns_JSON_OUTPUT]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpEmployeeContactIns_JSON_OUTPUT]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.EmployeeContact(
			[EmployeeId],
			[Email],
			[Phone],
			[InsertPersonId]
		)
		select 
			EmployeeId, Email, Phone, InsertPersonId
		from openjson(@json)
		with(
			EmployeeId int '$.employeeId',
			Email nvarchar(100) '$.email',
			Phone varchar(15) '$.contact',
			InsertPersonId int '$.insertPersonId'
		)

	END;


GO
