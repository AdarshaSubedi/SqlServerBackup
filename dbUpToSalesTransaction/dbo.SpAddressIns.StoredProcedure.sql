USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAddressIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpAddressIns]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;

		insert into dbo.[Address](
			[Zone],
			[District],
			[InsertPersonId]
		)
		select 
			[Zone], [District], InsertPersonId
		from openjson(@json)
		with(
			[Zone] nvarchar(15) '$.zone',
			[District] nvarchar(15) '$.district',
			InsertPersonId int '$.insertPersonId'
		) 

	END;


GO
