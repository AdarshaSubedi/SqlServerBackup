USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpCustomerUpd]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		--SET NOCOUNT ON;
		UPDATE c
				SET	
					FirstName = oj.firstName,
					MiddleName = oj.middleName,
					LastName = oj.lastName,
					Email = oj.email,
					Contact = oj.contact,
					InsertPersonId = oj.insertPersonId
				from dbo.Customer as c
				join	openjson(@json)
				with
					(
						customerId int,
						firstName nvarchar(50),
						middleName nvarchar(50),
						lastName nvarchar(50),
						email nvarchar(100),
						contact varchar(15),
						insertPersonId int
					) as oj
				ON
				c.CustomerId = oj.customerId


	END;


GO
