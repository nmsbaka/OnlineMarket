USE [master]
GO
/****** Object:  Database [SmartMarket]    Script Date: 1/14/2018 12:42:26 PM ******/
CREATE DATABASE [SmartMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SmartMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SmartMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SmartMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SmartMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SmartMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SmartMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartMarket] SET  MULTI_USER 
GO
ALTER DATABASE [SmartMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartMarket] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SmartMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SmartMarket]
GO
/****** Object:  Table [dbo].[tb_address]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_address](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[province_id] [tinyint] NOT NULL,
	[first_name] [nvarchar](64) NOT NULL,
	[last_name] [nvarchar](64) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](11) NOT NULL,
	[city] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_tb_address] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_address_order]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_address_order](
	[id_address] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NOT NULL,
 CONSTRAINT [PK_tb_address_order] PRIMARY KEY CLUSTERED 
(
	[id_address] ASC,
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_attribute]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_attribute](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[attribute_group_id] [int] NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[description] [nvarchar](500) NULL,
	[priority] [int] NULL,
	[type] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tb_attribute] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_attribute_group]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_attribute_group](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[product_category_id] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
	[priority] [int] NULL,
 CONSTRAINT [PK_tb_attribute_group] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_brand]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_brand](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[slug] [varchar](64) NOT NULL,
	[image_path] [varchar](2048) NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tb_brand] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_cart]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cart](
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tb_cart] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_comment]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comment](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [tinyint] NOT NULL,
	[update_date] [datetime] NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_comment] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_comment_post]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comment_post](
	[comment_id] [int] NOT NULL,
	[post_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_comment_post_1] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_comment_product]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_comment_product](
	[comment_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_comment_product_1] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_configuration]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_configuration](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_configuration] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[publisher_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NULL,
	[status] [tinyint] NOT NULL,
	[percent_value] [tinyint] NULL,
	[value] [decimal](13, 0) NULL,
	[code] [varchar](32) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[date_from] [datetime] NOT NULL,
	[date_to] [datetime] NOT NULL,
	[max_price] [decimal](13, 0) NOT NULL,
	[min_price] [decimal](13, 0) NOT NULL,
 CONSTRAINT [PK_tb_event] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_brand]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_brand](
	[event_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_brand_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_category]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_category](
	[event_id] [int] NOT NULL,
	[product_category_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_category_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[product_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_order]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_order](
	[event_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_order_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_event_product]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_event_product](
	[event_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_event_product_1] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_image]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_image](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](2083) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[data_type] [varchar](128) NOT NULL,
	[description] [nvarchar](500) NULL,
	[upload_date] [datetime] NOT NULL,
	[uploader_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_image] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_menu]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menu](
	[_id] [int] NOT NULL,
	[parent_id] [int] NULL,
	[group_menu_id] [int] NOT NULL,
	[path] [varchar](2083) NOT NULL,
	[description] [nvarchar](500) NULL,
	[icon] [varchar](35) NULL,
	[name] [nvarchar](255) NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_tb_menu] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_menu_group]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menu_group](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tb_group_menu] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_notification]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_notification](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [tinyint] NOT NULL,
	[content] [nvarchar](500) NOT NULL,
	[create_date] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_notification] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_order]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_paid] [decimal](13, 0) NULL,
	[total_paid_real] [decimal](13, 0) NULL,
	[total_product] [int] NULL,
	[total_shipping] [int] NULL,
	[status] [tinyint] NULL,
	[invoice_date] [datetime] NULL,
	[create_date] [datetime] NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tb_order] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order_detail](
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_quantity] [int] NOT NULL,
	[product_price] [decimal](13, 0) NOT NULL,
	[product_weight] [float] NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tb_order_detail_1] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_persistent_logins]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_persistent_logins](
	[username] [varchar](128) NOT NULL,
	[series] [varchar](64) NOT NULL,
	[token] [varchar](64) NOT NULL,
	[last_used] [datetime] NOT NULL,
 CONSTRAINT [PK_persistent_logins] PRIMARY KEY CLUSTERED 
(
	[series] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_post]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_post](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[post_category_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[publisher_id] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[status] [tinyint] NOT NULL,
	[post_type] [varchar](255) NOT NULL,
	[feature_image] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_tb_post] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_post_category]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_post_category](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tb_post_category] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[publisher_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](13, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[state] [tinyint] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[feature_image] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_tb_product] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product_attribute]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_attribute](
	[attribute_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[value] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tb_product_attribute] PRIMARY KEY CLUSTERED 
(
	[attribute_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product_category]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_category](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[slug] [nvarchar](64) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_tb_product_category] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_product_views]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_views](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_tb_product_vierws] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_province]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_province](
	[_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[shipping_fee] [decimal](13, 0) NOT NULL,
 CONSTRAINT [PK_tb_province] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_rating]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rating](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rate_date] [datetime] NULL,
	[content] [nchar](10) NULL,
	[create_rate_date] [datetime] NOT NULL,
	[score] [tinyint] NOT NULL,
 CONSTRAINT [PK_tb_rating] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_role]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_role](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_role] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_statistic_product_views]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_statistic_product_views](
	[_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[week] [int] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tb_statistic_product_views] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_statistic_rating]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_statistic_rating](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[average_score] [float] NOT NULL,
	[total_score] [int] NOT NULL,
	[user_count] [int] NOT NULL,
 CONSTRAINT [PK_tb_statistic_rating] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_user]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [tinyint] NOT NULL,
	[first_name] [nvarchar](64) NOT NULL,
	[last_name] [nvarchar](64) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[password] [varchar](60) NOT NULL,
	[birthday] [datetime] NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NULL,
	[state] [varchar](10) NOT NULL,
	[avatar] [varchar](1024) NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_user_role]    Script Date: 1/14/2018 12:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_user_role](
	[user_id] [int] NOT NULL,
	[user_role_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_user_role] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[user_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tb_address] ON 

INSERT [dbo].[tb_address] ([_id], [user_id], [province_id], [first_name], [last_name], [address], [phone_number], [city]) VALUES (1, 1, 44, N'Nhật Sang', N'Nguyễn', N'81/13 Hoàng Diệu, P. Lộc Phát', N'01643456554', N'TP. Bảo Lộc')
SET IDENTITY_INSERT [dbo].[tb_address] OFF
SET IDENTITY_INSERT [dbo].[tb_attribute] ON 

INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (1, 3, N'Screen Techonogy', NULL, 0, N'text')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (2, 5, N'Screen Techonogy', NULL, 2, N'text')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (3, 5, N'Display resolution', NULL, 1, N'text')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (4, 5, N'Screen size', NULL, 0, N'text')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (5, 5, N'Touch Screen', NULL, 4, N'text')
SET IDENTITY_INSERT [dbo].[tb_attribute] OFF
SET IDENTITY_INSERT [dbo].[tb_attribute_group] ON 

INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (3, N'Screen', 2, NULL, 0)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (4, N'Hardrive', 2, NULL, 0)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (5, N'Screen', 4, NULL, 0)
SET IDENTITY_INSERT [dbo].[tb_attribute_group] OFF
SET IDENTITY_INSERT [dbo].[tb_brand] ON 

INSERT [dbo].[tb_brand] ([_id], [name], [slug], [image_path], [description], [create_date], [update_date]) VALUES (3, N'Apple', N'apple', N'assets/images/site/2018/01/1515826378633-1024px-Apple_logo_black.svg.png', N'asdasdasdasadasd asd asd asd asd aasdasdasdasadasd asd asd asd asd aasdasdasdasadasd asd asd asd asd aasdasdasdasadasd asd asd asd asd aasdasdasdasadasd asd asd asd asd a', CAST(N'2018-01-13T13:54:45.293' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tb_brand] OFF
SET IDENTITY_INSERT [dbo].[tb_configuration] ON 

INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (1, N'title', N'Smart Market')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (2, N'description', N'Smart Market nơi cửa hàng đồ điện tử uy tín nhất dành cho bạn')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (3, N'keyword', N'Smart Market, Shop Online, E-comerece')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (4, N'favicon', N'assets/images/favicon/favicon-32x32.png')
SET IDENTITY_INSERT [dbo].[tb_configuration] OFF
SET IDENTITY_INSERT [dbo].[tb_event] ON 

INSERT [dbo].[tb_event] ([_id], [publisher_id], [name], [content], [status], [percent_value], [value], [code], [create_date], [update_date], [date_from], [date_to], [max_price], [min_price]) VALUES (2, 1, N'Apple', N'44564564564sadasdasdasdasdasdasdasasdasdasdasdasdas', 0, 10, CAST(31123 AS Decimal(13, 0)), N'asdasdas', CAST(N'2018-01-11T19:34:35.107' AS DateTime), NULL, CAST(N'2018-01-11T00:00:00.000' AS DateTime), CAST(N'2018-01-11T00:00:00.000' AS DateTime), CAST(121312313 AS Decimal(13, 0)), CAST(131231 AS Decimal(13, 0)))
SET IDENTITY_INSERT [dbo].[tb_event] OFF
SET IDENTITY_INSERT [dbo].[tb_image] ON 

INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (70, N'assets/images/site/2018/01/1515850399574-1024px-Apple_logo_black.svg.png', N'1024px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-01-13T20:33:19.583' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (71, N'assets/images/site/2018/01/1515851397033-1024px-Apple_logo_black.svg.png', N'1024px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-01-13T20:49:57.040' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tb_image] OFF
INSERT [dbo].[tb_persistent_logins] ([username], [series], [token], [last_used]) VALUES (N'nhatsang38@gmail.com', N'06Wn1HxtWVpi+o4ipAkmbQ==', N'3vvnocb5P/hj2xrJQxj3Dw==', CAST(N'2018-01-14T03:52:24.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_product] ON 

INSERT [dbo].[tb_product] ([_id], [category_id], [publisher_id], [brand_id], [name], [slug], [description], [price], [quantity], [state], [create_date], [update_date], [feature_image]) VALUES (2, 2, 1, 3, N'Apple', N'apple', N'<h2 style="margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;">Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền của&nbsp;<a href="https://www.thegioididong.com/dtdd-samsung" target="_blank" title="Điện thoại Samsung" style="margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(80, 168, 227); outline-style: none; outline-width: initial; zoom: 1;">Samsung</a>.</h2><h3 style="margin: 30px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;"><strong style="margin: 0px; padding: 0px;">Thiết kế độc đáo</strong></h3><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Ấn tượng đầu tiên về thiết kế của chiếc&nbsp;Samsung Galaxy J7 Pro chính là mặt lưng của máy. Đường cắt ăng ten ở mặt sau được hoàn thiện dạng ăn vào thân sau máy sau đó đi lên gần như chữ U rất đặc biệt,&nbsp;lạ mắt.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro4.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Thiết kế mới lạ" data-original="https://cdn3.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro4.jpg" class="lazy" title="Thiết kế mới lạ" src="https://cdn3.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro4.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Thiết kế mới lạ</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Máy cho cảm giác cầm nắm khá đầm tay, chắc chắn với khung kim loại bo cong mềm mại ở các góc.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro6.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Cảm biến vân tay một chạm" data-original="https://cdn.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro6.jpg" class="lazy" title="Cảm biến vân tay một chạm" src="https://cdn.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro6.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Cảm biến vân tay một chạm</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Phía trước vẫn là màn hình 5.5 inch độ phân giải Full HD, trên tấm nền&nbsp;<a href="https://www.thegioididong.com/hoi-dap/man-hinh-super-amoled-la-gi-905770" target="_blank" title="Tìm hiểu màn hình Super AMOLED" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);">Super AMOLED</a>&nbsp;và được bảo vệ bởi kính cường lực bo cong 2.5D.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro7.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Màn hình lớn, sắc nét" data-original="https://cdn2.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro7.jpg" class="lazy" title="Màn hình lớn, sắc nét" src="https://cdn2.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro7.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Màn hình lớn, sắc nét</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"></p><div class="ratingbox owl-carousel owl-theme" style="margin: 0px; padding: 0px; position: relative; width: 750px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; opacity: 1;"><div class="owl-wrapper-outer autoHeight" style="margin: 0px; padding: 0px; overflow: hidden; position: relative; width: 750px; transition: height 500ms ease-in-out; height: 171px;"><div class="owl-wrapper" style="margin: 0px; padding: 0px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; width: 3000px; left: 0px;"><div class="owl-item" style="margin: 0px; padding: 0px; float: left; backface-visibility: hidden; transform: translate3d(0px, 0px, 0px); width: 750px;"><div class="item" style="margin: 0px auto; padding: 0px; max-width: 550px; text-align: center;"><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; font-style: italic; line-height: 34px;"><b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❝</b>Xài hơn 2 tuần máy khá mượt vân tay nhạy, thiết kế đẹp, hiệu năng tốt, chụp hình selfie rất đẹp và ảo diệu. Dùng ko hề bị giật lag gì cả, máy màu xanh rất đẹp và cuốn hút.<b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❞</b></p><label class="line" style="margin: 10px auto; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 18px; outline: none; zoom: 1; display: block; width: 60px; height: 3px; background: rgb(224, 105, 68);"></label><span class="info" style="margin: 0px 0px 0px 170.5px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-style: italic; display: block; text-align: left;"><b style="margin: 0px; padding: 0px;">Ngô Hồng Hải</b>&nbsp;- Gia Lai<label class="sttB" style="margin: 0px; padding: 0px; font-style: normal; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(74, 187, 77); outline: none; zoom: 1; display: block;"><i class="iconcom-checkbuy" style="margin-top: -4px; margin-right: 4px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; background-image: url(&quot;//s.tgdd.vn/comment/Content/images/commentmobile@2x.png&quot;); background-size: 270px 128px; background-repeat: no-repeat; display: inline-block; height: 13px; width: 13px; line-height: 30px; vertical-align: middle; background-position: -220px -82px;"></i>Đã mua tại Thế giới di động</label></span></div></div><div class="owl-item" style="margin: 0px; padding: 0px; float: left; backface-visibility: hidden; transform: translate3d(0px, 0px, 0px); width: 750px;"><div class="item" style="margin: 0px auto; padding: 0px; max-width: 550px; text-align: center;"><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; font-style: italic; line-height: 34px;"><b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❝</b>Máy xài rất ổn, Camera đẹp, Pin gì đâu sài cả ngày mà ko hết 50% nữa. Android 7.0 chạy rất mượt . Ai còn phân vân thì nên mua đi .<b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❞</b></p><label class="line" style="margin: 10px auto; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 18px; outline: none; zoom: 1; display: block; width: 60px; height: 3px; background: rgb(224, 105, 68);"></label><span class="info" style="margin: 0px 0px 0px 170.5px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-style: italic; display: block; text-align: left;"><b style="margin: 0px; padding: 0px;">Kha Kha</b>&nbsp;- Q. Bình Tân, Tp HCM<label class="sttB" style="margin: 0px; padding: 0px; font-style: normal; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(74, 187, 77); outline: none; zoom: 1; display: block;"><i class="iconcom-checkbuy" style="margin-top: -4px; margin-right: 4px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; background-image: url(&quot;//s.tgdd.vn/comment/Content/images/commentmobile@2x.png&quot;); background-size: 270px 128px; background-repeat: no-repeat; display: inline-block; height: 13px; width: 13px; line-height: 30px; vertical-align: middle; background-position: -220px -82px;"></i>Đã mua tại Thế giới di động</label></span></div></div></div></div><div class="owl-controls clickable" style="margin: 0px; padding: 0px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-align: center;"><div class="owl-pagination" style="margin: 0px; padding: 0px;"><div class="owl-page active" style="margin: 0px; padding: 0px; cursor: pointer; display: inline-block; zoom: 1;"><span class="" style="margin: 0px 5px; padding: 0px; width: 4px; height: 4px; display: block; border-radius: 20px; background: rgb(239, 138, 50);"></span></div><div class="owl-page" style="margin: 0px; padding: 0px; cursor: pointer; display: inline-block; zoom: 1;"><span class="" style="margin: 0px 5px; padding: 0px; width: 4px; height: 4px; display: block; border-radius: 20px; background: rgb(216, 216, 216);"></span></div></div></div></div><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"></p><h3 style="margin: 30px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;"><strong style="margin: 0px; padding: 0px;">Camera được nâng cấp mạnh mẽ</strong></h3><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Dù chỉ là một thiết bị tầm trung nhưng J7 Pro vẫn được Samsung đầu tư cho một camera có độ phân giải 13 MP, khẩu độ lên tới F/1.7 cùng đèn flash trợ sáng.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro3.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Giao diện camera mới" data-original="https://cdn4.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro3.jpg" class="lazy" title="Giao diện camera mới" src="https://cdn4.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro3.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Giao diện camera mới</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Chất lượng ảnh cho ra từ máy là rất ấn tượng, ảnh có chi tiết và màu sắc hài hòa, ngay cả trong điều kiện ánh sáng yếu.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro1.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Ảnh chụp có màu sắc hài hòa" data-original="https://cdn1.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro1.jpg" class="lazy" title="Ảnh chụp có màu sắc hài hòa" src="https://cdn1.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro1.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Ảnh chụp có màu sắc hài hòa</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Camera trước cũng sở hữu độ phân giải khủng 13 MP, khẩu độ F/1.9, có hỗ trợ selfie bằng cử chỉ và khả năng selfie góc rộng giúp bạn có thể thoải mái tự sướng với bạn bè.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro10.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Camera selfie ảo diệu" data-original="https://cdn3.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro10.jpg" class="lazy" title="Camera selfie ảo diệu" src="https://cdn3.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro10.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Camera selfie ảo diệu</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"></p><div class="ratingbox owl-carousel owl-theme" style="margin: 0px; padding: 0px; position: relative; width: 750px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; opacity: 1;"><div class="owl-wrapper-outer autoHeight" style="margin: 0px; padding: 0px; overflow: hidden; position: relative; width: 750px; transition: height 500ms ease-in-out; height: 137px;"><div class="owl-wrapper" style="margin: 0px; padding: 0px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; width: 1500px; left: 0px;"><div class="owl-item" style="margin: 0px; padding: 0px; float: left; backface-visibility: hidden; transform: translate3d(0px, 0px, 0px); width: 750px;"><div class="item" style="margin: 0px auto; padding: 0px; max-width: 550px; text-align: center;"><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; font-style: italic; line-height: 34px;"><b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❝</b>Mua máy được hơn 1 tuần rồi, nói chung là Tuyệt! Máy chụp hình siêu đẹp luôn, rõ và xóa phông chuẩn! Chưa thấy lỗi gì từ máy.<b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❞</b></p><label class="line" style="margin: 10px auto; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 18px; outline: none; zoom: 1; display: block; width: 60px; height: 3px; background: rgb(224, 105, 68);"></label><span class="info" style="margin: 0px 0px 0px 170.5px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-style: italic; display: block; text-align: left;"><b style="margin: 0px; padding: 0px;">Kim</b>&nbsp;- Quận 1, Tp HCM<label class="sttB" style="margin: 0px; padding: 0px; font-style: normal; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(74, 187, 77); outline: none; zoom: 1; display: block;"><i class="iconcom-checkbuy" style="margin-top: -4px; margin-right: 4px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; background-image: url(&quot;//s.tgdd.vn/comment/Content/images/commentmobile@2x.png&quot;); background-size: 270px 128px; background-repeat: no-repeat; display: inline-block; height: 13px; width: 13px; line-height: 30px; vertical-align: middle; background-position: -220px -82px;"></i>Đã mua tại Thế giới di động</label></span></div></div></div></div></div><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"></p><h3 style="margin: 30px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;"><strong style="margin: 0px; padding: 0px;">Hiệu năng ổn định</strong></h3><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Cung cấp sức mạnh cho máy là con chip&nbsp;<a href="https://www.thegioididong.com/hoi-dap/samsung-exynos-7870-843409" target="_blank" title="Tìm hiểu chip Exynos 7870 8 nhân 64-bit" style="margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: arial, sans-serif;">Exynos 7870 8 nhân 64-bit</a>, 3 GB RAM cùng 32 GB bộ nhớ trong, đáp ứng tốt cho bạn trong những nhu cầu lướt web, xem phim hay chơi các tựa game trung bình.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"></p><div class="video" frameborder="0" height="395" scrolling="no" src="https://www.youtube.com/embed/tlI-uVWdG9M" width="640" style="margin: 0px auto; padding: 0px; max-width: 640px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"><iframe src="https://www.youtube.com/embed/tlI-uVWdG9M?rel=0" frameborder="0" allowfullscreen="" style="margin: 0px; padding: 0px; width: 640px; min-height: 350px;"></iframe></div><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Chơi game mượt mà trên J7 Pro</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Máy cũng hỗ trợ khe cắm thẻ nhớ mở rộng với dung lượng tối đa lên tới 256 GB cùng kết nối&nbsp;<a href="https://www.thegioididong.com/hoi-dap/4g-la-gi-731757#cat6" target="_blank" title="Tìm hiểu 4G LTE Cat 6" style="margin: 0px; padding: 0px; color: rgb(40, 138, 214); font-family: arial, sans-serif;">4G LTE Cat 6</a>&nbsp;tốc độ cao giúp bạn truy cập internet nhanh chóng, mọi lúc mọi nơi.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro11.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Dung lượng lưu trữ thoải mái" data-original="https://cdn.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro11.jpg" class="lazy" title="Dung lượng lưu trữ thoải mái" src="https://cdn.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro11.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Dung lượng lưu trữ thoải mái</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Về phần mềm, máy được chạy trên nền Android 7.0, tùy biến giao diện Samsung Experience 8.1 tương tự như&nbsp;<a href="https://www.thegioididong.com/dtdd/samsung-galaxy-s8" target="_blank" title="Điện thoại Galaxy S8" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);">Galaxy S8</a>&nbsp;và S8 Plus.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"></p><div class="ratingbox owl-carousel owl-theme" style="margin: 0px; padding: 0px; position: relative; width: 750px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; opacity: 1;"><div class="owl-wrapper-outer autoHeight" style="margin: 0px; padding: 0px; overflow: hidden; position: relative; width: 750px; transition: height 500ms ease-in-out; height: 205px;"><div class="owl-wrapper" style="margin: 0px; padding: 0px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; width: 1500px; left: 0px;"><div class="owl-item" style="margin: 0px; padding: 0px; float: left; backface-visibility: hidden; transform: translate3d(0px, 0px, 0px); width: 750px;"><div class="item" style="margin: 0px auto; padding: 0px; max-width: 550px; text-align: center;"><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; font-style: italic; line-height: 34px;"><b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❝</b>Mình có một vài nhận xét như sau: pin cực trâu sử dụng bình thường sáng tới chiều tối còn khoảng 40%. Camera chụp lấy nét nhanh. Chất lượng ảnh tốt. Nhận vân tay nhanh. Hiệu năng khá, chơi liên quân mượt. Ít khi giật lag.&nbsp;<b style="margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;">❞</b></p><label class="line" style="margin: 10px auto; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 18px; outline: none; zoom: 1; display: block; width: 60px; height: 3px; background: rgb(224, 105, 68);"></label><span class="info" style="margin: 0px 0px 0px 170.5px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-style: italic; display: block; text-align: left;"><b style="margin: 0px; padding: 0px;">Nguyễn Thông Thái</b>&nbsp;- T. Vĩnh Long<label class="sttB" style="margin: 0px; padding: 0px; font-style: normal; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(74, 187, 77); outline: none; zoom: 1; display: block;"><i class="iconcom-checkbuy" style="margin-top: -4px; margin-right: 4px; margin-bottom: 0px; margin-left: 0px !important; padding: 0px; background-image: url(&quot;//s.tgdd.vn/comment/Content/images/commentmobile@2x.png&quot;); background-size: 270px 128px; background-repeat: no-repeat; display: inline-block; height: 13px; width: 13px; line-height: 30px; vertical-align: middle; background-position: -220px -82px;"></i>Đã mua tại Thế giới di động</label></span></div></div></div></div>&nbsp;</div><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"></p><h3 style="margin: 30px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: bold; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;"><strong style="margin: 0px; padding: 0px;">Tính năng độc quyền</strong></h3><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">J7 Pro được trang bị&nbsp;nhiều tính năng độc quyền của Samsung như Always On Display hay thư mục bảo mật giúp bạn sử dụng điện thoại của mình hiệu quả hơn.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/42/103404/samsung-galaxy-j7-pro9.jpg" style="margin: 0px; padding: 0px; color: rgb(80, 168, 227);"><img alt="Alway On Display" data-original="https://cdn2.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro9.jpg" class="lazy" title="Alway On Display" src="https://cdn2.tgdd.vn/Products/Images/42/103404/samsung-galaxy-j7-pro9.jpg" style="margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 640px; height: auto; max-height: 533px;"></a></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;"><i style="margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);">Always On Display</i></p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;">Viên pin của máy có dung lượng&nbsp;3.600 mAh giúp bạn có thể thoải mái sử dụng trong hơn một ngày làm việc và giải trí.</p><p style="margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: right;"><strong style="margin: 0px; padding: 0px;">Hoàng Quốc Tuân</strong></p>', CAST(10000 AS Decimal(13, 0)), 100, 0, CAST(N'2018-01-13T20:53:07.713' AS DateTime), NULL, N'assets/images/site/2018/01/1515851397033-1024px-Apple_logo_black.svg.png')
SET IDENTITY_INSERT [dbo].[tb_product] OFF
INSERT [dbo].[tb_product_attribute] ([attribute_id], [product_id], [value]) VALUES (1, 2, N'Super AMOLED')
SET IDENTITY_INSERT [dbo].[tb_product_category] ON 

INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (2, N'Laptop', N'laptop', N'A laptop or notebook computer is a small, portable PC. It is usually lightweight, depending on the manufacturer and model for other uses', CAST(N'2018-01-12T09:26:38.573' AS DateTime), CAST(N'2018-01-12T09:26:44.210' AS DateTime))
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (3, N'Desktop', N'desktop', N'Personal computer (PC) is a small computer with its price, size and compatibility making it useful for the individual.', CAST(N'2018-01-12T09:27:25.693' AS DateTime), CAST(N'2018-01-12T09:27:32.597' AS DateTime))
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (4, N'Smart Phone', N'smart-phone', N'Smartphone is a concept that refers to a mobile phone that integrates a mobile operating system platform with many advanced connectivity features and connectivity based on the basic mobile platform.', CAST(N'2018-01-11T06:05:11.040' AS DateTime), NULL)
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (5, N'Smart TV', N'smart-tv', N'A smart TV, sometimes referred to as connected TV, hybrid TV, or intelly (portmanteau of the words intelligent and telly), is a television set with integrated Internet and interactive "Web 2.0" features. Smart TV is a technological convergence between computers and flatscreen television sets and set-top boxes. Besides the traditional functions of television sets and set-top boxes provided through traditional broadcasting media, these devices can also provide Internet TV, online interactive media, over-the-top content (OTT), as well as on-demand streaming media, and home networking access.', CAST(N'2018-01-11T06:07:29.237' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tb_product_category] OFF
SET IDENTITY_INSERT [dbo].[tb_province] ON 

INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (1, N'Thành phố Hà Nội', CAST(100 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (2, N'Hà Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (3, N'Cao Bằng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (4, N'Bắc Kạn', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (5, N'Tuyên Quang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (6, N'Lào Cai', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (7, N'Điện Biên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (8, N'Lai Châu', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (9, N'Sơn La', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (10, N'Yên Bái', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (11, N'Hoà Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (12, N'Thái Nguyên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (13, N'Lạng Sơn', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (14, N'Quảng Ninh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (15, N'Bắc Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (16, N'Phú Thọ', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (17, N'Vĩnh Phúc', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (18, N'Bắc Ninh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (19, N'Hải Dương', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (20, N'Thành phố Hải Phòng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (21, N'Hưng Yên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (22, N'Thái Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (23, N'Hà Nam', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (24, N'Nam Định', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (25, N'Ninh Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (26, N'Thanh Hóa', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (27, N'Nghệ An', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (28, N'Hà Tĩnh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (29, N'Quảng Bình', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (30, N'Quảng Trị', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (31, N'Thừa Thiên Huế', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (32, N'Thành phố Đà Nẵng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (33, N'Quảng Nam', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (34, N'Quảng Ngãi', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (35, N'Bình Định', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (36, N'Phú Yên', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (37, N'Khánh Hòa', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (38, N'Ninh Thuận', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (39, N'Bình Thuận', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (40, N'Kon Tum', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (41, N'Gia Lai', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (42, N'Đắk Lắk', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (43, N'Đắk Nông', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (44, N'Lâm Đồng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (45, N'Bình Phước', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (46, N'Tây Ninh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (47, N'Bình Dương', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (48, N'Đồng Nai', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (49, N'Bà Rịa - Vũng Tàu', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (50, N'Thành phố Hồ Chí Minh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (51, N'Long An', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (52, N'Tiền Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (53, N'Bến Tre', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (54, N'Trà Vinh', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (55, N'Vĩnh Long', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (56, N'Đồng Tháp', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (57, N'An Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (58, N'Kiên Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (59, N'Thành phố Cần Thơ', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (60, N'Hậu Giang', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (61, N'Sóc Trăng', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (62, N'Bạc Liêu', CAST(0 AS Decimal(13, 0)))
INSERT [dbo].[tb_province] ([_id], [name], [shipping_fee]) VALUES (63, N'Cà Mau', CAST(0 AS Decimal(13, 0)))
SET IDENTITY_INSERT [dbo].[tb_province] OFF
SET IDENTITY_INSERT [dbo].[tb_role] ON 

INSERT [dbo].[tb_role] ([_id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[tb_role] ([_id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[tb_role] OFF
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar]) VALUES (1, 1, N'Nhật Sang', N'Nguyễn', N'nhatsang38@gmail.com', N'$2a$10$T8F4GgXjLFgoLXg7.syHe.lpH156BseQhFAC8z0Df5pd.YEanA27G', CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2017-12-26T15:50:52.560' AS DateTime), NULL, N'Active', N'/assets/images/avatar.jpg')
INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar]) VALUES (2, 1, N'Nhật Tiến', N'Nguyễn', N'nhatsang39@gmail.com', N'$2a$10$NCQqCEv1TBADCdBKm/ysfOYBQqbPwW9YMHzKyDMZti4eqJ0lovKHG', CAST(N'2018-01-03T00:00:00.000' AS DateTime), CAST(N'2018-01-03T04:41:24.477' AS DateTime), NULL, N'Active', NULL)
SET IDENTITY_INSERT [dbo].[tb_user] OFF
INSERT [dbo].[tb_user_role] ([user_id], [user_role_id]) VALUES (1, 1)
INSERT [dbo].[tb_user_role] ([user_id], [user_role_id]) VALUES (2, 2)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_brand_slug_unique]    Script Date: 1/14/2018 12:42:27 PM ******/
ALTER TABLE [dbo].[tb_brand] ADD  CONSTRAINT [IX_tb_brand_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_user_email]    Script Date: 1/14/2018 12:42:27 PM ******/
ALTER TABLE [dbo].[tb_user] ADD  CONSTRAINT [IX_tb_user_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_attribute] ADD  CONSTRAINT [DF_tb_attribute_priority]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tb_attribute_group] ADD  CONSTRAINT [DF_tb_attribute_group_priority]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tb_address]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_tb_province] FOREIGN KEY([province_id])
REFERENCES [dbo].[tb_province] ([_id])
GO
ALTER TABLE [dbo].[tb_address] CHECK CONSTRAINT [FK_tb_address_tb_province]
GO
ALTER TABLE [dbo].[tb_address]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_address] CHECK CONSTRAINT [FK_tb_address_tb_user]
GO
ALTER TABLE [dbo].[tb_address_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_order_tb_address] FOREIGN KEY([id_address])
REFERENCES [dbo].[tb_address] ([_id])
GO
ALTER TABLE [dbo].[tb_address_order] CHECK CONSTRAINT [FK_tb_address_order_tb_address]
GO
ALTER TABLE [dbo].[tb_address_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_address_order_tb_order] FOREIGN KEY([id_order])
REFERENCES [dbo].[tb_order] ([_id])
GO
ALTER TABLE [dbo].[tb_address_order] CHECK CONSTRAINT [FK_tb_address_order_tb_order]
GO
ALTER TABLE [dbo].[tb_attribute]  WITH CHECK ADD  CONSTRAINT [FK_tb_attribute_tb_attribute_group] FOREIGN KEY([attribute_group_id])
REFERENCES [dbo].[tb_attribute_group] ([_id])
GO
ALTER TABLE [dbo].[tb_attribute] CHECK CONSTRAINT [FK_tb_attribute_tb_attribute_group]
GO
ALTER TABLE [dbo].[tb_attribute_group]  WITH CHECK ADD  CONSTRAINT [FK_tb_attribute_group_tb_product_category] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[tb_product_category] ([_id])
GO
ALTER TABLE [dbo].[tb_attribute_group] CHECK CONSTRAINT [FK_tb_attribute_group_tb_product_category]
GO
ALTER TABLE [dbo].[tb_cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_cart] CHECK CONSTRAINT [FK_tb_cart_tb_product]
GO
ALTER TABLE [dbo].[tb_cart]  WITH CHECK ADD  CONSTRAINT [FK_tb_cart_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_cart] CHECK CONSTRAINT [FK_tb_cart_tb_user]
GO
ALTER TABLE [dbo].[tb_comment]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_tb_comment] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tb_comment] ([_id])
GO
ALTER TABLE [dbo].[tb_comment] CHECK CONSTRAINT [FK_tb_comment_tb_comment]
GO
ALTER TABLE [dbo].[tb_comment]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_comment] CHECK CONSTRAINT [FK_tb_comment_tb_user]
GO
ALTER TABLE [dbo].[tb_comment_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_post_tb_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[tb_comment] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_post] CHECK CONSTRAINT [FK_tb_comment_post_tb_comment]
GO
ALTER TABLE [dbo].[tb_comment_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_post_tb_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[tb_post] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_post] CHECK CONSTRAINT [FK_tb_comment_post_tb_post]
GO
ALTER TABLE [dbo].[tb_comment_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_product_tb_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[tb_comment] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_product] CHECK CONSTRAINT [FK_tb_comment_product_tb_comment]
GO
ALTER TABLE [dbo].[tb_comment_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_comment_product_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_comment_product] CHECK CONSTRAINT [FK_tb_comment_product_tb_product]
GO
ALTER TABLE [dbo].[tb_event_brand]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_brand_tb_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[tb_brand] ([_id])
GO
ALTER TABLE [dbo].[tb_event_brand] CHECK CONSTRAINT [FK_tb_event_brand_tb_brand]
GO
ALTER TABLE [dbo].[tb_event_brand]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_brand_tb_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_brand] CHECK CONSTRAINT [FK_tb_event_brand_tb_event]
GO
ALTER TABLE [dbo].[tb_event_category]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_category_tb_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_category] CHECK CONSTRAINT [FK_tb_event_category_tb_event]
GO
ALTER TABLE [dbo].[tb_event_category]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_category_tb_product_category] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[tb_product_category] ([_id])
GO
ALTER TABLE [dbo].[tb_event_category] CHECK CONSTRAINT [FK_tb_event_category_tb_product_category]
GO
ALTER TABLE [dbo].[tb_event_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_order_tb_event_order] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_order] CHECK CONSTRAINT [FK_tb_event_order_tb_event_order]
GO
ALTER TABLE [dbo].[tb_event_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_order_tb_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tb_order] ([_id])
GO
ALTER TABLE [dbo].[tb_event_order] CHECK CONSTRAINT [FK_tb_event_order_tb_order]
GO
ALTER TABLE [dbo].[tb_event_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_product_tb_event] FOREIGN KEY([event_id])
REFERENCES [dbo].[tb_event] ([_id])
GO
ALTER TABLE [dbo].[tb_event_product] CHECK CONSTRAINT [FK_tb_event_product_tb_event]
GO
ALTER TABLE [dbo].[tb_event_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_event_product_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_event_product] CHECK CONSTRAINT [FK_tb_event_product_tb_product]
GO
ALTER TABLE [dbo].[tb_image]  WITH CHECK ADD  CONSTRAINT [FK_tb_image_tb_user] FOREIGN KEY([uploader_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_image] CHECK CONSTRAINT [FK_tb_image_tb_user]
GO
ALTER TABLE [dbo].[tb_menu]  WITH CHECK ADD  CONSTRAINT [FK_tb_menu_tb_menu] FOREIGN KEY([parent_id])
REFERENCES [dbo].[tb_menu] ([_id])
GO
ALTER TABLE [dbo].[tb_menu] CHECK CONSTRAINT [FK_tb_menu_tb_menu]
GO
ALTER TABLE [dbo].[tb_menu]  WITH CHECK ADD  CONSTRAINT [FK_tb_menu_tb_menu_group] FOREIGN KEY([group_menu_id])
REFERENCES [dbo].[tb_menu_group] ([_id])
GO
ALTER TABLE [dbo].[tb_menu] CHECK CONSTRAINT [FK_tb_menu_tb_menu_group]
GO
ALTER TABLE [dbo].[tb_notification]  WITH CHECK ADD  CONSTRAINT [FK_tb_notification_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_notification] CHECK CONSTRAINT [FK_tb_notification_tb_user]
GO
ALTER TABLE [dbo].[tb_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_order] CHECK CONSTRAINT [FK_tb_order_tb_user]
GO
ALTER TABLE [dbo].[tb_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_detail_tb_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tb_order] ([_id])
GO
ALTER TABLE [dbo].[tb_order_detail] CHECK CONSTRAINT [FK_tb_order_detail_tb_order]
GO
ALTER TABLE [dbo].[tb_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_post_tb_post_category] FOREIGN KEY([post_category_id])
REFERENCES [dbo].[tb_post_category] ([_id])
GO
ALTER TABLE [dbo].[tb_post] CHECK CONSTRAINT [FK_tb_post_tb_post_category]
GO
ALTER TABLE [dbo].[tb_post]  WITH CHECK ADD  CONSTRAINT [FK_tb_post_tb_user] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_post] CHECK CONSTRAINT [FK_tb_post_tb_user]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[tb_brand] ([_id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_brand]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[tb_product_category] ([_id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_product_category]
GO
ALTER TABLE [dbo].[tb_product]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_tb_user] FOREIGN KEY([publisher_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_product] CHECK CONSTRAINT [FK_tb_product_tb_user]
GO
ALTER TABLE [dbo].[tb_product_attribute]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_attribute_tb_attribute] FOREIGN KEY([attribute_id])
REFERENCES [dbo].[tb_attribute] ([_id])
GO
ALTER TABLE [dbo].[tb_product_attribute] CHECK CONSTRAINT [FK_tb_product_attribute_tb_attribute]
GO
ALTER TABLE [dbo].[tb_product_attribute]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_attribute_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_product_attribute] CHECK CONSTRAINT [FK_tb_product_attribute_tb_product]
GO
ALTER TABLE [dbo].[tb_product_views]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_vierws_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_product_views] CHECK CONSTRAINT [FK_tb_product_vierws_tb_product]
GO
ALTER TABLE [dbo].[tb_rating]  WITH CHECK ADD  CONSTRAINT [FK_tb_rating_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_rating] CHECK CONSTRAINT [FK_tb_rating_tb_product]
GO
ALTER TABLE [dbo].[tb_rating]  WITH CHECK ADD  CONSTRAINT [FK_tb_rating_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_rating] CHECK CONSTRAINT [FK_tb_rating_tb_user]
GO
ALTER TABLE [dbo].[tb_statistic_product_views]  WITH CHECK ADD  CONSTRAINT [FK_tb_statistic_product_views_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_statistic_product_views] CHECK CONSTRAINT [FK_tb_statistic_product_views_tb_product]
GO
ALTER TABLE [dbo].[tb_statistic_rating]  WITH CHECK ADD  CONSTRAINT [FK_tb_statistic_rating_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_statistic_rating] CHECK CONSTRAINT [FK_tb_statistic_rating_tb_product]
GO
ALTER TABLE [dbo].[tb_user_role]  WITH CHECK ADD  CONSTRAINT [FK_tb_user_role_tb_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tb_user] ([_id])
GO
ALTER TABLE [dbo].[tb_user_role] CHECK CONSTRAINT [FK_tb_user_role_tb_user]
GO
ALTER TABLE [dbo].[tb_user_role]  WITH CHECK ADD  CONSTRAINT [FK_tb_user_role_tb_user_role] FOREIGN KEY([user_role_id])
REFERENCES [dbo].[tb_role] ([_id])
GO
ALTER TABLE [dbo].[tb_user_role] CHECK CONSTRAINT [FK_tb_user_role_tb_user_role]
GO
USE [master]
GO
ALTER DATABASE [SmartMarket] SET  READ_WRITE 
GO
