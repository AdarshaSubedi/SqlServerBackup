USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpUserSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpUserSel]
(
	@Email varchar(100),
	@Password nvarchar(100)
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		select(
			select u.UserId as userId, u.Email as email, u.[Password] as [password]
			from dbo.[User] as u
			where u.Email = @Email and u.[Password] = @Password
			for json path, WITHOUT_ARRAY_WRAPPER 
		) as json
	END;
GO
