USE [master]
GO
/****** Object:  Database [PixelPalette]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE DATABASE [PixelPalette]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PixelPalette', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PixelPalette.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Collection]    Script Date: 5/5/2024 9:39:27 PM ******/
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
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Conversation]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Follower]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[LikePost]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Message]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Ownership]    Script Date: 5/5/2024 9:39:27 PM ******/
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
/****** Object:  Table [dbo].[Post]    Script Date: 5/5/2024 9:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Caption] [nvarchar](255) NULL,
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
/****** Object:  Table [dbo].[User]    Script Date: 5/5/2024 9:39:27 PM ******/
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
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240504131129_UltimateLy', N'6.0.28')
GO
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl]) VALUES (1, 2, N'Ảnh cute', NULL, N'gewbawdjidwm5qqxbijt', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714904626/gewbawdjidwm5qqxbijt.jpg')
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl]) VALUES (2, 2, N'Gấu trúc con', NULL, N'txjrlbxnee1uvexrsjb9', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905477/txjrlbxnee1uvexrsjb9.jpg')
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl]) VALUES (3, 2, N'Nhiếp ảnh kiến trúc', NULL, N'gl157bxlappm5z3zccrb', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905467/gl157bxlappm5z3zccrb.jpg')
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl]) VALUES (4, 2, N'Van Gogh', NULL, N'ehoccatfvtlumgshgxyp', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905515/ehoccatfvtlumgshgxyp.jpg')
INSERT [dbo].[Collection] ([Id], [UserId], [Name], [Description], [BackgroundId], [BackgroundUrl]) VALUES (5, 2, N'Phong cảnh', NULL, N'ub2orabcde9hxei7sunk', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905575/ub2orabcde9hxei7sunk.jpg')
SET IDENTITY_INSERT [dbo].[Collection] OFF
GO
SET IDENTITY_INSERT [dbo].[Ownership] ON 

INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (7, 2, 7)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (8, 2, 8)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (9, 2, 9)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (10, 1, 10)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (11, 1, 11)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (12, 5, 12)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (14, 5, 13)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (15, 4, 14)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (16, 4, 15)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (17, 4, 16)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (18, 4, 17)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (19, 4, 18)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (20, 4, 19)
INSERT [dbo].[Ownership] ([Id], [CollectionId], [PostId]) VALUES (21, 3, 20)
SET IDENTITY_INSERT [dbo].[Ownership] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (7, 2, NULL, NULL, NULL, NULL, N'ih5gwwogooqflbnerdhr', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915892/ih5gwwogooqflbnerdhr.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (8, 2, NULL, NULL, NULL, NULL, N'c1hu1ze06moot6sajpe6', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915905/c1hu1ze06moot6sajpe6.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (9, 2, NULL, NULL, NULL, NULL, N'euzgk4nstkssylqtn1f8', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915912/euzgk4nstkssylqtn1f8.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (10, 2, NULL, NULL, NULL, NULL, N'hha6e03z60nvgdf6bvto', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915918/hha6e03z60nvgdf6bvto.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (11, 2, NULL, NULL, NULL, NULL, N'tngw6r5kxsrx2pkk1sek', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915946/tngw6r5kxsrx2pkk1sek.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (12, 2, NULL, NULL, NULL, NULL, N'jcd28evejrew2o6orptw', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915952/jcd28evejrew2o6orptw.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (13, 2, NULL, NULL, NULL, NULL, N'ylvibw8h5xwxfopcs3dp', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915959/ylvibw8h5xwxfopcs3dp.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (14, 2, NULL, NULL, NULL, NULL, N'ifzuldk1493gphhyybje', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915966/ifzuldk1493gphhyybje.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (15, 2, NULL, NULL, NULL, NULL, N'gemilyczkchbatemwcee', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915972/gemilyczkchbatemwcee.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (16, 2, NULL, NULL, NULL, NULL, N'srhirbmr0flrtmefonwj', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915978/srhirbmr0flrtmefonwj.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (17, 2, NULL, NULL, NULL, NULL, N'wijx9wxtrxe5omrkeo14', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915984/wijx9wxtrxe5omrkeo14.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (18, 2, NULL, NULL, NULL, NULL, N'yxlxq821vb8xzioqbj7s', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915990/yxlxq821vb8xzioqbj7s.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (19, 2, NULL, NULL, NULL, NULL, N'qfbqpq7xvyfqu8wkdgzb', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714915998/qfbqpq7xvyfqu8wkdgzb.jpg', 0)
INSERT [dbo].[Post] ([Id], [UserId], [Caption], [Detail], [Theme], [Link], [ThumbnailId], [ThumbnailUrl], [Like]) VALUES (20, 2, NULL, NULL, NULL, NULL, N'sq0rn0jawaavocnzxylo', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714916006/sq0rn0jawaavocnzxylo.jpg', 0)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash]) VALUES (2, N'Huy', N'Cao', NULL, N'rsbvkld59blxkvkiqe7c', N'https://res.cloudinary.com/djaze4ci7/image/upload/v1714905896/rsbvkld59blxkvkiqe7c.jpg', CAST(N'2024-05-04' AS Date), 1, NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiaHV5QGdtYWlsLmNvbSIsImV4cCI6MTcxNDkyMjk4MCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzE3NyIsImF1ZCI6IlVzZXIifQ.1ETnSrquE41xZsXqjKP05bBLIqakXigBiCgS_cugNnY', 0, 0, N'huy@gmail.com', N'HUY@GMAIL.COM', N'huy@gmail.com', N'HUY@GMAIL.COM', N'AQAAAAEAACcQAAAAEIJ2mcBqdQOMM4c6YRsHc7OftW5wxbm+98lBj6fu+WH6Nom1dW2xnhfAgAkGyaHklQ==')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Introduction], [AvatarId], [AvatarUrl], [Birthday], [Gender], [Country], [Token], [Follower], [Following], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [PasswordHash]) VALUES (8, N'Hoang', N'Cao', NULL, NULL, NULL, CAST(N'2024-05-05' AS Date), 1, NULL, NULL, 0, 0, N'mhoang@gmail.com', N'MHOANG@GMAIL.COM', N'mhoang@gmail.com', N'MHOANG@GMAIL.COM', N'AQAAAAEAACcQAAAAEM40pDn+DL/ei11Uw0hKH2Gf263KuBUHfDk+MXWzkpv0WivA8y6tl2Lic+3dD50IXg==')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Collection_UserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Collection_UserId] ON [dbo].[Collection]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_PostId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_PostId] ON [dbo].[Comment]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_UserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_UserId] ON [dbo].[Comment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conversation_ConnectorId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Conversation_ConnectorId] ON [dbo].[Conversation]
(
	[ConnectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Conversation_CreatorId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Conversation_CreatorId] ON [dbo].[Conversation]
(
	[CreatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follower_FollowerUserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Follower_FollowerUserId] ON [dbo].[Follower]
(
	[FollowerUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Follower_FollowingUserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Follower_FollowingUserId] ON [dbo].[Follower]
(
	[FollowingUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikePost_PostId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_LikePost_PostId] ON [dbo].[LikePost]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LikePost_UserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_LikePost_UserId] ON [dbo].[LikePost]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_ConversationId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_ConversationId] ON [dbo].[Message]
(
	[ConversationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_RecipientId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_RecipientId] ON [dbo].[Message]
(
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Message_SenderId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Message_SenderId] ON [dbo].[Message]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_UserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_UserId] ON [dbo].[Notification]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ownership_CollectionId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ownership_CollectionId] ON [dbo].[Ownership]
(
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ownership_PostId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ownership_PostId] ON [dbo].[Ownership]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_UserId]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Post_UserId] ON [dbo].[Post]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Email] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_UserName]    Script Date: 5/5/2024 9:39:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_UserName] ON [dbo].[User]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ('0001-01-01T00:00:00.000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ('0') FOR [Like]
GO
ALTER TABLE [dbo].[Message] ADD  DEFAULT ('2024-03-17 14:29:45') FOR [DateSent]
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
GO
ALTER TABLE [dbo].[Collection] CHECK CONSTRAINT [Collection_UserId_foreign]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_PostId_foreign] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_PostId_foreign]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_UserId_foreign] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
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
GO
ALTER TABLE [dbo].[LikePost] CHECK CONSTRAINT [FK_LikePost_Post]
GO
ALTER TABLE [dbo].[LikePost]  WITH CHECK ADD  CONSTRAINT [FK_LikePost_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
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
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Ownership_Collection] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collection] ([Id])
GO
ALTER TABLE [dbo].[Ownership] CHECK CONSTRAINT [FK_Ownership_Collection]
GO
ALTER TABLE [dbo].[Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Ownership_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Ownership] CHECK CONSTRAINT [FK_Ownership_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [Post_UserId_foreign] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [Post_UserId_foreign]
GO
USE [master]
GO
ALTER DATABASE [PixelPalette] SET  READ_WRITE 
GO
