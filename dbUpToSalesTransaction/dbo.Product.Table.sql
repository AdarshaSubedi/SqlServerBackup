USE [Adarsha]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[ProductIdentifier] [varchar](20) NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PkProductId] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UkProductProductIdentifier] UNIQUE NONCLUSTERED 
(
	[ProductIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
