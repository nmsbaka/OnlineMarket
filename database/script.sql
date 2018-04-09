USE [master]
GO
/****** Object:  Database [SmartMarket]    Script Date: 4/9/2018 4:58:34 PM ******/
CREATE DATABASE [SmartMarket]
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
EXEC sys.sp_db_vardecimal_storage_format N'SmartMarket', N'ON'
GO
USE [SmartMarket]
GO
/****** Object:  Table [dbo].[tb_address]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_attribute]    Script Date: 4/9/2018 4:58:34 PM ******/
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
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_attribute] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_attribute_group]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_attribute_values]    Script Date: 4/9/2018 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_attribute_values](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](500) NOT NULL,
	[link] [nvarchar](2083) NULL,
	[attribute_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_attribute_values] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_brand]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_cart]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_comment]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_comment_post]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_comment_product]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_configuration]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_event]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_event_brand]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_event_category]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_event_order]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_event_product]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_image]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_menu]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_menu_group]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_notification]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_order]    Script Date: 4/9/2018 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_order](
	[_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[tb_order_detail]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_persistent_logins]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_post]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_post_category]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_product]    Script Date: 4/9/2018 4:58:34 PM ******/
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
	[weight] [int] NOT NULL,
	[release_date] [datetime] NOT NULL,
	[size] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_tb_product] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_product_attribute_values]    Script Date: 4/9/2018 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_product_attribute_values](
	[attribute_values_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_tb_product_attribute] PRIMARY KEY CLUSTERED 
(
	[attribute_values_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_product_category]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_product_views]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_province]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_rating]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_role]    Script Date: 4/9/2018 4:58:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_role](
	[_id] [tinyint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_role] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_statistic_product_views]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_statistic_rating]    Script Date: 4/9/2018 4:58:34 PM ******/
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
/****** Object:  Table [dbo].[tb_user]    Script Date: 4/9/2018 4:58:34 PM ******/
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
	[role_id] [tinyint] NOT NULL,
 CONSTRAINT [PK_tb_user] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_address] ON 

INSERT [dbo].[tb_address] ([_id], [user_id], [province_id], [first_name], [last_name], [address], [phone_number], [city]) VALUES (1, 1, 44, N'Nhật Sang', N'Nguyễn', N'81/13 Hoàng Diệu, P. Lộc Phát', N'01643456555', N'Bảo Lộc')
INSERT [dbo].[tb_address] ([_id], [user_id], [province_id], [first_name], [last_name], [address], [phone_number], [city]) VALUES (2, 1, 50, N'KHanh', N'Tưởng', N'73/2 Trường Chinh, P.13', N'0122384824', N'Tân Bình')
SET IDENTITY_INSERT [dbo].[tb_address] OFF
SET IDENTITY_INSERT [dbo].[tb_attribute] ON 

INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (7, 3, N'XXX xxx', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (8, 6, N'Screen technology', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (9, 6, N'Resolution', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (10, 6, N'Widescreen', NULL, 2, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (11, 6, N'Touch glass', NULL, 3, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (12, 7, N'Resolution', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (13, 7, N'Film', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (14, 7, N'Flash light', NULL, 2, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (15, 7, N'Advanced photography', NULL, 3, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (16, 8, N'Videocall', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (17, 8, N'Resolution', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (18, 8, N'Other information', NULL, 2, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (19, 9, N'Operating system', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (20, 9, N'Chipset (CPU manufacturer)', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (21, 9, N'CPU speed', NULL, 2, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (22, 9, N'Graphics Chip (GPU)', NULL, 3, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (23, 10, N'RAM', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (24, 10, N'Internal memory', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (25, 10, N'Remaining memory (available)', NULL, 2, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (26, 10, N'External memory card', NULL, 3, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (27, 11, N'Mobile network', NULL, 0, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (28, 11, N'SIM', NULL, 1, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (29, 11, N'Wifi', NULL, 2, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (30, 11, N'GPS', NULL, 3, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (31, 11, N'Bluetooth', NULL, 4, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (32, 11, N'Connector / Charger', NULL, 5, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (33, 11, N'Jack headset', NULL, 6, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (34, 11, N'Other connections', NULL, 7, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (35, 12, N'Design', NULL, 0, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (36, 12, N'Material', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (40, 13, N'Battery capacity', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (41, 13, N'Battery type', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (42, 13, N'Battery technology', NULL, 2, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (43, 14, N'Advanced security', NULL, 0, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (44, 14, N'Special Features', NULL, 1, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (45, 14, N'Recording', NULL, 2, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (46, 14, N'Radio', NULL, 3, N'select')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (47, 14, N'Watch movie', NULL, 5, N'checkbox')
INSERT [dbo].[tb_attribute] ([_id], [attribute_group_id], [name], [description], [priority], [type]) VALUES (48, 14, N'Listen to music', NULL, 4, N'checkbox')
SET IDENTITY_INSERT [dbo].[tb_attribute] OFF
SET IDENTITY_INSERT [dbo].[tb_attribute_group] ON 

INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (3, N'Screen', 2, NULL, 0)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (4, N'Hardrive', 2, NULL, 10)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (6, N'Screen', 4, NULL, 0)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (7, N'Camera after', 4, NULL, 1)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (8, N'Camera before', 4, NULL, 2)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (9, N'Operating system - CPU', 4, NULL, 3)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (10, N'Memory and storage', 4, NULL, 4)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (11, N'Connect', 4, NULL, 5)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (12, N'Design', 4, NULL, 6)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (13, N'Battery & Charger Information', 4, NULL, 7)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (14, N'Utilities', 4, NULL, 8)
INSERT [dbo].[tb_attribute_group] ([_id], [name], [product_category_id], [description], [priority]) VALUES (15, N'Other information', 4, NULL, 9)
SET IDENTITY_INSERT [dbo].[tb_attribute_group] OFF
SET IDENTITY_INSERT [dbo].[tb_attribute_values] ON 

INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (1, N'132131', NULL, 7)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (3, N'Full HD (1080 x 1920 pixels)', NULL, 9)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (4, N'5.5"', NULL, 10)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (5, N'Tempered Glass Gorilla Glass 4', NULL, 11)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (6, N'Auto Focus', NULL, 15)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (7, N'Touch focus', NULL, 15)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (8, N'Face Recognition', NULL, 15)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (9, N'Panorama', NULL, 15)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (10, N'HDR', NULL, 15)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (11, N'Professional Capture mode', NULL, 15)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (12, N'Wide Angle Camera', NULL, 18)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (13, N'Beauty Mode', NULL, 18)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (14, N'Face Detection', NULL, 18)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (15, N'Selfie by Gesture', NULL, 18)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (16, N'Android 7.0 (Nougat)', NULL, 19)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (17, N'Exynos 7870 8-core 64-bit', NULL, 20)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (18, N'1.6 GHz', NULL, 21)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (19, N'Mali-T830', NULL, 22)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (20, N'3 GB', NULL, 23)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (21, N'32 GB', NULL, 24)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (22, N'24.4 GB', NULL, 25)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (23, N'MicroSD', NULL, 26)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (24, N'Supports up to 256 GB', NULL, 26)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (25, N'3G', NULL, 27)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (26, N'4G LTE Cat 6', NULL, 27)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (27, N'2 Nano SIM', NULL, 28)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (28, N'Wi-Fi 802.11 b/g/n', NULL, 29)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (29, N'Wi-Fi hotspot', NULL, 29)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (30, N'A-GPS', NULL, 30)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (31, N'GLONASS', NULL, 30)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (32, N'Yes', NULL, 31)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (33, N'No', NULL, 31)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (34, N'Micro USB', NULL, 32)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (35, N'3.5 mm', NULL, 33)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (36, N'OTG', NULL, 34)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (37, N'Monolithic', NULL, 35)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (38, N'Curved glass 2.5D', NULL, 35)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (39, N'Aluminum alloy', NULL, 36)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (42, N'Save energy', NULL, 42)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (43, N'Standard battery Li-Ion', NULL, 41)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (44, N'3600 mAh', NULL, 40)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (47, N'H.265', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (48, N'3GP', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (49, N'MP4', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (50, N'AVI', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (51, N'WMV', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (52, N'H.264(MPEG4-AVC)', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (53, N'DivX', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (54, N'WMV9', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (55, N'Xvid', NULL, 47)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (56, N'Lossless', NULL, 48)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (57, N'MP3', NULL, 48)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (58, N'WAV', NULL, 48)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (59, N'WMA', NULL, 48)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (60, N'LED-backlit IPS LCD', NULL, 8)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (61, N'HD (1334 x 750 Pixels)', NULL, 9)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (62, N'4.7"', NULL, 10)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (63, N'Oleophobic glass (ionic strength)', NULL, 11)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (64, N'8 MP', NULL, 12)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (65, N'Record FullHD 1080p @ 60fps', NULL, 13)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (66, N'Yes', NULL, 14)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (67, N'No', NULL, 14)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (68, N'1.2 MP', NULL, 17)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (69, N'Yes', NULL, 16)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (70, N'Auto focus', NULL, 18)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (71, N'iOS 11', NULL, 19)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (72, N'Apple A8 2 core 64-bit', NULL, 20)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (73, N'1.4 GHz', NULL, 21)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (74, N'PowerVR GX6450', NULL, 22)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (75, N'1 GB', NULL, 23)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (77, N'About 26 GB', NULL, 25)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (78, N'No', NULL, 26)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (79, N'4G LTE Cat 4', NULL, 27)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (80, N'1 Nano SIM', NULL, 28)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (81, N'Dual-band', NULL, 29)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (82, N'Wi-Fi Direct', NULL, 29)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (83, N'Wi-Fi 802.11 a/b/g/n/ac', NULL, 29)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (84, N'Yes', NULL, 30)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (85, N'V4.0', NULL, 31)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (86, N'A2DP', NULL, 31)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (87, N'Lightning', NULL, 32)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (88, N'Air Play', NULL, 34)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (90, N'HDMI', NULL, 34)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (91, N'1810 mAh', NULL, 40)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (92, N'Unlock by fingerprint', NULL, 43)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (93, N'2.5D glass', NULL, 44)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (94, N'Yes', NULL, 46)
INSERT [dbo].[tb_attribute_values] ([_id], [value], [link], [attribute_id]) VALUES (95, N'No', NULL, 46)
SET IDENTITY_INSERT [dbo].[tb_attribute_values] OFF
SET IDENTITY_INSERT [dbo].[tb_brand] ON 

INSERT [dbo].[tb_brand] ([_id], [name], [slug], [image_path], [description], [create_date], [update_date]) VALUES (3, N'Apple', N'apple', N'/assets/images/site/2018/04/1523051146058-2000px-Apple_logo_black.svg.png', N'Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services. ... Its online services include the iTunes Store, the iOS App Store and Mac App Store, Apple Music, and iCloud.', CAST(N'2018-04-07T04:46:14.490' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tb_brand] OFF
SET IDENTITY_INSERT [dbo].[tb_configuration] ON 

INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (1, N'title', N'Smart Market')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (2, N'description', N'Smart Market where the most prestigious electronics store is for you')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (3, N'keyword', N'Smart Market, Shop Online, E-comerece')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (4, N'favicon', N'/assets/images/site/2018/03/1522394372134-login-logo.png')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (5, N'logo', N'/assets/images/site/2018/03/1522394372134-login-logo.png')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (6, N'email', N'nhatsang39@gmail.com')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (7, N'latitude', N'11.590762541644226')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (8, N'longitude', N'107.84443418314208')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (9, N'phoneNumber', N'0164345655')
INSERT [dbo].[tb_configuration] ([_id], [key], [value]) VALUES (10, N'address', N'Bao Loc, Lam Dong')
SET IDENTITY_INSERT [dbo].[tb_configuration] OFF
SET IDENTITY_INSERT [dbo].[tb_event] ON 

INSERT [dbo].[tb_event] ([_id], [publisher_id], [name], [content], [status], [percent_value], [value], [code], [create_date], [update_date], [date_from], [date_to], [max_price], [min_price]) VALUES (2, 1, N'Apple', N'44564564564sadasdasdasdasdasdasdasasdasdasdasdasdas', 0, 10, CAST(31123 AS Decimal(13, 0)), N'asdasdas', CAST(N'2018-01-11T19:34:35.107' AS DateTime), NULL, CAST(N'2018-01-11T00:00:00.000' AS DateTime), CAST(N'2018-01-11T00:00:00.000' AS DateTime), CAST(121312313 AS Decimal(13, 0)), CAST(131231 AS Decimal(13, 0)))
SET IDENTITY_INSERT [dbo].[tb_event] OFF
SET IDENTITY_INSERT [dbo].[tb_image] ON 

INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (75, N'/assets/images/site/2018/03/1522394372134-login-logo.png', N'login-logo.png', N'site', NULL, CAST(N'2018-03-30T14:19:32.150' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (76, N'/assets/images/user/2018/03/1522402437412-no_image.jpg', N'no_image.jpg', N'user', NULL, CAST(N'2018-03-30T16:33:57.450' AS DateTime), 1)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (77, N'/assets/images/site/2018/04/1522673337539-Dango.(CLANNAD).full.113863.jpg', N'Dango.(CLANNAD).full.113863.jpg', N'site', NULL, CAST(N'2018-04-02T19:48:57.587' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (78, N'/assets/images/site/2018/04/1522675979403-samsung-galaxy-j7-pro-2323-400x460.png', N'samsung-galaxy-j7-pro-2323-400x460.png', N'site', NULL, CAST(N'2018-04-02T20:32:59.467' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (79, N'/assets/images/site/2018/04/1523051146058-2000px-Apple_logo_black.svg.png', N'2000px-Apple_logo_black.svg.png', N'site', NULL, CAST(N'2018-04-07T04:45:46.120' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (80, N'/assets/images/site/2018/04/1523052371380-iphone-6-32gb-vang-400-400x460.png', N'iphone-6-32gb-vang-400-400x460.png', N'site', NULL, CAST(N'2018-04-07T05:06:11.387' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (81, N'/assets/images/site/2018/04/1523171068104-Product-Diagram-1.png', N'Product-Diagram-1.png', N'site', NULL, CAST(N'2018-04-08T14:04:28.173' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (82, N'/assets/images/product/2018/04/1523208920455-Dango.(CLANNAD).full.113863.jpg', N'Dango.(CLANNAD).full.113863.jpg', N'product', NULL, CAST(N'2018-04-09T00:35:20.500' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (83, N'/assets/images/product/2018/04/1523209128391-good_ending_lineart_chapter_155_by_thetrueheiron-d5qjybi.jpg', N'good_ending_lineart_chapter_155_by_thetrueheiron-d5qjybi.jpg', N'product', NULL, CAST(N'2018-04-09T00:38:48.487' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (84, N'/assets/images/product/2018/04/1523209387132-Good-ending.png', N'Good-ending.png', N'product', NULL, CAST(N'2018-04-09T00:43:07.410' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (85, N'/assets/images/product/2018/04/1523209417597-tut-2.PNG', N'tut-2.PNG', N'product', NULL, CAST(N'2018-04-09T00:43:37.633' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (86, N'/assets/images/product/2018/04/1523211142346-P_20170421_153155_SF.jpg', N'P_20170421_153155_SF.jpg', N'product', NULL, CAST(N'2018-04-09T01:12:22.420' AS DateTime), 2)
INSERT [dbo].[tb_image] ([_id], [path], [name], [data_type], [description], [upload_date], [uploader_id]) VALUES (87, N'/assets/images/product/2018/04/1523211161761-Dango.(CLANNAD).full.113863.jpg', N'Dango.(CLANNAD).full.113863.jpg', N'product', NULL, CAST(N'2018-04-09T01:12:41.770' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tb_image] OFF
INSERT [dbo].[tb_persistent_logins] ([username], [series], [token], [last_used]) VALUES (N'nhatsang333@gmail.com', N'pUlg/Uo7/RhJJjuRgWV/ig==', N'NcSTY9VZ7aCzz+B9MfmXug==', CAST(N'2018-03-31T02:22:08.830' AS DateTime))
INSERT [dbo].[tb_persistent_logins] ([username], [series], [token], [last_used]) VALUES (N'nhatsang39@gmail.com', N'TGw5B3SYV9iziapBnWNclA==', N'g57ZSC7+VX9ghDLba96q1w==', CAST(N'2018-04-09T14:33:14.010' AS DateTime))
INSERT [dbo].[tb_persistent_logins] ([username], [series], [token], [last_used]) VALUES (N'nhatsang39@gmail.com', N'zQdn6BeI2EFY7mp6yjwOzA==', N'flRu2QPB6LVvGX68ZbXB8g==', CAST(N'2018-04-09T16:36:34.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_product_category] ON 

INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (2, N'Laptop', N'laptop', N'A laptop or notebook computer is a small, portable PC. It is usually lightweight, depending on the manufacturer and model for other uses', CAST(N'2018-04-02T20:37:52.597' AS DateTime), CAST(N'2018-04-02T20:37:52.703' AS DateTime))
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (3, N'Desktop', N'desktop', N'Personal computer (PC) is a small computer with its price, size and compatibility making it useful for the individual.', CAST(N'2018-01-12T09:27:25.693' AS DateTime), CAST(N'2018-01-12T09:27:32.597' AS DateTime))
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (4, N'Smart Phone', N'smart-phone', N'Smartphone is a concept that refers to a mobile phone that integrates a mobile operating system platform with many advanced connectivity features and connectivity based on the basic mobile platform.', CAST(N'2018-01-11T06:05:11.040' AS DateTime), NULL)
INSERT [dbo].[tb_product_category] ([_id], [name], [slug], [description], [create_date], [update_date]) VALUES (6, N'Smart TV', N'smart-tv', NULL, CAST(N'2018-04-02T05:54:28.777' AS DateTime), NULL)
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
INSERT [dbo].[tb_role] ([_id], [name]) VALUES (0, N'ADMIN')
INSERT [dbo].[tb_role] ([_id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[tb_user] ON 

INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar], [role_id]) VALUES (1, 1, N'Nhật Sang', N'Nguyễn', N'nhatsang38@gmail.com', N'$2a$10$y4NkLhaK56SIrgkmvERDMeN3fW2UHI5QSsjRRfHApfLQsyROt/SRC', CAST(N'2017-01-25T00:00:00.000' AS DateTime), CAST(N'2018-03-31T00:30:34.137' AS DateTime), CAST(N'2018-03-31T02:25:38.253' AS DateTime), N'ACTIVE', N'/assets/images/avatar.jpg', 2)
INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar], [role_id]) VALUES (2, 1, N'Nhật Tiến', N'Nguyễn', N'nhatsang39@gmail.com', N'$2a$10$SEZSj0XYvpAe3Llw4PinHe3WtnWbCe83KUPwNMfBrDlVtVknkkqXe', CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'2018-01-03T04:41:24.477' AS DateTime), CAST(N'2018-04-02T20:34:26.837' AS DateTime), N'ACTIVE', N'/assets/images/site/2018/04/1522673337539-Dango.(CLANNAD).full.113863.jpg', 0)
INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar], [role_id]) VALUES (6, 0, N'Hoàng', N'Nguyễn', N'nhatsang40@gmail.com', N'$2a$10$s.kwzvKi2gVUp3aPR5X0keXEmIooDHrIYfAWh5e2QHk5acyJTRKxy', CAST(N'2018-01-05T00:00:00.000' AS DateTime), CAST(N'2018-03-30T20:21:35.310' AS DateTime), NULL, N'ACTIVE', N'/assets/images/defaultImage.jpg', 0)
INSERT [dbo].[tb_user] ([_id], [gender], [first_name], [last_name], [email], [password], [birthday], [create_date], [update_date], [state], [avatar], [role_id]) VALUES (7, 1, N'Nhật Tiến', N'Nguyễn', N'nhatsang333@gmail.com', N'$2a$10$s.kwzvKi2gVUp3aPR5X0keXEmIooDHrIYfAWh5e2QHk5acyJTRKxy', CAST(N'2018-01-21T00:00:00.000' AS DateTime), CAST(N'2018-03-30T23:35:51.220' AS DateTime), CAST(N'2018-03-31T15:27:58.707' AS DateTime), N'ACTIVE', N'/assets/images/defaultImage.jpg', 0)
SET IDENTITY_INSERT [dbo].[tb_user] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_brand_slug_unique]    Script Date: 4/9/2018 4:58:34 PM ******/
ALTER TABLE [dbo].[tb_brand] ADD  CONSTRAINT [IX_tb_brand_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tb_user_email]    Script Date: 4/9/2018 4:58:34 PM ******/
ALTER TABLE [dbo].[tb_user] ADD  CONSTRAINT [IX_tb_user_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_attribute] ADD  CONSTRAINT [DF_tb_attribute_priority]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tb_attribute_group] ADD  CONSTRAINT [DF_tb_attribute_group_priority]  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tb_user] ADD  CONSTRAINT [DF_tb_user_role]  DEFAULT ((0)) FOR [role_id]
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
ALTER TABLE [dbo].[tb_attribute_values]  WITH CHECK ADD  CONSTRAINT [FK_tb_attribute_values_tb_attribute] FOREIGN KEY([attribute_id])
REFERENCES [dbo].[tb_attribute] ([_id])
GO
ALTER TABLE [dbo].[tb_attribute_values] CHECK CONSTRAINT [FK_tb_attribute_values_tb_attribute]
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
ALTER TABLE [dbo].[tb_order]  WITH CHECK ADD  CONSTRAINT [FK_tb_order_tb_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[tb_address] ([_id])
GO
ALTER TABLE [dbo].[tb_order] CHECK CONSTRAINT [FK_tb_order_tb_address]
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
ALTER TABLE [dbo].[tb_product_attribute_values]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_attribute_tb_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tb_product] ([_id])
GO
ALTER TABLE [dbo].[tb_product_attribute_values] CHECK CONSTRAINT [FK_tb_product_attribute_tb_product]
GO
ALTER TABLE [dbo].[tb_product_attribute_values]  WITH CHECK ADD  CONSTRAINT [FK_tb_product_attribute_values_tb_attribute_values] FOREIGN KEY([attribute_values_id])
REFERENCES [dbo].[tb_attribute_values] ([_id])
GO
ALTER TABLE [dbo].[tb_product_attribute_values] CHECK CONSTRAINT [FK_tb_product_attribute_values_tb_attribute_values]
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
ALTER TABLE [dbo].[tb_user]  WITH CHECK ADD  CONSTRAINT [FK_tb_user_tb_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[tb_role] ([_id])
GO
ALTER TABLE [dbo].[tb_user] CHECK CONSTRAINT [FK_tb_user_tb_role]
GO
USE [master]
GO
ALTER DATABASE [SmartMarket] SET  READ_WRITE 
GO
