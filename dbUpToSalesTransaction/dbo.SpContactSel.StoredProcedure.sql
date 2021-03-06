USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpContactSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpContactSel]
AS
	BEGIN
		SET NOCOUNT ON;

		select c.FirstName, c.MiddleName, c.LastName, c.Email, c.Contact, a.[Zone], a.[District]
		from Customer as c
		inner join CustomerAddress as ca
		on c.CustomerId = ca.CustomerId
		inner join [Address] as a 
		on ca.AddressId = a.AddressId

	END;


GO
