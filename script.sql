USE [master]
GO
/****** Object:  Database [PayFuture]    Script Date: 12 October, 2021 9:14:32 PM ******/
CREATE DATABASE [PayFuture]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PayFuture', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PayFuture.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PayFuture_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PayFuture_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PayFuture] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PayFuture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PayFuture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PayFuture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PayFuture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PayFuture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PayFuture] SET ARITHABORT OFF 
GO
ALTER DATABASE [PayFuture] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PayFuture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PayFuture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PayFuture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PayFuture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PayFuture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PayFuture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PayFuture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PayFuture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PayFuture] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PayFuture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PayFuture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PayFuture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PayFuture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PayFuture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PayFuture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PayFuture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PayFuture] SET RECOVERY FULL 
GO
ALTER DATABASE [PayFuture] SET  MULTI_USER 
GO
ALTER DATABASE [PayFuture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PayFuture] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PayFuture] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PayFuture] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PayFuture] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PayFuture] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PayFuture', N'ON'
GO
ALTER DATABASE [PayFuture] SET QUERY_STORE = OFF
GO
USE [PayFuture]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 12 October, 2021 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchants](
	[merchant_id] [int] IDENTITY(1,1) NOT NULL,
	[merchant_name] [char](100) NOT NULL,
	[integration_key] [char](256) NOT NULL,
	[merchant_logo_url] [char](250) NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[merchant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Merchants] ON 

INSERT [dbo].[Merchants] ([merchant_id], [merchant_name], [integration_key], [merchant_logo_url]) VALUES (1, N'Al Danah                                                                                            ', N'21231312ssdasjdasjd_asjdqwe3123k123                                                                                                                                                                                                                             ', N'https://aldanah.com/images/logo.png                                                                                                                                                                                                                       ')
INSERT [dbo].[Merchants] ([merchant_id], [merchant_name], [integration_key], [merchant_logo_url]) VALUES (2, N'G42                                                                                                 ', N'12QW12W3E4R5T6Y                                                                                                                                                                                                                                                 ', N'G42.PNG                                                                                                                                                                                                                                                   ')
INSERT [dbo].[Merchants] ([merchant_id], [merchant_name], [integration_key], [merchant_logo_url]) VALUES (3, N'PayBy                                                                                               ', N'qwertyu                                                                                                                                                                                                                                                         ', N'abc.png                                                                                                                                                                                                                                                   ')
SET IDENTITY_INSERT [dbo].[Merchants] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMerchant]    Script Date: 12 October, 2021 9:14:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetMerchant]
    @merchant_id int   
AS   

    SET NOCOUNT OFF;  
    SELECT merchant_id, merchant_name, integration_key, merchant_logo_url  
    FROM Merchants  
    WHERE merchant_id = @merchant_id;
GO
USE [master]
GO
ALTER DATABASE [PayFuture] SET  READ_WRITE 
GO
