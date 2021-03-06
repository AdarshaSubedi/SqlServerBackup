USE [Adarsha]
GO
/****** Object:  Table [dbo].[ProductRate]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRate](
	[ProductRateId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Rate] [money] NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PkProductRateId] PRIMARY KEY CLUSTERED 
(
	[ProductRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductRate] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[ProductRate]  WITH CHECK ADD  CONSTRAINT [FkProductRateProductProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductRate] CHECK CONSTRAINT [FkProductRateProductProductId]
GO
