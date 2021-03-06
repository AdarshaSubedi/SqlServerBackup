USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpJobUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpJobUpd]
(
	@JobId int,
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

				update [dbo].[Job]
				set JobTitle = @JobTitle, InsertPersonId = @InsertPersonId
				where JobId = @JobId
					
			END;
	END;

GO
