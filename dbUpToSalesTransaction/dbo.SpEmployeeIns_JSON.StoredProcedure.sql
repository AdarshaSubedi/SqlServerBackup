USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeIns_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpEmployeeIns_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.Employee(
			[FirstName],
			[MiddleName],
			[LastName],
			[InsertPersonId],
			[Email],
			[Contact]
		)
		select 
			FirstName, MiddleName, LastName, InsertPersonId, Email, Contact
		from openjson(@json)
		with(
			FirstName nvarchar(50) '$.firstName',
			MiddleName nvarchar(50) '$.middleName',
			LastName nvarchar(50) '$.lastName',
			InsertPersonId int '$.insertPersonId',
			Email nvarchar(100) '$.email',
			Contact varchar(15) '$.contact'
		)

	END;


GO
