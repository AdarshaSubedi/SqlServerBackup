USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============================================
-- Author:		<Adarsha>
-- Create date: <09/04/2020>
-- Description: <insert into Job Table>
-- =============================================== 

CREATE PROCEDURE [dbo].[SpEmployeeIns]
(
	@FirstName nvarchar(50),
	@MiddleName nvarchar(50),
	@LastName nvarchar(50),
	@Email nvarchar(100),
	@Contact varchar(15)
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
				insert into dbo.Employee(FirstName, MiddleName,LastName, Email, Contact, InsertPersonId)
				values(@FirstName,@MiddleName, @LastName, @Email, @Contact, @InsertPersonId)	
			END;
	END;
GO
