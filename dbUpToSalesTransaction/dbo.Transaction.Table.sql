USE [Adarsha]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PkTransactionId] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FkTransactionAssignmentAssignmentId] FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignment] ([AssignmentId])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FkTransactionAssignmentAssignmentId]
GO
