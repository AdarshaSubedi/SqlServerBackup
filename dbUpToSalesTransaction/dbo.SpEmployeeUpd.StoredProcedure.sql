USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpEmployeeUpd]
(
	@EmployeeId int,
	@FirstName nvarchar(50) = null,
	@MiddleName nvarchar(50) = null,
	@LastName nvarchar(50) = null,
	@Email nvarchar(100) = null,
	@Contact varchar(15) = null
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

				update [dbo].[Employee]
				set 
					FirstName = isnull(@FirstName, FirstName),
					MiddleName = isnull(@MiddleName, MiddleName),
					LastName = isnull(@LastName, LastName),
					InsertPersonId = @InsertPersonId,
					Email = isnull(@Email, Email),
					Contact = isnull(@Contact, Contact)
				where EmployeeId = @EmployeeId
					
			END;
	END;

GO
