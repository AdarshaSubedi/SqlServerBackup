USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAssignmentDel_JSON]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpAssignmentDel_JSON]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;
				delete a
				from openjson(@json)
				with(assignmentId int) as oj
				inner join dbo.Assignment as a
				on 
					a.AssignmentId = oj.assignmentId
	END;

GO
