USE [master]
GO
/****** Object:  Database [Papyrus]    Script Date: 30/06/2016 13:28:00 ******/
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
/****** Object:  Schema [stg04]    Script Date: 30/06/2016 13:28:00 ******/
CREATE SCHEMA [stg04]
GO
/****** Object:  Table [stg04].[entcom]    Script Date: 30/06/2016 13:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
set dateformat ymd
GO
CREATE TABLE [stg04].[entcom](
	[numCom] [int] NOT NULL,
	[obsCom] [varchar](50) NULL,
	[datCom] [smalldatetime] NOT NULL DEFAULT (getdate()),
	[numFou] [int] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[numCom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [stg04].[fournis]    Script Date: 30/06/2016 13:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg04].[fournis](
	[numFou] [int] NOT NULL,
	[nomFou] [varchar](50) NOT NULL,
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
/****** Object:  Table [stg04].[ligcom]    Script Date: 30/06/2016 13:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg04].[ligcom](
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
/****** Object:  Table [stg04].[produit]    Script Date: 30/06/2016 13:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg04].[produit](
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
/****** Object:  Table [stg04].[vente]    Script Date: 30/06/2016 13:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg04].[vente](
	[codArt] [char](4) NOT NULL,
	[numFou] [int] NOT NULL,
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


GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70010, NULL, CAST(N'2007-02-10 00:00:00' AS SmallDateTime), 120)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70011, N'Commande Urgente', CAST(N'2007-03-01 00:00:00' AS SmallDateTime), 540)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70020, NULL, CAST(N'2007-04-25 00:00:00' AS SmallDateTime), 9180)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70025, N'Commande urgente', CAST(N'2007-04-30 00:00:00' AS SmallDateTime), 9150)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70210, N'Commande candencée', CAST(N'2007-05-05 00:00:00' AS SmallDateTime), 120)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70300, NULL, CAST(N'2007-06-06 00:00:00' AS SmallDateTime), 9120)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70250, N'Commande cadencée', CAST(N'2007-10-02 00:00:00' AS SmallDateTime), 8700)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70620, NULL, CAST(N'2007-10-20 00:00:00' AS SmallDateTime), 540)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70625, NULL, CAST(N'2007-10-09 00:00:00' AS SmallDateTime), 120)
GO
INSERT [stg04].[entcom] ([numCom], [obsCom], [datCom], [numFou]) VALUES (70629, NULL, CAST(N'2007-10-12 00:00:00' AS SmallDateTime), 9180)
GO

GO
INSERT [stg04].[fournis] ([numFou], [nomFou], [rueFou], [posFou], [vilFou], [conFou], [satisf]) VALUES (120, N'GROBRIGAN', N'20 rue du papier', N'92200', N'papercity', N'Georges', 8)
GO
INSERT [stg04].[fournis] ([numFou], [nomFou], [rueFou], [posFou], [vilFou], [conFou], [satisf]) VALUES (540, N'ECLIPSE', N'53, rue laisse flotter les rubans', N'78250', N'Bugbugville', N'Nestor', 7)
GO
INSERT [stg04].[fournis] ([numFou], [nomFou], [rueFou], [posFou], [vilFou], [conFou], [satisf]) VALUES (8700, N'MEDICIS', N'120 rue des plantes', N'75014', N'Paris', N'Lison', NULL)
GO
INSERT [stg04].[fournis] ([numFou], [nomFou], [rueFou], [posFou], [vilFou], [conFou], [satisf]) VALUES (9120, N'DISCOBOL', N'11 rue des sports', N'85100', N'La roche sur Yon', N'Hercule', 8)
GO
INSERT [stg04].[fournis] ([numFou], [nomFou], [rueFou], [posFou], [vilFou], [conFou], [satisf]) VALUES (9150, N'DEPANPAP', N'26, rue des locomotives', N'59987', N'Coroncountry', N'Pollux', 5)
GO
INSERT [stg04].[fournis] ([numFou], [nomFou], [rueFou], [posFou], [vilFou], [conFou], [satisf]) VALUES (9180, N'HURRYTAPE', N'68, boulevard des octets', N'04044', N'Dumpville', N'Track', NULL)
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70010, 1, N'I100', 3000, 470.0000, 3000, CAST(N'2007-03-15 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70010, 2, N'I105', 2000, 485.0000, 2000, CAST(N'2007-07-05 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70010, 3, N'I108', 1000, 680.0000, 1000, CAST(N'2007-08-20 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70010, 4, N'D035', 200, 40.0000, 250, CAST(N'2007-02-20 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70010, 5, N'P220', 6000, 3500.0000, 6000, CAST(N'2007-03-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70010, 6, N'P240', 6000, 2000.0000, 2000, CAST(N'2007-03-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70011, 1, N'I105', 1000, 600.0000, 1000, CAST(N'2007-05-16 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70020, 1, N'B001', 200, 140.0000, 0, CAST(N'2007-12-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70020, 2, N'B002', 200, 140.0000, 0, CAST(N'2007-12-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70025, 1, N'I100', 1000, 590.0000, 1000, CAST(N'2007-05-15 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70025, 2, N'I105', 500, 590.0000, 500, CAST(N'2007-05-15 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70210, 1, N'I100', 1000, 470.0000, 1000, CAST(N'2007-07-15 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70210, 2, N'P220', 10000, 3500.0000, 10000, CAST(N'2007-08-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70300, 1, N'I110', 50, 790.0000, 50, CAST(N'2007-10-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70250, 1, N'P230', 15000, 4900.0000, 12000, CAST(N'2007-12-15 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70250, 2, N'P220', 10000, 3350.0000, 10000, CAST(N'2007-11-10 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70620, 1, N'I105', 200, 600.0000, 200, CAST(N'2007-11-01 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70625, 1, N'I100', 1000, 470.0000, 1000, CAST(N'2007-10-15 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70625, 2, N'P220', 10000, 3500.0000, 10000, CAST(N'2007-10-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70629, 1, N'B001', 200, 140.0000, 0, CAST(N'2007-12-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[ligcom] ([numCom], [numLig], [codArt], [qteCde], [priUni], [qteLiv], [derLiv]) VALUES (70629, 2, N'B002', 200, 140.0000, 0, CAST(N'2007-12-31 00:00:00' AS SmallDateTime))
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'B001', N'Bande magnétique 1200', 20, 87, 240, N'unité')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'B002', N'Bande magnétique 6250', 20, 12, 410, N'unite')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'D035', N'CD R slim 80 mm', 40, 42, 150, N'B010 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'D050', N'CD R-W 80mm', 50, 4, 0, N'B010 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'I100', N'Papier 1 ex continu', 100, 557, 3500, N'B1000')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'I105', N'Papier 2 ex continu', 75, 5, 2300, N'B1000')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'I108', N'Papier 3 ex continu', 200, 557, 3500, N'B500 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'I110', N'Papier 4 ex continu', 10, 12, 63, N'B400 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'P220', N'Pré-imprimé commande', 500, 2500, 24500, N'B500 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'P230', N'Pré-imprimé facture', 500, 250, 12500, N'B500 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'P240', N'Pré-imprimé bulletin paie', 500, 3000, 6250, N'B500 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'P250', N'Pré-imprimé bon livraison', 500, 2500, 24500, N'B500 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'P270', N'Pré-imprimé bon fabrication', 500, 2500, 24500, N'B500 ')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'R080', N'ruban Epson 850', 10, 2, 120, N'unite')
GO
INSERT [stg04].[produit] ([codArt], [libArt], [stkLe], [stkPhy], [qteAnn], [uniMes]) VALUES (N'R132', N'ruban impl 1200 lignes', 25, 200, 182, N'unite')
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'B001', 8700, 15, 0, 150.0000, 50, 145.0000, 100, 140.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'B002', 8700, 15, 0, 210.0000, 50, 200.0000, 100, 185.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'D035', 120, 0, 0, 40.0000, NULL, NULL, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'D035', 9120, 5, 0, 40.0000, 100, 30.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I100', 120, 90, 0, 700.0000, 50, 600.0000, 120, 500.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I100', 540, 70, 0, 710.0000, 60, 630.0000, 100, 600.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I100', 9120, 60, 0, 800.0000, 70, 600.0000, 90, 500.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I100', 9150, 90, 0, 650.0000, 90, 600.0000, 200, 590.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I100', 9180, 30, 0, 720.0000, 50, 670.0000, 100, 490.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I105', 120, 90, 10, 705.0000, 50, 630.0000, 120, 500.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I105', 540, 70, 0, 810.0000, 60, 645.0000, 100, 600.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I105', 8700, 30, 0, 720.0000, 50, 670.0000, 100, 510.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I105', 9120, 60, 0, 920.0000, 70, 800.0000, 90, 700.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I105', 9150, 90, 0, 685.0000, 90, 600.0000, 200, 590.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I108', 120, 90, 5, 795.0000, 30, 720.0000, 100, 680.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I108', 9120, 60, 0, 920.0000, 70, 820.0000, 100, 780.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I110', 9120, 60, 0, 950.0000, 70, 850.0000, 90, 790.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'I110', 9180, 90, 0, 900.0000, 70, 870.0000, 90, 835.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P220', 120, 15, 0, 3700.0000, 100, 3500.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P220', 8700, 20, 50, 3500.0000, 100, 3350.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P230', 120, 30, 0, 5200.0000, 100, 5000.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P230', 8700, 60, 0, 5000.0000, 50, 4900.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P240', 120, 15, 0, 2200.0000, 100, 2000.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P250', 120, 30, 0, 1500.0000, 100, 1400.0000, 500, 1200.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'P250', 9120, 30, 0, 1500.0000, 100, 1400.0000, 500, 1200.0000)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'R080', 9120, 10, 0, 120.0000, 100, 100.0000, NULL, NULL)
GO
INSERT [stg04].[vente] ([codArt], [numFou], [delliv], [qte1], [prix1], [qte2], [prix2], [qte3], [prix3]) VALUES (N'R132', 9120, 5, 0, 275.0000, NULL, NULL, NULL, NULL)
GO
/****** Object:  Index [numFou_entCom]    Script Date: 30/06/2016 13:28:00 ******/
CREATE NONCLUSTERED INDEX [numFou_entCom] ON [stg04].[entcom]
(
	[numFou] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [stg04].[entcom]  WITH CHECK ADD FOREIGN KEY([numFou])
REFERENCES [stg04].[fournis] ([numFou])
GO
ALTER TABLE [stg04].[ligcom]  WITH CHECK ADD FOREIGN KEY([codArt])
REFERENCES [stg04].[produit] ([codArt])
GO
ALTER TABLE [stg04].[ligcom]  WITH CHECK ADD FOREIGN KEY([numCom])
REFERENCES [stg04].[entcom] ([numCom])
GO
ALTER TABLE [stg04].[vente]  WITH CHECK ADD FOREIGN KEY([codArt])
REFERENCES [stg04].[produit] ([codArt])
GO
ALTER TABLE [stg04].[vente]  WITH CHECK ADD FOREIGN KEY([numFou])
REFERENCES [stg04].[fournis] ([numFou])
GO
ALTER TABLE [stg04].[fournis]  WITH CHECK ADD CHECK  (([satisf]>=(1) AND [satisf]<=(10)))
GO
USE [master]
GO
ALTER DATABASE [Papyrus] SET  READ_WRITE 
GO
