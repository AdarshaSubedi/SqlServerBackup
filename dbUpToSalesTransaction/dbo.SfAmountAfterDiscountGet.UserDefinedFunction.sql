USE [Adarsha]
GO
/****** Object:  UserDefinedFunction [dbo].[SfAmountAfterDiscountGet]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[SfAmountAfterDiscountGet] (@CustomerId int)
returns money
as
begin
	declare @totalAmount money 
	set @totalAmount = (
		select sum(TotalAmount) from SalesTransaction as st
		where st.CustomerId = @CustomerId						
	)
	if (@totalAmount <= 500)
		set @totalAmount = cast(@totalAmount-(0.05*@totalAmount) as float)
	else 
		set @totalAmount = cast(@totalAmount-(0.1*@totalAmount) as float)
	return @totalAmount
end
GO
