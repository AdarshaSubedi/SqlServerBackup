USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpJobIns_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpJobIns_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.Job (
			[JobTitle],
			[InsertPersonId]
		)
		select 
			JobTitle, InsertPersonId
		from openjson(@json)
		with(
			JobTitle nvarchar(50) '$.jobTitle',
			InsertPersonId int '$.insertPersonId'
		)

	END;


GO
