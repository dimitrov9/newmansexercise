USE [master]
GO
/****** Object:  Database [PoolApp]    Script Date: 02.03.2018 18:15:00 ******/
CREATE DATABASE [PoolApp] ON  PRIMARY 
( NAME = N'PoolApp', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\PoolApp.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PoolApp_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\PoolApp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PoolApp] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PoolApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PoolApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PoolApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PoolApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PoolApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PoolApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [PoolApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PoolApp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PoolApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PoolApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PoolApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PoolApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PoolApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PoolApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PoolApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PoolApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PoolApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PoolApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PoolApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PoolApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PoolApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PoolApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PoolApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PoolApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PoolApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PoolApp] SET  MULTI_USER 
GO
ALTER DATABASE [PoolApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PoolApp] SET DB_CHAINING OFF 
GO
USE [PoolApp]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 02.03.2018 18:15:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[employeeid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[from] [datetime] NOT NULL,
	[to] [datetime] NOT NULL,
	[price] [int] NOT NULL,
	[tickettypeid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleyee]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleyee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](100) NOT NULL,
	[isdeleted] [bit] NOT NULL,
	[birthday] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locker]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](10) NOT NULL,
	[isforMale] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Member]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[surname] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[adminid] [int] NOT NULL,
	[ticketid] [int] NOT NULL,
	[memberid] [int] NULL,
	[payment_type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[tickettypeid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticket_Type]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[duration] [nvarchar](10) NOT NULL,
	[visitsinweek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Visits]    Script Date: 02.03.2018 18:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visits](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[from] [datetime] NOT NULL,
	[to] [datetime] NOT NULL,
	[ticketid] [int] NOT NULL,
	[lockerid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Administrator] ([id], [username], [password], [email], [employeeid]) VALUES (1, N'Helena1', N'helena123', N'helena@yahoo.com', 2)
INSERT [dbo].[Administrator] ([id], [username], [password], [email], [employeeid]) VALUES (2, N'John2', N'john45', N'john@gmail.com', 3)
INSERT [dbo].[Administrator] ([id], [username], [password], [email], [employeeid]) VALUES (3, N'Amala1', N'amala22', N'amala@yahoo.com', 4)
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (1, CAST(0x0000A8D70083D600 AS DateTime), CAST(0x0000A8D700E6B680 AS DateTime), 2200, 2)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (2, CAST(0x0000A97000E6B680 AS DateTime), CAST(0x0000A8E101499700 AS DateTime), 2400, 3)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (3, CAST(0x0000A8D700C5C100 AS DateTime), CAST(0x0000A8DE0107AC00 AS DateTime), 2600, 4)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (4, CAST(0x0000A93A0083D600 AS DateTime), CAST(0x0000A94A0107AC00 AS DateTime), 2300, 5)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (5, CAST(0x0000A91B0083D600 AS DateTime), CAST(0x0000A9B40083D600 AS DateTime), 24000, 6)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (6, CAST(0x0000A86600000000 AS DateTime), CAST(0x0000AAA700000000 AS DateTime), 24600, 7)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (7, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 27000, 8)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (8, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 2200, 1)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (9, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 27800, 9)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (10, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 26000, 10)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (11, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 700, 11)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (12, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 750, 12)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (13, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 800, 13)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (14, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 870, 14)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (15, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AAD900000000 AS DateTime), 840, 15)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (16, CAST(0x0000A8D700E6FCD0 AS DateTime), CAST(0x0000A97000E6B680 AS DateTime), 2000, 2)
INSERT [dbo].[Discount] ([id], [from], [to], [price], [tickettypeid]) VALUES (17, CAST(0x0000A8E10149DD50 AS DateTime), CAST(0x0000A97A01499700 AS DateTime), 2200, 3)
SET IDENTITY_INSERT [dbo].[Discount] OFF
SET IDENTITY_INSERT [dbo].[Empleyee] ON 

