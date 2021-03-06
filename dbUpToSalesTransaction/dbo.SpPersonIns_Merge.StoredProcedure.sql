USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpPersonIns_Merge]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpPersonIns_Merge]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;

		DECLARE @PersonId table (Id int identity(1,1), PersonId int)
		create table #PersonDetails(
			Id int identity,
			PersonId int,
			FirstName nvarchar(50),
			MiddleName nvarchar(50),
			LastName nvarchar(50),
			[Address] nvarchar(200), 
			Email nvarchar(100),
			Phone varchar(15),
			InsertPersonId int
		)
		insert into #PersonDetails(
			FirstName,
			MiddleName,
			LastName,
			[Address],
			[Email],
			[Phone],
			InsertPersonId
		)
		select 
			oj.FirstName, oj.MiddleName, oj.LastName, oj.[Address], oj.Email, oj.Phone, oj.InsertPersonId
		from openjson(@json)
		with(
			FirstName nvarchar(50) '$.firstName',
			MiddleName nvarchar(50) '$.middleName',
			LastName nvarchar(50) '$.lastName',
			[Address] nvarchar(200) '$.address',
			Email nvarchar(100) '$.email',
			Phone varchar(15) '$.phone',
			InsertPersonId int '$.insertPersonId'
		) as oj
		

		merge Person as p
		using #PersonDetails as pd
			on p.PersonId = pd.PersonId
		when not matched then
			insert (FirstName, MiddleName, LastName, InsertPersonId)
			values (pd.FirstName, pd.MiddleName, pd.LastName, pd.InsertPersonId)
			output inserted.PersonId into @PersonId;



		select @json = (
			select 
				pid.PersonId as 'personId',
				pd.[Address] as 'address',
				pd.Phone as 'phone',
				pd.Email as 'email',
				pd.InsertPersonId as 'insertPersonId'
			from #PersonDetails as pd
			inner join @PersonId as pid
			on pd.Id = pid.Id
			for json path				
		)


	END;


GO
