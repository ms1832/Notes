USE [master]
GO
/****** Object:  Database [Notes-MarketPlace]    Script Date: 11-02-2021 17:37:03 ******/
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
/****** Object:  Table [dbo].[Category_Details]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[Country_Details]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[Note_Details]    Script Date: 11-02-2021 17:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note_Details](
	[Note_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Image] [varchar](max) NULL,
	[Type_Id] [int] NOT NULL,
	[Pages] [numeric](10, 0) NULL,
	[Description] [varchar](500) NOT NULL,
	[University] [varchar](200) NULL,
	[Country_Id] [int] NULL,
	[Course] [varchar](10) NULL,
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
 CONSTRAINT [PK_Note_Details] PRIMARY KEY CLUSTERED 
(
	[Note_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotesAttachments]    Script Date: 11-02-2021 17:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotesAttachments](
	[Id] [int] NOT NULL,
	[NoteId] [int] NOT NULL,
	[FileName] [varchar](100) NOT NULL,
	[FilePath] [varchar](max) NOT NULL,
	[Create_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Details]    Script Date: 11-02-2021 17:37:04 ******/
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
	[AttachmentDownload_Date] [datetime] NOT NULL,
	[PurchasedPrice] [decimal](10, 0) NOT NULL,
	[Modified_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Purchase_Details] PRIMARY KEY CLUSTERED 
(
	[Purchase_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review_Details]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[Spam_Notes]    Script Date: 11-02-2021 17:37:04 ******/
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
	[Modified_Date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[System_Config]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[Type_Details]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[User_Details]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[User_Roles]    Script Date: 11-02-2021 17:37:04 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11-02-2021 17:37:04 ******/
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
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (1, N'Male', N'M', N'Gender', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (2, N'Female', N'Fe', N'Gender', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (3, N'Draft', N'Draft', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (4, N'Submitted For Review', N'Submitted For Review', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (5, N'In Review', N'In Review', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (6, N'Published', N'Approved', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (7, N'Rejected', N'Rejected', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Status] ([Id], [Value], [DataValue], [RefCategory], [Create_Date], [Modified_By], [Modified_Date], [IsActive]) VALUES (8, N'Removed', N'Removed', N'Notes Status', CAST(N'2021-02-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Roles] ON 

INSERT [dbo].[User_Roles] ([Role_Id], [Role], [Create_Date], [IsActive]) VALUES (1, N'Super_Admin', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Roles] ([Role_Id], [Role], [Create_Date], [IsActive]) VALUES (2, N'Admin', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User_Roles] ([Role_Id], [Role], [Create_Date], [IsActive]) VALUES (3, N'Member', CAST(N'2021-02-08T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [First_Name], [Last_Name], [Email], [Password], [IsEmailVerified], [Create_Date], [IsActive], [Modified_By], [Modified_Date], [RoleId]) VALUES (1, N'Meet', N'Sheth', N'admin@gmail.com', N'ms1832', 1, CAST(N'2021-02-09T00:00:00.000' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Note_Details] ADD  CONSTRAINT [DF_Note_Details_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NotesAttachments] ADD  CONSTRAINT [DF_NotesAttachments_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Purchase_Details] ADD  CONSTRAINT [DF_Purchase_Details_Allow_Download]  DEFAULT ((0)) FOR [Allow_Download]
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
ALTER TABLE [dbo].[Note_Details]  WITH CHECK ADD  CONSTRAINT [FK_Note_Details_Category_Details] FOREIGN KEY([Note_Id])
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
REFERENCES [dbo].[Note_Details] ([Note_Id])
GO
ALTER TABLE [dbo].[NotesAttachments] CHECK CONSTRAINT [FK_NotesAttachments_Note_Details]
GO
ALTER TABLE [dbo].[NotesAttachments]  WITH CHECK ADD  CONSTRAINT [FK_NotesAttachments_Users] FOREIGN KEY([Modified_By])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[NotesAttachments] CHECK CONSTRAINT [FK_NotesAttachments_Users]
GO
ALTER TABLE [dbo].[Purchase_Details]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Details_Note_Details] FOREIGN KEY([Note_Id])
REFERENCES [dbo].[Note_Details] ([Note_Id])
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
REFERENCES [dbo].[Note_Details] ([Note_Id])
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
REFERENCES [dbo].[Note_Details] ([Note_Id])
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
