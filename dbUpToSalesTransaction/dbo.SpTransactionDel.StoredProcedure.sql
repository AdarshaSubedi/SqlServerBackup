USE [Adarsha]
GO
/****** Object:  StoredProcedure [dbo].[SpTransactionDel]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===============================================
-- Author:		<Adarsha>
-- Create date: <09/04/2020>
-- Description: <insert into Jov Table>
-- ===============================================

CREATE PROCEDURE [dbo].[SpTransactionDel]
(
	@TransactionId int
)
AS
	BEGIN
		delete from [dbo].[Transaction]
			where TransactionId = @TransactionId
	END;

GO
