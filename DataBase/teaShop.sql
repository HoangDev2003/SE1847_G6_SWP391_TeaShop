

/****** Object:  Database [TeaShop]    Script Date: 5/30/2024 11:29:02 PM ******/
CREATE DATABASE [TeaShop]
 
USE [TeaShop]
GO
/****** Object:  User [sa]    Script Date: 5/30/2024 11:29:03 PM ******/

/****** Object:  Table [dbo].[Accounts]    Script Date: 5/30/2024 11:29:03 PM ******/
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[pass_word] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[email] [nvarchar](50) NULL,
	[created_at] [timestamp] NOT NULL,
	[status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatuses]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[CartDetails]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[CodeSale]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 5/30/2024 11:29:03 PM ******/
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
 CONSTRAINT [PK__Product__B40CC6ED7A47CDB7] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 5/30/2024 11:29:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[product_details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[discount] [float] NOT NULL,
 CONSTRAINT [PK__ProductD__2991D8BF7A0AD228] PRIMARY KEY CLUSTERED 
(
	[product_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[Topping]    Script Date: 5/30/2024 11:29:03 PM ******/
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
/****** Object:  Table [dbo].[ToppingDetails]    Script Date: 5/30/2024 11:29:03 PM ******/
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
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (1, N'Ô LONG VANI SỮA', 1, N'/TeaShop/img/olongvalisua.jpg', 54000, NULL, CAST(N'2024-05-10' AS Date), N'Thưởng thức sự kết hợp hoàn hảo giữa trà ô long thơm lừng và hương vị vani ngọt ngào trong từng ngụm Ô Long Vani Sữa. Được chế biến từ những lá trà ô long tuyển chọn, Ô Long Vani Sữa mang đến hương vị thanh mát và mượt mà, hòa quyện cùng sự dịu ngọt của vani và sữa. Ô Long Vani Sữa không chỉ là một thức uống giải khát tuyệt vời mà còn mang đến trải nghiệm thưởng trà tinh tế, lý tưởng cho những lúc cần thư giãn hay những buổi gặp gỡ bạn bè.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (2, N'PHÙ VÂN', 1, N'/TeaShop/img/phuvan.jpg', 33000, NULL, CAST(N'2024-03-11' AS Date), N'Khám phá hương vị tinh tế và quyến rũ của Phù Vân, đây là sự hòa quyện hoàn hảo giữa vị trà ô long đỏ thượng hạng và lớp kem whipping mềm mịn, tạo nên một trải nghiệm thưởng thức đầy mê hoặc. Phù Vân không chỉ là một thức uống tinh tế mà còn là một sự kết hợp độc đáo giữa truyền thống và hiện đại. Lý tưởng cho những lúc cần thư giãn, tận hưởng những phút giây yên bình hoặc chia sẻ cùng bạn bè và người thân.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (3, N'Ô LONG TRỨNG', 1, N'/TeaShop/img/olongtrungbong.jpg', 40000, NULL, CAST(N'2024-05-12' AS Date), N'Thưởng thức sự đột phá độc đáo và hấp dẫn của Ô Long Trứng, một thức uống kết hợp giữa hương vị trà ô long tinh tế và lớp kem trứng béo ngậy, mịn màng. Đây là sự kết hợp tuyệt vời giữa truyền thống và sáng tạo, mang đến trải nghiệm thưởng thức hoàn toàn mới mẻ và đầy cuốn hút. Ô Long Trứng không chỉ là một thức uống độc đáo mà còn là một trải nghiệm ẩm thực tinh tế, lý tưởng cho những ai muốn khám phá sự mới lạ trong từng ngụm trà. Hãy để Ô Long Trứng đưa bạn vào một hành trình hương vị đầy bất ngờ và thú vị, hoàn hảo cho mọi khoảnh khắc trong ngày.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (4, N'Ô LONG SỮA', 1, N'/TeaShop/img/olongsuaphela.jpg', 45000, NULL, CAST(N'2024-05-13' AS Date), N'Khám phá hương vị thanh mát và đầy quyến rũ của Ô Long Sữa, một sự kết hợp tuyệt vời giữa trà ô long thơm lừng và vị sữa béo ngậy, mịn màng. Mỗi ngụm trà mang đến sự hài hòa tinh tế, giúp bạn tận hưởng những phút giây thư giãn và sảng khoái. Ô Long Sữa không chỉ là một thức uống giải khát tuyệt vời mà còn là một trải nghiệm thưởng trà tinh tế. Hoàn hảo cho mọi khoảnh khắc, từ những lúc thư giãn cá nhân đến những buổi gặp gỡ bạn bè và người thân. Hãy để Ô Long Sữa làm mới ngày của bạn với hương vị đậm đà và sự mượt mà khó quên.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (5, N'Ô LONG NHÀI SỮA', 1, N'/TeaShop/img/olongnhaisua.jpg', 30000, NULL, CAST(N'2024-05-14' AS Date), N'Ô Long Nhài Sữa là sự kết hợp hoàn hảo giữa trà ô long hảo hạng, hoa nhài thơm ngát và vị sữa béo ngậy với hương vị độc đáo và quyến rũ. Trà ô long của chúng tôi được chọn lọc kỹ lưỡng, nổi bật với vị trà đậm đà, hậu ngọt và hương thơm tự nhiên. Hương nhài thanh thoát, nhẹ nhàng, mang lại cảm giác thư giãn và dễ chịu, sữa tươi nguyên chất tạo độ béo mịn, bổ sung vị ngọt nhẹ, cân bằng vị trà và mang đến một thức uống hài hòa. Hãy thưởng thức Ô Long Nhài Sữa để trải nghiệm sự tinh tế và thanh tao trong từng ngụm trà')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (6, N'PHAN XI PĂNG', 1, N'/TeaShop/img/phanxipang.jpg', 33000, NULL, CAST(N'2024-05-15' AS Date), N'Phan Xi Păng là sự pha trộn tinh tế giữa vị đậm đà của trà ô long đỏ đặc sản và hương vị béo ngậy, mát lạnh của cốt dừa đá xay. Đây là thức uống lý tưởng cho những ai yêu thích sự kết hợp độc đáo và sáng tạo, mang đến trải nghiệm thưởng thức trà hoàn toàn mới lạ và sảng khoái. Vị trà ô long đỏ đậm đà, thơm ngát hòa quyện cùng vị béo ngọt của cốt dừa và cảm giác mát lạnh từ đá xay. Thức uống này tạo nên sự cân bằng hoàn hảo, vừa thơm ngon, vừa sảng khoái.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (7, N'KHÓI B''LAO', 2, N'/TeaShop/img/khoiblao.jpg', 45000, NULL, CAST(N'2024-05-16' AS Date), N'Khói B''Lao là một sự kết hợp độc đáo giữa các tầng hương khói và hương hoa ngọc lan, tạo nên một trải nghiệm thưởng thức đặc biệt và đầy cuốn hút. Với nốt hương đầu là khói đậm, hương giữa là khói nhẹ và đọng lại ở hậu vị là hương hoa ngọc lan, Khói B''Lao là biểu tượng của sự phong phú và phức tạp trong thế giới hương vị. Khói B''Lao không chỉ là một thức uống mà còn là một hành trình khám phá hương vị độc đáo. Hãy tận hưởng mỗi ngụm trà, từ cảm giác mạnh mẽ của khói đến sự êm dịu của hoa ngọc lan, để trải nghiệm hết mức sự phong phú và phức tạp trong hương vị này.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (8, N'TẤM', 2, N'/TeaShop/img/tam.jpg', 45000, NULL, CAST(N'2024-05-17' AS Date), N'Tấm là một sự kết hợp độc đáo và bất ngờ giữa hương vị đậm đà của trà Ô Long và sự thơm ngon, bùi bởi gạo rang. Với sự hài hoà tinh tế giữa hai nguyên liệu này, Tấm không chỉ là một thức uống mà còn là một trải nghiệm đích thực cho các tín đồ của hương vị trà và hương thơm của gạo rang. Tấm không chỉ là một thức uống mà còn là một hành trình khám phá hương vị. Hãy tận hưởng mỗi ngụm trà, từ hương thơm của trà Ô Long đến hương vị đặc trưng của gạo rang, để trải nghiệm hết mức sự phong phú và sáng tạo trong hương vị này.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (9, N'CÀ PHÊ Ủ LẠNH', 3, N'/TeaShop/img/caphetulanh.jpg', 30000, NULL, CAST(N'2024-05-18' AS Date), N'Cà Phê Ủ Lạnh là một sự kết hợp độc đáo giữa cà phê đặc biệt được ủ lạnh bằng khí Nitơ và hương vị tươi mới của trái cây tươi. Với sự hòa quyện của hai yếu tố này, cà phê này không chỉ mang lại hương vị đặc trưng của cà phê mà còn bùng tỏa nốt hương tự nhiên và sảng khoái của trái cây tươi. Cà Phê Đặc Sản Nitơ Ủ Lạnh không chỉ là một thức uống mà còn là một trải nghiệm tuyệt vời. Hãy tận hưởng từng ngụm cà phê mát lạnh, bùng tỏa hương vị tự nhiên và sảng khoái của trái cây tươi, để trải nghiệm hết mức sự phong phú và sảng khoái trong hương vị này.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (10, N'PHÊ NÂU TRUFFLE', 3, N'/TeaShop/img/phenautruffle.jpg', 33000, NULL, CAST(N'2024-05-19' AS Date), N'Phê Nâu Truffle là sự hòa quyện tinh tế giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng, thêm vào đó là hương vị đặc biệt của nấm Truffle Đen quý hiếm. Kết hợp này tạo nên một hương vị đậm đà, mượt mà và độc đáo, đem đến cho thực khách một trải nghiệm cà phê tuyệt vời và không thể quên. Phê Nâu Truffle - một trải nghiệm cà phê đậm đà và độc đáo, mang lại cho bạn cảm giác thư giãn và ngưỡng mộ từng giọt. Hãy khám phá thức uống này ngay hôm nay để tận hưởng hương vị tinh tế và đặc biệt của Phê Nâu Truffle.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (11, N'PHÊ TRUFFLE', 3, N'/TeaShop/img/phetruffle.jpg', 43000, NULL, CAST(N'2024-05-20' AS Date), N'Phê Truffle là một sản phẩm sáng tạo, kết hợp giữa hương vị đậm mượt của cà phê và hương thơm ngậy của kem nấm truffle đen. Với sự hòa quyện tinh tế này, Phê Truffle mang đến một trải nghiệm cà phê độc đáo, bùng nổ và đầy phóng khoáng, làm hài lòng cả những tín đồ cà phê khó tính nhất. Phê Truffle không chỉ là một ly cà phê, mà còn là một trải nghiệm tuyệt vời. Hãy tận hưởng mỗi ngụm cà phê, từ hương thơm đặc trưng của kem nấm truffle đen đến vị đậm mượt của cà phê, để trải nghiệm sự phóng khoáng và độc đáo của hương vị này.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (12, N'PHÊ NÂU', 3, N'/TeaShop/img/phenau.jpg', 43000, NULL, CAST(N'2024-05-21' AS Date), N'Phê Nâu - một sản phẩm cà phê đậm đà và gần gũi, mang đến cho bạn một trải nghiệm cà phê thú vị và đặc biệt. Phê Nâu là sự kết hợp tuyệt vời giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng. Khi hoà quyện cùng sữa đặc, Phê Nâu mang lại hương vị đậm đà, mượt mà và gần gũi, tạo nên một trải nghiệm cà phê thú vị và đặc biệt. Hãy khám phá hương vị này ngay hôm nay để tận hưởng cảm giác thư giãn và hưởng thụ từng giọt cà phê thơm ngon của Phê Nâu.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (13, N'PHÊ ĐEN', 3, N'/TeaShop/img/capheden.jpg', 53000, NULL, CAST(N'2024-05-22' AS Date), N'Phê Đen là một sản phẩm cà phê không đường, kết hợp giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng. Tạo nên hương vị đậm đà, mượt mà và đầy tinh tế, Phê Đen mang lại một trải nghiệm cà phê đặc biệt và sảng khoái. Phê Đen không chỉ là một ly cà phê, mà còn là một trải nghiệm thú vị. Hãy tận hưởng mỗi ngụm cà phê, từ vị chua nhẹ của Arabica đến sự mạnh mẽ của Robusta, để trải nghiệm sự đậm đà và mượt mà của hương vị này.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (14, N'PHÊ ĐÀ LẠT', 3, N'/TeaShop/img/dalat.jpg', 55000, NULL, CAST(N'2024-05-23' AS Date), N'Phê Đà Lạt là một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê Arabica Đà Lạt và hương thơm ngậy của kem Whipping. Được tạo ra từ những nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Phê Đà Lạt mang đến cho bạn một trải nghiệm cà phê độc đáo và thú vị. Phê Đà Lạt - một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê Arabica Đà Lạt và hương thơm ngậy của kem Whipping, mang đến cho bạn một trải nghiệm cà phê độc đáo và thú vị.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (15, N'CÀ PHÊ TRỨNG BÔNG', 3, N'/TeaShop/img/caphetrungbong.jpg', 55000, NULL, CAST(N'2024-05-24' AS Date), N'Cafe Trứng Bông là một biểu tượng của hương vị đậm đà của cà phê Arabica kết hợp hài hòa với vị thơm ngậy của lớp kem trứng. Được sáng tạo từ những nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Cafe Trứng Bông mang đến cho bạn một trải nghiệm cà phê độc đáo và tinh tế. Với hương vị đặc trưng và đậm đà, cà phê Arabica tạo ra một lớp nền cơ bản hoàn hảo cho Cafe Trứng Bông, mang lại cảm giác sảng khoái và phức tạp từ mỗi ngụm uống. Hương thơm ngậy của kem trứng thêm vào sự ngọt ngào và béo ngậy, tạo ra một sự kết hợp hoàn hảo với hương vị cà phê, tạo nên một trải nghiệm hương vị độc đáo và tinh tế.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (16, N'GẤM', 4, N'/TeaShop/img/gam.jpg', 44000, NULL, CAST(N'2024-04-23' AS Date), N'Gấm là một hợp chất tinh tế giữa hương vị thơm mát của trà Ô Long Vải và vị ngọt căng mọng của trái vải. Từ những nguyên liệu chất lượng và kỹ thuật pha chế tỉ mỉ, Gấm mang lại cho bạn một trải nghiệm thức uống ngọt mát và thanh khiết, hoàn hảo cho mọi dịp. Hòa quyện với hương vị dịu nhẹ và thơm mát của trà Ô Long, tạo ra một cảm giác sảng khoái và thư giãn ngay từ những ngụm đầu tiên. Với vị ngọt tự nhiên và độ ẩm tươi mát, trái vải mang lại sự cân bằng và hòa quyện tuyệt vời với trà Ô Long, tạo nên một dư vị ngọt mát và thanh khiết.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (17, N'Ô LONG ĐÀO ĐỎ', 4, N'/TeaShop/img/olongdaodo.jpg', 54000, NULL, CAST(N'2024-02-10' AS Date), N'Ô Long Đào Đỏ là một sự kết hợp tinh tế giữa hương vị thanh nhẹ của trà Ô Long và sự ngọt mát của đào tươi. Từ những nguyên liệu tươi ngon và kỹ thuật pha chế tinh tế, Ô Long Đào Đỏ sẽ đánh thức vị giác của bạn và mang lại cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị dịu dàng và thanh nhẹ của trà Ô Long làm nổi bật hương thơm tự nhiên và sảng khoái, tạo cảm giác sảng khoái và thư giãn cho người thưởng thức. Những miếng đào tươi ngon vàng giòn thêm vào hương vị của thức uống, tạo ra một sự kết hợp hài hòa giữa ngọt mát và độ giòn của trái cây, đủ để làm đánh thức vị giác của bạn')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (18, N'TRÀ VỎ CÀ PHÊ', 4, N'/TeaShop/img/travocaphe.jpg', 33000, NULL, CAST(N'2024-01-10' AS Date), N'Trà Vỏ Cà Phê là một sự kết hợp độc đáo giữa hương trà thơm nhẹ và vị chua dịu của chanh vàng, với nguyên liệu chính là trà ủ từ vỏ cà phê. Từ sự lựa chọn cẩn thận của nguyên liệu đến kỹ thuật pha chế tinh tế, Trà Vỏ Cà Phê mang đến cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương trà nhẹ nhàng và thơm phức từ trà ủ từ vỏ cà phê tạo ra một lớp nền tinh tế cho thức uống, mang lại cảm giác sảng khoái và thư giãn. Vị chua dịu của chanh vàng hoà quyện với hương trà, tạo ra một sự kết hợp hài hòa giữa hương vị ngọt ngào và chua chát, đem lại cảm giác cân bằng và sảng khoái cho vị giác.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (19, N'Ô LONG NHÀI KEM ', 5, N'/TeaShop/img/olongnhaikemcheese.jpg', 40000, NULL, CAST(N'2024-02-21' AS Date), N'Ô Long Nhài Kem là một phiên bản độc đáo của trà Ô Long Đặc Sản, được ủ lạnh cùng hoa nhài tự nhiên, và kết hợp với lớp kem cheese sáng tạo và hương thơm ngọt ngào từ vani tự nhiên. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế đặc biệt, Ô Long Nhài Kem mang đến cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương vị đặc trưng của trà Ô Long kết hợp với sự dịu dàng và thơm ngát của hoa nhài tự nhiên, tạo ra một hòa quyện tinh tế, đem lại cảm giác sảng khoái và thư giãn. Lớp kem cheese sáng tạo và hương thơm ngọt ngào từ vani tự nhiên tạo điểm nhấn cho thức uống, tạo ra một sự kết hợp ngon ngọt và thơm ngon.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (20, N'LANG BIANG', 5, N'/TeaShop/img/langbiang.jpg', 45000, NULL, CAST(N'2024-03-24' AS Date), N'Lang Biang là một sự kết hợp tinh tế giữa hương vị thuần khiết của trà Ô Long Đặc Sản và hương thơm nhẹ của mứt hoa nhài. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Lang Biang mang lại cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương vị đặc trưng và thuần khiết của trà Ô Long Đặc Sản tạo nên lớp nền cho thức uống, mang lại cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Hương thơm nhẹ nhàng và dịu dàng của mứt hoa nhài hoà quyện với hương vị trà, tạo ra một sự kết hợp hài hòa và độc đáo.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (21, N'Ô LONG NHIỆT ĐỚI', 5, N'/TeaShop/img/olongnhietdoi.jpg', 50000, NULL, CAST(N'2024-03-19' AS Date), N'Ô Long Nhiệt Đới là một sự kết hợp tinh tế giữa hương vị tươi mát của trà Ô Long Đặc Sản và sự ngọt ngào của trái cây nhiệt đới. Từ sự hòa quyện kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Ô Long Nhiệt Đới mang lại cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị đặc trưng và tinh tế của trà Ô Long Đặc Sản tạo nên lớp nền cho thức uống, mang lại cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Sự kết hợp của trái cây nhiệt đới như xoài, dứa, cam... tạo ra hương vị tươi mát và ngọt ngào, làm tôn lên sự phong phú và đa dạng của thức uống.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (22, N'MATCHA ĐÁ XAY', 6, N'/TeaShop/img/matchadaxay.jpg', 50000, NULL, CAST(N'2024-01-29' AS Date), N'Matcha Đá Xay là một sự kết hợp tinh tế giữa hương vị mát lạnh của ô long matcha và sự ngọt thơm của sữa dừa Bến Tre hữu cơ. Từ sự kết hợp cân bằng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Matcha Đá Xay mang đến cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị đặc trưng của ô long matcha, khi kết hợp với lớp đá xay mát lạnh, tạo ra một cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Sự ngọt ngào và thơm mát của sữa dừa hữu cơ Bến Tre hoà quyện với hương vị matcha, tạo ra một hòa quyện hài hòa và độc đáo. Lớp kem matcha dừa thơm ngậy phủ lên trên cùng, tạo điểm nhấn và tăng thêm hương vị đặc biệt cho thức uống.')
GO
INSERT [dbo].[Product] ([product_id], [product_name], [category_id], [image], [price], [discount], [create_at], [description]) VALUES (23, N'MATCHA COCO LATTE', 6, N'/TeaShop/img/matchacoclatte.jpg', 55000, NULL, CAST(N'2024-03-22' AS Date), N'Matcha Coco Latte là một hòa quyện đầy mê hoặc giữa lớp kem ô long matcha bồng bềnh sánh mịn và sữa dừa Bến Tre hữu cơ ngọt thơm. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Matcha Coco Latte mang lại cho bạn một trải nghiệm thức uống đặc biệt và đầy sức hút. Hương vị đặc trưng của ô long matcha được thể hiện qua lớp kem bồng bềnh sánh mịn, tạo ra một cảm giác mát lạnh và đầy sảng khoái từ mỗi ngụm uống. Sự ngọt ngào và thơm thơm của sữa dừa hữu cơ Bến Tre hòa quyện với hương vị matcha, tạo ra một sự kết hợp hài hòa và độc đáo.')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (5, 1, N'Thưởng thức sự kết hợp hoàn hảo giữa trà ô long thơm lừng và hương vị vani ngọt ngào trong từng ngụm Ô Long Vani Sữa. Được chế biến từ những lá trà ô long tuyển chọn, Ô Long Vani Sữa mang đến hương vị thanh mát và mượt mà, hòa quyện cùng sự dịu ngọt của vani và sữa. Ô Long Vani Sữa không chỉ là một thức uống giải khát tuyệt vời mà còn mang đến trải nghiệm thưởng trà tinh tế, lý tưởng cho những lúc cần thư giãn hay những buổi gặp gỡ bạn bè.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (6, 2, N'Khám phá hương vị tinh tế và quyến rũ của Phù Vân, đây là sự hòa quyện hoàn hảo giữa vị trà ô long đỏ thượng hạng và lớp kem whipping mềm mịn, tạo nên một trải nghiệm thưởng thức đầy mê hoặc. Phù Vân không chỉ là một thức uống tinh tế mà còn là một sự kết hợp độc đáo giữa truyền thống và hiện đại. Lý tưởng cho những lúc cần thư giãn, tận hưởng những phút giây yên bình hoặc chia sẻ cùng bạn bè và người thân.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (7, 3, N'Thưởng thức sự đột phá độc đáo và hấp dẫn của Ô Long Trứng, một thức uống kết hợp giữa hương vị trà ô long tinh tế và lớp kem trứng béo ngậy, mịn màng. Đây là sự kết hợp tuyệt vời giữa truyền thống và sáng tạo, mang đến trải nghiệm thưởng thức hoàn toàn mới mẻ và đầy cuốn hút. Ô Long Trứng không chỉ là một thức uống độc đáo mà còn là một trải nghiệm ẩm thực tinh tế, lý tưởng cho những ai muốn khám phá sự mới lạ trong từng ngụm trà. Hãy để Ô Long Trứng đưa bạn vào một hành trình hương vị đầy bất ngờ và thú vị, hoàn hảo cho mọi khoảnh khắc trong ngày.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (8, 4, N'Khám phá hương vị thanh mát và đầy quyến rũ của Ô Long Sữa, một sự kết hợp tuyệt vời giữa trà ô long thơm lừng và vị sữa béo ngậy, mịn màng. Mỗi ngụm trà mang đến sự hài hòa tinh tế, giúp bạn tận hưởng những phút giây thư giãn và sảng khoái. Ô Long Sữa không chỉ là một thức uống giải khát tuyệt vời mà còn là một trải nghiệm thưởng trà tinh tế. Hoàn hảo cho mọi khoảnh khắc, từ những lúc thư giãn cá nhân đến những buổi gặp gỡ bạn bè và người thân. Hãy để Ô Long Sữa làm mới ngày của bạn với hương vị đậm đà và sự mượt mà khó quên.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (9, 5, N'Ô Long Nhài Sữa là sự kết hợp hoàn hảo giữa trà ô long hảo hạng, hoa nhài thơm ngát và vị sữa béo ngậy với hương vị độc đáo và quyến rũ. Trà ô long của chúng tôi được chọn lọc kỹ lưỡng, nổi bật với vị trà đậm đà, hậu ngọt và hương thơm tự nhiên. Hương nhài thanh thoát, nhẹ nhàng, mang lại cảm giác thư giãn và dễ chịu, sữa tươi nguyên chất tạo độ béo mịn, bổ sung vị ngọt nhẹ, cân bằng vị trà và mang đến một thức uống hài hòa. Hãy thưởng thức Ô Long Nhài Sữa để trải nghiệm sự tinh tế và thanh tao trong từng ngụm trà', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (10, 6, N'Phan Xi Păng là sự pha trộn tinh tế giữa vị đậm đà của trà ô long đỏ đặc sản và hương vị béo ngậy, mát lạnh của cốt dừa đá xay. Đây là thức uống lý tưởng cho những ai yêu thích sự kết hợp độc đáo và sáng tạo, mang đến trải nghiệm thưởng thức trà hoàn toàn mới lạ và sảng khoái. Vị trà ô long đỏ đậm đà, thơm ngát hòa quyện cùng vị béo ngọt của cốt dừa và cảm giác mát lạnh từ đá xay. Thức uống này tạo nên sự cân bằng hoàn hảo, vừa thơm ngon, vừa sảng khoái.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (11, 7, N'Khói B''Lao là một sự kết hợp độc đáo giữa các tầng hương khói và hương hoa ngọc lan, tạo nên một trải nghiệm thưởng thức đặc biệt và đầy cuốn hút. Với nốt hương đầu là khói đậm, hương giữa là khói nhẹ và đọng lại ở hậu vị là hương hoa ngọc lan, Khói B''Lao là biểu tượng của sự phong phú và phức tạp trong thế giới hương vị. Khói B''Lao không chỉ là một thức uống mà còn là một hành trình khám phá hương vị độc đáo. Hãy tận hưởng mỗi ngụm trà, từ cảm giác mạnh mẽ của khói đến sự êm dịu của hoa ngọc lan, để trải nghiệm hết mức sự phong phú và phức tạp trong hương vị này.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (12, 8, N'Tấm là một sự kết hợp độc đáo và bất ngờ giữa hương vị đậm đà của trà Ô Long và sự thơm ngon, bùi bởi gạo rang. Với sự hài hoà tinh tế giữa hai nguyên liệu này, Tấm không chỉ là một thức uống mà còn là một trải nghiệm đích thực cho các tín đồ của hương vị trà và hương thơm của gạo rang. Tấm không chỉ là một thức uống mà còn là một hành trình khám phá hương vị. Hãy tận hưởng mỗi ngụm trà, từ hương thơm của trà Ô Long đến hương vị đặc trưng của gạo rang, để trải nghiệm hết mức sự phong phú và sáng tạo trong hương vị này.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (14, 9, N'Cà Phê Ủ Lạnh là một sự kết hợp độc đáo giữa cà phê đặc biệt được ủ lạnh bằng khí Nitơ và hương vị tươi mới của trái cây tươi. Với sự hòa quyện của hai yếu tố này, cà phê này không chỉ mang lại hương vị đặc trưng của cà phê mà còn bùng tỏa nốt hương tự nhiên và sảng khoái của trái cây tươi. Cà Phê Đặc Sản Nitơ Ủ Lạnh không chỉ là một thức uống mà còn là một trải nghiệm tuyệt vời. Hãy tận hưởng từng ngụm cà phê mát lạnh, bùng tỏa hương vị tự nhiên và sảng khoái của trái cây tươi, để trải nghiệm hết mức sự phong phú và sảng khoái trong hương vị này.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (15, 10, N'Phê Nâu Truffle là sự hòa quyện tinh tế giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng, thêm vào đó là hương vị đặc biệt của nấm Truffle Đen quý hiếm. Kết hợp này tạo nên một hương vị đậm đà, mượt mà và độc đáo, đem đến cho thực khách một trải nghiệm cà phê tuyệt vời và không thể quên. Phê Nâu Truffle - một trải nghiệm cà phê đậm đà và độc đáo, mang lại cho bạn cảm giác thư giãn và ngưỡng mộ từng giọt. Hãy khám phá thức uống này ngay hôm nay để tận hưởng hương vị tinh tế và đặc biệt của Phê Nâu Truffle.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (16, 11, N'Phê Truffle là một sản phẩm sáng tạo, kết hợp giữa hương vị đậm mượt của cà phê và hương thơm ngậy của kem nấm truffle đen. Với sự hòa quyện tinh tế này, Phê Truffle mang đến một trải nghiệm cà phê độc đáo, bùng nổ và đầy phóng khoáng, làm hài lòng cả những tín đồ cà phê khó tính nhất. Phê Truffle không chỉ là một ly cà phê, mà còn là một trải nghiệm tuyệt vời. Hãy tận hưởng mỗi ngụm cà phê, từ hương thơm đặc trưng của kem nấm truffle đen đến vị đậm mượt của cà phê, để trải nghiệm sự phóng khoáng và độc đáo của hương vị này.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (17, 12, N'Phê Nâu - một sản phẩm cà phê đậm đà và gần gũi, mang đến cho bạn một trải nghiệm cà phê thú vị và đặc biệt. Phê Nâu là sự kết hợp tuyệt vời giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng. Khi hoà quyện cùng sữa đặc, Phê Nâu mang lại hương vị đậm đà, mượt mà và gần gũi, tạo nên một trải nghiệm cà phê thú vị và đặc biệt. Hãy khám phá hương vị này ngay hôm nay để tận hưởng cảm giác thư giãn và hưởng thụ từng giọt cà phê thơm ngon của Phê Nâu.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (19, 13, N'Phê Đen là một sản phẩm cà phê không đường, kết hợp giữa vị chua nhẹ tự nhiên của hạt Arabica Cầu Đất và sự mạnh mẽ của Robusta Gia Lai, được tuyển chọn kỹ lưỡng. Tạo nên hương vị đậm đà, mượt mà và đầy tinh tế, Phê Đen mang lại một trải nghiệm cà phê đặc biệt và sảng khoái. Phê Đen không chỉ là một ly cà phê, mà còn là một trải nghiệm thú vị. Hãy tận hưởng mỗi ngụm cà phê, từ vị chua nhẹ của Arabica đến sự mạnh mẽ của Robusta, để trải nghiệm sự đậm đà và mượt mà của hương vị này.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (20, 14, N'Phê Đà Lạt là một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê Arabica Đà Lạt và hương thơm ngậy của kem Whipping. Được tạo ra từ những nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Phê Đà Lạt mang đến cho bạn một trải nghiệm cà phê độc đáo và thú vị. Phê Đà Lạt - một sự kết hợp độc đáo giữa hương vị đậm đà của cà phê Arabica Đà Lạt và hương thơm ngậy của kem Whipping, mang đến cho bạn một trải nghiệm cà phê độc đáo và thú vị.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (21, 15, N'Cafe Trứng Bông là một biểu tượng của hương vị đậm đà của cà phê Arabica kết hợp hài hòa với vị thơm ngậy của lớp kem trứng. Được sáng tạo từ những nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Cafe Trứng Bông mang đến cho bạn một trải nghiệm cà phê độc đáo và tinh tế. Với hương vị đặc trưng và đậm đà, cà phê Arabica tạo ra một lớp nền cơ bản hoàn hảo cho Cafe Trứng Bông, mang lại cảm giác sảng khoái và phức tạp từ mỗi ngụm uống. Hương thơm ngậy của kem trứng thêm vào sự ngọt ngào và béo ngậy, tạo ra một sự kết hợp hoàn hảo với hương vị cà phê, tạo nên một trải nghiệm hương vị độc đáo và tinh tế.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (22, 16, N'Gấm là một hợp chất tinh tế giữa hương vị thơm mát của trà Ô Long Vải và vị ngọt căng mọng của trái vải. Từ những nguyên liệu chất lượng và kỹ thuật pha chế tỉ mỉ, Gấm mang lại cho bạn một trải nghiệm thức uống ngọt mát và thanh khiết, hoàn hảo cho mọi dịp. Hòa quyện với hương vị dịu nhẹ và thơm mát của trà Ô Long, tạo ra một cảm giác sảng khoái và thư giãn ngay từ những ngụm đầu tiên. Với vị ngọt tự nhiên và độ ẩm tươi mát, trái vải mang lại sự cân bằng và hòa quyện tuyệt vời với trà Ô Long, tạo nên một dư vị ngọt mát và thanh khiết.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (23, 17, N'Ô Long Đào Đỏ là một sự kết hợp tinh tế giữa hương vị thanh nhẹ của trà Ô Long và sự ngọt mát của đào tươi. Từ những nguyên liệu tươi ngon và kỹ thuật pha chế tinh tế, Ô Long Đào Đỏ sẽ đánh thức vị giác của bạn và mang lại cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị dịu dàng và thanh nhẹ của trà Ô Long làm nổi bật hương thơm tự nhiên và sảng khoái, tạo cảm giác sảng khoái và thư giãn cho người thưởng thức. Những miếng đào tươi ngon vàng giòn thêm vào hương vị của thức uống, tạo ra một sự kết hợp hài hòa giữa ngọt mát và độ giòn của trái cây, đủ để làm đánh thức vị giác của bạn', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (25, 18, N'Trà Vỏ Cà Phê là một sự kết hợp độc đáo giữa hương trà thơm nhẹ và vị chua dịu của chanh vàng, với nguyên liệu chính là trà ủ từ vỏ cà phê. Từ sự lựa chọn cẩn thận của nguyên liệu đến kỹ thuật pha chế tinh tế, Trà Vỏ Cà Phê mang đến cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương trà nhẹ nhàng và thơm phức từ trà ủ từ vỏ cà phê tạo ra một lớp nền tinh tế cho thức uống, mang lại cảm giác sảng khoái và thư giãn. Vị chua dịu của chanh vàng hoà quyện với hương trà, tạo ra một sự kết hợp hài hòa giữa hương vị ngọt ngào và chua chát, đem lại cảm giác cân bằng và sảng khoái cho vị giác.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (26, 19, N'Ô Long Nhài Kem là một phiên bản độc đáo của trà Ô Long Đặc Sản, được ủ lạnh cùng hoa nhài tự nhiên, và kết hợp với lớp kem cheese sáng tạo và hương thơm ngọt ngào từ vani tự nhiên. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế đặc biệt, Ô Long Nhài Kem mang đến cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương vị đặc trưng của trà Ô Long kết hợp với sự dịu dàng và thơm ngát của hoa nhài tự nhiên, tạo ra một hòa quyện tinh tế, đem lại cảm giác sảng khoái và thư giãn. Lớp kem cheese sáng tạo và hương thơm ngọt ngào từ vani tự nhiên tạo điểm nhấn cho thức uống, tạo ra một sự kết hợp ngon ngọt và thơm ngon.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (27, 20, N'Lang Biang là một sự kết hợp tinh tế giữa hương vị thuần khiết của trà Ô Long Đặc Sản và hương thơm nhẹ của mứt hoa nhài. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Lang Biang mang lại cho bạn một trải nghiệm thức uống độc đáo và đầy sự phong phú. Hương vị đặc trưng và thuần khiết của trà Ô Long Đặc Sản tạo nên lớp nền cho thức uống, mang lại cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Hương thơm nhẹ nhàng và dịu dàng của mứt hoa nhài hoà quyện với hương vị trà, tạo ra một sự kết hợp hài hòa và độc đáo.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (28, 21, N'Ô Long Nhiệt Đới là một sự kết hợp tinh tế giữa hương vị tươi mát của trà Ô Long Đặc Sản và sự ngọt ngào của trái cây nhiệt đới. Từ sự hòa quyện kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Ô Long Nhiệt Đới mang lại cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị đặc trưng và tinh tế của trà Ô Long Đặc Sản tạo nên lớp nền cho thức uống, mang lại cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Sự kết hợp của trái cây nhiệt đới như xoài, dứa, cam... tạo ra hương vị tươi mát và ngọt ngào, làm tôn lên sự phong phú và đa dạng của thức uống.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (29, 22, N'Matcha Đá Xay là một sự kết hợp tinh tế giữa hương vị mát lạnh của ô long matcha và sự ngọt thơm của sữa dừa Bến Tre hữu cơ. Từ sự kết hợp cân bằng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Matcha Đá Xay mang đến cho bạn một trải nghiệm thức uống tươi mới và đầy sảng khoái. Hương vị đặc trưng của ô long matcha, khi kết hợp với lớp đá xay mát lạnh, tạo ra một cảm giác sảng khoái và thư giãn từ mỗi ngụm uống. Sự ngọt ngào và thơm mát của sữa dừa hữu cơ Bến Tre hoà quyện với hương vị matcha, tạo ra một hòa quyện hài hòa và độc đáo. Lớp kem matcha dừa thơm ngậy phủ lên trên cùng, tạo điểm nhấn và tăng thêm hương vị đặc biệt cho thức uống.', NULL, 10)
GO
INSERT [dbo].[ProductDetails] ([product_details_id], [product_id], [description], [status], [discount]) VALUES (30, 23, N'Matcha Coco Latte là một hòa quyện đầy mê hoặc giữa lớp kem ô long matcha bồng bềnh sánh mịn và sữa dừa Bến Tre hữu cơ ngọt thơm. Từ sự kết hợp kỹ lưỡng của các nguyên liệu chất lượng và kỹ thuật pha chế tinh tế, Matcha Coco Latte mang lại cho bạn một trải nghiệm thức uống đặc biệt và đầy sức hút. Hương vị đặc trưng của ô long matcha được thể hiện qua lớp kem bồng bềnh sánh mịn, tạo ra một cảm giác mát lạnh và đầy sảng khoái từ mỗi ngụm uống. Sự ngọt ngào và thơm thơm của sữa dừa hữu cơ Bến Tre hòa quyện với hương vị matcha, tạo ra một sự kết hợp hài hòa và độc đáo.', NULL, 10)
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
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
