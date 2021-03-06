USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpJobIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpJobIns]
(
	@JobTitle nvarchar(50)
)
AS
	BEGIN
		SET NOCOUNT ON;
		DECLARE @InsertPersonId int = 1;
		IF (@InsertPersonId = 0)
			BEGIN
				RAISERROR('Insert person not found', 16, 1);
			END;

		ELSE
			BEGIN

				insert into dbo.Job(JobTitle, InsertPersonId) values(@JobTitle, @InsertPersonId)
					
			END;
	END;


GO
