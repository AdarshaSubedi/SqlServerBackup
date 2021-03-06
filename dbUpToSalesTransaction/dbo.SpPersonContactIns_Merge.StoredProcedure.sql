USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpPersonContactIns_Merge]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpPersonContactIns_Merge]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.PersonContact(
			[PersonId],
			[Email],
			[Phone],
			[InsertPersonId]
		)
		select 
			PersonId, Email, Phone, InsertPersonId
		from openjson(@json)
		with(
			PersonId int '$.personId',
			Email nvarchar(100) '$.email',
			Phone varchar(15) '$.phone',
			InsertPersonId int '$.insertPersonId'
		)

	END;


GO
