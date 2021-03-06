USE [master]
GO
/****** Object:  Database [Papyrus]    Script Date: 21/06/2016 13:43:36 ******/
CREATE DATABASE [Papyrus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Papyrus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Papyrus.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Papyrus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Papyrus_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Papyrus] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Papyrus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Papyrus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Papyrus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Papyrus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Papyrus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Papyrus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Papyrus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Papyrus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Papyrus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Papyrus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Papyrus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Papyrus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Papyrus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Papyrus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Papyrus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Papyrus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Papyrus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Papyrus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Papyrus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Papyrus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Papyrus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Papyrus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Papyrus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Papyrus] SET RECOVERY FULL 
GO
ALTER DATABASE [Papyrus] SET  MULTI_USER 
GO
ALTER DATABASE [Papyrus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Papyrus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Papyrus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Papyrus] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Papyrus] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Papyrus]
GO
/****** Object:  Table [dbo].[entcom]    Script Date: 21/06/2016 13:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entcom](
	[numCom] [int] IDENTITY(1,1) NOT NULL,
	[obsCom] [varchar](50) NULL,
	[datCom] [smalldatetime] NOT NULL,
	[numFou] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[numCom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fournis]    Script Date: 21/06/2016 13:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fournis](
	[numFou] [tinyint] NOT NULL,
	[nomFou] [varchar](25) NOT NULL,
	[rueFou] [varchar](50) NOT NULL,
	[posFou] [char](5) NOT NULL,
	[vilFou] [varchar](30) NOT NULL,
	[conFou] [varchar](15) NOT NULL,
	[satisf] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[numFou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ligcom]    Script Date: 21/06/2016 13:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ligcom](
	[numCom] [int] NOT NULL,
	[numLig] [tinyint] NOT NULL,
	[codArt] [char](4) NOT NULL,
	[qteCde] [int] NOT NULL,
	[priUni] [smallmoney] NOT NULL,
	[qteLiv] [int] NULL,
	[derLiv] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numCom] ASC,
	[numLig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[produit]    Script Date: 21/06/2016 13:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[produit](
	[codArt] [char](4) NOT NULL,
	[libArt] [varchar](30) NOT NULL,
	[stkLe] [int] NOT NULL,
	[stkPhy] [int] NOT NULL,
	[qteAnn] [int] NOT NULL,
	[uniMes] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codArt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vente]    Script Date: 21/06/2016 13:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vente](
	[codArt] [char](4) NOT NULL,
	[numFou] [tinyint] NOT NULL,
	[delliv] [smallint] NOT NULL,
	[qte1] [int] NOT NULL,
	[prix1] [smallmoney] NOT NULL,
	[qte2] [int] NULL,
	[prix2] [smallmoney] NULL,
	[qte3] [int] NULL,
	[prix3] [smallmoney] NULL,
PRIMARY KEY CLUSTERED 
(
	[codArt] ASC,
	[numFou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [numFou_entCom]    Script Date: 21/06/2016 13:43:36 ******/
CREATE NONCLUSTERED INDEX [numFou_entCom] ON [dbo].[entcom]
(
	[numFou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[entcom] ADD  DEFAULT (getdate()) FOR [datCom]
GO
ALTER TABLE [dbo].[entcom] ADD  DEFAULT (NULL) FOR [numFou]
GO
ALTER TABLE [dbo].[entcom]  WITH CHECK ADD FOREIGN KEY([numFou])
REFERENCES [dbo].[fournis] ([numFou])
GO
ALTER TABLE [dbo].[ligcom]  WITH CHECK ADD FOREIGN KEY([codArt])
REFERENCES [dbo].[produit] ([codArt])
GO
ALTER TABLE [dbo].[ligcom]  WITH CHECK ADD FOREIGN KEY([numCom])
REFERENCES [dbo].[entcom] ([numCom])
GO
ALTER TABLE [dbo].[vente]  WITH CHECK ADD FOREIGN KEY([codArt])
REFERENCES [dbo].[produit] ([codArt])
GO
ALTER TABLE [dbo].[vente]  WITH CHECK ADD FOREIGN KEY([numFou])
REFERENCES [dbo].[fournis] ([numFou])
GO
ALTER TABLE [dbo].[fournis]  WITH CHECK ADD CHECK  (([satisf]>=(1) AND [satisf]<=(10)))
GO
USE [master]
GO
ALTER DATABASE [Papyrus] SET  READ_WRITE 
GO
