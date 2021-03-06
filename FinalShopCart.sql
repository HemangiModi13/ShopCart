USE [master]
GO
/****** Object:  Database [ShoppingCartDB]    Script Date: 05-01-2018 11:48:03 ******/
CREATE DATABASE [ShoppingCartDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCartDB', FILENAME = N'D:\Database\DB\ShoppingCartDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCartDB_log', FILENAME = N'D:\Database\DB\ShoppingCartDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCartDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCartDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCartDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCartDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCartDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingCartDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCartDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCartDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCartDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShoppingCartDB]
GO
/****** Object:  User [dev]    Script Date: 05-01-2018 11:48:03 ******/
CREATE USER [dev] FOR LOGIN [dev] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05-01-2018 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 05-01-2018 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Qty] [int] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 05-01-2018 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[CategoryID] [int] NULL,
	[Image] [varchar](50) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCart]    Script Date: 05-01-2018 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProdID] [int] NULL,
	[Price] [int] NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_Product_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 05-01-2018 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserOrder]    Script Date: 05-01-2018 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNO] [varchar](7) NULL,
	[TotalAmt] [int] NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_UserOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Mobile')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Laptop')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Desktop')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (1, 1, 1, 1, 50000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (2, 1, 2, 1, 50000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (3, 1, 3, 1, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (4, 1, 7, 1, 234324)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (5, 1, 1, 1, 50000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (6, 1, 16, 2, 20000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (7, 2, 7, 1, 234324)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (8, 3, 6, 1, 235423)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (9, 4, 3, 1, 70000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Qty], [Amount]) VALUES (10, 4, 5, 1, 234)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (1, N'iphone', 1, N'/UploadedFiles/ph1.jpg', 50000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (2, N'HP', 2, N'/UploadedFiles/lp2.jpg', 50000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (3, N'Dell', 2, N'/UploadedFiles/lp3.jpg', 70000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (5, N'asddsa', 1, N'/UploadedFiles/lp3.jpg', 234)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (6, N'wr', 2, N'/UploadedFiles/lp2.jpg', 235423)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (7, N'demo', 1, N'/UploadedFiles/dt3.jpg', 234324)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (8, N'Samsung', 1, N'/UploadedFiles/ph3.jpg', 10000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (9, N'MI NOTE 4', 1, N'/UploadedFiles/ph2.jpg', 10000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (10, N'TOSHIBA', 2, N'/UploadedFiles/lp1.jpg', 50000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (14, N'Desk1', 3, N'/UploadedFiles/dt3.jpg', 20000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (15, N'asd', 1, N'/UploadedFiles/lp3.jpg', 10000)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CategoryID], [Image], [Price]) VALUES (16, N'asd', 1, N'/UploadedFiles/lp3.jpg', 10000)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password]) VALUES (1, N'Hemi123', N'h@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserOrder] ON 

INSERT [dbo].[UserOrder] ([OrderID], [OrderNO], [TotalAmt], [OrderDate]) VALUES (1, N'O001', 464324, CAST(N'2018-01-05 11:02:41.000' AS DateTime))
INSERT [dbo].[UserOrder] ([OrderID], [OrderNO], [TotalAmt], [OrderDate]) VALUES (2, N'O001', 234324, CAST(N'2018-01-05 11:31:53.000' AS DateTime))
INSERT [dbo].[UserOrder] ([OrderID], [OrderNO], [TotalAmt], [OrderDate]) VALUES (3, N'O001', 235423, CAST(N'2018-01-05 11:36:55.000' AS DateTime))
INSERT [dbo].[UserOrder] ([OrderID], [OrderNO], [TotalAmt], [OrderDate]) VALUES (4, N'O001', 70234, CAST(N'2018-01-05 11:37:43.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserOrder] OFF
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[UserOrder] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserOrder]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [ShoppingCartDB] SET  READ_WRITE 
GO
