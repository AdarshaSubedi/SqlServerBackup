USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerSel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpCustomerSel](@json nvarchar(max))
AS
	BEGIN
		SET NOCOUNT ON;

		select * from Customer 
		where
		CustomerId in(
			select oj.customerId
			from openjson(@Json)
			with(
				customerId int
			) as oj
		)

	END;


GO
