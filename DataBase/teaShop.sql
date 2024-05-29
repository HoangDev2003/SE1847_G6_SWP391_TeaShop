

/****** Object:  Database [TeaShop]    Script Date: 23/05/2024 3:59:51 pm ******/
CREATE DATABASE [TeaShop]
 
USE [TeaShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[pass_word] [nvarchar](50) NULL,
	[full_name] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[email] [nvarchar](50) NULL,
	[phone_number] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[note] [nvarchar](250) NULL,
	[role_id] [int] NULL,
	[created_at] [timestamp] NOT NULL,
	[status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatuses]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatuses](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[total_order_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[cart_details_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodeSale]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodeSale](
	[code_sale_id] [int] IDENTITY(1,1) NOT NULL,
	[code_sale] [nvarchar](50) NULL,
	[discount] [int] NULL,
	[code_sale_status] [int] NULL,
	[date_start] [nchar](10) NULL,
	[date_end] [nchar](10) NULL,
	[limited_quantity] [int] NULL,
	[discount_conditions] [nvarchar](max) NULL,
	[title] [nchar](100) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[code_sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[product_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[order_date] [date] NULL,
	[total_amount] [int] NULL,
	[status] [int] NULL,
	[note] [nvarchar](250) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[quantity] [int] NULL,
	[topping_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](150) NOT NULL,
	[category_id] [int] NULL,
	[image] [nvarchar](max) NULL,
	[price] [int] NULL,
	[discount] [float] NULL,
 CONSTRAINT [PK__Product__B40CC6ED7A47CDB7] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[product_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[delete] [bit] NULL,
	[discount] [float] NOT NULL,
 CONSTRAINT [PK__ProductD__2991D8BF7A0AD228] PRIMARY KEY CLUSTERED 
(
	[product_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[size_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 23/05/2024 3:59:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	[topping_id] [int] IDENTITY(1,1) NOT NULL,
	[topping_name] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[topping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'SYPHON')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'MOKA POT')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'CÀ PHÊ')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'FRENCH PRESS')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'COLD BREW')
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (6, N'Ô LONG MATCHA')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (1, N'Ô LONG VANI SỮA', 1, N'/TeaShop/img/olongvalisua.jpg', 54000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (2, N'PHÙ VÂN', 1, N'/TeaShop/img/phuvan.jpg', 33000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (3, N'Ô LONG TRỨNG', 1, N'/TeaShop/img/olongtrungbong.jpg', 40000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (4, N'Ô LONG SỮA', 1, N'/TeaShop/img/olongsuaphela.jpg', 45000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (5, N'Ô LONG NHÀI SỮA', 1, N'/TeaShop/img/olongnhaisua.jpg', 30000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (6, N'PHAN XI PĂNG', 1, N'/TeaShop/img/phanxipang.jpg', 33000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (7, N'KHÓI B''LAO', 2, N'/TeaShop/img/khoiblao.jpg', 45000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (8, N'TẤM', 2, N'/TeaShop/img/tam.jpg', 45000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (9, N'CÀ PHÊ Ủ LẠNH', 3, N'/TeaShop/img/caphetulanh.jpg', 30000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (10, N'PHÊ NÂU TRUFFLE', 3, N'/TeaShop/img/phenautruffle.jpg', 33000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (11, N'PHÊ TRUFFLE', 3, N'/TeaShop/img/phetruffle.jpg', 43000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (12, N'PHÊ NÂU', 3, N'/TeaShop/img/phenau.jpg', 43000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (13, N'PHÊ ĐEN', 3, N'/TeaShop/img/capheden.jpg', 53000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (14, N'PHÊ ĐÀ LẠT', 3, N'/TeaShop/img/dalat.jpg', 55000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (15, N'CÀ PHÊ TRỨNG BÔNG', 3, N'/TeaShop/img/caphetrungbong.jpg', 55000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (16, N'GẤM', 4, N'/TeaShop/img/gam.jpg', 44000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (17, N'Ô LONG ĐÀO ĐỎ', 4, N'/TeaShop/img/olongdaodo.jpg', 54000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (18, N'TRÀ VỎ CÀ PHÊ', 4, N'/TeaShop/img/travocaphe.jpg', 33000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (19, N'Ô LONG NHÀI KEM ', 5, N'/TeaShop/img/olongnhaikemcheese.jpg', 40000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (20, N'LANG BIANG', 5, N'/TeaShop/img/langbiang.jpg', 45000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (21, N'Ô LONG NHIỆT ĐỚI', 5, N'/TeaShop/img/olongnhietdoi.jpg', 50000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (22, N'MATCHA ĐÁ XAY', 6, N'/TeaShop/img/matchadaxay.jpg', 50000, NULL)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount]) VALUES (23, N'MATCHA COCO LATTE', 6, N'/TeaShop/img/matchacoclatte.jpg', 55000, NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 
GO
INSERT [dbo].[Size] ([size_id], [size_name]) VALUES (1, N'S')
GO
INSERT [dbo].[Size] ([size_id], [size_name]) VALUES (2, N'M')
GO
INSERT [dbo].[Size] ([size_id], [size_name]) VALUES (3, N'L')
GO
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0.0)) FOR [total_order_price]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_AccountStatuses] FOREIGN KEY([status_id])
REFERENCES [dbo].[AccountStatuses] ([status_id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_AccountStatuses]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Role]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Accounts]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Cart]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD  CONSTRAINT [FK_CartDetails_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[CartDetails] CHECK CONSTRAINT [FK_CartDetails_Product]
GO
ALTER TABLE [dbo].[CodeSale]  WITH CHECK ADD  CONSTRAINT [FK_CodeSale_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[CodeSale] CHECK CONSTRAINT [FK_CodeSale_Role]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Accounts]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Accounts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Topping] FOREIGN KEY([topping_id])
REFERENCES [dbo].[Topping] ([topping_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Topping]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_Product]
GO
USE [master]
GO
ALTER DATABASE [TeaShop] SET  READ_WRITE 
GO
