USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpJobDel_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpJobDel_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
				delete j
				from openjson(@json)
				with(jobId int) as oj
				inner join dbo.Job as j
				on 
					j.JobId = oj.jobId
	END;

GO
