USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpPersonAddressIns_Merge]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpPersonAddressIns_Merge]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.PersonAddress(
			[PersonId],
			[Address],
			[InsertPersonId]
		)
		select 
			PersonId, [Address], InsertPersonId
		from openjson(@json)
		with(
			PersonId int '$.personId',
			[Address] nvarchar(200) '$.address',
			InsertPersonId int '$.insertPersonId'
		)

	END;


GO
