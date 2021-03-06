USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeIns_JSON_OUTPUT]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpEmployeeIns_JSON_OUTPUT]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;

		DECLARE @MyTable table (Id int identity, EmployeeId int)
		create table #Temp(
			Id int identity,
			[Address] nvarchar(200), 
			Email nvarchar(100),
			Contact varchar(15)	
		)
		insert into #Temp(
			[Address],
			[Email],
			[Contact]
		)
		select 
			[Address], Email, Contact
		from openjson(@json)
		with(
			[Address] nvarchar(200) '$.address',
			Email nvarchar(100) '$.email',
			Contact varchar(15) '$.contact'
		)
		

		insert into dbo.Employee(
			[FirstName],
			[MiddleName],
			[LastName],
			[InsertPersonId],
			[Email],
			[Contact]
		)
		output inserted.EmployeeId 
			into @MyTable 
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

		select @json = (
			select 
				m.EmployeeId as 'employeeId',
				t.[Address] as 'address',
				t.Contact as 'contact',
				t.Email as 'email',
				e.InsertPersonId as 'insertPersonId'
			from Employee as e
			inner join @MyTable as m
			on e.EmployeeId = m.EmployeeId
			inner join #Temp as t
			on m.Id = t.Id

			for json path				
		)


	END;


GO
