USE [Adarsha]
GO
/****** Object:  UserDefinedFunction [dbo].[SfProductRateGet]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[SfProductRateGet] (@ProductId int)
returns money
as
begin
	declare @rate money

		select top  1 @rate = p.Rate 
		from ProductRate as p
		where ProductId= @ProductId
		and getDate() between p.StartDate and p.EndDate 
		order by InsertDate desc

	return @rate
end
GO
