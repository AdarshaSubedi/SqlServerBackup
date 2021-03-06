USE [Adarsha]
GO
/****** Object:  UserDefinedFunction [dbo].[SfJobIdGet]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SfJobIdGet](@JobTitle nvarchar(50))
RETURNS int
AS 
BEGIN
	declare @JobId int

	select @JobId = j.JobId 
	from [dbo].[Job] as j
	where 
		j.JobTitle = @JobTitle

	Return @JobId
END
GO
