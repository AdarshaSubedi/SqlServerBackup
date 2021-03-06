USE [Adarsha]
GO
/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAddress](
	[EmployeeAddressId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeAddress] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FkEmployeeAddressEmployeeEmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FkEmployeeAddressEmployeeEmployeeId]
GO