INSERT [dbo].[Empleyee] ([id], [name], [surname], [address], [phone], [isdeleted], [birthday]) VALUES (2, N'Helena', N'Timsonson', N'/', N'416547754654', 1, CAST(0x000080E400000000 AS DateTime))
INSERT [dbo].[Empleyee] ([id], [name], [surname], [address], [phone], [isdeleted], [birthday]) VALUES (3, N'John', N'Thompson', N'/', N'547754654', 1, CAST(0x000082EA00000000 AS DateTime))
INSERT [dbo].[Empleyee] ([id], [name], [surname], [address], [phone], [isdeleted], [birthday]) VALUES (4, N'Amala', N'Johnson', N'11th Avenue', N'547754646254', 1, CAST(0x00007F8100000000 AS DateTime))
INSERT [dbo].[Empleyee] ([id], [name], [surname], [address], [phone], [isdeleted], [birthday]) VALUES (5, N'Joana', N'Tamiha', N'/', N'54758754654', 1, CAST(0x000078F300000000 AS DateTime))
INSERT [dbo].[Empleyee] ([id], [name], [surname], [address], [phone], [isdeleted], [birthday]) VALUES (6, N'Tea', N'Tiverson', N'/', N'54775554654', 1, CAST(0x00007D7B00000000 AS DateTime))
INSERT [dbo].[Empleyee] ([id], [name], [surname], [address], [phone], [isdeleted], [birthday]) VALUES (7, N'Eli', N'Nikolaewski', N'/', N'54775515454654', 1, CAST(0x0000722900000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Empleyee] OFF
SET IDENTITY_INSERT [dbo].[Locker] ON 

INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (1, N'1', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (5, N'10', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (3, N'12', 0)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (2, N'12', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (8, N'125', 0)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (9, N'126', 0)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (4, N'13', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (10, N'152', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (11, N'162', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (7, N'3', 0)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (13, N'30', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (12, N'56', 1)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (6, N'65', 0)
INSERT [dbo].[Locker] ([id], [number], [isforMale]) VALUES (14, N'9', 0)
SET IDENTITY_INSERT [dbo].[Locker] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (1, N'john@yahoo.com', N'John', N'Petrewski', N'075487445670005', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (2, N'dora@yahoo.com', N'Dora', N'Petrew', N'07548670005', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (3, N'ellen@yahoo.com', N'Ellen', N'Stamenkov', N'078670005', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (4, N'gavril@yahoo.com', N'Gavril', N'Stamenkowski', N'0788874584670005', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (5, N'gavrilo@yahoo.com', N'Gavrilo', N'Nikov', N'0788874584670005', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (6, N'gabi@yahoo.com', N'Gabi', N'Nikowska', N'0788874670005', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (7, N'vasil@yahoo.com', N'Vasil', N'Antov', N'07888670005', N'A/NA', 1)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (8, N'vasilij@yahoo.com', N'Vasilij', N'Antowski', N'07888675165160005', N'A/NA', 1)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (9, N'vesna@yahoo.com', N'Vesna', N'Hristova', N'07888675165', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (10, N'tereza@yahoo.com', N'Tereza', N'Malewski', N'075487445', N'A/NA', 0)
INSERT [dbo].[Member] ([id], [email], [name], [surname], [phone], [address], [isdeleted]) VALUES (11, N'roby@yahoo.com', N'Roby', N'Timeson', N'075480005', N'A/NA', 0)
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (5, CAST(0x0000A8B600CE00B8 AS DateTime), 1, 14, 1, 1)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (6, CAST(0x0000A8B600CE96B8 AS DateTime), 1, 15, 2, 1)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (7, CAST(0x0000A8B600DF1178 AS DateTime), 1, 16, 3, 1)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (8, CAST(0x0000A8B600E44968 AS DateTime), 2, 17, 4, 2)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (9, CAST(0x0000A8DE00E562A8 AS DateTime), 2, 18, 5, 2)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (10, CAST(0x0000A8E800B2D928 AS DateTime), 2, 19, 6, 2)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (11, CAST(0x0000A8B600CE00B8 AS DateTime), 1, 20, 7, 1)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (12, CAST(0x0000A8B600CE00B8 AS DateTime), 1, 21, 8, 2)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (13, CAST(0x0000A8B600CE00B8 AS DateTime), 3, 22, 9, 2)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (14, CAST(0x0000A8B600CE00B8 AS DateTime), 3, 23, 10, 1)
INSERT [dbo].[Payment] ([id], [date], [adminid], [ticketid], [memberid], [payment_type]) VALUES (15, CAST(0x0000A8B600CE00B8 AS DateTime), 3, 24, 11, 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Payment_Type] ON 

INSERT [dbo].[Payment_Type] ([id], [name]) VALUES (1, N'kash')
INSERT [dbo].[Payment_Type] ([id], [name]) VALUES (2, N'CreditCard')
SET IDENTITY_INSERT [dbo].[Payment_Type] OFF
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (13, CAST(0x0000A8C300000000 AS DateTime), CAST(0x0000A8E100000000 AS DateTime), 3)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (14, CAST(0x0000A90000000000 AS DateTime), CAST(0x0000A91E00000000 AS DateTime), 3)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (15, CAST(0x0000A86900000000 AS DateTime), CAST(0x0000A88800000000 AS DateTime), 1)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (16, CAST(0x0000A90000000000 AS DateTime), CAST(0x0000AA6D00000000 AS DateTime), 6)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (17, CAST(0x0000A90000000000 AS DateTime), CAST(0x0000AA6D00000000 AS DateTime), 8)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (18, CAST(0x0000A90000000000 AS DateTime), CAST(0x0000AA6D00000000 AS DateTime), 9)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (19, CAST(0x0000A9B700000000 AS DateTime), CAST(0x0000AB2400000000 AS DateTime), 9)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (20, CAST(0x0000A90000000000 AS DateTime), CAST(0x0000A90800000000 AS DateTime), 15)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (21, CAST(0x0000A88400000000 AS DateTime), CAST(0x0000A88A00000000 AS DateTime), 14)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (22, CAST(0x0000A8B500000000 AS DateTime), CAST(0x0000AA2800000000 AS DateTime), 11)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (23, CAST(0x0000A91500000000 AS DateTime), CAST(0x0000A91C00000000 AS DateTime), 11)
INSERT [dbo].[Ticket] ([id], [startDate], [endDate], [tickettypeid]) VALUES (24, CAST(0x0000A91900000000 AS DateTime), CAST(0x0000A92000000000 AS DateTime), 11)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
SET IDENTITY_INSERT [dbo].[Ticket_Type] ON 

INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (1, N'for girls (13yearsOld)', N'1m', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (2, N'for boys (13yearsOld)', N'1m', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (3, N'for women (over 40)', N'1m', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (4, N'for men (over 40)', N'1m', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (5, N'over 65', N'1m', 3)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (6, N'for girls (13yearsOld)', N'1y', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (7, N'for boys (13yearsOld)', N'1y', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (8, N'for women (over 40)', N'1y', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (9, N'for men (over 40)', N'1y', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (10, N'over 65', N'1y', 3)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (11, N'for girls (13yearsOld)', N'1w', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (12, N'for boys (13yearsOld)', N'1w', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (13, N'for women (over 40)', N'1w', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (14, N'for men (over 40)', N'1w', 5)
INSERT [dbo].[Ticket_Type] ([id], [name], [duration], [visitsinweek]) VALUES (15, N'over 65', N'1w', 3)
SET IDENTITY_INSERT [dbo].[Ticket_Type] OFF
SET IDENTITY_INSERT [dbo].[Visits] ON 

INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (1, CAST(0x0000A97500000000 AS DateTime), CAST(0x0000A97500000000 AS DateTime), 14, 6)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (2, CAST(0x0000A97500000000 AS DateTime), CAST(0x0000A97500000000 AS DateTime), 17, 6)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (3, CAST(0x0000A97500000000 AS DateTime), CAST(0x0000A97500000000 AS DateTime), 20, 1)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (4, CAST(0x0000A97500000000 AS DateTime), CAST(0x0000A97500000000 AS DateTime), 21, 1)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (5, CAST(0x0000A97500000000 AS DateTime), CAST(0x0000A97500000000 AS DateTime), 17, 3)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (6, CAST(0x0000A8D700000000 AS DateTime), CAST(0x0000A8D700000000 AS DateTime), 17, 12)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (7, CAST(0x0000A8D700000000 AS DateTime), CAST(0x0000A8D700000000 AS DateTime), 19, 14)
INSERT [dbo].[Visits] ([id], [from], [to], [ticketid], [lockerid]) VALUES (8, CAST(0x0000A9B400000000 AS DateTime), CAST(0x0000A9B400000000 AS DateTime), 18, 8)
SET IDENTITY_INSERT [dbo].[Visits] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Number_ISForMale]    Script Date: 02.03.2018 18:15:01 ******/
ALTER TABLE [dbo].[Locker] ADD  CONSTRAINT [UK_Number_ISForMale] UNIQUE NONCLUSTERED 
(
	[number] ASC,
	[isforMale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleyee] ADD  DEFAULT ((1)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[Locker] ADD  DEFAULT ((1)) FOR [isforMale]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [fk_Administrator_Employee] FOREIGN KEY([employeeid])
REFERENCES [dbo].[Empleyee] ([id])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [fk_Administrator_Employee]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [fk_Discount_TicketType] FOREIGN KEY([tickettypeid])
REFERENCES [dbo].[Ticket_Type] ([id])
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [fk_Discount_TicketType]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [fk_Payment_Member] FOREIGN KEY([memberid])
REFERENCES [dbo].[Member] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [fk_Payment_Member]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [fk_Payment_Payment_Type] FOREIGN KEY([payment_type])
REFERENCES [dbo].[Payment_Type] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [fk_Payment_Payment_Type]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [fk_Payment_Ticket] FOREIGN KEY([ticketid])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [fk_Payment_Ticket]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [fk_Ticket_TicketType] FOREIGN KEY([tickettypeid])
REFERENCES [dbo].[Ticket_Type] ([id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [fk_Ticket_TicketType]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [fk_Visits_Locker] FOREIGN KEY([lockerid])
REFERENCES [dbo].[Locker] ([id])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [fk_Visits_Locker]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [fk_Visits_Ticket] FOREIGN KEY([ticketid])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [fk_Visits_Ticket]
GO
ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [ck_Administrator_Password_Length] CHECK  ((len([password])>=(6)))
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [ck_Administrator_Password_Length]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [ck_checkPrice] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [ck_checkPrice]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [ck_CheckStarDate] CHECK  (([startDate]<=[endDate]))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [ck_CheckStarDate]
GO
ALTER TABLE [dbo].[Ticket_Type]  WITH CHECK ADD  CONSTRAINT [ck_checkvisitsinweek] CHECK  (([visitsinweek]<=(7)))
GO
ALTER TABLE [dbo].[Ticket_Type] CHECK CONSTRAINT [ck_checkvisitsinweek]
GO
ALTER TABLE [dbo].[Visits]  WITH CHECK ADD  CONSTRAINT [ck_Visit_CheckDates] CHECK  (([from]<=[to]))
GO
ALTER TABLE [dbo].[Visits] CHECK CONSTRAINT [ck_Visit_CheckDates]
GO
USE [master]
GO
ALTER DATABASE [PoolApp] SET  READ_WRITE 
GO
