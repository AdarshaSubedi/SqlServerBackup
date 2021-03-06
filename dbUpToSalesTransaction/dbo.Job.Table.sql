USE [Adarsha]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PkJobId] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Job] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
