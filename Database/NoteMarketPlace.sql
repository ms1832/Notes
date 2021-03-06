USE [master]
GO
/****** Object:  Database [Notes-MarketPlace]    Script Date: 02-04-2021 11:21:52 ******/
CREATE DATABASE [Notes-MarketPlace] ON  PRIMARY 
( NAME = N'Notes-MarketPlace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Notes-MarketPlace.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Notes-MarketPlace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Notes-MarketPlace_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Notes-MarketPlace] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Notes-MarketPlace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ARITHABORT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Notes-MarketPlace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Notes-MarketPlace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Notes-MarketPlace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Notes-MarketPlace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Notes-MarketPlace] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Notes-MarketPlace] SET  MULTI_USER 
GO
ALTER DATABASE [Notes-MarketPlace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Notes-MarketPlace] SET DB_CHAINING OFF 
GO
USE [Notes-MarketPlace]
GO
/****** Object:  Table [dbo].[Category_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Details](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Added_Date] [datetime] NOT NULL,
	[Added_By] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_date] [datetime] NULL,
 CONSTRAINT [PK_Category_Details] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country_Details](
	[Country_Id] [int] IDENTITY(1,1) NOT NULL,
	[Country_Name] [varchar](50) NOT NULL,
	[Country_Code] [numeric](10, 0) NOT NULL,
	[Added_By] [int] NOT NULL,
	[Added_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Country_Details] PRIMARY KEY CLUSTERED 
(
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Note_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Image] [varchar](max) NULL,
	[Type_Id] [int] NOT NULL,
	[Pages] [numeric](10, 0) NULL,
	[Description] [varchar](500) NOT NULL,
	[University] [varchar](200) NULL,
	[Country_Id] [int] NULL,
	[Course] [varchar](100) NULL,
	[Course_Code] [varchar](50) NULL,
	[Professor] [varchar](50) NULL,
	[Price] [decimal](10, 0) NOT NULL,
	[Note_Preview] [varchar](max) NULL,
	[Status] [int] NOT NULL,
	[Added_Date] [datetime] NOT NULL,
	[Review_By] [int] NULL,
	[Published_Date] [datetime] NULL,
	[User_Id] [int] NOT NULL,
	[Edited_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[AdminReview] [varchar](max) NULL,
 CONSTRAINT [PK_Note_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotesAttachments]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotesAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoteId] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[Create_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_NotesAttachments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Details](
	[Purchase_Id] [int] IDENTITY(1,1) NOT NULL,
	[Downloader] [int] NOT NULL,
	[Note_Id] [int] NOT NULL,
	[Seller] [int] NOT NULL,
	[Purchase_Date] [datetime] NOT NULL,
	[Allow_Download] [bit] NOT NULL,
	[IsAttachment_Downloaded] [bit] NOT NULL,
	[AttachmentDownload_Date] [datetime] NULL,
	[PurchasedPrice] [decimal](10, 0) NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Purchase_Details] PRIMARY KEY CLUSTERED 
(
	[Purchase_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review_Details](
	[Review_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Note_Id] [int] NOT NULL,
	[Purchase_Id] [int] NOT NULL,
	[Review_msg] [varchar](100) NOT NULL,
	[Review_Date] [datetime] NOT NULL,
	[Rating] [int] NOT NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Review_Details] PRIMARY KEY CLUSTERED 
(
	[Review_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spam_Notes]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spam_Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoteId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Purchase_Id] [int] NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
	[Reported_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Spam_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[DataValue] [varchar](100) NOT NULL,
	[RefCategory] [varchar](100) NOT NULL,
	[Create_Date] [datetime] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Note_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[System_Config]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[Modified_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_System_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Details](
	[Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Added_Date] [datetime] NOT NULL,
	[Added_By] [int] NOT NULL,
	[Edited_By] [int] NULL,
	[Edited_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Type_Details] PRIMARY KEY CLUSTERED 
(
	[Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DOB] [date] NULL,
	[Gender] [int] NULL,
	[Secondary_Email] [varchar](100) NULL,
	[Phone_No_Country_Code] [varchar](5) NOT NULL,
	[Phone_No] [numeric](20, 0) NOT NULL,
	[Profile_Img] [varchar](max) NULL,
	[Address_Line1] [varchar](100) NOT NULL,
	[Address_Line2] [varchar](100) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[Country_Id] [int] NOT NULL,
	[University] [varchar](50) NULL,
	[College] [varchar](100) NULL,
	[Create_Date] [datetime] NULL,
	[Modified_date] [datetime] NULL,
 CONSTRAINT [PK_User_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Roles]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[Create_Date] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Admin_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02-04-2021 11:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[Create_Date] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category_Details] ON 

INSERT [dbo].[Category_Details] ([Category_Id], [Category_Name], [Description], [Added_Date], [Added_By], [IsActive], [Modified_By], [Modified_date]) VALUES (1, N'IT', N'Lorem ipsum is dummy text', CAST(N'2021-02-13T00:00:00.000' AS DateTime), 1, 1, 1, CAST(N'2021-03-21T12:53:56.207' AS DateTime))
INSERT [dbo].[Category_Details] ([Category_Id], [Category_Name], [Description], [Added_Date], [Added_By], [IsActive], [Modified_By], [Modified_date]) VALUES (3, N'Computer', N'Lorem Is dummy text.', CAST(N'2021-02-15T00:00:00.000' AS DateTime), 2, 1, 1, CAST(N'2021-03-09T10:41:59.720' AS DateTime))
INSERT [dbo].[Category_Details] ([Category_Id], [Category_Name], [Description], [Added_Date], [Added_By], [IsActive], [Modified_By], [Modified_date]) VALUES (4, N'Science', N'Lorem is dummy text', CAST(N'2021-02-11T00:00:00.000' AS DateTime), 2, 1, NULL, NULL)
INSERT [dbo].[Category_Details] ([Category_Id], [Category_Name], [Description], [Added_Date], [Added_By], [IsActive], [Modified_By], [Modified_date]) VALUES (5, N'category 1', N'demo category', CAST(N'2021-03-30T11:12:51.267' AS DateTime), 6, 0, 6, CAST(N'2021-03-30T11:13:26.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Country_Details] ON 

INSERT [dbo].[Country_Details] ([Country_Id], [Country_Name], [Country_Code], [Added_By], [Added_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (1, N'India', CAST(91 AS Numeric(10, 0)), 1, CAST(N'2021-02-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Country_Details] ([Country_Id], [Country_Name], [Country_Code], [Added_By], [Added_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (2, N'Australia', CAST(61 AS Numeric(10, 0)), 1, CAST(N'2021-02-13T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Country_Details] ([Country_Id], [Country_Name], [Country_Code], [Added_By], [Added_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (3, N'United States', CAST(1 AS Numeric(10, 0)), 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-07T20:28:08.640' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Country_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Note_Details] ON 

INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (21, N'Computer Science', 3, N'../Members/5/21/2.jpg', 1, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo', N'University of California, US', 3, N'Engineering', NULL, NULL, CAST(0 AS Decimal(10, 0)), N'../Members/5/21/preview.pdf', 6, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 6, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 5, NULL, 1, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (22, N'Computer Science Illustrated', 4, N'../Members/5/22/4.jpg', 1, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo', N'University of California, US', 1, N'Engineering', N'15486', N'Mr. Richard', CAST(359 AS Decimal(10, 0)), N'../Members/5/21/preview.pdf', 6, CAST(N'2021-02-25T12:56:41.810' AS DateTime), 6, CAST(N'2021-02-26T00:00:00.000' AS DateTime), 5, NULL, 1, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (24, N'Basic Computer Engineering Tech India Publication', 1, N'../Members/7/24/3.jpg', 2, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo', N'University of California, US', 3, N'Engineering', NULL, NULL, CAST(0 AS Decimal(10, 0)), N'../Members/5/21/preview.pdf', 6, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 6, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 7, NULL, 1, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (25, N'The Principal of Computer Hardware', 3, N'../Members/7/25/5.jpg', 2, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo', N'Standford University, US', 3, N'Engineering', NULL, NULL, CAST(549 AS Decimal(10, 0)), N'../Members/5/21/preview.pdf', 6, CAST(N'2021-02-18T00:00:00.000' AS DateTime), 6, CAST(N'2021-02-22T00:00:00.000' AS DateTime), 7, NULL, 1, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (33, N'Basic C++', 3, N'../Members/8/33/book.jpg', 1, CAST(389 AS Numeric(10, 0)), N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo', N'GTU', 1, N'Engineering', NULL, NULL, CAST(722 AS Decimal(10, 0)), NULL, 6, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 8, CAST(N'2021-03-08T18:28:05.080' AS DateTime), 1, N'testing')
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (34, N'Basic C# Programming', 1, NULL, 2, CAST(480 AS Numeric(10, 0)), N'The complete C# Programming for Beginners.', NULL, 1, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, 8, CAST(N'2021-03-03T14:06:49.337' AS DateTime), 1, NULL, 11, CAST(N'2021-03-09T10:35:54.957' AS DateTime), 0, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (35, N'Basic C# Programming', 1, N'../Members/Default_book.jpg', 2, CAST(480 AS Numeric(10, 0)), N'The complete C# Programming for Beginners.', NULL, 1, NULL, NULL, NULL, CAST(250 AS Decimal(10, 0)), NULL, 5, CAST(N'2021-03-03T14:21:23.657' AS DateTime), 6, NULL, 11, CAST(N'2021-03-30T10:58:06.627' AS DateTime), 1, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (36, N'Compiler Design', 3, N'../Members/Default_book.jpg', 2, CAST(850 AS Numeric(10, 0)), N'Compiler design book.', NULL, 3, NULL, NULL, NULL, CAST(759 AS Decimal(10, 0)), N'../Members/5/36/preview.pdf', 4, CAST(N'2021-03-24T13:25:45.483' AS DateTime), NULL, NULL, 5, CAST(N'2021-03-24T13:38:36.227' AS DateTime), 1, NULL)
INSERT [dbo].[Note_Details] ([Id], [Title], [Category_Id], [Image], [Type_Id], [Pages], [Description], [University], [Country_Id], [Course], [Course_Code], [Professor], [Price], [Note_Preview], [Status], [Added_Date], [Review_By], [Published_Date], [User_Id], [Edited_Date], [IsActive], [AdminReview]) VALUES (52, N'Python Programming', 1, N'../Members/Default_book.jpg', 2, NULL, N'Python programming learning for beginners.', NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(10, 0)), NULL, 7, CAST(N'2021-04-02T10:51:57.247' AS DateTime), 1, CAST(N'2021-04-02T11:06:26.943' AS DateTime), 5, CAST(N'2021-04-02T11:07:48.913' AS DateTime), 1, N'unpublished note')
SET IDENTITY_INSERT [dbo].[Note_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[NotesAttachments] ON 

INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (3, 22, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\5\22\Attachment', CAST(N'2021-02-25T12:56:42.777' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (4, 21, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\5\21\Attachment', CAST(N'2021-02-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (5, 24, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\7\24\Attachment', CAST(N'2021-02-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (6, 25, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\7\25\Attachment', CAST(N'2021-02-23T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (13, 34, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\11\34\Attachment', CAST(N'2021-03-03T14:06:51.160' AS DateTime), 1, CAST(N'2021-03-09T10:35:54.957' AS DateTime), 0)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (14, 35, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\11\35\Attachment', CAST(N'2021-03-03T14:21:23.737' AS DateTime), 1, CAST(N'2021-03-09T10:35:55.137' AS DateTime), 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (15, 33, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\8\33\Attachment', CAST(N'2021-02-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (29, 36, N'book.pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\5\36\Attachment', CAST(N'2021-02-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[NotesAttachments] ([Id], [NoteId], [FileName], [FilePath], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (30, 52, N'Notes Marketplace - Front .pdf', N'C:\Users\Lenovo\Desktop\projects\NoteMarketPlace\NoteMarketPlace\Members\5\52\Attachment', CAST(N'2021-04-02T10:51:59.110' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[NotesAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase_Details] ON 

INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (10, 7, 21, 5, CAST(N'2021-02-25T13:50:38.733' AS DateTime), 1, 1, CAST(N'2021-02-25T13:50:38.733' AS DateTime), CAST(0 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (11, 7, 22, 5, CAST(N'2021-02-25T17:49:22.223' AS DateTime), 0, 0, NULL, CAST(359 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (12, 5, 24, 7, CAST(N'2021-02-25T17:50:27.283' AS DateTime), 1, 1, CAST(N'2021-03-30T10:47:30.440' AS DateTime), CAST(0 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (13, 5, 25, 7, CAST(N'2021-02-25T17:50:40.907' AS DateTime), 1, 1, CAST(N'2021-03-23T11:45:46.743' AS DateTime), CAST(549 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (15, 11, 21, 5, CAST(N'2021-03-02T18:24:35.267' AS DateTime), 1, 1, CAST(N'2021-03-02T18:24:35.270' AS DateTime), CAST(0 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (16, 10, 21, 5, CAST(N'2021-03-02T18:29:17.647' AS DateTime), 1, 1, CAST(N'2021-03-02T18:29:17.647' AS DateTime), CAST(0 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (17, 9, 21, 5, CAST(N'2021-03-02T18:32:58.807' AS DateTime), 1, 1, CAST(N'2021-03-02T18:32:58.807' AS DateTime), CAST(0 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (18, 11, 24, 7, CAST(N'2021-03-03T11:23:54.523' AS DateTime), 1, 1, CAST(N'2021-03-03T11:23:54.523' AS DateTime), CAST(0 AS Decimal(10, 0)), NULL, NULL)
INSERT [dbo].[Purchase_Details] ([Purchase_Id], [Downloader], [Note_Id], [Seller], [Purchase_Date], [Allow_Download], [IsAttachment_Downloaded], [AttachmentDownload_Date], [PurchasedPrice], [Modified_By], [Modified_Date]) VALUES (19, 11, 22, 5, CAST(N'2021-03-23T11:25:20.210' AS DateTime), 1, 1, CAST(N'2021-03-23T11:47:20.073' AS DateTime), CAST(359 AS Decimal(10, 0)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Purchase_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Review_Details] ON 

INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (5, 5, 24, 12, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-02-18T00:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (6, 5, 25, 13, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-02-26T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (7, 7, 22, 11, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-02-22T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (8, 7, 21, 10, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-02-25T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (9, 11, 21, 15, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-03-02T00:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (10, 10, 21, 16, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-03-02T00:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (11, 9, 21, 17, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. tempor incididunt ut labore et', CAST(N'2021-03-03T00:00:00.000' AS DateTime), 5, NULL)
INSERT [dbo].[Review_Details] ([Review_Id], [User_Id], [Note_Id], [Purchase_Id], [Review_msg], [Review_Date], [Rating], [Modified_Date]) VALUES (12, 11, 24, 18, N'This is dummy review. Lorem ipsum is simple dummy text.', CAST(N'2021-03-03T11:25:20.287' AS DateTime), 3, NULL)
SET IDENTITY_INSERT [dbo].[Review_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Spam_Notes] ON 

INSERT [dbo].[Spam_Notes] ([Id], [NoteId], [UserId], [Purchase_Id], [Remarks], [Reported_Date], [Modified_By], [Modified_Date]) VALUES (1, 21, 7, 10, N'This note is spam.', CAST(N'2021-03-03T12:12:56.767' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Spam_Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (1, N'Male', N'M', N'Gender', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (2, N'Female', N'Fe', N'Gender', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (3, N'Draft', N'Draft', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (4, N'Submitted', N'Submitted For Review', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (5, N'In Review', N'In Review', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (6, N'Published', N'Approved', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (7, N'Rejected', N'Rejected', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (8, N'Removed', N'Removed', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[System_Config] ON 

INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (1, N'Facebook', N'https://www.facebook.com', NULL, 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (2, N'Twitter', N'https://www.twitter.com', NULL, 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (3, N'Linkedin', N'https://www.linkedin.com', NULL, 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (5, N'DefaultBookImage', N'../Members/Default_book.jpg', CAST(N'2021-03-09T14:08:37.700' AS DateTime), 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (6, N'DefaultProfileImage', N'../Members/user.png', CAST(N'2021-03-09T14:08:37.700' AS DateTime), 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (7, N'SupportEmailAddress', N'admin@gmail.com', NULL, 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (8, N'SupportContact', N'9954763245', CAST(N'2021-03-09T14:08:37.700' AS DateTime), 1)
INSERT [dbo].[System_Config] ([Id], [Name], [Value], [Modified_Date], [IsActive]) VALUES (10, N'EmailAddresses', N'admin@gmail.com', NULL, 1)
SET IDENTITY_INSERT [dbo].[System_Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_Details] ON 

INSERT [dbo].[Type_Details] ([Type_Id], [Type_Name], [Description], [Added_Date], [Added_By], [Edited_By], [Edited_Date], [IsActive]) VALUES (1, N'Handwritten', N'Handwritten Book.', CAST(N'2021-02-12T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-03-07T20:27:35.247' AS DateTime), 1)
INSERT [dbo].[Type_Details] ([Type_Id], [Type_Name], [Description], [Added_Date], [Added_By], [Edited_By], [Edited_Date], [IsActive]) VALUES (2, N'Notebook', N'Lorem is dummy text', CAST(N'2021-02-15T00:00:00.000' AS DateTime), 2, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Type_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Details] ON 

INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (1, 5, CAST(N'2000-03-18' AS Date), 1, NULL, N'91', CAST(9965423581 AS Numeric(20, 0)), N'../Members/5/DP.png', N'Near xyz street,', N'dhhdhdh', N'Rajkot', N'Gujarat', N'360003', 1, N'GTU', N'BH Gardi', CAST(N'2021-02-12T00:00:00.000' AS DateTime), CAST(N'2021-03-27T19:52:28.460' AS DateTime))
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (2, 7, NULL, 2, NULL, N'91', CAST(9985423215 AS Numeric(20, 0)), N'../Members/7/DP.png', N'asdfv ccbcbcbcb', N'jsjsjjsdddj djdjdjdj', N'Ahmedabad', N'Gujarat', N'360001', 1, N'GTU', N'ABc', CAST(N'2021-02-26T00:00:00.000' AS DateTime), CAST(N'2021-02-25T18:44:10.133' AS DateTime))
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (3, 8, NULL, 1, NULL, N'91', CAST(4586245852 AS Numeric(20, 0)), NULL, N'test12234', N'Testing 12344', N'New YorkC', N'NY', N'374638', 3, N'Columbia University', N'Columbia Science School', CAST(N'2021-03-01T19:11:50.047' AS DateTime), NULL)
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (4, 9, NULL, 2, NULL, N'91', CAST(4586245852 AS Numeric(20, 0)), N'../Members/9/DP.png', N'asddfgg', N'zcxbcnvmb,', N'New York', N'New York', N'235486', 3, N'University', N'College', CAST(N'2021-03-02T18:01:07.990' AS DateTime), NULL)
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (5, 10, NULL, 1, NULL, N'91', CAST(4586245852 AS Numeric(20, 0)), N'../Members/10/DP.png', N'qewreueu', N'lgkgkfrikf', N'New York', N'NY', N'562255', 3, N'University', N'College', CAST(N'2021-03-02T18:02:30.257' AS DateTime), NULL)
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (6, 11, NULL, 1, NULL, N'91', CAST(4586245852 AS Numeric(20, 0)), N'../Members/11/DP.png', N'utjjdkskslxm', N'rurfocnxnsnsbbdbvmv', N'Rajkot', N'Gujarat', N'360003', 1, N'Gujarat Technological University', N'B.H Gardi', CAST(N'2021-03-02T18:03:59.603' AS DateTime), NULL)
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (7, 1, NULL, NULL, NULL, N'1', CAST(4586245852 AS Numeric(20, 0)), NULL, N'', NULL, N'', N'', N'', 1, NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-03-27T19:24:02.280' AS DateTime))
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (8, 2, NULL, NULL, NULL, N'91', CAST(4586245852 AS Numeric(20, 0)), NULL, N'', NULL, N'', N'', N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (9, 6, NULL, NULL, NULL, N'1', CAST(4586245852 AS Numeric(20, 0)), NULL, N'', NULL, N'', N'', N'', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[User_Details] ([Id], [UserId], [DOB], [Gender], [Secondary_Email], [Phone_No_Country_Code], [Phone_No], [Profile_Img], [Address_Line1], [Address_Line2], [City], [State], [ZipCode], [Country_Id], [University], [College], [Create_Date], [Modified_date]) VALUES (11, 17, NULL, NULL, NULL, N'91', CAST(9987125478 AS Numeric(20, 0)), NULL, N'', NULL, N'', N'', N'', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Roles] ON 

INSERT [dbo].[User_Roles] ([Role_Id], [Role], [Create_Date], [IsActive]) VALUES (1, N'Super_Admin', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Roles] ([Role_Id], [Role], [Create_Date], [IsActive]) VALUES (2, N'Admin', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Roles] ([Role_Id], [Role], [Create_Date], [IsActive]) VALUES (3, N'Member', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (1, N'Meet', N'Sheth', N'admin@gmail.com', N'ms1832', 1, CAST(N'2021-02-09T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-03-27T19:24:02.280' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (2, N'Jonas', N'Stephen', N'abc@gmail.com', N'4545', 1, CAST(N'2021-02-11T00:00:00.000' AS DateTime), 1, NULL, NULL, 2)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (3, N'Abc', N'Xyz', N'a@gmail.com', N'123', 0, CAST(N'2021-02-12T11:23:10.417' AS DateTime), 1, 1, CAST(N'2021-03-09T10:35:02.393' AS DateTime), 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (5, N'Meet', N'Sheth', N'shethmeet1@gmail.com', N'meet123', 1, CAST(N'2021-02-12T13:09:28.560' AS DateTime), 1, NULL, CAST(N'2021-03-27T19:52:28.460' AS DateTime), 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (6, N'Smith', N'Steve', N'smith@gmail.com', N'smith123', 1, CAST(N'2021-01-19T00:00:00.000' AS DateTime), 1, NULL, NULL, 2)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (7, N'Khyati', N'Patel', N'khyati@gmail.com', N'khyati123', 1, CAST(N'2021-01-23T00:00:00.000' AS DateTime), 1, NULL, CAST(N'2021-02-25T18:44:10.133' AS DateTime), 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (8, N'Oliver', N'Queen', N'oliver@gmail.com', N'oliver123', 1, CAST(N'2021-02-18T10:15:22.357' AS DateTime), 1, NULL, NULL, 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (9, N'Felicity', N'Smoke', N'felicity@gmail.com', N'felicity123', 1, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 1, NULL, NULL, 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (10, N'John', N'Diggle', N'john@gmail.com', N'john123', 1, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 1, NULL, NULL, 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (11, N'Keval', N'Siddhpura', N'keval@gmail.com', N'keval123', 1, CAST(N'2021-03-01T19:17:51.103' AS DateTime), 1, 1, CAST(N'2021-03-09T10:35:54.757' AS DateTime), 3)
INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (17, N'Mit', N'Sheth', N'mitsheth@gmail.com', N'637640', 0, CAST(N'2021-03-25T19:17:38.000' AS DateTime), 1, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Note_Details] ADD  CONSTRAINT [DF_Note_Details_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NotesAttachments] ADD  CONSTRAINT [DF_NotesAttachments_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Purchase_Details] ADD  CONSTRAINT [DF_Purchase_Details_Allow_Download]  DEFAULT ((0)) FOR [Allow_Download]
GO
ALTER TABLE [dbo].[Purchase_Details] ADD  DEFAULT ((0)) FOR [IsAttachment_Downloaded]
GO
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [DF_Note_Status_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[System_Config] ADD  CONSTRAINT [DF_System_Config_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User_Roles] ADD  CONSTRAINT [DF_User_Roles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsEmailVerified]  DEFAULT ((0)) FOR [IsEmailVerified]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Category_Details]  WITH CHECK ADD  CONSTRAINT [FK_Category_Details_Users] FOREIGN KEY([Added_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Category_Details] CHECK CONSTRAINT [FK_Category_Details_Users]
GO
ALTER TABLE [dbo].[Category_Details]  WITH CHECK ADD  CONSTRAINT [FK_Category_Details_Users1] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Category_Details] CHECK CONSTRAINT [FK_Category_Details_Users1]
GO
ALTER TABLE [dbo].[Country_Details]  WITH CHECK ADD  CONSTRAINT [FK_Country_Details_Users] FOREIGN KEY([Added_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Country_Details] CHECK CONSTRAINT [FK_Country_Details_Users]
GO
ALTER TABLE [dbo].[Country_Details]  WITH CHECK ADD  CONSTRAINT [FK_Country_Details_Users1] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Country_Details] CHECK CONSTRAINT [FK_Country_Details_Users1]
GO
ALTER TABLE [dbo].[Note_Details]  WITH CHECK ADD  CONSTRAINT [FK_Note_Details_Category_Details] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category_Details] ([Category_Id])
GO
ALTER TABLE [dbo].[Note_Details] CHECK CONSTRAINT [FK_Note_Details_Category_Details]
GO
ALTER TABLE [dbo].[Note_Details]  WITH CHECK ADD  CONSTRAINT [FK_Note_Details_Country_Details] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country_Details] ([Country_Id])
GO
ALTER TABLE [dbo].[Note_Details] CHECK CONSTRAINT [FK_Note_Details_Country_Details]
GO
ALTER TABLE [dbo].[Note_Details]  WITH CHECK ADD  CONSTRAINT [FK_Note_Details_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Note_Details] CHECK CONSTRAINT [FK_Note_Details_Status]
GO
ALTER TABLE [dbo].[Note_Details]  WITH CHECK ADD  CONSTRAINT [FK_Note_Details_Type_Details] FOREIGN KEY([Type_Id])
REFERENCES [dbo].[Type_Details] ([Type_Id])
GO
ALTER TABLE [dbo].[Note_Details] CHECK CONSTRAINT [FK_Note_Details_Type_Details]
GO
ALTER TABLE [dbo].[Note_Details]  WITH CHECK ADD  CONSTRAINT [FK_Note_Details_User_Details] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Note_Details] CHECK CONSTRAINT [FK_Note_Details_User_Details]
GO
ALTER TABLE [dbo].[NotesAttachments]  WITH CHECK ADD  CONSTRAINT [FK_NotesAttachments_Note_Details] FOREIGN KEY([NoteId])
REFERENCES [dbo].[Note_Details] ([Id])
GO
ALTER TABLE [dbo].[NotesAttachments] CHECK CONSTRAINT [FK_NotesAttachments_Note_Details]
GO
ALTER TABLE [dbo].[NotesAttachments]  WITH CHECK ADD  CONSTRAINT [FK_NotesAttachments_Users] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[NotesAttachments] CHECK CONSTRAINT [FK_NotesAttachments_Users]
GO
ALTER TABLE [dbo].[Purchase_Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Details_Note_Details] FOREIGN KEY([Note_Id])
REFERENCES [dbo].[Note_Details] ([Id])
GO
ALTER TABLE [dbo].[Purchase_Details] CHECK CONSTRAINT [FK_Purchase_Details_Note_Details]
GO
ALTER TABLE [dbo].[Purchase_Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Details_User_Details] FOREIGN KEY([Downloader])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Purchase_Details] CHECK CONSTRAINT [FK_Purchase_Details_User_Details]
GO
ALTER TABLE [dbo].[Purchase_Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Details_Users] FOREIGN KEY([Seller])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Purchase_Details] CHECK CONSTRAINT [FK_Purchase_Details_Users]
GO
ALTER TABLE [dbo].[Purchase_Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Details_Users1] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Purchase_Details] CHECK CONSTRAINT [FK_Purchase_Details_Users1]
GO
ALTER TABLE [dbo].[Review_Details]  WITH CHECK ADD  CONSTRAINT [FK_Review_Details_Note_Details] FOREIGN KEY([Note_Id])
REFERENCES [dbo].[Note_Details] ([Id])
GO
ALTER TABLE [dbo].[Review_Details] CHECK CONSTRAINT [FK_Review_Details_Note_Details]
GO
ALTER TABLE [dbo].[Review_Details]  WITH CHECK ADD  CONSTRAINT [FK_Review_Details_Purchase_Details] FOREIGN KEY([Purchase_Id])
REFERENCES [dbo].[Purchase_Details] ([Purchase_Id])
GO
ALTER TABLE [dbo].[Review_Details] CHECK CONSTRAINT [FK_Review_Details_Purchase_Details]
GO
ALTER TABLE [dbo].[Review_Details]  WITH CHECK ADD  CONSTRAINT [FK_Review_Details_User_Details] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Review_Details] CHECK CONSTRAINT [FK_Review_Details_User_Details]
GO
ALTER TABLE [dbo].[Spam_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Spam_Notes_Note_Details] FOREIGN KEY([NoteId])
REFERENCES [dbo].[Note_Details] ([Id])
GO
ALTER TABLE [dbo].[Spam_Notes] CHECK CONSTRAINT [FK_Spam_Notes_Note_Details]
GO
ALTER TABLE [dbo].[Spam_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Spam_Notes_Purchase_Details] FOREIGN KEY([Purchase_Id])
REFERENCES [dbo].[Purchase_Details] ([Purchase_Id])
GO
ALTER TABLE [dbo].[Spam_Notes] CHECK CONSTRAINT [FK_Spam_Notes_Purchase_Details]
GO
ALTER TABLE [dbo].[Spam_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Spam_Notes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Spam_Notes] CHECK CONSTRAINT [FK_Spam_Notes_Users]
GO
ALTER TABLE [dbo].[Spam_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Spam_Notes_Users1] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Spam_Notes] CHECK CONSTRAINT [FK_Spam_Notes_Users1]
GO
ALTER TABLE [dbo].[Type_Details]  WITH CHECK ADD  CONSTRAINT [FK_Type_Details_Users] FOREIGN KEY([Added_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Type_Details] CHECK CONSTRAINT [FK_Type_Details_Users]
GO
ALTER TABLE [dbo].[Type_Details]  WITH CHECK ADD  CONSTRAINT [FK_Type_Details_Users1] FOREIGN KEY([Edited_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Type_Details] CHECK CONSTRAINT [FK_Type_Details_Users1]
GO
ALTER TABLE [dbo].[User_Details]  WITH CHECK ADD  CONSTRAINT [FK_User_Details_Status] FOREIGN KEY([Gender])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[User_Details] CHECK CONSTRAINT [FK_User_Details_Status]
GO
ALTER TABLE [dbo].[User_Details]  WITH CHECK ADD  CONSTRAINT [FK_User_Details_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[User_Details] CHECK CONSTRAINT [FK_User_Details_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_User_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[User_Roles] ([Role_Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_User_Roles]
GO
USE [master]
GO
ALTER DATABASE [Notes-MarketPlace] SET  READ_WRITE 
GO
