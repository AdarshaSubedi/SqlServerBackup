USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpCustomerIns]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON;

		DECLARE @MyTable table (Id int identity, CustomerId int)
		create table #Temp(
			Id int identity,
			AddressId int	
		)
		insert into #Temp(
			[AddressId]
		)
		select 
			AddressId
		from openjson(@json)
		with(
			AddressId int '$.addressId'
		)
		

		insert into dbo.Customer(
			[FirstName],
			[MiddleName],
			[LastName],
			[Email],
			[Contact],
			[InsertPersonId]
		)
		output inserted.CustomerId 
			into @MyTable 
		select 
			[FirstName], [MiddleName], [LastName], [Email], [Contact], [InsertPersonId]
		from openjson(@json)
		with(
			FirstName nvarchar(50) '$.firstName',
			MiddleName nvarchar(50) '$.middleName',
			LastName nvarchar(50) '$.lastName',
			Email nvarchar(100) '$.email',
			Contact varchar(15) '$.contact',
			InsertPersonId int '$.insertPersonId'
		) 

		select @json = (
			select 
				m.CustomerId as 'customerId',
				t.AddressId as 'addressId',
				c.InsertPersonId as 'insertPersonId'
			from Customer as c
			inner join @MyTable as m
			on c.CustomerId = m.CustomerId
			inner join #Temp as t
			on m.Id = t.Id

			for json path				
		)

	END;

GO
