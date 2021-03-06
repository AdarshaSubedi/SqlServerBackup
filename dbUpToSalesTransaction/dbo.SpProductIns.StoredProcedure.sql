USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpProductIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpProductIns]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON;

		DECLARE @MyTable table (Id int identity, ProductId int)
		create table #Temp(
			Id int identity,
			Rate money,
			StartDate smalldatetime,
			EndDate smalldatetime
		)
		insert into #Temp(
			[Rate],
			[StartDate],
			[EndDate]
		)
		select 
			Rate, StartDate, EndDate
		from openjson(@json)
		with(
			Rate money '$.rate',
			StartDate smalldatetime '$.startDate',
			EndDate smalldatetime '$.endDate'
		)
		

		insert into dbo.Product(
			[ProductName],
			[Brand],
			[ProductIdentifier],
			[InsertPersonId]
		)
		output inserted.ProductId 
			into @MyTable 
		select 
			ProductName, Brand, ProductIdentifier, InsertPersonId
		from openjson(@json)
		with(
			ProductName nvarchar(100) '$.productName',
			Brand nvarchar(50) '$.brand',
			ProductIdentifier varchar(20) '$.productIdentifier',
			InsertPersonId int '$.insertPersonId'
		) 

		select @json = (
			select 
				m.ProductId as 'productId',
				t.Rate as 'rate', t.StartDate as 'startDate', t.EndDate as 'endDate',
				p.InsertPersonId as 'insertPersonId'
			from Product as p
			inner join @MyTable as m
			on p.ProductId = m.ProductId
			inner join #Temp as t
			on m.Id = t.Id

			for json path				
		)


	END;


GO
