USE [master]
GO
/****** Object:  Database [PixelPalette]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE DATABASE [PixelPalette]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PixelPalette', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PixelPalette.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PixelPalette_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PixelPalette_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PixelPalette] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PixelPalette].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PixelPalette] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PixelPalette] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PixelPalette] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PixelPalette] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PixelPalette] SET ARITHABORT OFF 
GO
ALTER DATABASE [PixelPalette] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PixelPalette] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PixelPalette] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PixelPalette] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PixelPalette] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PixelPalette] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PixelPalette] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PixelPalette] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PixelPalette] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PixelPalette] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PixelPalette] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PixelPalette] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PixelPalette] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PixelPalette] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PixelPalette] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PixelPalette] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PixelPalette] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PixelPalette] SET RECOVERY FULL 
GO
ALTER DATABASE [PixelPalette] SET  MULTI_USER 
GO
ALTER DATABASE [PixelPalette] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PixelPalette] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PixelPalette] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PixelPalette] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PixelPalette] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PixelPalette] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PixelPalette', N'ON'
GO
ALTER DATABASE [PixelPalette] SET QUERY_STORE = ON
GO
ALTER DATABASE [PixelPalette] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PixelPalette]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Analysis]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analysis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostCount] [int] NOT NULL,
	[UserCount] [int] NOT NULL,
	[NotificationCount] [int] NOT NULL,
	[AccessCountInDay] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Analysis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BackgroundId] [nvarchar](max) NULL,
	[BackgroundUrl] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[PostCount] [int] NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentReplyId] [int] NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Like] [bigint] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatorId] [int] NOT NULL,
	[ConnectorId] [int] NOT NULL,
 CONSTRAINT [PK_Conversation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follower]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follower](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FollowingUserId] [int] NOT NULL,
	[FollowerUserId] [int] NOT NULL,
 CONSTRAINT [PK_Follower] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikePost]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikePost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_LikePost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConversationId] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DateSent] [datetime] NOT NULL,
	[DateRead] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ownership]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ownership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CollectionId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Ownership] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Caption] [nvarchar](255) NOT NULL,
	[Detail] [nvarchar](max) NULL,
	[Theme] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[ThumbnailId] [nvarchar](max) NOT NULL,
	[ThumbnailUrl] [nvarchar](max) NOT NULL,
	[Like] [bigint] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](450) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Introduction] [nvarchar](max) NULL,
	[AvatarId] [nvarchar](max) NULL,
	[AvatarUrl] [nvarchar](max) NULL,
	[Birthday] [date] NULL,
	[Gender] [bit] NULL,
	[Country] [nvarchar](255) NULL,
	[Token] [nvarchar](max) NULL,
	[Follower] [bigint] NOT NULL,
	[Following] [bigint] NOT NULL,
	[UserName] [nvarchar](450) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](450) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 6/5/2024 1:22:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240507061430_Inittial', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240511123535_addStatus', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240512024000_deleteStatus', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240520174213_CaptionNotNull', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240522121724_addPostCount', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240530135806_Analysis', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240530183234_Date', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240531081003_newDate', N'6.0.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240531081415_change', N'6.0.28')
GO
SET IDENTITY_INSERT [dbo].[Analysis] ON 

INSERT [dbo].[Analysis] ([Id], [PostCount], [UserCount], [NotificationCount], [AccessCountInDay], [CreateAt]) VALUES (10, 26, 15, 0, 2, CAST(N'2024-05-31T08:21:01.940' AS DateTime))
INSERT [dbo].[Analysis] ([Id], [PostCount], [UserCount], [NotificationCount], [AccessCountInDay], [CreateAt]) VALUES (11, 26, 16, 0, 0, CAST(N'2024-05-31T23:45:18.497' AS DateTime))
INSERT [dbo].[Analysis] ([Id], [PostCount], [UserCount], [NotificationCount], [AccessCountInDay], [CreateAt]) VALUES (12, 23, 15, 1, 24, CAST(N'2024-06-01T04:11:11.363' AS DateTime))
INSERT [dbo].[Analysis] ([Id], [PostCount], [UserCount], [NotificationCount], [AccessCountInDay], [CreateAt]) VALUES (13, 24, 17, 3, 11, CAST(N'2024-06-02T08:35:15.430' AS DateTime))
INSERT [dbo].[Analysis] ([Id], [PostCount], [UserCount], [NotificationCount], [AccessCountInDay], [CreateAt]) VALUES (14, 25, 18, 8, 6, CAST(N'2024-06-03T04:01:05.963' AS DateTime))
INSERT [dbo].[Analysis] ([Id], [PostCount], [UserCount], [NotificationCount], [AccessCountInDay], [CreateAt]) VALUES (15, 25, 19, 8, 5, CAST(N'2024-06-04T00:07:50.317' AS DateTime))
SET IDENTITY_INSERT [dbo].[Analysis] OFF
GO
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (1, 4, N'Ảnh cute', NULL, N'gewbawdjidwm5qqxbijt', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714904626/gewbawdjidwm5qqxbijt.jpg', 0, 1)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (2, 4, N'Gấu trúc con', NULL, N'txjrlbxnee1uvexrsjb9', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905477/txjrlbxnee1uvexrsjb9.jpg', 0, 0)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (3, 4, N'Nhiếp ảnh kiến trúc', NULL, N'gl157bxlappm5z3zccrb', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905467/gl157bxlappm5z3zccrb.jpg', 0, 0)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (4, 4, N'Van Gogh', NULL, N'ehoccatfvtlumgshgxyp', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905515/ehoccatfvtlumgshgxyp.jpg', 0, 0)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (5, 4, N'Phong cảnh', NULL, N'ub2orabcde9hxei7sunk', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905575/ub2orabcde9hxei7sunk.jpg', 0, 0)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (8, 5, N'Bảng đồ ăn', N'Lưu các bài viết về đồ ăn', NULL, NULL, 0, 1)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (12, 3, N'Bảng mặc định', NULL, NULL, NULL, 1, 2)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (13, 5, N'Bảng mặc định', N'Đây là bảng mặc định của tui', NULL, NULL, 1, 2)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (14, 4, N'Bảng mặc định', NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (15, 5, N'Bảng ai', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (16, 23, N'Bảng mặc định', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (17, 10, N'Bảng mặc định', NULL, NULL, NULL, 1, 5)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (18, 10, N'Bảng girl', NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl], [IsDefault], [PostCount]) VALUES (19, 10, N'Girl', NULL, NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Collection] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (1, NULL, 9, 7, N'hello my phen', CAST(N'2024-05-27T16:07:11.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (2, NULL, 9, 7, N'hello my phen', CAST(N'2024-05-27T16:08:58.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (3, NULL, 9, 7, N'hello my phen', CAST(N'2024-05-27T16:08:59.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (4, 3, 9, 7, N'hello cc', CAST(N'2024-05-27T16:09:24.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (5, 3, 9, 7, N'hello cc', CAST(N'2024-05-27T16:13:22.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (6, NULL, 10, 9, N'Xinh quá!!!', CAST(N'2024-06-02T16:26:34.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (8, NULL, 10, 9, N'Tuyệt vời', CAST(N'2024-06-04T00:49:08.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (9, NULL, 10, 9, N'Wow', CAST(N'2024-06-04T00:53:42.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (10, NULL, 10, 9, N'haha', CAST(N'2024-06-04T00:56:23.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (12, NULL, 10, 9, N'hdksafl', CAST(N'2024-06-04T01:00:25.000' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [CommentReplyId], [UserId], [PostId], [Content], [CreatedAt], [Like]) VALUES (13, NULL, 10, 9, N'Ừ', CAST(N'2024-06-04T01:04:22.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Conversation] ON 

INSERT [dbo].[Conversation] ([Id], [CreatedAt], [CreatorId], [ConnectorId]) VALUES (12, CAST(N'2024-05-27T17:13:00.843' AS DateTime), 9, 3)
INSERT [dbo].[Conversation] ([Id], [CreatedAt], [CreatorId], [ConnectorId]) VALUES (13, CAST(N'2024-05-27T17:16:23.657' AS DateTime), 4, 9)
INSERT [dbo].[Conversation] ([Id], [CreatedAt], [CreatorId], [ConnectorId]) VALUES (14, CAST(N'2024-06-02T22:08:27.133' AS DateTime), 10, 9)
INSERT [dbo].[Conversation] ([Id], [CreatedAt], [CreatorId], [ConnectorId]) VALUES (15, CAST(N'2024-06-03T00:42:20.573' AS DateTime), 10, 4)
INSERT [dbo].[Conversation] ([Id], [CreatedAt], [CreatorId], [ConnectorId]) VALUES (16, CAST(N'2024-06-03T05:00:34.443' AS DateTime), 24, 3)
SET IDENTITY_INSERT [dbo].[Conversation] OFF
GO
SET IDENTITY_INSERT [dbo].[Follower] ON 

INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (16, 4, 3)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (17, 5, 3)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (20, 3, 4)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (23, 3, 9)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (24, 4, 9)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (25, 5, 9)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (26, 4, 5)
INSERT [dbo].[Follower] ([Id], [FollowingUserId], [FollowerUserId]) VALUES (27, 4, 23)
SET IDENTITY_INSERT [dbo].[Follower] OFF
GO
SET IDENTITY_INSERT [dbo].[LikePost] ON 

INSERT [dbo].[LikePost] ([Id], [PostId], [UserId]) VALUES (19, 9, 5)
INSERT [dbo].[LikePost] ([Id], [PostId], [UserId]) VALUES (20, 8, 10)
INSERT [dbo].[LikePost] ([Id], [PostId], [UserId]) VALUES (22, 7, 23)
INSERT [dbo].[LikePost] ([Id], [PostId], [UserId]) VALUES (23, 9, 10)
SET IDENTITY_INSERT [dbo].[LikePost] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (7, 12, 9, 3, N'Hẻllo', CAST(N'2024-05-27T17:13:00.847' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (8, 12, 9, 3, N'2', CAST(N'2024-05-27T17:13:46.970' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (9, 13, 4, 9, N'Hẻllo', CAST(N'2024-05-27T17:16:23.663' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (10, 13, 9, 4, N'2', CAST(N'2024-05-27T17:16:45.833' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (12, 14, 10, 9, N'Hellu', CAST(N'2024-06-02T22:48:31.340' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (13, 15, 10, 4, N'hellu', CAST(N'2024-06-03T00:42:20.590' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (14, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:19.503' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (15, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:21.787' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (16, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:21.950' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (17, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:22.100' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (18, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:22.250' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (19, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:22.407' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (20, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:22.570' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (21, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:22.730' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (22, 14, 10, 9, N'Helluu', CAST(N'2024-06-03T03:08:22.877' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (23, 14, 10, 9, N'Hellu', CAST(N'2024-06-03T03:08:35.913' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (24, 14, 10, 9, N'Hi', CAST(N'2024-06-03T03:30:30.090' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (25, 14, 10, 9, N'Wow', CAST(N'2024-06-03T03:34:33.787' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (26, 14, 10, 9, N'hhaha', CAST(N'2024-06-03T03:37:45.307' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (27, 14, 10, 9, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', CAST(N'2024-06-03T03:41:13.210' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (28, 16, 24, 3, N'hellu', CAST(N'2024-06-03T05:00:34.450' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (29, 12, 3, 9, N'Hellu', CAST(N'2024-06-03T05:16:11.940' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (30, 14, 10, 9, N'hhahah', CAST(N'2024-06-04T01:37:15.457' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (31, 14, 10, 9, N'What', CAST(N'2024-06-04T01:37:36.350' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (32, 14, 10, 9, N'dsjk', CAST(N'2024-06-04T01:40:37.100' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (33, 14, 10, 9, N'okii', CAST(N'2024-06-04T01:41:21.087' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (34, 14, 10, 9, N'jdsafh', CAST(N'2024-06-04T01:42:10.547' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (35, 14, 10, 9, N'Hezzz', CAST(N'2024-06-04T01:45:55.353' AS DateTime), NULL)
INSERT [dbo].[Message] ([Id], [ConversationId], [SenderId], [RecipientId], [Content], [DateSent], [DateRead]) VALUES (36, 14, 10, 9, N'hàias', CAST(N'2024-06-04T03:27:31.133' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (1, 3, N'New!   đã chia sẻ bài đăng có tiêu đề Bài viết 01', CAST(N'2024-06-01T00:50:30.917' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (3, 3, N'Hết nước chấm :))', CAST(N'2024-06-01T10:02:14.420' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (5, 3, N'Cập nhập hệ thống lần 2', CAST(N'2024-06-01T10:19:15.163' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (6, 10, N'Hot! Trang Nguyễn Thị Đã thích bài đăng Fix', CAST(N'2024-06-02T11:59:59.307' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (7, 23, N'Hot! Nhật Cao Đã thích bài đăng Debug', CAST(N'2024-06-02T13:43:25.960' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (8, 23, N'Hot! Nhật Cao Đã thích bài đăng Debug', CAST(N'2024-06-02T13:43:28.063' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (9, 10, N'Hot! Trang Nguyễn Thị Đã thích bài đăng Fix', CAST(N'2024-06-02T15:25:12.393' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (10, 10, N'New! Trang Nguyễn Thị đã chia sẻ bài đăng có tiêu đề Bài viết 02', CAST(N'2024-06-02T19:49:55.860' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (11, 10, N'New! Trang Nguyễn Thị đã chia sẻ bài đăng có tiêu đề Girl', CAST(N'2024-06-04T00:22:40.427' AS DateTime))
INSERT [dbo].[Notification] ([Id], [UserId], [Data], [CreatedAt]) VALUES (12, 10, N'New! Trang Nguyễn Thị đã chia sẻ bài đăng có tiêu đề Tiêu đề1', CAST(N'2024-06-04T03:22:04.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Ownership] ON 

INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (28, 12, 7)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (30, 12, 8)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (56, 13, 9)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (57, 13, 7)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (58, 1, 7)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (59, 8, 7)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (60, 16, 7)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (62, 18, 9)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (63, 17, 9)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (64, 17, 10)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (65, 17, 49)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (66, 17, 34)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (67, 17, 51)
SET IDENTITY_INSERT [dbo].[Ownership] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (7, 4, N'Debug', NULL, NULL, N'http://localhost:7499/', N'cvo1pm8cqr9xvbzvglr0', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715916732/cvo1pm8cqr9xvbzvglr0.png', 1)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (8, 4, N'Fix', NULL, NULL, NULL, N'c1hu1ze06moot6sajpe6', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915905/c1hu1ze06moot6sajpe6.jpg', 1)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (9, 4, N'Fix', NULL, NULL, NULL, N'euzgk4nstkssylqtn1f8', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915912/euzgk4nstkssylqtn1f8.jpg', 2)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (10, 4, N'Fix', NULL, NULL, NULL, N'hha6e03z60nvgdf6bvto', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915918/hha6e03z60nvgdf6bvto.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (11, 4, N'Fix', NULL, NULL, NULL, N'tngw6r5kxsrx2pkk1sek', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915946/tngw6r5kxsrx2pkk1sek.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (12, 4, N'Fix', NULL, NULL, NULL, N'jcd28evejrew2o6orptw', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915952/jcd28evejrew2o6orptw.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (13, 4, N'Fix', NULL, NULL, NULL, N'ylvibw8h5xwxfopcs3dp', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915959/ylvibw8h5xwxfopcs3dp.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (14, 4, N'Fix', NULL, NULL, NULL, N'ifzuldk1493gphhyybje', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915966/ifzuldk1493gphhyybje.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (15, 4, N'Fix', NULL, NULL, NULL, N'gemilyczkchbatemwcee', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915972/gemilyczkchbatemwcee.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (16, 4, N'Fix', NULL, NULL, NULL, N'srhirbmr0flrtmefonwj', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915978/srhirbmr0flrtmefonwj.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (17, 4, N'Fix', NULL, NULL, NULL, N'wijx9wxtrxe5omrkeo14', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915984/wijx9wxtrxe5omrkeo14.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (18, 4, N'Fix', NULL, NULL, NULL, N'yxlxq821vb8xzioqbj7s', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915990/yxlxq821vb8xzioqbj7s.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (19, 4, N'Fix', NULL, NULL, NULL, N'qfbqpq7xvyfqu8wkdgzb', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915998/qfbqpq7xvyfqu8wkdgzb.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (20, 4, N'Fix', NULL, NULL, NULL, N'sq0rn0jawaavocnzxylo', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714916006/sq0rn0jawaavocnzxylo.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (22, 4, N'Fix', NULL, NULL, NULL, N'a3utclajzclkkzmogcn9', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714922566/a3utclajzclkkzmogcn9.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (23, 4, N'Fix', NULL, NULL, NULL, N'uzisrljo6hxpvlgghnsp', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715064796/uzisrljo6hxpvlgghnsp.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (34, 5, N'Fix', NULL, NULL, NULL, N'nzjbjdjr6lo4k0roknf7', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715915238/nzjbjdjr6lo4k0roknf7.webp', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (35, 5, N'Fix', NULL, NULL, NULL, N'ktlvob6blh673kr0qvgm', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715915414/ktlvob6blh673kr0qvgm.png', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (36, 5, N'Fix', NULL, NULL, NULL, N'reab91qipyhdpzwk4xuh', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715915492/reab91qipyhdpzwk4xuh.webp', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (39, 5, N'Fix', NULL, NULL, NULL, N'i4glnqgtgcrskbmymm09', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715916222/i4glnqgtgcrskbmymm09.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (44, 5, N'ShowCase02', NULL, N'#showcase', NULL, N'czd6edboegwmsikzaztp', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715950119/czd6edboegwmsikzaztp.webp', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (45, 5, N'Show case 03', N'Show case', N'#showcase02', N'Dân trí', N'hiqixresaghulfucq2id', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1716220664/hiqixresaghulfucq2id.webp', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (47, 3, N'Collection', N'Đây là bài viết về collection', N'#collection', NULL, N'axamvxhycuovfd7ckjit', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1717205081/axamvxhycuovfd7ckjit.png', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (48, 3, N'Icon thông báo', NULL, NULL, NULL, N'v4nsczvd574ezihusthe', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1717228416/v4nsczvd574ezihusthe.png', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (49, 10, N'Bài viết 02', NULL, NULL, NULL, N'v4kyrbyyud8smbvkj6ta', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1717357794/v4kyrbyyud8smbvkj6ta.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (50, 10, N'Girl', NULL, NULL, NULL, N'qwea37yc60enkjnatxtg', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1717460559/qwea37yc60enkjnatxtg.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (51, 10, N'Tiêu đề1', NULL, NULL, NULL, N'zaianfzuci0zuv46a4fc', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1717471322/zaianfzuci0zuv46a4fc.jpg', 0)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'Member', N'MEMBER', N'943c5751-c044-41a5-80de-ffec18c1a8a8')
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (4, N'Admin', N'ADMIN', N'217595fe-5f4b-48f1-85f6-51e647f78d21')
INSERT [dbo].[Role] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (5, N'Blocker', N'BLOCKER', N'3ec010d6-ef2b-443a-b23f-7f418bb9187f')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (3, N'Kiên', N'Nguyễn Huy', N'Hi, I''m Kiên', N'pdvsdeeg8wglpb9jkzd5', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1717210276/pdvsdeeg8wglpb9jkzd5.jpg', CAST(N'2007-04-08' AS Date), 1, N'Hải Phòng', N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW5AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjpbIk1lbWJlciIsIkFkbWluIl0sImV4cCI6MTcxNzQ3Mjc5MywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.Cnqc3upY3XoeImIcyW6Uf220ZxBPvN0Bugw90ZRvq9g', 1, 2, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'AQAAAAEAACcQAAAAELHlQVOurS2TNM2GCUYqqojblQNpnENIyMNvGilabt2ml/JoBv7C5gYWPM8GppnFyw==', N'HVQVJP6OBLMIK4HUNLT4THUWKAKHI4RJ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (4, N'Huy', N'Cao', NULL, NULL, NULL, CAST(N'2024-05-07' AS Date), 1, NULL, N'gzscghOWDCrS1IGuGvvniV5vvMK8Q2OV', 3, 1, N'huy@gmail.com', N'HUY@GMAIL.COM', N'huy@gmail.com', N'HUY@GMAIL.COM', N'$2y$12$t3aF61vkfmBiDI7gzLgfvOQJXFvIkelhI9b4RDBB8IGOY6u8qpqk6', N'KTL2U2X6GMJSKJTDGMVA2CD5DVNDZBMP')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (5, N'Trang', N'Nguyễn Thị', N'Hoàn hảo theo cách không hoàn hảo', N'cyivqfqk5wxllrnq7be3', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1715831818/cyivqfqk5wxllrnq7be3.png', CAST(N'2003-10-12' AS Date), 0, N'Hưng Yên', N'AtwZ67iQtXPuKkukV1LAP3UWH3vBVftv', 1, 1, N'user@gmail.com', N'USER@GMAIL.COM', N'user@gmail.com', N'USER@GMAIL.COM', N'$2y$12$7jj7bMRs1uJCTTV3r/e6aOl1Lv0D6ABnL56lQhwOYWcto1MjElOlC', N'Y3GF5AIESXGDXBVUL4PUPSP22HSZJTCB')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (8, N'Soc', N'Cao', NULL, NULL, NULL, CAST(N'2024-05-12' AS Date), 1, NULL, NULL, 0, 0, N'soc@gmail.com', N'SOC@GMAIL.COM', N'soc@gmail.com', N'SOC@GMAIL.COM', N'AQAAAAEAACcQAAAAEI98q75JDqR6zsbaNcdKBHq1ib8n37RkfmUDg9eDOlYDxrZnQ+LgpYGCd7x0aZDHeQ==', N'VZWP7QVKROIYVQHLYW4H65KTWQUAOVDR')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (9, N'QUÂN', N'NT', NULL, NULL, NULL, CAST(N'2024-05-27' AS Date), 1, NULL, N'q2U3Tm8qYMEHEqoLfGOG62XPfo43WGLG', 0, 0, N'trungquanbg3@gmail.com', N'TRUNGQUANBG3@GMAIL.COM', N'trungquanbg3@gmail.com', N'TRUNGQUANBG3@GMAIL.COM', N'8634fbc043dc9d031ef397b9bd2b9a3c54668684369d1cbdfd7b36a9fbceb05a', N'PXD5C47QOHWDCNDK436B67KMZR3KILBW')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (10, N'Trang', N'Nguyễn Thị', NULL, NULL, NULL, CAST(N'2024-05-30' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWJjQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik1lbWJlciIsImV4cCI6MTcxNzQ3ODgyNCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.WhbSqpbkVonH_jxVDlcgVZjemlnYxs7uJEQ8lLryGe4', 0, 0, N'abc@gmail.com', N'ABC@GMAIL.COM', N'abc@gmail.com', N'ABC@GMAIL.COM', N'AQAAAAEAACcQAAAAEIfk6hhZnlRB3jacBTXfPtTxqfKX2QQbTGncs6toyhBZOAMlVwzAU58wiz2QjhN/XA==', N'N6CACPSCX76UGN6FVZUE37V6LXRWVQF3')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (11, N'Trang', N'Nguyễn Thị', NULL, NULL, NULL, CAST(N'2024-05-12' AS Date), 0, N'Nam Từ Liêm', N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYmNkQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik1lbWJlciIsImV4cCI6MTcxNzA0NTkzOSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.YzZF3Ui0qh299fLhIKZJd5AOdoZBctg_WaFstRUk65M', 0, 0, N'bcd@gmail.com', N'BCD@GMAIL.COM', N'bcd@gmail.com', N'BCD@GMAIL.COM', N'AQAAAAEAACcQAAAAEAosB6kUIyngsDTSFGpyrx41AZTi8R7mnDkOkx+18yYKJ4m9h+fWvyZcy4+yu54CUA==', N'6HIBZD2LA4R3F5ENT5WVHGTVGEXI2WF7')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (12, N'Trang', N'Nguyễn Thị', NULL, NULL, NULL, CAST(N'2024-05-30' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidHJhbmduZ3V5ZW5AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiTWVtYmVyIiwiZXhwIjoxNzE3MDQ1OTgyLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MTc3IiwiYXVkIjoiVXNlciJ9.HdWMNNYI6YePoqsbWOOnLijUILfkMQimbBhhwJyuVJE', 0, 0, N'trangnguyen@gmail.com', N'TRANGNGUYEN@GMAIL.COM', N'trangnguyen@gmail.com', N'TRANGNGUYEN@GMAIL.COM', N'AQAAAAEAACcQAAAAEFgvmrOkNnX9+5UkFemoVt9B+eRXsYs9LxvF7AB7FuY4plS000+Pe/oKZcFoNtjPoA==', N'BDHNBAQD5F2CFNVJZVXBIG4JLZR2MEA7')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (13, N'Huyền', N'Nguyễn Thị', NULL, NULL, NULL, CAST(N'2003-05-04' AS Date), 0, N'Hải Dương', N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidHJhbmdhYmNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiTWVtYmVyIiwiZXhwIjoxNzE3MDQ2MTIzLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MTc3IiwiYXVkIjoiVXNlciJ9.eqbHwp5bDmeeq6ZOXWzAqC467vYfxt4fgB_T9jQ_kTM', 0, 0, N'trangabc@gmail.com', N'TRANGABC@GMAIL.COM', N'trangabc@gmail.com', N'TRANGABC@GMAIL.COM', N'AQAAAAEAACcQAAAAEJtL74wpu7vAr66RgxmLCzdnyLjNCL98ZNXp0f2+6H3kPgvbRt1We/FimZQqnNYZFQ==', N'FRNOQBUKUQKIDLSQXJ5Z2CE6KI7XT7MZ')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (15, N'Huyền', N'Lương Thị', NULL, NULL, NULL, CAST(N'2024-05-30' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiaHV5ZW5AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiTWVtYmVyIiwiZXhwIjoxNzE3MDQ2NDAzLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MTc3IiwiYXVkIjoiVXNlciJ9.rq7GwE4PRYev-z315twQDtFDLL8yw129xQxKULFpvGM', 0, 0, N'huyen@gmail.com', N'HUYEN@GMAIL.COM', N'huyen@gmail.com', N'HUYEN@GMAIL.COM', N'AQAAAAEAACcQAAAAECpvf7x97F/4txYV+ppSSrXL9r85MFiuiDwPocAoCUlQa/mzRdNSWam+AeOsN75zwQ==', N'OGN6H6DRCSAIJ33EIFJCCD5SK7HL5IW2')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (16, N'Thanh', N'Vũ Thị', NULL, NULL, NULL, CAST(N'2024-05-30' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidGhhbmhAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiTWVtYmVyIiwiZXhwIjoxNzE3MDQ2NTk4LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MTc3IiwiYXVkIjoiVXNlciJ9.AUZw9sObMimwsxZrpSxZHMXuPyQ_bI8NblPcqe7XN3Y', 0, 0, N'thanh@gmail.com', N'THANH@GMAIL.COM', N'thanh@gmail.com', N'THANH@GMAIL.COM', N'AQAAAAEAACcQAAAAENtegLJa+1LaDK3JoqZeyZRtFoeHer8QCu+K9wE+qtjsIDLKx8h7f0AIZXjJwhZayg==', N'CFO4ZK2D5IN732O3X3HLEVAV4XJE6HKS')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (17, N'hoang', N'Cao', NULL, NULL, NULL, CAST(N'2024-05-30' AS Date), 1, NULL, N't16ZHrZkilAZiuvOgNlfxRZYi4Kcp25w', 0, 0, N'hoangg@gmail.com', N'HOANGG@GMAIL.COM', N'hoangg@gmail.com', N'HOANGG@GMAIL.COM', N'11fc51e3666e8ea1f5a5059489553d0ef8c1452aafa7a0dee5b6e26cd040f5bb', N'LIB6LW7KBGA7IR5HSDX6MHUIFS2NANNY')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (18, N'dasd', N'dsad', NULL, NULL, NULL, CAST(N'2024-05-30' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoicXVhbmhoYmcwM0BnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJNZW1iZXIiLCJleHAiOjE3MTcwNjAwMDEsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcxNzciLCJhdWQiOiJVc2VyIn0.Qi3oIT1wPd50MFiUJ4Rc9sxnvSgGL6LHF4Z5v6PGEcQ', 0, 0, N'quanhhbg03@gmail.com', N'QUANHHBG03@GMAIL.COM', N'quanhhbg03@gmail.com', N'QUANHHBG03@GMAIL.COM', N'7496ef530fb68e89549fe84d11fc724d6cece42af742f966675bc32645f765d0', N'O4GVNV5KPSW7EMMHEVKL7FTHE5ANJVGN')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (19, N'hoàng', N'cao', NULL, NULL, NULL, CAST(N'2024-05-31' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiaG9hbmdoQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik1lbWJlciIsImV4cCI6MTcxNzE1MzM2MywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.lOPNogcSUHYgUIbWt26j9YmPoMTX1w1CvNcmlzvktv8', 0, 0, N'hoangh@gmail.com', N'HOANGH@GMAIL.COM', N'hoangh@gmail.com', N'HOANGH@GMAIL.COM', N'AQAAAAEAACcQAAAAECKg7VYs5OCIXHHLRUmNkepKovz7jDNGixbBhbIrvaTBIabStspH4BrOcQvmPHxb9A==', N'IFNHNCTG7TNQ74DTTKP7JSR6QEJMDWUA')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (20, N'Dương Văn', N'Sơn', NULL, NULL, NULL, CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 0, 0, N'son@gmail.com', N'SON@GMAIL.COM', N'son@gmail.com', N'SON@GMAIL.COM', N'AQAAAAEAACcQAAAAEBQCS5Eu1fV3DOe/h6r1lBDngoZs1olB7Ic4qxJSbHRW0WLZtoqhbLrM+uOPZHhK1w==', N'BPLHEDBVLALV6UNATREM2N3VBJFXLBMX')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (21, N'Lương Văn', N'Hoàng', NULL, NULL, NULL, CAST(N'2024-06-01' AS Date), 1, NULL, NULL, 0, 0, N'hoanglb@gmail.com', N'HOANGLB@GMAIL.COM', N'hoanglb@gmail.com', N'HOANGLB@GMAIL.COM', N'AQAAAAEAACcQAAAAEL1K/4+6zqbufa366ufejR2Y0dcRdPxS9jlaxECOfDvxw3kWGiis0MEEeUURQpkxIQ==', N'XNY7GX2XAJ4VUKHRBXQMPKEHBOOBIQJM')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (22, N'Thảo Vân', N'Phạm Thị', NULL, NULL, NULL, CAST(N'2024-06-01' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidmFucHR0QGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik1lbWJlciIsImV4cCI6MTcxNzI2NDQ3NywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.uuLuLpVZ5fQEfswSsQ5YcbRLLYXpiMnIsDKNsEWP6s4', 0, 0, N'vanptt@gmail.com', N'VANPTT@GMAIL.COM', N'vanptt@gmail.com', N'VANPTT@GMAIL.COM', N'AQAAAAEAACcQAAAAEGxA7aDjO5QvDzXTJzV09G9NcAwfiF7Qrnsf362E4/dpbPoM8RNiIQjf71XOSTloGw==', N'I2J7J6SK3CDFQECPVFHOYNOGYF6UMALY')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (23, N'Nhật', N'Cao', NULL, NULL, NULL, CAST(N'2024-06-02' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYW5obmhhdDIyMTAyMDAzQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6Ik1lbWJlciIsImV4cCI6MTcxNzM0ODk4MiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.MfSisiW8-KZeP6ijC6SnfenM9X560_tLmXUFvhK8O9g', 0, 1, N'anhnhat22102003@gmail.com', N'ANHNHAT22102003@GMAIL.COM', N'anhnhat22102003@gmail.com', N'ANHNHAT22102003@GMAIL.COM', N'AQAAAAEAACcQAAAAEHGUp0KVHwsjqXG6O8a0qn55+bg7/Sm3/OMSPqc8GmVmbdasDJBeN4y1+XIO7hchjg==', N'AFVZZA4L6HQILFLQEU3GAVF6V6O42LE6')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash], [SecurityStamp]) VALUES (24, N'Tâm', N'Nguyễn Thị', NULL, NULL, NULL, CAST(N'2024-06-03' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidGFtbnRAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiTWVtYmVyIiwiZXhwIjoxNzE3NDczMzA1LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MTc3IiwiYXVkIjoiVXNlciJ9._Gn7T7geFs_dql8ybHlEyDS1Jv8lA4pkyskG4O0wKj4', 0, 0, N'tamnt@gmail.com', N'TAMNT@GMAIL.COM', N'tamnt@gmail.com', N'TAMNT@GMAIL.COM', N'AQAAAAEAACcQAAAAEFgWBTypB2kTiqawCvfxjl45nVutBbY+eqg7q0+ZTP+Pv87XABrfYydDthBWdUZGBA==', N'6ECO3T7VVK3H3RWQAMCPIHVJSBXRPBSS')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (5, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (8, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (9, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (10, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (11, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (12, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (13, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (15, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (16, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (17, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (18, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (19, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (20, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (21, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (22, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (23, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (24, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (3, 4)
GO
/****** Object:  Index [IX_Collection_UserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Collection_UserId] ON [dbo].[Collection]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_PostId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_PostId] ON [dbo].[Comment]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_UserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_UserId] ON [dbo].[Comment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conversation_ConnectorId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Conversation_ConnectorId] ON [dbo].[Conversation]
(
	[ConnectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conversation_CreatorId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Conversation_CreatorId] ON [dbo].[Conversation]
(
	[CreatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follower_FollowerUserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Follower_FollowerUserId] ON [dbo].[Follower]
(
	[FollowerUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follower_FollowingUserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Follower_FollowingUserId] ON [dbo].[Follower]
(
	[FollowingUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikePost_PostId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_LikePost_PostId] ON [dbo].[LikePost]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikePost_UserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_LikePost_UserId] ON [dbo].[LikePost]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_ConversationId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_ConversationId] ON [dbo].[Message]
(
	[ConversationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_RecipientId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_RecipientId] ON [dbo].[Message]
(
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_SenderId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_SenderId] ON [dbo].[Message]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_UserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_UserId] ON [dbo].[Notification]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ownership_CollectionId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ownership_CollectionId] ON [dbo].[Ownership]
(
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ownership_PostId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ownership_PostId] ON [dbo].[Ownership]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_UserId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Post_UserId] ON [dbo].[Post]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Role_NormalizedName]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Role_NormalizedName] ON [dbo].[Role]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Email] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_UserName]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_UserName] ON [dbo].[User]
(
	[UserName] ASC
)
WHERE ([UserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_RoleId]    Script Date: 6/5/2024 1:22:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_RoleId] ON [dbo].[UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Analysis] ADD  DEFAULT ('0001-01-01T00:00:00.000') FOR [CreateAt]
GO
ALTER TABLE [dbo].[Collection] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Collection] ADD  DEFAULT ('0') FOR [PostCount]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ('0001-01-01T00:00:00.000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ('0') FOR [Like]
GO
ALTER TABLE [dbo].[Message] ADD  DEFAULT ('2024-03-17 14:29:45') FOR [DateSent]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (N'') FOR [Caption]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (N'') FOR [ThumbnailId]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (N'') FOR [ThumbnailUrl]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT ('0') FOR [Like]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('0') FOR [Follower]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('0') FOR [Following]
GO
ALTER TABLE [dbo].[Collection]  WITH CHECK ADD  CONSTRAINT [Collection_UserId_foreign] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [Collection_UserId_foreign]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_PostId_foreign] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_PostId_foreign]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_UserId_foreign] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_UserId_foreign]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Conversation_User] FOREIGN KEY([ConnectorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Conversation_User]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Conversation_User1] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Conversation_User1]
GO
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [Follower_FollowerUserId_foreign] FOREIGN KEY([FollowerUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [Follower_FollowerUserId_foreign]
GO
ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [Follower_FollowingUserId_foreign] FOREIGN KEY([FollowingUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [Follower_FollowingUserId_foreign]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_Post]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_User]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [Message_ConversationId_foreign] FOREIGN KEY([ConversationId])
REFERENCES [dbo].[Conversation] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [Message_ConversationId_foreign]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [Message_RecipientId_foreign] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [Message_RecipientId_foreign]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [Message_SenderId_foreign] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [Message_SenderId_foreign]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Ownership_Collection] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collection] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ownership] CHECK CONSTRAINT [FK_Ownership_Collection]
GO
ALTER TABLE [dbo].[Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Ownership_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ownership] CHECK CONSTRAINT [FK_Ownership_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [Post_UserId_foreign] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [Post_UserId_foreign]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [PixelPalette] SET  READ_WRITE 
GO
