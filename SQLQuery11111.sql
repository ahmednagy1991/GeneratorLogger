USE [master]
GO
/****** Object:  Database [HeatMonitorLogger]    Script Date: 7/24/2020 1:18:47 PM ******/
CREATE DATABASE [HeatMonitorLogger]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HeatMonitorLogger', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HeatMonitorLogger.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HeatMonitorLogger_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HeatMonitorLogger_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HeatMonitorLogger] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HeatMonitorLogger].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HeatMonitorLogger] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET ARITHABORT OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HeatMonitorLogger] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HeatMonitorLogger] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HeatMonitorLogger] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HeatMonitorLogger] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HeatMonitorLogger] SET  MULTI_USER 
GO
ALTER DATABASE [HeatMonitorLogger] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HeatMonitorLogger] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HeatMonitorLogger] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HeatMonitorLogger] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HeatMonitorLogger] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HeatMonitorLogger]
GO
/****** Object:  Table [dbo].[Generator]    Script Date: 7/24/2020 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generator](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GeneratorName] [nvarchar](150) NULL,
	[Latitude] [nvarchar](150) NULL,
	[longitude] [nvarchar](150) NULL,
 CONSTRAINT [PK_Generator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GeneratorLog]    Script Date: 7/24/2020 1:18:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneratorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Temprature] [int] NULL,
	[FK_GeneratorId] [bigint] NULL,
	[Logging_date] [datetime] NULL,
 CONSTRAINT [PK_GeneratorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Generator] ON 

GO
INSERT [dbo].[Generator] ([Id], [GeneratorName], [Latitude], [longitude]) VALUES (1, N'DabbaaGenerator2', N'23.56753', N'40.55678')
GO
SET IDENTITY_INSERT [dbo].[Generator] OFF
GO
SET IDENTITY_INSERT [dbo].[GeneratorLog] ON 

GO
INSERT [dbo].[GeneratorLog] ([Id], [Temprature], [FK_GeneratorId], [Logging_date]) VALUES (1, 25, 1, CAST(N'2020-07-22 19:44:29.297' AS DateTime))
GO
INSERT [dbo].[GeneratorLog] ([Id], [Temprature], [FK_GeneratorId], [Logging_date]) VALUES (2, 25, 1, CAST(N'2020-07-24 13:11:39.393' AS DateTime))
GO
INSERT [dbo].[GeneratorLog] ([Id], [Temprature], [FK_GeneratorId], [Logging_date]) VALUES (3, 33, 1, CAST(N'2020-07-24 13:11:53.363' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[GeneratorLog] OFF
GO
ALTER TABLE [dbo].[GeneratorLog]  WITH CHECK ADD  CONSTRAINT [FK_GeneratorLog_Generator] FOREIGN KEY([FK_GeneratorId])
REFERENCES [dbo].[Generator] ([Id])
GO
ALTER TABLE [dbo].[GeneratorLog] CHECK CONSTRAINT [FK_GeneratorLog_Generator]
GO
USE [master]
GO
ALTER DATABASE [HeatMonitorLogger] SET  READ_WRITE 
GO
