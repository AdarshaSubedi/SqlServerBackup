USE [Adarsha]
GO
/****** Object:  UserDefinedFunction [dbo].[SfNewAmountAfterDiscountGet]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE function [dbo].[SfNewAmountAfterDiscountGet] (@amount money)
returns money
as
begin
	if (@amount <= 500)
		set @amount = cast(@amount-(0.05*@amount) as float)
	else 
		set @amount = cast(@amount-(0.1*@amount) as float)
	return @amount
end
GO
