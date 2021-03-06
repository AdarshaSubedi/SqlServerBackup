USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpAllCustomerSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SpAllCustomerSel]
AS
	BEGIN
		SET NOCOUNT ON;

		select
	(
		select
		(
			select distinct 
			c.CustomerId as 'customerId',
			c.FirstName as 'firstName',
			c.MiddleName as 'middleName',
			c.LastName as 'lastName',
			c.Email as 'email',
			c.Contact as 'contact'
			from Customer as c
			order by 1
			for json path, include_null_values
		) as 'data' for json path, without_array_wrapper
	) as 'Json'

	END;
GO
