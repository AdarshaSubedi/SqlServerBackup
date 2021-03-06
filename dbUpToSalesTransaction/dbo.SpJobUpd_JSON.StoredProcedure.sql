USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpJobUpd_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpJobUpd_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
		--DECLARE @JobId int = json_value(@json, '$.jobId')
		--IF (@JobId is null or @JobId = 0)
			--BEGIN
				--RAISERROR('JobId not found', 16, 1);
			--END;
		--ELSE
		UPDATE J
		SET
			JobTitle = obj.jobTitle,
			InsertPersonId = obj.insertPersonId
		from [dbo].[Job] as J
		join	openjson(@json)
				with
					(
						jobId int,
						jobTitle nvarchar(50),
						insertPersonId int
					) as obj
				ON
				J.JobId = obj.jobId

	END;

GO
