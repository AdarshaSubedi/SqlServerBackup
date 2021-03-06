USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeAddressIns_JSON_OUTPUT]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SpEmployeeAddressIns_JSON_OUTPUT]
(
	@json nvarchar(max) output
)
AS
	BEGIN
		SET NOCOUNT ON;
		
		insert into dbo.EmployeeAddress(
			[EmployeeId],
			[Address],
			[InsertPersonId]
		)
		select 
			EmployeeId, [Address], InsertPersonId
		from openjson(@json)
		with(
			EmployeeId int '$.employeeId',
			[Address] nvarchar(200) '$.address',
			InsertPersonId int '$.insertPersonId'
		)

	END;


GO
