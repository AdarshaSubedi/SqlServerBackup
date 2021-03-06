USE [Adarsha]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Zone] [nvarchar](15) NOT NULL,
	[District] [nvarchar](15) NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PkAddressId] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UkAddressZoneDistrict] UNIQUE NONCLUSTERED 
(
	[Zone] ASC,
	[District] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
