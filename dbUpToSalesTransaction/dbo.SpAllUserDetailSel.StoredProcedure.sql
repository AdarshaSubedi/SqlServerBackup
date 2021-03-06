USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAllUserDetailSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpAllUserDetailSel]
AS
	BEGIN
		SET NOCOUNT ON;
		declare @Json nvarchar(max)
		set @Json  = (
		select  (
			select top 10 
			UserId  as 'userId',
			Email as 'email',
			[Password] as 'password',
			FirstName as 'firstName', 
			MiddleName as 'middleName', 
			LastName as 'lastName'
			from [User]
			order by 1
			for json path, include_null_values
			) as 'data' for json path, without_array_wrapper
		) 
		select @Json as 'Json'
	END;
GO
