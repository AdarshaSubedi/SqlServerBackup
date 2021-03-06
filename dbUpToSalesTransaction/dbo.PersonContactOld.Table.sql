USE [Adarsha]
GO
/****** Object:  Table [dbo].[PersonContactOld]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonContactOld](
	[PersonContactID] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonContactOld] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[PersonContactOld]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[PersonOld] ([PersonId])
GO
