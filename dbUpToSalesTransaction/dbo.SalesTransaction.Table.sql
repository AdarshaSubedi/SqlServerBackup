USE [Adarsha]
GO
/****** Object:  Table [dbo].[SalesTransaction]    Script Date: 10/5/2020 4:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTransaction](
	[SalesTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[InvoiceId] [int] NULL,
	[InsertPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
	[Quantity] [money] NOT NULL,
	[Rate] [money] NOT NULL,
	[TotalAmount] [money] NOT NULL,
 CONSTRAINT [PkSalesTransactionId] PRIMARY KEY CLUSTERED 
(
	[SalesTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesTransaction] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD  CONSTRAINT [FkSalesTransactionCustomerCustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[SalesTransaction] CHECK CONSTRAINT [FkSalesTransactionCustomerCustomerId]
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD  CONSTRAINT [FkSalesTransactionInvoiceInvoiceId] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[SalesTransaction] CHECK CONSTRAINT [FkSalesTransactionInvoiceInvoiceId]
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD  CONSTRAINT [FkSalesTransactionProductProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[SalesTransaction] CHECK CONSTRAINT [FkSalesTransactionProductProductId]
GO
