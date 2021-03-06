USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerAddressIns]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SpCustomerAddressIns]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;

		insert into dbo.CustomerAddress(
			[CustomerId],
			[AddressId],
			[InsertPersonId]
		)
		select 
			[CustomerId], [AddressId], [InsertPersonId]
		from openjson(@json)
		with(
			CustomerId int '$.customerId',
			AddressId int '$.addressId',
			InsertPersonId int '$.insertPersonId'
		) 

	END;

GO
