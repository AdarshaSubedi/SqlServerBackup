USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpUserDetailSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpUserDetailSel]
(
	@UserId int
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		select(
				select  u.UserId as userId ,u.FirstName as firstName, u.MiddleName as middleName, u.LastName as lastName,
				u.Email as email, u.[Password] as password
				from dbo.[User] as u
				where u.UserId = @UserId
				for json path, WITHOUT_ARRAY_WRAPPER 
		) as json
	END;
GO
