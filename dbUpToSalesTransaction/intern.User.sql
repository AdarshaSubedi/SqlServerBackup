USE [Adarsha]
GO
/****** Object:  User [intern]    Script Date: 10/5/2020 4:00:28 PM ******/
CREATE USER [intern] FOR LOGIN [intern] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [intern]
GO
