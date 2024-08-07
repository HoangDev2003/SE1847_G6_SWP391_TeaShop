
/****** Object:  Database [TeaShop]    Script Date: 28/07/2024 10:45:21 am ******/
CREATE DATABASE [TeaShop]
 GO
USE [TeaShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[pass_word] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[email] [nvarchar](50) NULL,
	[status_id] [int] NULL,
	[gender] [varchar](10) NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [varchar](15) NOT NULL,
	[created_at] [date] NULL,
	[full_name] [nvarchar](50) NULL,
	[avartar] [nvarchar](max) NULL,
 CONSTRAINT [PK__Accounts__46A222CD2DCA8318] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatuses]    Script Date: 28/07/2024 10:45:21 am ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[content] [nvarchar](max) NULL,
	[img] [nvarchar](max) NOT NULL,
	[blog_name] [nvarchar](max) NULL,
	[created_at] [date] NULL,
	[categoryID] [int] NULL,
	[is_deleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](max) NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28/07/2024 10:45:21 am ******/
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
/****** Object:  Table [dbo].[CodeSale]    Script Date: 28/07/2024 10:45:21 am ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[product_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[created_at] [datetime] NOT NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK__Feedback__7A6B2B8C897DE702] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[quantity] [int] NULL,
	[status_feedback_id] [int] NULL,
	[image] [nvarchar](max) NULL,
	[image_after_ship] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[order_date] [datetime] NULL,
	[total_amount] [int] NULL,
	[status_id] [int] NULL,
	[note] [nvarchar](250) NULL,
	[estimated_delivery_date] [datetime] NULL,
	[address] [nvarchar](100) NULL,
	[full_name] [nvarchar](50) NULL,
	[payment_method] [nvarchar](10) NULL,
	[phone_number] [varchar](15) NULL,
	[shipper_note] [nvarchar](50) NULL,
	[staff_note] [nvarchar](50) NULL,
	[shipper_delivery_time] [datetime] NULL,
	[vnp_TxnRef] [varchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28/07/2024 10:45:21 am ******/
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
	[create_at] [date] NULL,
	[description] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[sales_numbers] [int] NULL,
 CONSTRAINT [PK__Product__B40CC6ED7A47CDB7] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Role__760965CC569E88FE] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](255) NULL,
	[url] [nvarchar](255) NULL,
	[image] [nvarchar](max) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusFeedback]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusFeedback](
	[status_feedback_id] [int] NOT NULL,
	[status_feedback_name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_StatusFeedback] PRIMARY KEY CLUSTERED 
(
	[status_feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 28/07/2024 10:45:21 am ******/
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
/****** Object:  Table [dbo].[ToppingDetails]    Script Date: 28/07/2024 10:45:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToppingDetails](
	[order_details_id] [int] NOT NULL,
	[topping_id] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (7, N'Nguyen Xuan Hoang', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'chimmy2003@gmail.com', 1, N'Unknown', N'Trường FPTU Hòa Lạc', N'0345638419', CAST(N'1900-01-01' AS Date), N'Nguyễn Xuân Hoàng', N'/img/340785063_6713180308698138_8163177629903918911_n.jpg')
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (16, N'trang', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'huientranq@gmail.com', 1, N'Unknown', N'Not Provided', N'N/A', CAST(N'1900-01-01' AS Date), N'Huyen Trang', N'/img/..........jpg')
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (26, N'trangne', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 1, N'huyentrang@gmail.com', 1, N'Female', N'Ha Noi', N'N/A', CAST(N'1900-01-01' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (36, N'huyentrang', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 1, N'huientranq@gmail.com', 1, N'Female', N'Ha Noi', N'0962041358', CAST(N'1900-01-01' AS Date), NULL, N'/img/..........jpg')
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (37, N'tranggg', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'haha@gmail.com', 1, N'Female', N'Ha Noi', N'012345678', CAST(N'2024-05-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (38, N'trangg', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'haha@gmail.com', 1, N'Female', N'Ha Noi', N'0779231026', CAST(N'2024-05-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (39, N'Tien', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'hong@gmail.com', 1, N'1', N'Ha Noi', N'0912445216', CAST(N'2024-05-29' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (42, N'testUser', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'new@example.com', 1, N'M', N'Test Address', N'1234567890', CAST(N'2024-06-19' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (43, N'testUser', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 2, N'new@example.com', 1, N'M', N'Test Address', N'1234567890', CAST(N'2024-06-19' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (90, N'shipper', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 4, N'pk19032003@gmail.com', 1, N'Male', N'Hanoi', N'0345638419', CAST(N'2024-06-19' AS Date), N'Shipper TeaShop', N'https://png.pngtree.com/png-clipart/20190904/original/pngtree-user-cartoon-avatar-pattern-flat-avatar-png-image_4492883.jpg')
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (92, N'Staff-1', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 3, N'Staff1@gmail.com', 1, N'Male', N'Ha Noi', N'0912445216', CAST(N'2024-07-16' AS Date), N'Staff TeaShop', N'https://png.pngtree.com/element_our/20190603/ourlarge/pngtree-user-flat-character-avatar-png-image_1442182.jpg')
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (93, N'Admin', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 1, N'admin123@gmail.com', 1, N'Female', N'Ha Noi', N'0962042367', CAST(N'2024-07-16' AS Date), N'Admin TeaShop', N'https://png.pngtree.com/png-clipart/20190920/original/pngtree-user-flat-character-avatar-png-png-image_4654505.jpg')
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (94, N'hoangstaff', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 3, N'hoangnx@gmail.com', 1, N'Female', N'Han Noi', N'0345638410', CAST(N'2023-07-06' AS Date), N'Staff', NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (95, N'HoangNX', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 3, N'huyentrang31102003@gmial.com', 1, N'Female', N'Hanoi', N'0962045368', CAST(N'2024-07-19' AS Date), NULL, NULL)
GO
INSERT [dbo].[Accounts] ([account_id], [user_name], [pass_word], [role_id], [email], [status_id], [gender], [address], [phone_number], [created_at], [full_name], [avartar]) VALUES (97, N'hoang dx', N'JtYP+VbBQqG9eD3oCvRd93fWFx8=', 3, N'HoangNXHE171895@fpt.edu.vn', 1, N'Male', N'hanoi', N'0345638419', CAST(N'2024-07-22' AS Date), NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([id], [role_id], [content], [img], [blog_name], [created_at], [categoryID], [is_deleted]) VALUES (1, 4, N'Thỏa Mát Mùa Hè Cùng Chương Trình Giảm Giá "Thanh Mát Lên Ngàn" Của TeaShop!
Bạn đang tìm kiếm những thức uống mát lạnh để giải nhiệt cho mùa hè nóng bức?

TeaShop xin hân hạnh giới thiệu chương trình khuyến mãi "Thanh Mát Lên Ngàn" với vô vàn ưu đãi hấp dẫn dành cho tất cả khách hàng!

 TeaShop mang đến:

Giảm giá 20% cho tất cả các loại trà trái cây tươi mát, sảng khoái như trà dâu tây, trà đào, trà kiwi,...
Mua 1 tặng 1 cho các loại trà sữa trân châu béo ngậy, thơm ngon như trà sữa trân châu đường đen, trà sữa trân châu hoàng kim,...
Ưu đãi đặc biệt: Giảm 50% cho tất cả các loại topping thạch, trân châu, pudding,... khi mua kèm ly trà sữa bất kỳ.
Hãy đến TeaShop ngay hôm nay để tận hưởng những thức uống thơm ngon, mát lạnh và tiết kiệm tối đa với chương trình "Thanh Mát Lên Ngàn"!

TeaShop - Nơi mang đến cho bạn những ly trà chất lượng và những phút giây thư giãn tuyệt vời!

Điều khoản và điều kiện:

Chương trình áp dụng cho tất cả các cửa hàng TeaShop trên toàn quốc.
Không áp dụng đồng thời với các chương trình khuyến mãi khác.
TeaShop có quyền thay đổi điều khoản và điều kiện chương trình mà không cần báo trước.
Liên hệ ngay:

Trang mạng: https://www.facebook.com/TeaShoppeWV/
Đường dây nóng: 01234567890
Đừng bỏ lỡ cơ hội thưởng thức những thức uống ngon tuyệt vời với giá ưu đãi hấp dẫn tại TeaShop!
', N'giamgia1.jpg', N'Thỏa Mát Mùa Hè Cùng Chương Trình Giảm Giá "Thanh Mát Lên Ngàn" Của TeaShop!', CAST(N'2024-05-30' AS Date), 1, 0)
GO
INSERT [dbo].[Blog] ([id], [role_id], [content], [img], [blog_name], [created_at], [categoryID], [is_deleted]) VALUES (2, 4, N'Chào mừng Black Friday tại Teashop!

Hãy hòa mình vào không khí mua sắm sôi động và tận hưởng ưu đãi giảm giá 10% cho tất cả các loại trà yêu thích của bạn tại Teashop. Dù bạn là người sành trà lâu năm hay mới bắt đầu khám phá thế giới trà, Teashop đều có thứ dành cho bạn.

Thưởng thức hương vị tuyệt vời của các loại trà với giá ưu đãi Black Friday
Chúc bạn mua sắm Black Friday vui vẻ tại Teashop!

Trang mạng: https://www.facebook.com/TeaShoppeWV/
Đường dây nóng: 01234567890
Đừng bỏ lỡ cơ hội thưởng thức những thức uống ngon tuyệt vời với giá ưu đãi hấp dẫn tại TeaShop!
', N'giamgia3.jpg', N'Black Friday Bùng Nổ - Giảm Giá 10% Toàn Bộ Trà Tại Teashop!', CAST(N'2024-05-29' AS Date), 1, 0)
GO
INSERT [dbo].[Blog] ([id], [role_id], [content], [img], [blog_name], [created_at], [categoryID], [is_deleted]) VALUES (3, 4, N'Hòa chung không khí náo nhiệt của Ngày Quốc tế Thiếu nhi, Dreamy Coffee tổ chức cuộc thi vẽ tranh với chủ đề "Tuổi thơ rực rỡ - Ước mơ bay xa".

Em nhỏ nào yêu thích vẽ tranh, hãy thỏa sức sáng tạo và thể hiện ước mơ của mình qua những nét vẽ đầy màu sắc!

Thông tin chi tiết về cuộc thi:

Đối tượng: Các em học sinh từ 6 đến 15 tuổi.
Chủ đề: "Tuổi thơ rực rỡ - Ước mơ bay xa".
Hình thức: Vẽ tranh trên giấy A3.
Thời gian nộp bài: Từ giờ đến 7/6.
Tác phẩm đoạt giải Nhất sẽ được vinh danh và treo trang trọng tại Dreamy Coffee.
Hãy tham gia cuộc thi để thể hiện niềm vui và ước mơ của tuổi thơ, đồng thời có cơ hội nhận được những giải thưởng hấp dẫn!
', N'giamgia2.jpg', N'Tung bừng sắc màu - Chào mừng Quốc tế Thiếu nhi 1/6!', CAST(N'2024-05-28' AS Date), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategory] ON 
GO
INSERT [dbo].[BlogCategory] ([categoryID], [categoryName]) VALUES (1, N'Product Reviews')
GO
INSERT [dbo].[BlogCategory] ([categoryID], [categoryName]) VALUES (2, N'Sale')
GO
INSERT [dbo].[BlogCategory] ([categoryID], [categoryName]) VALUES (3, N'Prize')
GO
INSERT [dbo].[BlogCategory] ([categoryID], [categoryName]) VALUES (4, N'Other')
GO
SET IDENTITY_INSERT [dbo].[BlogCategory] OFF
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
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (7, N'Cà Phê Cốt ')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [comment], [created_at], [rating]) VALUES (7, 7, 1, N'Tuyệt cà là vời', CAST(N'2024-07-04T13:30:00.000' AS DateTime), 5)
GO
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [comment], [created_at], [rating]) VALUES (8, 7, 2, N'quá ngon', CAST(N'2024-07-04T15:35:47.667' AS DateTime), 5)
GO
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [comment], [created_at], [rating]) VALUES (9, 7, 1, N'Tuyet qua', CAST(N'2024-07-05T10:18:37.220' AS DateTime), 4)
GO
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [comment], [created_at], [rating]) VALUES (11, 7, 2, N'Tỵt cà là vời', CAST(N'2024-07-21T21:30:45.627' AS DateTime), 4)
GO
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [comment], [created_at], [rating]) VALUES (12, 7, 3, N'Tuyet ca la voi', CAST(N'2024-07-25T15:52:55.407' AS DateTime), 4)
GO
INSERT [dbo].[Feedback] ([feedback_id], [account_id], [product_id], [comment], [created_at], [rating]) VALUES (15, 16, 1, N'Quá ngon ', CAST(N'2024-07-28T07:21:24.703' AS DateTime), 5)
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (1, 1, 1, 1, 1, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/cafe-cot-dua-3-800x800.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (2, 2, 1, 2, 2, N'uploadImages/448964945_867413702075691_8685861228586756902_n.jpg', N'uploadImages/cafe-cot-dua-3-800x800.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (3, 3, 2, 2, 2, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (4, 1, 6, 1, 2, N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg', N'uploadImages/....jfif')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (5, 1, 7, 1, 2, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/....jfif')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (6, 2, 8, 4, 2, N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg', N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (7, 6, 8, 3, 1, N'uploadImages/cafe-cot-dua-3-800x800.jpg', N'uploadImages/cafe-cot-dua-3-800x800.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (8, 2, 9, 1, 1, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (9, 1, 10, 3, 1, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (10, 2, 10, 2, 2, N'uploadImages/cafe-cot-dua-3-800x800.jpg', N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (13, 1, 13, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (14, 2, 13, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (15, 3, 13, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (16, 2, 14, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (17, 3, 14, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (18, 2, 16, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (19, 3, 16, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (20, 1, 17, 3, 2, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (21, 2, 17, 1, 2, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (22, 3, 17, 1, 2, N'uploadImages/cafe-cot-dua-3-800x800.jpg', N'uploadImages/cafe-cot-dua-3-800x800.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (23, 1, 18, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (24, 2, 18, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (25, 1, 19, 3, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (26, 2, 19, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (27, 1, 20, 3, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (28, 2, 20, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (29, 3, 20, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (30, 2, 21, 3, 2, N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg', N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (31, 3, 21, 1, 2, N'uploadImages/cafe-cot-dua-3-800x800.jpg', N'uploadImages/cafe-cot-dua-3-800x800.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (32, 3, 22, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (33, 6, 22, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (34, 3, 23, 1, 2, NULL, NULL)
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (35, 1, 24, 1, 1, N'uploadImages/417739129_763570695793326_3313564972350183483_n.jpg', N'uploadImages/417738807_763570699126659_2237114998338369130_n.jpg')
GO
INSERT [dbo].[OrderDetails] ([order_details_id], [product_id], [order_id], [quantity], [status_feedback_id], [image], [image_after_ship]) VALUES (36, 2, 24, 2, 2, N'uploadImages/448964945_867413702075691_8685861228586756902_n.jpg', N'uploadImages/448164797_858064519677276_6778494698323381970_n.jpg')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (1, 7, CAST(N'2024-06-11T15:30:00.000' AS DateTime), 120000, 4, N'Ship nhanh xíu ', CAST(N'2024-07-28T12:39:00.000' AS DateTime), N'Tầng 6, Tòa nhà Việt Á, Số 9 phố Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, N'Ok', CAST(N'2024-07-27T15:25:09.793' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (2, 7, CAST(N'2024-06-15T02:30:00.000' AS DateTime), 80000, 4, N'nhé', CAST(N'2024-07-21T18:45:00.000' AS DateTime), N'Tầng 6, Tòa nhà Việt Á, Số 9 phố Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Thành phố Hà Nội', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, N'fhhfh', CAST(N'2024-07-27T15:26:00.083' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (6, 7, CAST(N'2024-07-14T11:54:09.000' AS DateTime), 54000, 4, N'Hihi', CAST(N'2024-07-24T19:25:00.000' AS DateTime), N'hahaha, Phường Phú Thượng, Quận Tây Hồ', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, NULL, CAST(N'2024-07-28T00:30:38.553' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (7, 7, CAST(N'2024-07-16T02:08:28.000' AS DateTime), 54000, 4, N'huhu', CAST(N'2024-07-23T23:09:00.000' AS DateTime), N'hahaha, Phường , Quận Hoàn Kiếm', N'Nguyen Xuan HOang', N'COD', N'0345678890', N'khách bom hàng', N'Ship nhẹ nhàng thoi nhe', CAST(N'2024-07-28T07:03:19.893' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (8, NULL, CAST(N'2024-07-19T08:50:46.000' AS DateTime), 231000, 3, N'', CAST(N'2024-07-19T21:35:00.000' AS DateTime), N'Hanoi, Phường Phương Liên, Quận Đống Đa', N'hoang dx', N'COD', N'0345638419', NULL, NULL, CAST(N'2024-07-27T15:20:02.187' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (9, 7, CAST(N'2024-07-22T21:14:38.000' AS DateTime), 46050, 5, N'', CAST(N'2024-07-23T22:35:00.000' AS DateTime), N'Hanoi, Phường Cửa Nam, Quận Hoàn Kiếm', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', N'khách bom hàng', NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (10, NULL, CAST(N'2024-07-22T21:34:04.000' AS DateTime), 253800, 4, N'Them da', CAST(N'2024-07-26T21:39:00.000' AS DateTime), N'Hanoi, Phường Đội Cấn, Quận Ba Đình', N'hoang dx', N'VNPay', N'0345638419', NULL, NULL, CAST(N'2024-07-26T20:48:17.323' AS DateTime), N'95042543')
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (13, 7, CAST(N'2024-07-22T22:08:50.000' AS DateTime), 107950, 1, N'', NULL, N', Phường Quảng An, Quận Tây Hồ', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (14, 7, CAST(N'2024-07-22T22:14:32.000' AS DateTime), 62050, 1, N'', NULL, N', Phường , ', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (16, NULL, CAST(N'2024-07-22T22:16:16.000' AS DateTime), 62050, 1, N'', NULL, N'hanoi, Phường Phú Thượng, Quận Tây Hồ', N'Nguyen Hoàng', N'COD', N'0345638419', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (17, NULL, CAST(N'2024-07-22T22:33:44.000' AS DateTime), 223750, 4, N'Thêm nhiều đá nhé', CAST(N'2024-07-27T22:35:00.000' AS DateTime), N'hanoi, Phường Đội Cấn, Quận Ba Đình', N'hoang dx', N'VNPay', N'0345638419', NULL, NULL, CAST(N'2024-07-26T23:17:43.340' AS DateTime), N'44053850')
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (18, 7, CAST(N'2024-07-22T22:43:43.000' AS DateTime), 97950, 3, N'', NULL, N'17 , Phường Hàng Bạc, Quận Hoàn Kiếm', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, N'Đơn hàng đã hết', NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (19, 7, CAST(N'2024-07-22T22:58:11.000' AS DateTime), 201750, 1, N'', NULL, N'hanoi, Phường Đồng Nhân, Quận Hai Bà Trưng', N'Nguyễn Xuân Hoàng', N'VNPay', N'0345638419', NULL, NULL, NULL, N'78379265')
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (20, NULL, CAST(N'2024-07-22T23:01:51.000' AS DateTime), 247750, 1, N'', NULL, N'hanoi, Phường Hàng Bồ, Quận Hoàn Kiếm', N'hoa nguyen', N'VNPay', N'0345638419', NULL, NULL, NULL, N'41001059')
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (21, NULL, CAST(N'2024-07-22T23:08:35.000' AS DateTime), 166150, 4, N'', CAST(N'2024-07-23T23:09:00.000' AS DateTime), N'dâda, Phường Phú Thượng, Quận Tây Hồ', N'Hoagn  Nguyen', N'VNPay', N'0345638419', NULL, NULL, CAST(N'2024-07-27T15:23:32.060' AS DateTime), N'72590604')
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (22, 7, CAST(N'2024-07-22T23:18:05.000' AS DateTime), 74050, 1, N'', NULL, N'hanoi, Phường Nhật Tân, Quận Tây Hồ', N'Nguyễn Xuân Hoàng', N'COD', N'0345638419', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (23, NULL, CAST(N'2024-07-26T23:31:10.000' AS DateTime), 40000, 2, N'', NULL, N'hanoi, Phường Nghĩa Đô, Quận Cầu Giấy', N'hoang da', N'COD', N'0345638419', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([order_id], [account_id], [order_date], [total_amount], [status_id], [note], [estimated_delivery_date], [address], [full_name], [payment_method], [phone_number], [shipper_note], [staff_note], [shipper_delivery_time], [vnp_TxnRef]) VALUES (24, 16, CAST(N'2024-07-28T07:13:38.000' AS DateTime), 139620, 4, N'', CAST(N'2024-07-28T07:30:00.000' AS DateTime), N'So1 , Phường Đội Cấn, Quận Ba Đình', N'trang hihi', N'VNPay', N'0345638419', NULL, NULL, CAST(N'2024-07-28T07:18:59.020' AS DateTime), N'87293831')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (1, N'Ô LONG VANI SỮA', 1, N'/TeaShop/img/olongvalisua.jpg', 54000, 12, CAST(N'2024-05-10' AS Date), N'Thưởng thức sự kết hợp hoàn hảo giữa trà ô long thơm lừng và hương vị vani ngọt ngào trong từng ngụm Ô Long Vani Sữa. Được chế biến từ những lá trà ô long tuyển chọn, Ô Long Vani Sữa mang đến hương vị thanh mát và mượt mà, hòa quyện cùng sự dịu ngọt của vani và sữa. Ô Long Vani Sữa không chỉ là một thức uống giải khát tuyệt vời mà còn mang đến trải nghiệm thưởng trà tinh tế, lý tưởng cho những lúc cần thư giãn hay những buổi gặp gỡ bạn bè.', NULL, 7)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (2, N'PHÙ VÂN', 1, N'/TeaShop/img/phuvan.jpg', 33000, 15, CAST(N'2024-03-11' AS Date), N'Khám phá hương vị tinh tế và quyến rũ của Phù Vân, đây là sự hòa quyện hoàn hảo giữa vị trà ô long đỏ thượng hạng và lớp kem whipping mềm mịn, tạo nên một trải nghiệm thưởng thức đầy mê hoặc. Phù Vân không chỉ là một thức uống tinh tế mà còn là một sự kết hợp độc đáo giữa truyền thống và hiện đại. Lý tưởng cho những lúc cần thư giãn, tận hưởng những phút giây yên bình hoặc chia sẻ cùng bạn bè và người thân.', NULL, 8)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (3, N'Ô LONG TRỨNG', 1, N'/TeaShop/img/olongtrungbong.jpg', 40000, 15, CAST(N'2024-05-12' AS Date), N'Thưởng thức sự đột phá độc đáo và hấp dẫn của Ô Long Trứng, một thức uống kết hợp giữa hương vị trà ô long tinh tế và lớp kem trứng béo ngậy, mịn màng. Đây là sự kết hợp tuyệt vời giữa truyền thống và sáng tạo, mang đến trải nghiệm thưởng thức hoàn toàn mới mẻ và đầy cuốn hút. Ô Long Trứng không chỉ là một thức uống độc đáo mà còn là một trải nghiệm ẩm thực tinh tế, lý tưởng cho những ai muốn khám phá sự mới lạ trong từng ngụm trà. Hãy để Ô Long Trứng đưa bạn vào một hành trình hương vị đầy bất ngờ và thú vị, hoàn hảo cho mọi khoảnh khắc trong ngày.', NULL, 12)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (4, N'Ô LONG SỮA', 1, N'/TeaShop/img/olongsuaphela.jpg', 45000, 15, CAST(N'2024-05-13' AS Date), N'Khám phá hương vị thanh mát và đầy quyến rũ của Ô Long Sữa, một sự kết hợp tuyệt vời giữa trà ô long thơm lừng và vị sữa béo ngậy, mịn màng. Mỗi ngụm trà mang đến sự hài hòa tinh tế, giúp bạn tận hưởng những phút giây thư giãn và sảng khoái. Ô Long Sữa không chỉ là một thức uống giải khát tuyệt vời mà còn là một trải nghiệm thưởng trà tinh tế. Hoàn hảo cho mọi khoảnh khắc, từ những lúc thư giãn cá nhân đến những buổi gặp gỡ bạn bè và người thân. Hãy để Ô Long Sữa làm mới ngày của bạn với hương vị đậm đà và sự mượt mà khó quên.', NULL, 20)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (5, N'Ô LONG NHÀI SỮA', 1, N'/TeaShop/img/olongnhaisua.jpg', 30000, 15, CAST(N'2024-05-14' AS Date), N'Ô Long Nhài Sữa là sự kết hợp hoàn hảo giữa trà ô long hảo hạng, hoa nhài thơm ngát và vị sữa béo ngậy với hương vị độc đáo và quyến rũ. Trà ô long của chúng tôi được chọn lọc kỹ lưỡng, nổi bật với vị trà đậm đà, hậu ngọt và hương thơm tự nhiên. Hương nhài thanh thoát, nhẹ nhàng, mang lại cảm giác thư giãn và dễ chịu, sữa tươi nguyên chất tạo độ béo mịn, bổ sung vị ngọt nhẹ, cân bằng vị trà và mang đến một thức uống hài hòa. Hãy thưởng thức Ô Long Nhài Sữa để trải nghiệm sự tinh tế và thanh tao trong từng ngụm trà', NULL, 30)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (6, N'PHAN XI PĂNG', 1, N'/TeaShop/img/phanxipang.jpg', 33000, 15, CAST(N'2024-05-15' AS Date), N'Phan Xi Păng là sự pha trộn tinh tế giữa vị đậm đà của trà ô long đỏ đặc sản và hương vị béo ngậy, mát lạnh của cốt dừa đá xay. Đây là thức uống lý tưởng cho những ai yêu thích sự kết hợp độc đáo và sáng tạo, mang đến trải nghiệm thưởng thức trà hoàn toàn mới lạ và sảng khoái. Vị trà ô long đỏ đậm đà, thơm ngát hòa quyện cùng vị béo ngọt của cốt dừa và cảm giác mát lạnh từ đá xay. Thức uống này tạo nên sự cân bằng hoàn hảo, vừa thơm ngon, vừa sảng khoái.', NULL, 44)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (7, N'KHÓI B''LAO', 2, N'/TeaShop/img/khoiblao.jpg', 45000, 15, CAST(N'2024-05-16' AS Date), N'Khói B''Lao là một sự kết hợp độc đáo giữa các tầng hương khói và hương hoa ngọc lan, tạo nên một trải nghiệm thưởng thức đặc biệt và đầy cuốn hút. Với nốt hương đầu là khói đậm, hương giữa là khói nhẹ và đọng lại ở hậu vị là hương hoa ngọc lan, Khói B''Lao là biểu tượng của sự phong phú và phức tạp trong thế giới hương vị. Khói B''Lao không chỉ là một thức uống mà còn là một hành trình khám phá hương vị độc đáo. Hãy tận hưởng mỗi ngụm trà, từ cảm giác mạnh mẽ của khói đến sự êm dịu của hoa ngọc lan, để trải nghiệm hết mức sự phong phú và phức tạp trong hương vị này.', NULL, 20)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (8, N'TẤM', 2, N'/TeaShop/img/tam.jpg', 45000, 15, CAST(N'2024-05-17' AS Date), N'Tấm là một sự kết hợp độc đáo và bất ngờ giữa hương vị đậm đà của trà Ô Long và sự thơm ngon, bùi bởi gạo rang. Với sự hài hoà tinh tế giữa hai nguyên liệu này, Tấm không chỉ là một thức uống mà còn là một trải nghiệm đích thực cho các tín đồ của hương vị trà và hương thơm của gạo rang. Tấm không chỉ là một thức uống mà còn là một hành trình khám phá hương vị. Hãy tận hưởng mỗi ngụm trà, từ hương thơm của trà Ô Long đến hương vị đặc trưng của gạo rang, để trải nghiệm hết mức sự phong phú và sáng tạo trong hương vị này.', NULL, 45)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (9, N'CÀ PHÊ Ủ LẠNH', 3, N'/TeaShop/img/caphetulanh.jpg', 30000, 15, CAST(N'2024-05-18' AS Date), N'Cà Phê Ủ Lạnh là một sự kết hợp độc đáo giữa cà phê đặc biệt được ủ lạnh bằng khí Nitơ và hương vị tươi mới của trái cây tươi. Với sự hòa quyện của hai yếu tố này, cà phê này không chỉ mang lại hương vị đặc trưng của cà phê mà còn bùng tỏa nốt hương tự nhiên và sảng khoái của trái cây tươi. Cà Phê Đặc Sản Nitơ Ủ Lạnh không chỉ là một thức uống mà còn là một trải nghiệm tuyệt vời. Hãy tận hưởng từng ngụm cà phê mát lạnh, bùng tỏa hương vị tự nhiên và sảng khoái của trái cây tươi, để trải nghiệm hết mức sự phong phú và sảng khoái trong hương vị này.', NULL, 23)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (10, N'PHÊ NÂU TRUFFLE', 3, N'/TeaShop/img/phenautruffle.jpg', 33000, 15, CAST(N'2024-05-19' AS Date), N'Phê Nâu Truffle là sự hòa quyện tinh tế giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng, thêm vào đó là hương vị đặc biệt của nấm Truffle Đen quý hiếm. Kết hợp này tạo nên một hương vị đậm đà, mượt mà và độc đáo, đem đến cho thực khách một trải nghiệm cà phê tuyệt vời và không thể quên. Phê Nâu Truffle - một trải nghiệm cà phê đậm đà và độc đáo, mang lại cho bạn cảm giác thư giãn và ngưỡng mộ từng giọt. Hãy khám phá thức uống này ngay hôm nay để tận hưởng hương vị tinh tế và đặc biệt của Phê Nâu Truffle.', NULL, 34)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (11, N'PHÊ TRUFFLE', 3, N'/TeaShop/img/phetruffle.jpg', 43000, 15, CAST(N'2024-05-20' AS Date), N'Phê Truffle là một sản phẩm sáng tạo, kết hợp giữa hương vị đậm mượt của cà phê và hương thơm ngậy của kem nấm truffle đen. Với sự hòa quyện tinh tế này, Phê Truffle mang đến một trải nghiệm cà phê độc đáo, bùng nổ và đầy phóng khoáng, làm hài lòng cả những tín đồ cà phê khó tính nhất. Phê Truffle không chỉ là một ly cà phê, mà còn là một trải nghiệm tuyệt vời. Hãy tận hưởng mỗi ngụm cà phê, từ hương thơm đặc trưng của kem nấm truffle đen đến vị đậm mượt của cà phê, để trải nghiệm sự phóng khoáng và độc đáo của hương vị này.', NULL, 23)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (12, N'PHÊ NÂU', 3, N'/TeaShop/img/phenau.jpg', 43000, 15, CAST(N'2024-05-21' AS Date), N'Phê Nâu - một sản phẩm cà phê đậm đà và gần gũi, mang đến cho bạn một trải nghiệm cà phê thú vị và đặc biệt. Phê Nâu là sự kết hợp tuyệt vời giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng. Khi hoà quyện cùng sữa đặc, Phê Nâu mang lại hương vị đậm đà, mượt mà và gần gũi, tạo nên một trải nghiệm cà phê thú vị và đặc biệt. Hãy khám phá hương vị này ngay hôm nay để tận hưởng cảm giác thư giãn và hưởng thụ từng giọt cà phê thơm ngon của Phê Nâu.', NULL, 62)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (13, N'PHÊ ĐEN', 3, N'/TeaShop/img/capheden.jpg', 53000, 15, CAST(N'2024-05-22' AS Date), N'Phê Đen là một sản phẩm cà phê không đường, kết hợp giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng. Tạo nên hương vị đậm đà, mượt mà và đầy tinh tế, Phê Đen mang lại một trải nghiệm cà phê đặc biệt và sảng khoái. Phê Đen không chỉ là một ly cà phê, mà còn là một trải nghiệm thú vị. Hãy tận hưởng mỗi ngụm cà phê, từ vị chua nhẹ của Arabica đến sự mạnh mẽ của Robusta, để trải nghiệm sự đậm đà và mượt mà của hương vị này.', NULL, 64)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (14, N'PHÊ ĐÀ LẠT', 3, N'/TeaShop/img/dalat.jpg', 55000, 15, CAST(N'2024-05-23' AS Date), N'Phê Đà Lạt là một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê Arabica Đà Lạt và hương thơm ngậy của kem Whipping. Được tạo ra từ những nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Phê Đà Lạt mang đến cho bạn một trải nghiệm cà phê độc đáo và thú vị. Phê Đà Lạt - một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê Arabica Đà Lạt và hương thơm ngậy của kem Whipping, mang đến cho bạn một trải nghiệm cà phê độc đáo và thú vị.', NULL, 43)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (15, N'CÀ PHÊ TRỨNG BÔNG', 3, N'/TeaShop/img/caphetrungbong.jpg', 55000, 15, CAST(N'2024-05-24' AS Date), N'Cafe Trứng Bông là một biểu tượng của hương vị đậm đà của cà phê Arabica kết hợp hài hòa với vị thơm ngậy của lớp kem trứng. Được sáng tạo từ những nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Cafe Trứng Bông mang đến cho bạn một trải nghiệm cà phê độc đáo và tinh tế. Với hương vị đặc trưng và đậm đà, cà phê Arabica tạo ra một lớp nền cơ bản hoàn hảo cho Cafe Trứng Bông, mang lại cảm giác sảng khoái và phức tạp từ mỗi ngụm uống. Hương thơm ngậy của kem trứng thêm vào sự ngọt ngào và béo ngậy, tạo ra một sự kết hợp hoàn hảo với hương vị cà phê, tạo nên một trải nghiệm hương vị độc đáo và tinh tế.', NULL, 32)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (16, N'GẤM', 4, N'/TeaShop/img/gam.jpg', 44000, 15, CAST(N'2024-04-23' AS Date), N'Gấm là một hợp chất tinh tế giữa hương vị thơm mát của trà Ô Long Vải và vị ngọt căng mọng của trái vải. Từ những nguyên liệu chất lượng và kỹ thuật pha chế tỉ mỉ, Gấm mang lại cho bạn một trải nghiệm thức uống ngọt mát và thanh khiết, hoàn hảo cho mọi dịp. Hòa quyện với hương vị dịu nhẹ và thơm mát của trà Ô Long, tạo ra một cảm giác sảng khoái và thư giãn ngay từ những ngụm đầu tiên. Với vị ngọt tự nhiên và độ ẩm tươi mát, trái vải mang lại sự cân bằng và hòa quyện tuyệt vời với trà Ô Long, tạo nên một dư vị ngọt mát và thanh khiết.', NULL, 53)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (17, N'Ô LONG ĐÀO ĐỎ', 4, N'/TeaShop/img/olongdaodo.jpg', 54000, 15, CAST(N'2024-02-10' AS Date), N'Ô Long Đào Đỏ là một sự kết hợp tinh tế giữa hương vị thanh nhẹ của trà Ô Long và sự ngọt mát của đào tươi. Từ những nguyên liệu tươi ngon và kỹ thuật pha chế tinh tế, Ô Long Đào Đỏ sẽ đánh thức vị giác của bạn và mang lại cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị dịu dàng và thanh nhẹ của trà Ô Long làm nổi bật hương thơm tự nhiên và sảng khoái, tạo cảm giác sảng khoái và thư giãn cho người thưởng thức. Những miếng đào tươi ngon vàng giòn thêm vào hương vị của thức uống, tạo ra một sự kết hợp hài hòa giữa ngọt mát và độ giòn của trái cây, đủ để làm đánh thức vị giác của bạn', NULL, 69)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (18, N'TRÀ VỎ CÀ PHÊ', 4, N'/TeaShop/img/travocaphe.jpg', 33000, 15, CAST(N'2024-01-10' AS Date), N'Trà Vỏ Cà Phê là một sự kết hợp độc đáo giữa hương trà thơm nhẹ và vị chua dịu của chanh vàng, với nguyên liệu chính là trà ủ từ vỏ cà phê. Từ sự lựa chọn cẩn thận của nguyên liệu đến kỹ thuật pha chế tinh tế, Trà Vỏ Cà Phê mang đến cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương trà nhẹ nhàng và thơm phức từ trà ủ từ vỏ cà phê tạo ra một lớp nền tinh tế cho thức uống, mang lại cảm giác sảng khoái và thư giãn. Vị chua dịu của chanh vàng hoà quyện với hương trà, tạo ra một sự kết hợp hài hòa giữa hương vị ngọt ngào và chua chát, đem lại cảm giác cân bằng và sảng khoái cho vị giác.', NULL, 53)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (19, N'Ô LONG NHÀI KEM ', 5, N'/TeaShop/img/olongnhaikemcheese.jpg', 40000, 15, CAST(N'2024-02-21' AS Date), N'Ô Long Nhài Kem là một phiên bản độc đáo của trà Ô Long Đặc Sản, được ủ lạnh cùng hoa nhài tự nhiên, và kết hợp với lớp kem cheese sáng tạo và hương thơm ngọt ngào từ vani tự nhiên. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế đặc biệt, Ô Long Nhài Kem mang đến cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương vị đặc trưng của trà Ô Long kết hợp với sự dịu dàng và thơm ngát của hoa nhài tự nhiên, tạo ra một hòa quyện tinh tế, đem lại cảm giác sảng khoái và thư giãn. Lớp kem cheese sáng tạo và hương thơm ngọt ngào từ vani tự nhiên tạo điểm nhấn cho thức uống, tạo ra một sự kết hợp ngon ngọt và thơm ngon.', NULL, 97)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (20, N'LANG BIANG', 5, N'/TeaShop/img/langbiang.jpg', 45000, 15, CAST(N'2024-03-24' AS Date), N'Lang Biang là một sự kết hợp tinh tế giữa hương vị thuần khiết của trà Ô Long Đặc Sản và hương thơm nhẹ của mứt hoa nhài. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Lang Biang mang lại cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương vị đặc trưng và thuần khiết của trà Ô Long Đặc Sản tạo nên lớp nền cho thức uống, mang lại cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Hương thơm nhẹ nhàng và dịu dàng của mứt hoa nhài hoà quyện với hương vị trà, tạo ra một sự kết hợp hài hòa và độc đáo.', NULL, 57)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (21, N'Ô LONG NHIỆT ĐỚI', 5, N'/TeaShop/img/olongnhietdoi.jpg', 50000, 15, CAST(N'2024-03-19' AS Date), N'Ô Long Nhiệt Đới là một sự kết hợp tinh tế giữa hương vị tươi mát của trà Ô Long Đặc Sản và sự ngọt ngào của trái cây nhiệt đới. Từ sự hòa quyện kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Ô Long Nhiệt Đới mang lại cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị đặc trưng và tinh tế của trà Ô Long Đặc Sản tạo nên lớp nền cho thức uống, mang lại cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Sự kết hợp của trái cây nhiệt đới như xoài, dứa, cam... tạo ra hương vị tươi mát và ngọt ngào, làm tôn lên sự phong phú và đa dạng của thức uống.', NULL, 29)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (22, N'MATCHA ĐÁ XAY', 6, N'/TeaShop/img/matchadaxay.jpg', 50000, 15, CAST(N'2024-01-29' AS Date), N'Matcha Đá Xay là một sự kết hợp tinh tế giữa hương vị mát lạnh của ô long matcha và sự ngọt thơm của sữa dừa Bến Tre hữu cơ. Từ sự kết hợp cân bằng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Matcha Đá Xay mang đến cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị đặc trưng của ô long matcha, khi kết hợp với lớp đá xay mát lạnh, tạo ra một cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Sự ngọt ngào và thơm mát của sữa dừa hữu cơ Bến Tre hoà quyện với hương vị matcha, tạo ra một hòa quyện hài hòa và độc đáo. Lớp kem matcha dừa thơm ngậy phủ lên trên cùng, tạo điểm nhấn và tăng thêm hương vị đặc biệt cho thức uống.', NULL, 49)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (23, N'MATCHA COCO LATTE', 6, N'/TeaShop/img/matchacoclatte.jpg', 55000, 15, CAST(N'2024-03-22' AS Date), N'Matcha Coco Latte là một hòa quyện đầy mê hoặc giữa lớp kem ô long matcha bồng bềnh sánh mịn và sữa dừa Bến Tre hữu cơ ngọt thơm. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Matcha Coco Latte mang lại cho bạn một trải nghiệm thức uống đặc biệt và đầy sức hút. Hương vị đặc trưng của ô long matcha được thể hiện qua lớp kem bồng bềnh sánh mịn, tạo ra một cảm giác mát lạnh và đầy sảng khoái từ mỗi ngụm uống. Sự ngọt ngào và thơm thơm của sữa dừa hữu cơ Bến Tre hòa quyện với hương vị matcha, tạo ra một sự kết hợp hài hòa và độc đáo.', NULL, 51)
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description], [status], [sales_numbers]) VALUES (25, N'Cà Phê Cốt ', 1, N'uploads/cafe-cot-dua-3-800x800.jpg', 50000, 15, CAST(N'2024-07-06' AS Date), N'Ok', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'User')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Staff')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Shipper')
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 
GO
INSERT [dbo].[Slider] ([id], [name], [description], [url], [image], [status]) VALUES (1, N'Slider_1', N'Welcome to our shop!', N'/shop', N'anh1.jpg', 1)
GO
INSERT [dbo].[Slider] ([id], [name], [description], [url], [image], [status]) VALUES (2, N'Slider_2', N'Joy products!', N'/shop', N'anh2.jpg', 1)
GO
INSERT [dbo].[Slider] ([id], [name], [description], [url], [image], [status]) VALUES (3, N'Slider_3', N'Coffee!', N'/shop', N'anh3.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'Chờ xác nhận')
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Chờ làm đơn hàng')
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'Chờ giao hàng')
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (4, N'Hoàn thành')
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (5, N'Đơn hàng giao không thành công')
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (6, N'Đã hủy đơn hàng')
GO
INSERT [dbo].[StatusFeedback] ([status_feedback_id], [status_feedback_name]) VALUES (1, N'Đã đánh giá')
GO
INSERT [dbo].[StatusFeedback] ([status_feedback_id], [status_feedback_name]) VALUES (2, N'Chưa đánh giá')
GO
SET IDENTITY_INSERT [dbo].[Topping] ON 
GO
INSERT [dbo].[Topping] ([topping_id], [topping_name]) VALUES (1, N'Trân Châu Phong Lan')
GO
INSERT [dbo].[Topping] ([topping_id], [topping_name]) VALUES (2, N'Trân Châu Gạo Rang')
GO
INSERT [dbo].[Topping] ([topping_id], [topping_name]) VALUES (3, N'Trân Châu Ô Long')
GO
INSERT [dbo].[Topping] ([topping_id], [topping_name]) VALUES (4, N'Nha đam trắng')
GO
INSERT [dbo].[Topping] ([topping_id], [topping_name]) VALUES (5, N'Trân châu đen')
GO
SET IDENTITY_INSERT [dbo].[Topping] OFF
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (6, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (6, 3)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (8, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (8, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (8, 3)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (9, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (9, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (10, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (10, 3)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (21, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (21, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (22, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (22, 3)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (23, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (23, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (24, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (24, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (25, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (25, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (32, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (32, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (34, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (35, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (35, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (36, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (36, 3)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (27, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (27, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (28, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (28, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (30, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (30, 2)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (31, 1)
GO
INSERT [dbo].[ToppingDetails] ([order_details_id], [topping_id]) VALUES (31, 2)
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
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_BlogCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[BlogCategory] ([categoryID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_BlogCategory]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Role]
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
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_StatusFeedback] FOREIGN KEY([status_feedback_id])
REFERENCES [dbo].[StatusFeedback] ([status_feedback_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_StatusFeedback]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Accounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
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
