
/****** Object:  Database [TeaShop]    Script Date: 5/30/2024 12:37:14 AM ******/
CREATE DATABASE [TeaShop]
 
USE [TeaShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/30/2024 12:37:15 AM ******/

CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[pass_word] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[email] [nvarchar](50) NULL,
	[status_id] [int] NULL,
	[gender] [varchar](10) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatuses]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 5/30/2024 12:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[total_order_price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 5/30/2024 12:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[cart_details_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[CodeSale]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 5/30/2024 12:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[total_amount] [int] NULL,
	[created_by] [nchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[phone_number] [nchar](10) NULL,
	[status] [int] NULL,
	[note] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/30/2024 12:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_details_id] [int] NULL,
	[order_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[topping_details_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 5/30/2024 12:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[product_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [float] NULL,
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
/****** Object:  Table [dbo].[Role]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[Topping]    Script Date: 5/30/2024 12:37:15 AM ******/
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
/****** Object:  Table [dbo].[ToppingDetails]    Script Date: 5/30/2024 12:37:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToppingDetails](
	[topping_details_id] [int] IDENTITY(1,1) NOT NULL,
	[topping_id] [int] NULL,
	[quantity] [int] NULL,
	[order_details_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[topping_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (4, N'johndoe', N'password123', 1, N'johndoe@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (5, N'janedoe', N'password456', 2, N'janedoe@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (6, N'marksmith', N'password789', 2, N'marksmith@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (7, N'user1', N'password1', 2, N'user1@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (8, N'user2', N'password2', 2, N'user2@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (9, N'user3', N'password3', 2, N'user3@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (10, N'user4', N'password4', 2, N'user4@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (11, N'user5', N'password5', 2, N'user5@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (12, N'user6', N'password6', 2, N'user6@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (13, N'user7', N'password7', 2, N'user7@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (14, N'user8', N'password8', 2, N'user8@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (15, N'user9', N'password9', 2, N'user9@example.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (16, N'trang', N'123456', 2, N'huientranq@gmail.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (17, N'user1', N'password1', 1, N'user1@example.com', 1, N'Male', N'123 Main St', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (18, N'user2', N'password2', 1, N'user2@example.com', 1, N'Female', N'456 Maple Ave', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (19, N'user3', N'password3', 1, N'user3@example.com', 1, N'Male', N'789 Oak Dr', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (20, N'user4', N'password4', 1, N'user4@example.com', 1, N'Female', N'321 Pine Ln', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (21, N'user5', N'password5', 1, N'user5@example.com', 1, N'Male', N'654 Elm St', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (22, N'user6', N'password6', 1, N'user6@example.com', 1, N'Female', N'987 Cedar Rd', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (23, N'user7', N'password7', 1, N'user7@example.com', 1, N'Male', N'246 Birch Blvd', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (24, N'user8', N'password8', 1, N'user8@example.com', 1, N'Female', N'135 Spruce Ct', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (25, N'user9', N'password9', 1, N'user9@example.com', 1, N'Male', N'864 Hickory St', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (26, N'trangne', N'123', 1, N'huyentrang@gmail.com', 1, N'Female', N'Ha Noi', N'N/A', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (27, N'user30', N'password1', 1, N'user1@example.com', 1, N'Male', N'123 Main St', N'123-456-7890', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (28, N'user31', N'password2', 1, N'user2@example.com', 1, N'Female', N'456 Maple Ave', N'123-456-7891', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (29, N'user32', N'password3', 1, N'user3@example.com', 1, N'Male', N'789 Oak Dr', N'123-456-7892', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (30, N'user43', N'password4', 1, N'user4@example.com', 1, N'Female', N'321 Pine Ln', N'123-456-7893', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (31, N'user54', N'password5', 1, N'user5@example.com', 1, N'Male', N'654 Elm St', N'123-456-7894', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (32, N'user65', N'password6', 1, N'user6@example.com', 1, N'Female', N'987 Cedar Rd', N'123-456-7895', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (33, N'user76', N'password7', 1, N'user7@example.com', 1, N'Male', N'246 Birch Blvd', N'123-456-7896', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (34, N'user87', N'password8', 1, N'user8@example.com', 1, N'Female', N'135 Spruce Ct', N'123-456-7897', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (35, N'user98', N'password9', 1, N'user9@example.com', 1, N'Male', N'864 Hickory St', N'123-456-7898', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (36, N'huyentrang', N'123', 1, N'huientranq@gmail.com', 1, N'Female', N'Ha Noi', N'0962041358', CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (37, N'tranggg', N'123', 2, N'haha@gmail.com', 1, N'Female', N'Ha Noi', N'012345678', CAST(N'2024-05-29' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (38, N'trangg', N'123', 2, N'haha@gmail.com', 1, N'Female', N'Ha Noi', N'0779231026', CAST(N'2024-05-29' AS Date))
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at]) VALUES (39, N'Tien', N'123', 2, N'hong@gmail.com', 1, N'1', N'Ha Noi', N'0912445216', CAST(N'2024-05-29' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountStatuses] ON 
GO
INSERT [dbo].[AccountStatuses] ([status_id], [status_name]) VALUES (1, N'Active')
GO
INSERT [dbo].[AccountStatuses] ([status_id], [status_name]) VALUES (2, N'InActive')
GO
SET IDENTITY_INSERT [dbo].[AccountStatuses] OFF
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
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
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
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ('Unknown') FOR [gender]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ('Not Provided') FOR [address]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ('N/A') FOR [phone_number]
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Accounts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductDetails] FOREIGN KEY([order_details_id])
REFERENCES [dbo].[ProductDetails] ([product_details_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductDetails]
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
ALTER TABLE [dbo].[ToppingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ToppingDetails_OrderDetails] FOREIGN KEY([order_details_id])
REFERENCES [dbo].[OrderDetails] ([order_details_id])
GO
ALTER TABLE [dbo].[ToppingDetails] CHECK CONSTRAINT [FK_ToppingDetails_OrderDetails]
GO
ALTER TABLE [dbo].[ToppingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ToppingDetails_Topping] FOREIGN KEY([topping_id])
REFERENCES [dbo].[Topping] ([topping_id])
GO
ALTER TABLE [dbo].[ToppingDetails] CHECK CONSTRAINT [FK_ToppingDetails_Topping]
GO
USE [master]
GO
ALTER DATABASE [TeaShop] SET  READ_WRITE 
GO
