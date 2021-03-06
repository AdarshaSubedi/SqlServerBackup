USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerAddressUpd]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpCustomerAddressUpd]
(
	@json nvarchar(max)
)
AS
	BEGIN
		SET NOCOUNT ON;

		UPDATE ca
				SET	
					CustomerId = oj.customerId,
					AddressId = oj.addressId,
					InsertPersonId = oj.insertPersonId
				from dbo.CustomerAddress as ca
				join	openjson(@json)
				with
					(
						customerId int,
						addressId int,
						insertPersonId int
					) as oj
				ON
				ca.CustomerId = oj.customerId


	END;


GO
