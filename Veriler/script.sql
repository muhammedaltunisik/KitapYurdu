USE [master]
GO
/****** Object:  Database [KitapYurdu]    Script Date: 6.02.2023 18:25:44 ******/
CREATE DATABASE [KitapYurdu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KitapYurdu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KitapYurdu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KitapYurdu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\KitapYurdu_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KitapYurdu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KitapYurdu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KitapYurdu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KitapYurdu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KitapYurdu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KitapYurdu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KitapYurdu] SET ARITHABORT OFF 
GO
ALTER DATABASE [KitapYurdu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KitapYurdu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KitapYurdu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KitapYurdu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KitapYurdu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KitapYurdu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KitapYurdu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KitapYurdu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KitapYurdu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KitapYurdu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KitapYurdu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KitapYurdu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KitapYurdu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KitapYurdu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KitapYurdu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KitapYurdu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KitapYurdu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KitapYurdu] SET RECOVERY FULL 
GO
ALTER DATABASE [KitapYurdu] SET  MULTI_USER 
GO
ALTER DATABASE [KitapYurdu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KitapYurdu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KitapYurdu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KitapYurdu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KitapYurdu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KitapYurdu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KitapYurdu] SET QUERY_STORE = OFF
GO
USE [KitapYurdu]
GO
/****** Object:  Table [dbo].[tbl_Adress]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Adress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICI_ID] [int] NOT NULL,
	[ADDRESSTEXT] [varchar](100) NOT NULL,
	[ADRES_BASLIGI] [varchar](20) NOT NULL,
	[ULKE] [varchar](20) NOT NULL,
	[SEHIR] [varchar](20) NOT NULL,
	[ILCE] [varchar](20) NOT NULL,
	[MAHALLE] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_Adress] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kitaplar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Kitaplar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SATICI_ID] [int] NOT NULL,
	[YAZAR_ID] [int] NOT NULL,
	[URUN_KODU] [varchar](50) NOT NULL,
	[URUN_ADI] [varchar](50) NOT NULL,
	[FIYAT] [float] NOT NULL,
	[KATEGORI_1] [varchar](50) NOT NULL,
	[KATEGORI_2] [varchar](50) NULL,
	[URUN_ADEDI] [int] NOT NULL,
	[SAYFA_SAYISI] [int] NOT NULL,
	[DIL] [varchar](20) NOT NULL,
	[DURUM] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kullanicilar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Kullanicilar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICI_ADI] [varchar](20) NOT NULL,
	[SIFRE] [varchar](64) NOT NULL,
	[TAM_AD] [varchar](50) NOT NULL,
	[MAIL] [varchar](50) NOT NULL,
	[CINSIYET] [varchar](5) NOT NULL,
	[KULLANICI_TIPI] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tbl_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Saticilar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Saticilar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICI_ADI] [varchar](20) NOT NULL,
	[SIFRE] [varchar](64) NOT NULL,
	[YAYINEVI_ADI] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Saticilar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_silinen_Kitaplar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_silinen_Kitaplar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_2] [int] NOT NULL,
	[SATICI_ID] [int] NOT NULL,
	[YAZAR_ID] [int] NOT NULL,
	[URUN_KODU] [varchar](50) NOT NULL,
	[URUN_ADI] [varchar](50) NOT NULL,
	[FIYAT] [float] NOT NULL,
	[KATEGORI_1] [varchar](50) NOT NULL,
	[KATEGORI_2] [varchar](50) NULL,
	[URUN_ADEDI] [int] NOT NULL,
	[SAYFA_SAYISI] [int] NOT NULL,
	[DIL] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_silinen_Kullanicilar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_silinen_Kullanicilar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_2] [int] NOT NULL,
	[KULLANICI_ADI] [varchar](20) NOT NULL,
	[SIFRE] [varchar](64) NOT NULL,
	[TAM_AD] [varchar](50) NOT NULL,
	[MAIL] [varchar](50) NOT NULL,
	[CINSIYET] [varchar](5) NOT NULL,
	[KULLANICI_TIPI] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Siparisler]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Siparisler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICI_ID] [int] NOT NULL,
	[ITEM_ID] [int] NOT NULL,
	[ADDRESS_ID] [int] NOT NULL,
	[SATICI_ID] [int] NOT NULL,
	[URUN_KODU] [varchar](50) NOT NULL,
	[SIPARIS_KODU] [int] NOT NULL,
	[TARIH] [smalldatetime] NOT NULL,
	[TOPLAM_FIYAT] [float] NOT NULL,
	[DURUM] [tinyint] NOT NULL,
	[ADET] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_Siparisler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Yazarlar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Yazarlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TAM_AD] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Adress] ON 

INSERT [dbo].[tbl_Adress] ([ID], [KULLANICI_ID], [ADDRESSTEXT], [ADRES_BASLIGI], [ULKE], [SEHIR], [ILCE], [MAHALLE]) VALUES (1, 22, N'Yeni Mah. Atatürk Bulvarı. No:X Kat:X
Daire:X', N'Yeni Mahalle Ev', N'Türkiye', N'Ordu', N'Altınordu', N'Yeni Mahalle')
SET IDENTITY_INSERT [dbo].[tbl_Adress] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Kitaplar] ON 

INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (1, 13, 67, N'IN-UP', N'Silver Beardgrass', 147, N'Roofing (Asphalt)', NULL, 44, 212, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (2, 7, 144, N'US-AK', N'Rock Panicgrass', 64, N'Retaining Wall and Brick Pavers', N'Casework', 87, 771, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (3, 34, 84, N'JP-34', N'Cream Ticktrefoil', 52, N'Fire Sprinkler System', N'Drywall & Acoustical (MOB)', 78, 460, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (4, 49, 44, N'SY-DY', N'California Buckthorn', 71, N'Casework', NULL, 14, 558, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (5, 31, 73, N'SB-MK', N'Catawba Rosebay', 67, N'Retaining Wall and Brick Pavers', N'Drilled Shafts', 85, 1002, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (6, 43, 91, N'BR-RJ', N'White-flower Johnnyberry', 50, N'Fire Protection', N'Doors, Frames & Hardware', 37, 917, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (7, 31, 70, N'SE-BD', N'Tehama Pincushionplant', 97, N'Prefabricated Aluminum Metal Canopies', N'Masonry', 22, 174, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (8, 50, 6, N'BS-MG', N'Bellflower', 57, N'Site Furnishings', NULL, 18, 202, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (9, 12, 98, N'LA-BK', N'Leatherleaf', 150, N'HVAC', NULL, 84, 70, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (10, 15, 86, N'ID-PA', N'Richardson''s Sedge', 58, N'Sitework & Site Utilities', N'Electrical', 74, 429, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (11, 20, 144, N'AR-R', N'Cyrtandra', 29, N'Marlite Panels (FED)', NULL, 40, 131, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (12, 33, 59, N'IS-4', N'Herb Of The Cross', 77, N'Fire Protection', N'Painting & Vinyl Wall Covering', 49, 497, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (13, 21, 71, N'US-CO', N'Davis Mountain Rocktrumpet', 63, N'Elevator', N'Construction Clean and Final Clean', 67, 972, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (14, 27, 91, N'US-AK', N'Wart Lichen', 53, N'Doors, Frames & Hardware', NULL, 5, 1003, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (15, 4, 107, N'IR-15', N'Piper''s Buxbaumia Moss', 92, N'Framing (Wood)', NULL, 66, 687, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (16, 13, 100, N'US-AR', N'Sematophyllum Moss', 29, N'Termite Control', N'Curb & Gutter', 11, 1032, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (17, 48, 141, N'IT-82', N'Tansy Bristle Fern', 150, N'Site Furnishings', N'RF Shielding', 68, 459, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (18, 44, 95, N'ST-P', N'Broadleaf Tonguefern', 60, N'Wall Protection', NULL, 83, 265, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (19, 29, 104, N'US-AZ', N'Antilles Parmotremopsis', 143, N'Construction Clean and Final Clean', NULL, 52, 631, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (20, 19, 63, N'BR-RS', N'Needle Spikerush', 129, N'Asphalt Paving', NULL, 25, 270, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (21, 9, 68, N'CA-NL', N'Cottonrose', 147, N'Epoxy Flooring', NULL, 19, 555, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (22, 12, 48, N'US-OK', N'Miracle Fruit', 42, N'Doors, Frames & Hardware', N'Termite Control', 74, 180, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (23, 7, 77, N'CD-KW', N'Cochise Scaly Cloakfern', 94, N'Fire Sprinkler System', NULL, 99, 1097, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (24, 48, 136, N'CN-33', N'Dwarf Crested Iris', 62, N'Structural & Misc Steel Erection', NULL, 17, 1074, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (25, 32, 116, N'AO-HUA', N'Wedgeleaf', 46, N'Marlite Panels (FED)', NULL, 86, 453, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (26, 21, 93, N'PE-PIU', N'Vine Jointfir', 28, N'Masonry & Precast', N'Sitework & Site Utilities', 29, 830, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (27, 6, 109, N'CA-AB', N'Seashore Paspalum', 102, N'Masonry & Precast', NULL, 57, 604, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (28, 32, 51, N'SA-07', N'Manyflowered Monkeyflower', 132, N'Temp Fencing, Decorative Fencing and Gates', N'HVAC', 98, 589, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (29, 47, 101, N'CO-CHO', N'Garden Onion', 25, N'Glass & Glazing', N'Wall Protection', 65, 1009, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (30, 34, 144, N'KE-200', N'Meadowparsnip', 79, N'Wall Protection', NULL, 16, 878, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (31, 26, 121, N'US-NY', N'Sierra Shootingstar', 147, N'Drywall & Acoustical (MOB)', NULL, 19, 191, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (32, 30, 85, N'AO-MOX', N'Smooth Lessingia', 114, N'Waterproofing & Caulking', N'Soft Flooring and Base', 53, 879, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (33, 19, 49, N'ID-RI', N'Beeftree', 47, N'Ornamental Railings', NULL, 40, 586, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (34, 8, 111, N'CO-GUV', N'Bird''s-foot', 94, N'Epoxy Flooring', N'Exterior Signage', 23, 1056, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (35, 8, 38, N'CI-08', N'Nealley''s Kisses', 53, N'Prefabricated Aluminum Metal Canopies', NULL, 82, 266, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (36, 29, 19, N'CN-14', N'Parry''s Milkvetch', 39, N'Drilled Shafts', NULL, 71, 260, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (37, 18, 135, N'AR-U', N'Hybrid Violet', 26, N'Granite Surfaces', NULL, 39, 458, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (38, 5, 112, N'ET-AA', N'Marsh Labrador Tea', 94, N'Structural & Misc Steel Erection', NULL, 37, 328, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (39, 11, 8, N'NL-NB', N'Bud Saxifrage', 61, N'Temp Fencing, Decorative Fencing and Gates', NULL, 62, 917, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (40, 48, 10, N'PH-AUR', N'Cleveland''s Beardtongue', 122, N'Ornamental Railings', NULL, 95, 438, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (41, 29, 54, N'NZ-HKB', N'Carolina Desert-thorn', 24, N'Asphalt Paving', N'Plumbing & Medical Gas', 58, 936, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (42, 41, 99, N'AU-WA', N'Arctodupontia', 77, N'Rebar & Wire Mesh Install', NULL, 14, 641, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (43, 44, 148, N'US-UT', N'Yellow Salsify', 81, N'Ornamental Railings', N'Retaining Wall and Brick Pavers', 50, 535, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (44, 49, 128, N'ID-PA', N'Sleeping Ute Milkvetch', 127, N'Ornamental Railings', N'Prefabricated Aluminum Metal Canopies', 33, 722, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (45, 11, 69, N'MY-11', N'California Butterwort', 63, N'HVAC', N'Granite Surfaces', 76, 75, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (46, 17, 61, N'AR-Q', N'Annual Blue-eyed Grass', 139, N'Ornamental Railings', NULL, 47, 810, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (47, 43, 55, N'AU-QLD', N'Carminatia', 139, N'Plumbing & Medical Gas', N'Waterproofing & Caulking', 61, 1083, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (48, 2, 108, N'NZ-WGN', N'Mahogany Milkweed', 25, N'Electrical', NULL, 55, 286, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (49, 37, 144, N'GN-K', N'Santa Monica Rinodina Lichen', 147, N'Framing (Steel)', N'Wall Protection', 65, 955, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (50, 44, 135, N'IE-SO', N'Buttonia', 79, N'Framing (Steel)', NULL, 26, 748, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (51, 34, 52, N'NZ-AUK', N'Abrothallus Lichen', 79, N'Structural & Misc Steel Erection', N'Prefabricated Aluminum Metal Canopies', 55, 659, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (52, 1, 98, N'CO-MET', N'Wright''s Goldenrod', 81, N'Construction Clean and Final Clean', NULL, 36, 715, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (53, 3, 128, N'CN-65', N'False Pennyroyal', 34, N'Soft Flooring and Base', N'Structural & Misc Steel Erection', 37, 933, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (54, 12, 97, N'RU-BEL', N'Jelly Lichen', 44, N'Landscaping & Irrigation', NULL, 24, 709, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (55, 50, 47, N'GL-U-A', N'Arizona Cliffrose', 93, N'Casework', N'Construction Clean and Final Clean', 20, 941, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (56, 39, 8, N'CN-53', N'Baker''s Wild Hollyhock', 55, N'Drilled Shafts', N'Site Furnishings', 84, 483, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (57, 35, 54, N'US-WY', N'Nuttall''s Crinklemat', 128, N'Masonry', NULL, 13, 497, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (58, 32, 116, N'MG-M', N'Coastal Sage Scrub Oak', 56, N'HVAC', N'Waterproofing & Caulking', 26, 503, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (59, 31, 68, N'PG-NPP', N'Dwarf Iris', 68, N'Masonry', N'Elevator', 87, 264, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (60, 30, 150, N'MM-11', N'Toughleaf Iris', 86, N'Waterproofing & Caulking', NULL, 55, 933, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (61, 3, 108, N'US-NJ', N'Savannah False Pimpernel', 97, N'EIFS', NULL, 32, 844, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (62, 36, 91, N'PK-PB', N'Woolly Tidestromia', 79, N'Electrical', NULL, 39, 501, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (63, 22, 73, N'US-CA', N'Esparto', 69, N'Roofing (Metal)', N'Termite Control', 82, 632, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (64, 38, 92, N'FR-F', N'Arizona Bluecurls', 25, N'Glass & Glazing', N'Masonry', 95, 698, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (65, 33, 95, N'TH-47', N'Netted Pawpaw', 95, N'Site Furnishings', NULL, 91, 659, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (66, 1, 119, N'AU-TAS', N'Barren Ground Willow', 141, N'Wall Protection', NULL, 15, 626, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (67, 32, 132, N'PG-CPK', N'Yellow Bloodstain Lichen', 112, N'Rebar & Wire Mesh Install', NULL, 8, 192, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (68, 31, 80, N'BR-PE', N'Tanglehead', 123, N'Masonry & Precast', NULL, 74, 263, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (69, 7, 71, N'US-FL', N'Douglas''s Catchfly', 142, N'Elevator', NULL, 49, 753, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (70, 47, 70, N'IT-62', N'Garden Sorrel', 67, N'Electrical and Fire Alarm', NULL, 52, 543, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (71, 47, 78, N'AU-QLD', N'Guadalupe Violet', 142, N'Soft Flooring and Base', N'Doors, Frames & Hardware', 92, 139, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (72, 49, 38, N'MX-BCS', N'Redroot Cryptantha', 143, N'Waterproofing & Caulking', NULL, 88, 229, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (73, 30, 59, N'US-SC', N'Calotropis', 99, N'Doors, Frames & Hardware', N'Masonry', 29, 785, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (74, 25, 15, N'MX-COA', N'Scaldweed', 44, N'Ornamental Railings', NULL, 10, 343, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (75, 30, 115, N'PG-WBK', N'Fringed Amaranth', 81, N'Temp Fencing, Decorative Fencing and Gates', NULL, 37, 125, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (76, 43, 75, N'CA-ON', N'Broadleaf Woodsorrel', 142, N'Framing (Steel)', NULL, 79, 317, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (77, 35, 130, N'KR-41', N'Purple Rattlesnakeroot', 82, N'Retaining Wall and Brick Pavers', N'Curb & Gutter', 35, 818, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (78, 19, 3, N'NG-KD', N'Wildparsley', 58, N'RF Shielding', N'Wall Protection', 69, 966, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (79, 28, 146, N'CA-QC', N'Southwestern Waterwort', 33, N'Epoxy Flooring', NULL, 44, 484, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (80, 41, 79, N'US-NC', N'Streptanthella', 104, N'Drywall & Acoustical (FED)', NULL, 90, 431, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (81, 39, 39, N'GB-NIR', N'Japanese Elm', 118, N'Roofing (Metal)', NULL, 18, 492, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (82, 2, 24, N'AU-TAS', N'Arctic Groundsel', 112, N'Wall Protection', NULL, 48, 720, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (83, 29, 77, N'RU-KOS', N'Amador County Vervain', 130, N'Curb & Gutter', NULL, 44, 892, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (84, 13, 139, N'AU-QLD', N'Sonoran Indian Mallow', 25, N'Electrical and Fire Alarm', N'Fire Protection', 66, 181, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (85, 43, 106, N'KE-300', N'Wire Sedge', 29, N'Sitework & Site Utilities', NULL, 32, 532, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (86, 13, 139, N'BR-RS', N'Netleaf Swampprivet', 138, N'Elevator', NULL, 51, 331, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (87, 48, 135, N'AU-QLD', N'Spikesedge', 32, N'Marlite Panels (FED)', NULL, 81, 955, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (88, 34, 110, N'CK-U-A', N'Premna', 147, N'Granite Surfaces', N'Landscaping & Irrigation', 14, 591, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (89, 39, 80, N'US-CA', N'Cooper''s Goldenbush', 22, N'Construction Clean and Final Clean', NULL, 19, 524, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (90, 40, 53, N'PM-SP', N'Midsorus Fern', 82, N'Drywall & Acoustical (FED)', N'Wall Protection', 13, 278, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (91, 24, 103, N'CD-KE', N'Dwarf Cinquefoil', 23, N'Drywall & Acoustical (FED)', NULL, 99, 488, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (92, 33, 84, N'VE-K', N'Sonoran Pricklypoppy', 127, N'Overhead Doors', NULL, 46, 181, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (93, 5, 16, N'IN-KA', N'Strapwort', 39, N'Masonry & Precast', N'Roofing (Asphalt)', 38, 990, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (94, 9, 126, N'CD-OR', N'Disc Lichen', 35, N'Roofing (Metal)', NULL, 23, 870, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (95, 36, 69, N'SD-01', N'Schied''s Snakeherb', 97, N'Waterproofing & Caulking', NULL, 60, 327, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (96, 17, 70, N'KR-44', N'Heartleaf Foamflower', 65, N'Epoxy Flooring', NULL, 5, 858, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (97, 19, 80, N'PG-WPD', N'Emblic', 102, N'Elevator', NULL, 76, 483, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (98, 1, 121, N'US-CA', N'Midget Quillwort', 24, N'Masonry & Precast', NULL, 91, 639, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (99, 15, 8, N'US-FL', N'Shasta Lupine', 128, N'Doors, Frames & Hardware', NULL, 5, 693, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (100, 10, 132, N'PL-SL', N'Tamarugo', 133, N'Termite Control', N'Soft Flooring and Base', 71, 1061, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (101, 20, 147, N'TC-MC', N'Caper', 114, N'Drilled Shafts', N'Exterior Signage', 21, 369, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (102, 10, 9, N'US-WA', N'Desert Yaupon', 125, N'Plumbing & Medical Gas', N'Structural & Misc Steel Erection', 79, 890, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (103, 25, 145, N'SD-24', N'Showy Orchid', 70, N'Plumbing & Medical Gas', NULL, 29, 510, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (104, 13, 58, N'CA-AB', N'Korean Rockfern', 36, N'Waterproofing & Caulking', NULL, 5, 999, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (105, 4, 36, N'JP-15', N'California Fairypoppy', 129, N'Prefabricated Aluminum Metal Canopies', NULL, 72, 806, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (106, 26, 26, N'CI-01', N'Western Wart Lichen', 81, N'Marlite Panels (FED)', NULL, 43, 685, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (107, 28, 7, N'US-OH', N'Longleaf Buckwheat', 47, N'Electrical and Fire Alarm', N'Waterproofing & Caulking', 97, 1052, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (108, 16, 70, N'CN-35', N'Drummond''s Rockcress', 104, N'Electrical', N'Temp Fencing, Decorative Fencing and Gates', 30, 716, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (109, 41, 88, N'IT-45', N'Descanso Milkvetch', 24, N'Structural and Misc Steel (Fabrication)', NULL, 12, 378, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (110, 31, 111, N'IT-75', N'Chinalaurel', 127, N'Drywall & Acoustical (FED)', NULL, 56, 387, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (111, 38, 107, N'GR-81', N'Gamba-pea', 62, N'Drywall & Acoustical (MOB)', NULL, 32, 73, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (112, 31, 84, N'PA-KY', N'Pyramid Moss', 47, N'Asphalt Paving', NULL, 6, 890, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (113, 25, 48, N'KI-G', N'Goldenweed', 31, N'EIFS', NULL, 7, 1062, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (114, 20, 138, N'BR-SP', N'Browneyed Susan', 110, N'Doors, Frames & Hardware', NULL, 24, 186, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (115, 27, 8, N'MY-13', N'Slender Brake', 98, N'Electrical and Fire Alarm', NULL, 25, 242, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (116, 40, 134, N'CA-NL', N'Idaho Bellflower', 88, N'Marlite Panels (FED)', N'Electrical and Fire Alarm', 50, 621, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (117, 8, 129, N'BR-AM', N'Bigroot Blue-eyed Grass', 33, N'Prefabricated Aluminum Metal Canopies', N'Marlite Panels (FED)', 99, 476, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (118, 34, 76, N'TZ-25', N'Pendant Kihifern', 30, N'Prefabricated Aluminum Metal Canopies', NULL, 92, 550, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (119, 42, 121, N'US-IL', N'Florida Hobblebush', 77, N'Plumbing & Medical Gas', NULL, 72, 564, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (120, 26, 100, N'US-AK', N'Annona', 81, N'Framing (Steel)', N'Asphalt Paving', 76, 828, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (121, 37, 137, N'BO-B', N'Aquilon', 54, N'Roofing (Asphalt)', NULL, 70, 1061, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (122, 8, 9, N'US-CO', N'Pyramid Moss', 24, N'Rebar & Wire Mesh Install', NULL, 5, 481, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (123, 18, 59, N'MA-CAS', N'California Biddy-biddy', 78, N'Structural and Misc Steel (Fabrication)', NULL, 19, 626, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (124, 5, 2, N'AU-WA', N'Hairybeast Turtleback', 46, N'Termite Control', NULL, 7, 268, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (125, 30, 28, N'IR-02', N'Melanelia Lichen', 66, N'Termite Control', NULL, 25, 675, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (126, 33, 147, N'HN-CP', N'Hill''s Lupine', 122, N'Doors, Frames & Hardware', N'Glass & Glazing', 93, 456, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (127, 4, 47, N'GR-82', N'Starfern', 117, N'Roofing (Metal)', N'Prefabricated Aluminum Metal Canopies', 7, 561, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (128, 41, 97, N'CA-QC', N'Lecania Lichen', 79, N'Hard Tile & Stone', NULL, 72, 505, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (129, 7, 23, N'GR-81', N'Prickly Hound''s Tongue', 100, N'Elevator', N'Structural & Misc Steel Erection', 42, 296, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (130, 49, 144, N'US-AK', N'Watercrown Grass', 25, N'Granite Surfaces', N'Drywall & Acoustical (FED)', 59, 1076, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (131, 16, 136, N'AU-QLD', N'Cypresshead Groundcherry', 82, N'Plumbing & Medical Gas', N'Fire Protection', 51, 1100, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (132, 8, 58, N'CA-AB', N'Black Bugbane', 149, N'Curb & Gutter', NULL, 37, 592, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (133, 7, 24, N'GB-ENG', N'Dwarf-flax', 88, N'HVAC', NULL, 86, 127, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (134, 12, 84, N'US-MD', N'Bull Crowngrass', 38, N'Exterior Signage', NULL, 19, 592, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (135, 14, 63, N'US-MS', N'Seaside Buckwheat', 63, N'Fire Sprinkler System', NULL, 36, 665, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (136, 18, 28, N'VN-34', N'Yakama Biscuitroot', 33, N'Masonry', N'Roofing (Asphalt)', 40, 79, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (137, 30, 123, N'JP-13', N'California Biddy-biddy', 30, N'Structural & Misc Steel Erection', NULL, 17, 252, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (138, 31, 137, N'US-TX', N'Cucumis', 89, N'Exterior Signage', N'Temp Fencing, Decorative Fencing and Gates', 88, 943, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (139, 41, 101, N'YE-TA', N'Witch''s Hair Lichen', 53, N'Painting & Vinyl Wall Covering', NULL, 71, 571, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (140, 40, 10, N'EG-MT', N'Lavaflow Nehe', 107, N'Elevator', N'Structural & Misc Steel Erection', 93, 490, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (141, 17, 49, N'CA-NU', N'Threelobe Rosemallow', 124, N'Glass & Glazing', NULL, 69, 155, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (142, 41, 102, N'NZ-CAN', N'Alyssumleaf Phlox', 59, N'Wall Protection', N'Structural & Misc Steel Erection', 45, 480, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (143, 36, 135, N'ID-PA', N'Silverleaf Sunray', 141, N'Roofing (Asphalt)', NULL, 26, 952, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (144, 37, 79, N'CO-CHO', N'Merismatium Lichen', 51, N'HVAC', NULL, 79, 596, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (145, 43, 149, N'MG-U', N'Castle Lake Bedstraw', 102, N'Painting & Vinyl Wall Covering', NULL, 88, 156, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (146, 43, 64, N'AR-P', N'Bog Orchid', 103, N'Ornamental Railings', NULL, 47, 702, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (147, 30, 37, N'ID-PA', N'Hooker''s Matted Lichen', 81, N'Masonry & Precast', NULL, 10, 802, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (148, 16, 27, N'ID-MA', N'Herbst''s Bloodleaf', 53, N'RF Shielding', NULL, 35, 844, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (149, 10, 150, N'UA-32', N'Shaggy Blazing Star', 77, N'Prefabricated Aluminum Metal Canopies', N'Elevator', 20, 457, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (150, 27, 117, N'US-UT', N'Bractless Hedgehyssop', 51, N'Epoxy Flooring', N'Structural & Misc Steel Erection', 95, 55, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (151, 19, 94, N'US-AK', N'Bamboo', 87, N'HVAC', NULL, 84, 311, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (152, 35, 146, N'NP-KO', N'Tundra Sandwort', 109, N'Roofing (Metal)', NULL, 27, 620, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (153, 25, 10, N'KZ-AKM', N'Anderson''s Weissia Moss', 106, N'Glass & Glazing', N'Roofing (Asphalt)', 97, 84, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (154, 22, 73, N'LY-BU', N'Dot Lichen', 47, N'Ornamental Railings', NULL, 10, 400, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (155, 27, 74, N'TL-CO', N'Orthothecium Moss', 67, N'Framing (Steel)', NULL, 86, 520, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (156, 19, 50, N'US-MA', N'Socarrillo', 104, N'Retaining Wall and Brick Pavers', NULL, 68, 126, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (157, 46, 60, N'TN-52', N'Beaked Dodder', 146, N'Temp Fencing, Decorative Fencing and Gates', N'Curb & Gutter', 93, 920, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (158, 20, 122, N'CD-KW', N'Swordbush', 92, N'Electrical and Fire Alarm', NULL, 67, 571, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (159, 26, 25, N'CO-VAU', N'Robbins'' Phacelia', 54, N'Marlite Panels (FED)', N'Framing (Wood)', 44, 466, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (160, 19, 15, N'US-AK', N'Sticky Chinese Houses', 76, N'Granite Surfaces', NULL, 19, 892, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (161, 30, 4, N'CL-TA', N'Purplestem Shoestring Fern', 26, N'Wall Protection', NULL, 52, 440, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (162, 35, 2, N'PE-TAC', N'Prince Albert''s Yew', 91, N'Soft Flooring and Base', NULL, 18, 544, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (163, 34, 9, N'DE-NW', N'Twoheaded Water-starwort', 88, N'Casework', N'Site Furnishings', 56, 877, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (164, 19, 46, N'US-AK', N'Floerkea', 75, N'Casework', NULL, 56, 807, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (165, 34, 6, N'BR-AM', N'Buchu', 71, N'Glass & Glazing', NULL, 41, 390, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (166, 41, 92, N'MN-041', N'Milkbush', 59, N'Drywall & Acoustical (MOB)', N'Electrical and Fire Alarm', 26, 781, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (167, 30, 108, N'JP-15', N'Annual Polemonium', 120, N'Framing (Wood)', NULL, 86, 434, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (168, 50, 100, N'PG-SAN', N'Oriental Wheat', 32, N'Ornamental Railings', NULL, 71, 989, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (169, 47, 85, N'US-MI', N'Cupseed', 44, N'Masonry & Precast', NULL, 21, 502, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (170, 40, 88, N'PG-WPD', N'Risdon Peppermint Gum', 39, N'Landscaping & Irrigation', N'Structural and Misc Steel (Fabrication)', 51, 234, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (171, 50, 118, N'ZA-NL', N'Pylaisiella Moss', 89, N'HVAC', NULL, 62, 807, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (172, 2, 96, N'DE-NW', N'Wiry Snapdragon', 51, N'Waterproofing & Caulking', NULL, 14, 731, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (173, 50, 6, N'US-TX', N'Fendler''s Brickellbush', 99, N'Roofing (Asphalt)', NULL, 92, 1050, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (174, 31, 30, N'BR-MS', N'Dehesa Beargrass', 74, N'Wall Protection', NULL, 17, 1000, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (175, 35, 144, N'US-WA', N'Big-sage', 96, N'Prefabricated Aluminum Metal Canopies', N'Ornamental Railings', 90, 310, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (176, 7, 28, N'CD-BC', N'Purple Morning-glory', 60, N'Fire Sprinkler System', NULL, 81, 521, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (177, 41, 90, N'VU-SAM', N'Tioga Gentian', 147, N'Plumbing & Medical Gas', N'Elevator', 9, 416, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (178, 24, 110, N'TZ-13', N'''awiwi', 27, N'Structural and Misc Steel (Fabrication)', NULL, 63, 622, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (179, 43, 135, N'GB-ENG', N'Hydnocarpus', 59, N'Wall Protection', NULL, 86, 436, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (180, 47, 136, N'GB-SCT', N'Purple Cyanea', 149, N'Framing (Steel)', NULL, 99, 545, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (181, 37, 7, N'US-IN', N'Santa Rita Mountain Yellowshow', 74, N'Temp Fencing, Decorative Fencing and Gates', NULL, 83, 211, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (182, 39, 38, N'NO-15', N'Harper''s Dodder', 124, N'Roofing (Metal)', NULL, 18, 200, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (183, 46, 24, N'CA-QC', N'Clustered Mountainmint', 72, N'Elevator', NULL, 49, 804, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (184, 36, 146, N'MX-CAM', N'Myrobalan', 39, N'Waterproofing & Caulking', NULL, 86, 560, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (185, 36, 129, N'HN-CR', N'Goldenrod', 122, N'EIFS', N'Plumbing & Medical Gas', 66, 1061, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (186, 23, 63, N'GB-ENG', N'Flat Pea', 20, N'Electrical', NULL, 83, 606, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (187, 22, 110, N'SN-TC', N'Hopea', 71, N'Hard Tile & Stone', NULL, 55, 848, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (188, 29, 44, N'US-MT', N'Threepetal Bedstraw', 145, N'Asphalt Paving', NULL, 75, 514, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (189, 26, 74, N'US-AZ', N'Lecania Lichen', 119, N'Overhead Doors', NULL, 69, 252, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (190, 4, 77, N'EG-KN', N'Barbula Moss', 42, N'Painting & Vinyl Wall Covering', N'Hard Tile & Stone', 83, 580, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (191, 19, 56, N'US-CT', N'Spanish Bayonet', 29, N'Fire Protection', NULL, 99, 622, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (192, 22, 128, N'US-CA', N'Alexandra Palm', 68, N'Rebar & Wire Mesh Install', NULL, 13, 132, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (193, 32, 106, N'CA-NT', N'Jared''s Pepperweed', 53, N'Site Furnishings', NULL, 59, 392, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (194, 38, 119, N'BR-SP', N'Acacia Fringedfern', 89, N'Exterior Signage', N'Drywall & Acoustical (MOB)', 68, 1080, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (195, 45, 35, N'ID-MA', N'Peruvian Muhly', 83, N'Exterior Signage', NULL, 77, 768, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (196, 14, 137, N'OM-SH', N'Valley Schiedea', 87, N'Structural & Misc Steel Erection', N'Framing (Steel)', 98, 443, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (197, 28, 41, N'FI-OL', N'Bentspur Orchid', 146, N'Drywall & Acoustical (MOB)', NULL, 53, 671, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (198, 44, 3, N'CA-NU', N'Foxtail Sedge', 142, N'Drywall & Acoustical (FED)', N'Retaining Wall and Brick Pavers', 97, 1017, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (199, 7, 59, N'UY-RV', N'Carquinez Goldenbush', 59, N'Wall Protection', N'Prefabricated Aluminum Metal Canopies', 88, 614, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (200, 33, 100, N'TH-58', N'Northern Spicebush', 72, N'Fire Sprinkler System', NULL, 16, 600, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (201, 30, 116, N'CA-NU', N'Woolly Blackberry', 65, N'Painting & Vinyl Wall Covering', NULL, 70, 111, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (202, 14, 58, N'US-TN', N'Showy Maiden Fern', 49, N'Marlite Panels (FED)', NULL, 95, 765, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (203, 41, 120, N'CA-SK', N'Northern Eyebright', 112, N'Wall Protection', NULL, 35, 409, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (204, 28, 1, N'US-NM', N'Shortleaf Jefea', 86, N'HVAC', N'Glass & Glazing', 19, 113, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (205, 6, 113, N'BR-MG', N'Pequi', 98, N'Elevator', N'Retaining Wall and Brick Pavers', 40, 989, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (206, 44, 80, N'US-NE', N'Rangoon Creeper', 55, N'Drilled Shafts', NULL, 79, 1052, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (207, 34, 29, N'AR-B', N'Lama', 104, N'Termite Control', NULL, 4, 696, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (208, 10, 143, N'MX-OAX', N'Palmleaf Rockcap Fern', 43, N'HVAC', NULL, 82, 342, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (209, 14, 27, N'US-AK', N'Scadden Flat Checkerbloom', 143, N'Construction Clean and Final Clean', NULL, 25, 448, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (210, 32, 106, N'US-NV', N'Maidenplum', 134, N'Landscaping & Irrigation', N'Masonry', 18, 336, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (211, 28, 132, N'DE-NI', N'Miquel''s Spicywintergreen', 46, N'Fire Sprinkler System', NULL, 69, 319, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (212, 15, 47, N'CO-ANT', N'Spring Phacelia', 114, N'Rebar & Wire Mesh Install', NULL, 40, 298, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (213, 20, 147, N'SE-Y', N'Roell''s Moss', 79, N'RF Shielding', NULL, 64, 909, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (214, 50, 94, N'MX-SLP', N'Shoofly', 107, N'Ornamental Railings', NULL, 34, 1093, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (215, 3, 42, N'FJ-R', N'Tweedy''s Ivesia', 58, N'Retaining Wall and Brick Pavers', N'Wall Protection', 24, 972, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (216, 26, 90, N'CN-32', N'Pine Violet', 81, N'Structural & Misc Steel Erection', N'Elevator', 35, 65, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (217, 45, 29, N'CN-13', N'Lotebush', 120, N'Soft Flooring and Base', N'Drywall & Acoustical (MOB)', 68, 895, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (218, 32, 1, N'FR-E', N'Heavy Sedge', 81, N'Exterior Signage', NULL, 75, 655, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (219, 18, 32, N'LA-LP', N'Sacramento Waxydogbane', 94, N'Fire Protection', NULL, 79, 594, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (220, 30, 9, N'US-MT', N'Pinesap', 29, N'Sitework & Site Utilities', NULL, 7, 736, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (221, 22, 104, N'KI-G', N'Subalpine Lupine', 128, N'Hard Tile & Stone', N'Drywall & Acoustical (FED)', 56, 943, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (222, 25, 111, N'CA-AB', N'Campylopus Moss', 84, N'Fire Protection', N'Roofing (Metal)', 88, 839, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (223, 25, 68, N'US-NJ', N'Common Gorse', 61, N'Fire Protection', N'Structural and Misc Steel (Fabrication)', 12, 518, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (224, 24, 125, N'CA-BC', N'Long-scape Iris', 57, N'Termite Control', N'Roofing (Asphalt)', 65, 57, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (225, 4, 28, N'BR-TO', N'Giant Salvinia', 44, N'Marlite Panels (FED)', NULL, 48, 1033, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (226, 18, 2, N'IS-4', N'Polysporina Lichen', 80, N'Hard Tile & Stone', N'Masonry & Precast', 10, 984, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (227, 6, 42, N'US-AK', N'Oval-leaf Blueberry', 66, N'Doors, Frames & Hardware', N'Granite Surfaces', 33, 478, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (228, 32, 106, N'AU-NSW', N'Neomarica', 62, N'Plumbing & Medical Gas', NULL, 47, 286, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (229, 1, 67, N'CN-62', N'Engelmann''s Bladderpod', 73, N'Fire Protection', N'Granite Surfaces', 48, 809, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (230, 40, 146, N'AU-QLD', N'Inland Bluegrass', 35, N'Landscaping & Irrigation', NULL, 74, 252, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (231, 36, 78, N'TO-05', N'Necklace Spike Sedge', 52, N'Plumbing & Medical Gas', N'Drilled Shafts', 19, 877, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (232, 33, 41, N'AU-NSW', N'Styrax', 116, N'Doors, Frames & Hardware', N'Structural and Misc Steel (Fabrication)', 32, 802, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (233, 34, 12, N'PG-MPL', N'Rio Grande Tickseed', 93, N'Temp Fencing, Decorative Fencing and Gates', NULL, 43, 702, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (234, 24, 5, N'US-NY', N'Glenwood Springs Rockcress', 66, N'EIFS', N'Sitework & Site Utilities', 29, 439, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (235, 37, 97, N'US-WV', N'Rhizoma Peanut', 144, N'Electrical and Fire Alarm', N'Termite Control', 69, 865, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (236, 35, 150, N'PT-20', N'Dwarf Popcornflower', 68, N'Framing (Wood)', NULL, 27, 927, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (237, 48, 14, N'US-TX', N'Sticky Chinese Houses', 81, N'Marlite Panels (FED)', N'Roofing (Metal)', 62, 392, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (238, 14, 71, N'GR-56', N'Giant Spanish Needle', 150, N'Fire Protection', N'Painting & Vinyl Wall Covering', 64, 510, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (239, 34, 118, N'GN-K', N'Threestamen Waterwort', 44, N'Sitework & Site Utilities', NULL, 91, 71, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (240, 26, 63, N'US-AZ', N'Mealy Fumewort', 49, N'Painting & Vinyl Wall Covering', N'Plumbing & Medical Gas', 87, 94, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (241, 7, 98, N'ID-PA', N'Peirson''s Springbeauty', 142, N'Curb & Gutter', N'RF Shielding', 48, 341, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (242, 2, 110, N'ID-KB', N'Orchis', 20, N'RF Shielding', NULL, 36, 385, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (243, 45, 9, N'BR-MA', N'Waihanau Lobelia', 106, N'Sitework & Site Utilities', NULL, 61, 661, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (244, 1, 129, N'FR-D', N'Confederate Huckleberry', 30, N'Soft Flooring and Base', N'Hard Tile & Stone', 4, 489, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (245, 32, 111, N'KZ-AKM', N'Porter''s Sunflower', 113, N'Granite Surfaces', NULL, 42, 423, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (246, 9, 67, N'IT-21', N'San Joaquin Tarweed', 34, N'Structural & Misc Steel Erection', NULL, 90, 114, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (247, 30, 96, N'PE-PIU', N'Dutchman''s Breeches', 101, N'HVAC', NULL, 33, 141, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (248, 16, 73, N'BR-SP', N'Orthotrichum Moss', 73, N'Termite Control', NULL, 60, 796, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (249, 18, 101, N'CG-14', N'Diphysa', 103, N'Temp Fencing, Decorative Fencing and Gates', NULL, 4, 1005, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (250, 44, 19, N'CA-AB', N'Candelabra Aloe', 50, N'Painting & Vinyl Wall Covering', NULL, 14, 156, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (251, 31, 126, N'SE-AC', N'Flagstaff Ragwort', 110, N'Asphalt Paving', N'Electrical', 9, 726, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (252, 50, 55, N'US-UT', N'Green-winged Orchid', 116, N'Retaining Wall and Brick Pavers', NULL, 23, 492, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (253, 24, 75, N'US-VT', N'Brown Bentgrass', 150, N'Electrical and Fire Alarm', N'Fire Protection', 21, 856, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (254, 3, 53, N'BR-PR', N'Bejuco De Alambre', 103, N'Temp Fencing, Decorative Fencing and Gates', NULL, 61, 911, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (255, 12, 22, N'AU-QLD', N'Star Of Bethlehem', 47, N'Site Furnishings', NULL, 48, 713, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (256, 3, 21, N'US-MT', N'Puahekili', 149, N'Fire Sprinkler System', N'Casework', 32, 953, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (257, 9, 35, N'US-AK', N'Silver Fir', 29, N'Drywall & Acoustical (FED)', NULL, 41, 1012, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (258, 15, 84, N'UA-14', N'Paraguayan Windmill Grass', 35, N'Structural and Misc Steel (Fabrication)', N'Doors, Frames & Hardware', 45, 524, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (259, 37, 146, N'RU-CHU', N'Lemmon''s Rockcress', 94, N'Site Furnishings', NULL, 40, 87, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (260, 32, 106, N'FM-YAP', N'Snow Lichen', 80, N'Glass & Glazing', NULL, 27, 55, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (261, 14, 14, N'BR-RS', N'White Vervain', 56, N'Soft Flooring and Base', NULL, 12, 463, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (262, 1, 147, N'FR-H', N'Common Duckmeat', 102, N'Electrical', NULL, 76, 104, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (263, 16, 98, N'BD-5', N'Texas Crested Coralroot', 93, N'Curb & Gutter', NULL, 97, 944, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (264, 18, 17, N'NP-SE', N'Stylophorum', 96, N'Temp Fencing, Decorative Fencing and Gates', NULL, 86, 898, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (265, 8, 87, N'KY-U-A', N'Yellow Himalayan Raspberry', 56, N'Exterior Signage', NULL, 88, 916, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (266, 33, 33, N'IT-82', N'Moroccan Toadflax', 66, N'Overhead Doors', NULL, 24, 700, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (267, 31, 93, N'IE-D', N'Rockyscree False Goldenaster', 20, N'Electrical and Fire Alarm', N'Overhead Doors', 59, 145, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (268, 15, 105, N'US-GA', N'Perry''s Aloe', 63, N'Framing (Steel)', N'Construction Clean and Final Clean', 55, 698, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (269, 43, 11, N'PG-NSB', N'Waxflower', 90, N'Framing (Wood)', N'Construction Clean and Final Clean', 22, 983, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (270, 3, 34, N'PT-11', N'St. Catherine''s Lace', 53, N'Casework', NULL, 83, 258, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (271, 26, 73, N'CU-07', N'Hypoderris', 121, N'Casework', N'Waterproofing & Caulking', 9, 500, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (272, 2, 23, N'LY-NL', N'Paper Birch', 74, N'Epoxy Flooring', NULL, 82, 979, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (273, 17, 42, N'AU-QLD', N'Egg Milkvetch', 43, N'Epoxy Flooring', NULL, 33, 918, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (274, 8, 39, N'LS-H', N'Nettleleaf Noseburn', 80, N'Epoxy Flooring', NULL, 88, 1069, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (275, 19, 100, N'US-ID', N'Wreath Lichen', 24, N'Soft Flooring and Base', NULL, 74, 567, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (276, 33, 59, N'MX-BCS', N'Dotted Lichen', 136, N'Epoxy Flooring', N'Roofing (Asphalt)', 56, 920, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (277, 39, 114, N'CA-NT', N'Tetracarpidium', 72, N'Framing (Steel)', NULL, 66, 262, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (278, 4, 22, N'IE-C', N'Agroelymus', 37, N'Ornamental Railings', NULL, 8, 604, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (279, 22, 11, N'BR-MT', N'Albizia', 22, N'Overhead Doors', N'Asphalt Paving', 99, 811, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (280, 16, 74, N'NL-NH', N'Southern Honeysuckle', 44, N'Exterior Signage', N'Structural and Misc Steel (Fabrication)', 83, 63, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (281, 43, 84, N'CA-ON', N'Redpod Stonecrop', 110, N'Electrical', NULL, 90, 467, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (282, 20, 77, N'CO-MET', N'Loxospora Lichen', 109, N'Temp Fencing, Decorative Fencing and Gates', NULL, 87, 147, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (283, 41, 98, N'DZ-22', N'Wild Potato', 47, N'Sitework & Site Utilities', N'Elevator', 29, 112, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (284, 26, 47, N'MA-TIZ', N'Ternate Buckwheat', 109, N'Construction Clean and Final Clean', N'Roofing (Metal)', 32, 851, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (285, 14, 39, N'CL-MA', N'Santa Barbara Milkvetch', 138, N'Landscaping & Irrigation', N'Hard Tile & Stone', 19, 776, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (286, 31, 141, N'MM-11', N'Club Spikemoss', 67, N'Structural and Misc Steel (Fabrication)', N'Termite Control', 16, 814, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (287, 23, 73, N'MR-02', N'Northern Meadowsweet', 114, N'Masonry', N'Roofing (Asphalt)', 73, 102, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (288, 23, 131, N'BS-AC', N'Bruised Lichen', 31, N'Curb & Gutter', N'Drilled Shafts', 15, 379, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (289, 28, 116, N'MG-A', N'Scorpidium Moss', 31, N'Painting & Vinyl Wall Covering', NULL, 78, 154, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (290, 30, 91, N'AD-07', N'Stewart''s Little Walnut', 59, N'RF Shielding', N'Fire Protection', 32, 182, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (291, 39, 82, N'YE-AD', N'Mexican Hedgenettle', 47, N'Ornamental Railings', N'Ornamental Railings', 54, 706, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (292, 20, 143, N'PM-SP', N'Beard Lichen', 57, N'Masonry', NULL, 70, 439, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (293, 27, 25, N'CI-19', N'Hybrid Hickory', 21, N'Soft Flooring and Base', NULL, 71, 280, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (294, 24, 138, N'AU-NT', N'Oysternut', 35, N'Plumbing & Medical Gas', NULL, 93, 891, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (295, 32, 150, N'LR-MO', N'Kaibab Spinystar', 69, N'Doors, Frames & Hardware', N'Site Furnishings', 97, 457, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (296, 16, 32, N'CN-13', N'Fox Grape', 144, N'Structural & Misc Steel Erection', NULL, 29, 936, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (297, 9, 105, N'NO-08', N'Carpet Phlox', 83, N'Framing (Steel)', NULL, 17, 578, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (298, 26, 147, N'CU-11', N'Small Black Blueberry', 44, N'Soft Flooring and Base', N'Overhead Doors', 87, 178, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (299, 48, 3, N'US-SC', N'Bristly Nootka Rose', 36, N'Masonry & Precast', N'Retaining Wall and Brick Pavers', 60, 1038, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (300, 6, 127, N'IN-TR', N'Goldenwave Tickseed', 67, N'Granite Surfaces', NULL, 35, 740, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (301, 17, 25, N'TH-83', N'Pucciphippsia', 57, N'Soft Flooring and Base', NULL, 74, 826, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (302, 18, 54, N'BR-MG', N'Jamaican Broom', 97, N'Curb & Gutter', NULL, 78, 1055, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (303, 4, 4, N'BR-PI', N'Horsehair Lichen', 119, N'Exterior Signage', N'Casework', 72, 377, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (304, 33, 145, N'AU-NT', N'Tropical Sensitive Pea', 103, N'Roofing (Metal)', N'Exterior Signage', 9, 62, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (305, 12, 98, N'PE-PIU', N'Aiken Hawthorn', 73, N'Asphalt Paving', NULL, 6, 406, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (306, 48, 64, N'FR-S', N'Shorthair Reedgrass', 83, N'Elevator', NULL, 88, 329, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (307, 45, 74, N'SA-08', N'Haplopappus', 35, N'Drywall & Acoustical (MOB)', NULL, 50, 670, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (308, 36, 45, N'US-AK', N'Pagosa Springs Bladderpod', 26, N'Granite Surfaces', NULL, 80, 997, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (309, 5, 103, N'PY-12', N'Sawtooth Sage', 107, N'Exterior Signage', NULL, 37, 614, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (310, 14, 60, N'RU-SA', N'Anacamptodon Moss', 59, N'RF Shielding', N'Painting & Vinyl Wall Covering', 21, 774, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (311, 31, 39, N'BR-RS', N'False Croton', 97, N'EIFS', NULL, 42, 876, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (312, 7, 92, N'NO-12', N'Nodding Brome', 143, N'Construction Clean and Final Clean', NULL, 81, 836, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (313, 40, 5, N'IN-TR', N'Wyoming Sand Verbena', 86, N'Ornamental Railings', N'HVAC', 100, 585, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (314, 24, 10, N'GY-UT', N'Subalpine Draba', 35, N'Ornamental Railings', NULL, 91, 737, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (315, 10, 60, N'US-AL', N'Orange Lichen', 45, N'Casework', N'Rebar & Wire Mesh Install', 88, 573, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (316, 19, 41, N'PH-NSA', N'Elegant Milkvetch', 37, N'Overhead Doors', NULL, 31, 1026, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (317, 28, 9, N'SO-TO', N'Sierra Beardtongue', 88, N'Overhead Doors', N'Landscaping & Irrigation', 33, 915, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (318, 13, 87, N'DE-NI', N'Domingoa', 139, N'Granite Surfaces', NULL, 15, 1047, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (319, 13, 56, N'NZ-WGN', N'Gale Of The Wind', 102, N'Drilled Shafts', NULL, 43, 358, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (320, 11, 81, N'US-GA', N'Florida False Sunflower', 42, N'HVAC', N'Drywall & Acoustical (MOB)', 80, 546, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (321, 44, 97, N'GH-WP', N'Common Juniper', 127, N'Electrical and Fire Alarm', NULL, 23, 478, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (322, 24, 135, N'TD-BA', N'Prairie Bluebells', 47, N'Granite Surfaces', NULL, 45, 488, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (323, 46, 31, N'US-FL', N'Bearded Sprangletop', 146, N'Masonry & Precast', NULL, 77, 261, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (324, 28, 95, N'RU-AST', N'Chocolate Vine', 95, N'Soft Flooring and Base', N'Framing (Wood)', 6, 140, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (325, 18, 102, N'CL-MA', N'Dotted Fern', 137, N'Structural and Misc Steel (Fabrication)', NULL, 5, 166, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (326, 3, 51, N'US-AK', N'Lescur''s Platylomella Moss', 80, N'RF Shielding', N'Fire Protection', 16, 855, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (327, 9, 89, N'US-NE', N'Yellow Evening Primrose', 106, N'Construction Clean and Final Clean', NULL, 79, 269, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (328, 31, 124, N'US-FL', N'Common Butterwort', 131, N'Landscaping & Irrigation', NULL, 27, 875, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (329, 48, 58, N'BS-NP', N'Baillonella', 97, N'Hard Tile & Stone', NULL, 46, 453, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (330, 4, 132, N'JP-27', N'Pale Evening Primrose', 59, N'Wall Protection', NULL, 85, 1087, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (331, 36, 128, N'IN-AP', N'Taro', 135, N'Ornamental Railings', NULL, 42, 1048, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (332, 43, 25, N'KH-15', N'Rock Goldenrod', 37, N'Granite Surfaces', N'Framing (Wood)', 30, 986, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (333, 17, 40, N'US-AK', N'Muir''s Reedgrass', 118, N'Epoxy Flooring', N'Waterproofing & Caulking', 27, 970, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (334, 19, 1, N'US-AK', N'Tripterocladium Moss', 43, N'Construction Clean and Final Clean', N'Elevator', 10, 820, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (335, 10, 139, N'US-OK', N'Climbing Dayflower', 133, N'Roofing (Asphalt)', NULL, 31, 698, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (336, 10, 113, N'VE-G', N'Sawara-cypress', 103, N'Retaining Wall and Brick Pavers', NULL, 95, 818, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (337, 37, 28, N'RU-KHM', N'Kirschsteiniothelia Lichen', 132, N'Roofing (Asphalt)', NULL, 41, 919, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (338, 23, 147, N'LT-SA', N'Star Of Bethlehem', 125, N'Sitework & Site Utilities', NULL, 34, 220, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (339, 23, 98, N'MA-BAH', N'Elderberry', 75, N'Elevator', NULL, 77, 428, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (340, 3, 18, N'US-AK', N'Lindsaeosoria', 49, N'Wall Protection', NULL, 8, 1091, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (341, 43, 74, N'US-CA', N'Capillary Hairsedge', 35, N'Drywall & Acoustical (FED)', NULL, 42, 848, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (342, 24, 20, N'CN-15', N'Zulu Fescue', 35, N'Construction Clean and Final Clean', NULL, 74, 421, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (343, 5, 55, N'BO-B', N'Maui Bur Cucumber', 20, N'Asphalt Paving', N'Fire Protection', 63, 652, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (344, 37, 27, N'WF-U-A', N'Red Cyphomeris', 51, N'Electrical and Fire Alarm', NULL, 44, 907, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (345, 44, 33, N'PK-TA', N'Calymperes Moss', 33, N'Masonry & Precast', NULL, 71, 169, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (346, 29, 12, N'ET-AM', N'Hawthorn', 140, N'Electrical and Fire Alarm', NULL, 28, 360, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (347, 9, 15, N'AU-QLD', N'Monte Neva Indian Paintbrush', 99, N'HVAC', NULL, 26, 1023, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (348, 7, 114, N'BR-BA', N'White Mountain Lupine', 90, N'Ornamental Railings', NULL, 58, 863, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (349, 24, 82, N'PG-SAN', N'Intermountain Mousetail', 88, N'Casework', NULL, 69, 1042, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (350, 44, 144, N'ID-JI', N'Upright Sedge', 60, N'Drilled Shafts', N'Epoxy Flooring', 4, 1078, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (351, 15, 96, N'GT-ES', N'Palmate Toothwort', 44, N'Drywall & Acoustical (FED)', NULL, 83, 938, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (352, 35, 92, N'BJ-BO', N'Staghorn Clubmoss', 139, N'HVAC', NULL, 65, 405, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (353, 42, 113, N'CA-QC', N'Tall Thimbleweed', 22, N'Structural and Misc Steel (Fabrication)', N'Prefabricated Aluminum Metal Canopies', 68, 713, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (354, 29, 18, N'BR-BA', N'Tulip', 113, N'Prefabricated Aluminum Metal Canopies', NULL, 32, 258, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (355, 35, 24, N'AO-CUS', N'Acaulon Moss', 85, N'Roofing (Metal)', NULL, 18, 1043, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (356, 7, 85, N'MX-MEX', N'Dragonhead', 142, N'Soft Flooring and Base', N'Masonry & Precast', 17, 535, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (357, 8, 79, N'BD-5', N'Bog Yelloweyed Grass', 127, N'Doors, Frames & Hardware', NULL, 16, 522, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (358, 8, 146, N'CR-G', N'Fontinalis Moss', 68, N'Retaining Wall and Brick Pavers', N'Framing (Steel)', 8, 118, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (359, 22, 35, N'CD-BN', N'Scarlet Lady''s Tresses', 39, N'Doors, Frames & Hardware', N'Wall Protection', 18, 329, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (360, 27, 129, N'SE-Z', N'Spurge', 63, N'Drilled Shafts', N'Epoxy Flooring', 90, 90, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (361, 7, 3, N'CA-BC', N'Catalina Island Mountain Mahogany', 67, N'Overhead Doors', NULL, 84, 853, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (362, 3, 62, N'TD-SA', N'Rosette Lichen', 53, N'Drywall & Acoustical (MOB)', N'Prefabricated Aluminum Metal Canopies', 77, 630, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (363, 16, 26, N'IN-HP', N'Desert Rose', 73, N'Epoxy Flooring', NULL, 89, 643, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (364, 9, 72, N'AU-QLD', N'Longbract Wild Indigo', 54, N'Roofing (Metal)', NULL, 10, 417, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (365, 11, 12, N'ZA-NP', N'Gray Sheoak', 43, N'Hard Tile & Stone', N'Epoxy Flooring', 75, 993, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (366, 26, 41, N'US-ME', N'Ulota Moss', 43, N'Construction Clean and Final Clean', N'Drywall & Acoustical (FED)', 6, 811, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (367, 9, 15, N'RU-YAN', N'Hawkweed', 40, N'Framing (Wood)', NULL, 85, 1089, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (368, 12, 31, N'ET-SO', N'Peruvian Feathergrass', 131, N'Ornamental Railings', NULL, 86, 504, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (369, 38, 3, N'US-MO', N'Rosepink', 120, N'Overhead Doors', N'Landscaping & Irrigation', 72, 593, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (370, 34, 95, N'GB-ENG', N'Sessileleaf Bellwort', 26, N'Drywall & Acoustical (FED)', N'Overhead Doors', 31, 1013, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (371, 21, 23, N'BR-MG', N'Tanners Canyon Onion', 44, N'Casework', NULL, 78, 53, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (372, 1, 128, N'TH-30', N'Rock Ragwort', 69, N'Landscaping & Irrigation', NULL, 60, 159, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (373, 19, 64, N'TW-TXG', N'Chinese-pepper', 115, N'Overhead Doors', NULL, 62, 681, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (374, 40, 5, N'EC-S', N'Thelocactus', 129, N'Framing (Wood)', NULL, 63, 319, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (375, 22, 150, N'CN-54', N'Bulrush', 148, N'Sitework & Site Utilities', NULL, 53, 701, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (376, 50, 16, N'CG-8', N'California Hesperochiron', 109, N'Termite Control', NULL, 42, 1023, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (377, 26, 99, N'US-MA', N'Undulate Plagiothecium Moss', 106, N'Soft Flooring and Base', NULL, 82, 874, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (378, 37, 6, N'US-IA', N'Mountain Ball Cactus', 40, N'Drywall & Acoustical (FED)', NULL, 71, 1073, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (379, 14, 16, N'MO-U-A', N'Sphinctrina Lichen', 148, N'Roofing (Asphalt)', NULL, 40, 316, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (380, 12, 34, N'ID-KI', N'Red Bloodwood', 64, N'Casework', N'Retaining Wall and Brick Pavers', 11, 133, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (381, 29, 117, N'BR-AC', N'Starflower', 85, N'Ornamental Railings', NULL, 44, 666, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (382, 11, 27, N'PA-8', N'West Indian Tonguefern', 145, N'Drywall & Acoustical (FED)', N'Electrical', 82, 215, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (383, 46, 26, N'MH-ALL', N'Curvenut Combseed', 74, N'Hard Tile & Stone', NULL, 55, 136, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (384, 2, 53, N'ZW-MV', N'Goosefoot Violet', 128, N'Elevator', N'Glass & Glazing', 15, 811, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (385, 4, 108, N'PG-WPD', N'Disk Waterhyssop', 68, N'Site Furnishings', N'Soft Flooring and Base', 56, 555, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (386, 25, 72, N'US-OK', N'Stringy Stonecrop', 31, N'Termite Control', NULL, 94, 909, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (387, 3, 129, N'CA-QC', N'Whiteflower Kurrajong', 117, N'Hard Tile & Stone', N'Fire Sprinkler System', 66, 902, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (388, 3, 87, N'BF-SEN', N'Dubautia', 21, N'Framing (Steel)', NULL, 99, 1041, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (389, 1, 36, N'US-TN', N'Nuttall''s Linanthus', 46, N'Glass & Glazing', NULL, 66, 295, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (390, 33, 10, N'PH-BOH', N'Hierba Del Soldado', 35, N'Framing (Steel)', N'Elevator', 71, 151, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (391, 36, 136, N'CN-51', N'Allicoche Hedgehog Cactus', 59, N'Roofing (Asphalt)', NULL, 47, 461, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (392, 21, 44, N'PG-WPD', N'Sorbaronia', 32, N'Framing (Steel)', N'EIFS', 52, 731, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (393, 19, 90, N'US-CA', N'Oregon Stonecrop', 57, N'Prefabricated Aluminum Metal Canopies', N'Curb & Gutter', 100, 231, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (394, 38, 41, N'AU-WA', N'Woodside Buckwheat', 24, N'Framing (Steel)', NULL, 40, 272, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (395, 41, 150, N'PG-MPL', N'Kidney Lichen', 107, N'Ornamental Railings', NULL, 60, 74, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (396, 18, 121, N'EG-KN', N'Martagon Lily', 80, N'Marlite Panels (FED)', NULL, 77, 147, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (397, 36, 6, N'VE-G', N'Arboles Milkvetch', 118, N'Rebar & Wire Mesh Install', NULL, 36, 788, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (398, 15, 2, N'US-AK', N'Philodendron', 96, N'Structural and Misc Steel (Fabrication)', NULL, 66, 585, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (399, 3, 69, N'CN-32', N'Sharpleaf Baby''s-breath', 94, N'Sitework & Site Utilities', NULL, 96, 682, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (400, 37, 18, N'BW-KG', N'Kamchatka Rhododendron', 140, N'Waterproofing & Caulking', NULL, 17, 115, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (401, 17, 41, N'CO-MET', N'Morning Glory', 75, N'Drilled Shafts', N'Hard Tile & Stone', 53, 239, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (402, 29, 31, N'DE-MV', N'Deam''s Goldenrod', 22, N'Drywall & Acoustical (FED)', N'Framing (Steel)', 65, 999, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (403, 27, 115, N'US-CA', N'Turk''s Cap', 93, N'Masonry & Precast', NULL, 61, 222, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (404, 30, 20, N'CO-CUN', N'Map Lichen', 50, N'Structural and Misc Steel (Fabrication)', NULL, 21, 805, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (405, 4, 65, N'CO-VAC', N'Dune Fescue', 38, N'Construction Clean and Final Clean', NULL, 83, 197, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (406, 34, 45, N'US-NC', N'Mountainside Indian Paintbrush', 147, N'Prefabricated Aluminum Metal Canopies', N'RF Shielding', 24, 416, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (407, 5, 24, N'NP-NA', N'Colorado Woodrush', 145, N'Sitework & Site Utilities', NULL, 70, 259, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (408, 24, 50, N'MA-CAS', N'Passionflower', 125, N'Electrical', NULL, 54, 82, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (409, 50, 142, N'NP-SE', N'Winter Daffodil', 84, N'Framing (Wood)', N'Sitework & Site Utilities', 100, 251, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (410, 11, 54, N'CA-MB', N'Giant Milkweed', 127, N'Asphalt Paving', NULL, 60, 606, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (411, 50, 58, N'NZ-WTC', N'Maluco', 66, N'Plumbing & Medical Gas', NULL, 66, 393, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (412, 39, 71, N'FR-J', N'Coulter''s Lupine', 114, N'Drilled Shafts', NULL, 89, 493, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (413, 16, 142, N'US-FL', N'Yellow Owl''s-clover', 116, N'Framing (Wood)', N'Masonry & Precast', 83, 1097, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (414, 45, 78, N'ID-MA', N'Florida Sphagnum', 34, N'Electrical', N'Electrical and Fire Alarm', 9, 720, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (415, 15, 40, N'TN-72', N'Johnnyberry', 132, N'Asphalt Paving', NULL, 63, 797, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (416, 11, 109, N'BR-PA', N'Maritime Saltbush', 30, N'Termite Control', NULL, 51, 637, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (417, 20, 29, N'US-AK', N'Caimitillo Verde', 25, N'Drywall & Acoustical (FED)', NULL, 33, 67, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (418, 31, 37, N'CA-AB', N'Hollowheart', 111, N'Landscaping & Irrigation', NULL, 10, 979, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (419, 42, 118, N'PG-GPK', N'Thickhead Sedge', 65, N'Construction Clean and Final Clean', NULL, 77, 103, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (420, 50, 56, N'US-AK', N'Bull Thistle', 74, N'Structural and Misc Steel (Fabrication)', NULL, 60, 103, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (421, 50, 149, N'AU-WA', N'Watson''s Amaranth', 64, N'Fire Protection', NULL, 15, 874, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (422, 5, 61, N'VN-34', N'Lepisorus', 60, N'Framing (Steel)', NULL, 78, 592, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (423, 22, 94, N'US-PA', N'Cusick''s Hawksbeard', 30, N'Hard Tile & Stone', NULL, 78, 507, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (424, 34, 8, N'MR-07', N'Tiger Lily', 61, N'Elevator', N'Fire Protection', 23, 990, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (425, 6, 141, N'CA-NT', N'Grass Pea', 79, N'Prefabricated Aluminum Metal Canopies', NULL, 91, 1031, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (426, 17, 145, N'AU-QLD', N'Dwarf Mock Orange', 129, N'Electrical', NULL, 10, 268, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (427, 31, 50, N'US-MS', N'Miracle Fruit', 99, N'Hard Tile & Stone', NULL, 23, 569, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (428, 43, 19, N'US-TX', N'Umbrella-tree', 72, N'Roofing (Metal)', NULL, 25, 546, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (429, 15, 56, N'CI-04', N'Tennessee Quillwort', 31, N'Electrical and Fire Alarm', N'Elevator', 64, 648, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (430, 29, 18, N'ID-PA', N'Island Wallflower', 150, N'Asphalt Paving', N'Drilled Shafts', 45, 1003, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (431, 29, 134, N'US-CA', N'Globeberry', 78, N'Electrical', N'Plumbing & Medical Gas', 52, 719, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (432, 24, 103, N'US-AZ', N'Shortspine Horsebrush', 79, N'Soft Flooring and Base', N'Electrical and Fire Alarm', 84, 54, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (433, 19, 142, N'IN-RJ', N'Wart Lichen', 114, N'Granite Surfaces', N'Wall Protection', 41, 828, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (434, 49, 114, N'ID-KU', N'Weigela', 118, N'Marlite Panels (FED)', N'Ornamental Railings', 90, 428, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (435, 37, 35, N'YT-U-A', N'Lipped Orchid', 95, N'RF Shielding', NULL, 9, 108, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (436, 50, 114, N'GB-ENG', N'Heartleaf Skullcap', 84, N'Termite Control', NULL, 62, 434, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (437, 40, 130, N'MP-U-A', N'Tubercle Dot Lichen', 58, N'Doors, Frames & Hardware', NULL, 36, 668, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (438, 28, 59, N'BO-T', N'Cracked Lichen', 143, N'Plumbing & Medical Gas', N'Marlite Panels (FED)', 51, 929, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (439, 30, 19, N'BR-PA', N'Yew', 49, N'Elevator', NULL, 67, 430, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (440, 1, 63, N'AO-LNO', N'Alkali Sandspurry', 105, N'Prefabricated Aluminum Metal Canopies', N'Painting & Vinyl Wall Covering', 78, 551, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (441, 47, 73, N'UY-SA', N'Splendid Bristlegrass', 84, N'Framing (Wood)', N'Painting & Vinyl Wall Covering', 35, 464, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (442, 23, 34, N'MH-KWA', N'Scleropodium Moss', 84, N'Exterior Signage', N'Plumbing & Medical Gas', 26, 371, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (443, 37, 60, N'NC-U-A', N'Presidio Manzanita', 77, N'Exterior Signage', N'Asphalt Paving', 46, 946, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (444, 25, 92, N'US-AK', N'Drushel''s Wild Petunia', 138, N'Drywall & Acoustical (FED)', NULL, 12, 493, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (445, 31, 30, N'KI-G', N'Sonoran Bean', 120, N'Drywall & Acoustical (MOB)', NULL, 5, 375, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (446, 2, 82, N'CN-53', N'Mediterranean Sage', 103, N'Temp Fencing, Decorative Fencing and Gates', NULL, 62, 289, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (447, 2, 90, N'IT-45', N'Heterocarpon Lichen', 59, N'Termite Control', N'Retaining Wall and Brick Pavers', 95, 1044, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (448, 4, 21, N'CN-36', N'Tropical Dock', 142, N'Fire Protection', NULL, 49, 365, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (449, 1, 91, N'KR-47', N'Venus Penstemon', 52, N'Exterior Signage', NULL, 25, 771, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (450, 39, 83, N'US-SD', N'Wedgeleaf Spurge', 136, N'Temp Fencing, Decorative Fencing and Gates', N'EIFS', 26, 335, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (451, 35, 106, N'PH-U-A', N'Saltloving Goosefoot', 76, N'Hard Tile & Stone', N'Wall Protection', 59, 74, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (452, 42, 53, N'AU-NT', N'Bracted Nutrush', 86, N'Casework', N'Roofing (Asphalt)', 95, 586, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (453, 35, 140, N'NG-KT', N'Torrey''s Popcornflower', 149, N'Painting & Vinyl Wall Covering', NULL, 51, 425, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (454, 30, 42, N'GB-ENG', N'Cascara Buckthorn', 80, N'Granite Surfaces', N'Rebar & Wire Mesh Install', 5, 753, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (455, 33, 105, N'MN-067', N'Southern Blue Monkshood', 125, N'RF Shielding', NULL, 90, 345, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (456, 17, 126, N'HN-YO', N'Alpine Lake False Dandelion', 42, N'Plumbing & Medical Gas', NULL, 81, 739, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (457, 22, 41, N'BR-SP', N'Hemlock Rosette Grass', 130, N'Retaining Wall and Brick Pavers', N'Sitework & Site Utilities', 41, 603, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (458, 37, 137, N'US-WA', N'Hybrid Oak', 96, N'Drilled Shafts', N'Waterproofing & Caulking', 77, 819, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (459, 49, 112, N'AU-VIC', N'Mountain Willow', 51, N'Casework', NULL, 55, 417, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (460, 45, 53, N'PG-NIK', N'Parry''s Agave', 20, N'Soft Flooring and Base', NULL, 89, 661, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (461, 45, 51, N'MN-069', N'Tuberous Springbeauty', 78, N'Plumbing & Medical Gas', N'Rebar & Wire Mesh Install', 47, 182, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (462, 31, 103, N'TH-54', N'Rinodina Lichen', 61, N'Marlite Panels (FED)', NULL, 47, 553, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (463, 35, 139, N'SY-HL', N'Bedstraw St. Johnswort', 90, N'Glass & Glazing', NULL, 57, 873, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (464, 11, 23, N'VE-I', N'Hairy Rockcress', 47, N'Electrical', N'Drywall & Acoustical (FED)', 9, 221, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (465, 12, 146, N'MN-071', N'Desert Mariposa Lily', 69, N'Ornamental Railings', N'Glass & Glazing', 38, 783, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (466, 49, 8, N'US-CA', N'White Doll''s Daisy', 108, N'Fire Sprinkler System', NULL, 43, 553, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (467, 20, 117, N'IL-D', N'Rand''s Goldenrod', 149, N'Framing (Wood)', NULL, 97, 533, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (468, 44, 47, N'AU-NT', N'Xanthoparmelia Lichen', 57, N'Site Furnishings', NULL, 56, 443, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (469, 48, 132, N'ID-MA', N'Smooth Rodwood', 96, N'Prefabricated Aluminum Metal Canopies', NULL, 83, 321, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (470, 48, 15, N'TD-OD', N'Amazonvine', 116, N'Prefabricated Aluminum Metal Canopies', NULL, 87, 602, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (471, 9, 51, N'US-AK', N'Little Bur-clover', 72, N'EIFS', NULL, 28, 162, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (472, 45, 33, N'AU-QLD', N'Poorman''s Friend', 47, N'Waterproofing & Caulking', NULL, 64, 238, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (473, 46, 70, N'MX-TAM', N'Viscid Candyleaf', 80, N'HVAC', N'Waterproofing & Caulking', 16, 94, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (474, 20, 98, N'SL-S', N'Jamaican Caper', 30, N'Ornamental Railings', N'Termite Control', 68, 937, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (475, 35, 72, N'MM-04', N'New Mexico Fleabane', 99, N'Site Furnishings', N'Construction Clean and Final Clean', 8, 972, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (476, 24, 70, N'AU-NSW', N'Arizona Scaly Polypody', 124, N'Construction Clean and Final Clean', N'Hard Tile & Stone', 75, 357, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (477, 36, 48, N'CA-QC', N'Beckett''s Water Trumpet', 28, N'Elevator', NULL, 46, 83, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (478, 4, 72, N'US-OK', N'Pistachio Nut', 140, N'Plumbing & Medical Gas', N'Exterior Signage', 37, 861, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (479, 15, 73, N'MY-03', N'English Bluebell', 27, N'Fire Protection', NULL, 29, 505, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (480, 14, 123, N'US-NJ', N'Harlequin Spiralseed', 125, N'Fire Protection', NULL, 95, 716, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (481, 33, 114, N'US-OR', N'Nail Lichen', 148, N'Elevator', N'Waterproofing & Caulking', 65, 107, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (482, 35, 143, N'MX-BCS', N'Alvord Oak', 34, N'Drywall & Acoustical (FED)', NULL, 12, 694, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (483, 5, 7, N'GN-B', N'Arizona Centaury', 60, N'Masonry', N'Epoxy Flooring', 15, 975, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (484, 39, 147, N'CL-AN', N'Polypremum', 149, N'Prefabricated Aluminum Metal Canopies', NULL, 25, 243, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (485, 18, 10, N'CA-NL', N'Foster''s Rockdaisy', 96, N'Plumbing & Medical Gas', NULL, 72, 268, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (486, 29, 78, N'LY-BA', N'Hawai''i Ticktrefoil', 111, N'Wall Protection', NULL, 69, 252, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (487, 14, 77, N'CA-ON', N'Parry''s Lousewort', 130, N'Temp Fencing, Decorative Fencing and Gates', NULL, 49, 372, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (488, 16, 87, N'CO-CUN', N'Hooker''s Evening Primrose', 85, N'Roofing (Asphalt)', NULL, 16, 1064, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (489, 45, 18, N'PY-16', N'Pepperweed', 53, N'Rebar & Wire Mesh Install', N'Masonry & Precast', 28, 154, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (490, 47, 70, N'RU-KHM', N'Interior Live Oak', 143, N'Masonry & Precast', NULL, 95, 924, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (491, 25, 110, N'US-VA', N'Lettuce', 49, N'Ornamental Railings', NULL, 51, 569, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (492, 37, 66, N'SA-08', N'Oregon Checkerbloom', 95, N'Ornamental Railings', NULL, 67, 726, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (493, 2, 77, N'BR-MG', N'Wedgeleaf Spurge', 142, N'Curb & Gutter', N'Construction Clean and Final Clean', 16, 543, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (494, 28, 108, N'CA-ON', N'Peregrine Saltbush', 84, N'Structural & Misc Steel Erection', NULL, 38, 888, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (495, 7, 83, N'TH-63', N'Pylaisiadelpha Moss', 22, N'Overhead Doors', NULL, 14, 694, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (496, 28, 76, N'TT-WTO', N'Woollystar', 108, N'Prefabricated Aluminum Metal Canopies', NULL, 33, 994, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (497, 25, 98, N'ZA-NP', N'Common Yarrow', 117, N'Marlite Panels (FED)', NULL, 87, 600, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (498, 34, 72, N'GR-A1', N'Largeflower Yellow False Foxglove', 24, N'Exterior Signage', NULL, 54, 807, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (499, 23, 134, N'US-AK', N'Biatorella Lichen', 20, N'Marlite Panels (FED)', N'Masonry', 6, 475, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (500, 47, 149, N'PE-PIU', N'Thin-stem Lady''s Mantle', 64, N'RF Shielding', NULL, 96, 991, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (501, 24, 40, N'IR-23', N'Wavyleaf Mullein', 136, N'Painting & Vinyl Wall Covering', N'Asphalt Paving', 33, 170, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (502, 14, 123, N'MY-12', N'Scouler''s Willow', 150, N'Framing (Wood)', NULL, 57, 1079, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (503, 12, 137, N'AO-LNO', N'Kanawao Ke''oke''o', 35, N'EIFS', NULL, 63, 271, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (504, 25, 150, N'US-CA', N'Licaria', 80, N'Exterior Signage', N'Electrical and Fire Alarm', 69, 868, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (505, 6, 75, N'MW-SA', N'Adobe Desertparsley', 127, N'Framing (Steel)', N'RF Shielding', 56, 1038, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (506, 48, 127, N'US-AK', N'Brittlestem Hempnettle', 89, N'Exterior Signage', NULL, 48, 865, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (507, 7, 30, N'CD-BN', N'Dot Lichen', 127, N'Casework', N'Elevator', 87, 463, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (508, 22, 105, N'CA-BC', N'Rim Lichen', 90, N'Casework', NULL, 45, 479, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (509, 2, 114, N'RU-SPE', N'Smooth Barley', 145, N'Epoxy Flooring', NULL, 46, 298, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (510, 6, 104, N'US-AK', N'Spike Bentgrass', 140, N'Framing (Steel)', N'Exterior Signage', 14, 790, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (511, 45, 21, N'GA-2', N'Forked Fanwort', 64, N'Doors, Frames & Hardware', NULL, 52, 295, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (512, 36, 32, N'RU-KYA', N'Nevada Buckthorn', 46, N'Drilled Shafts', NULL, 67, 1031, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (513, 43, 40, N'NA-ER', N'Serpentine Wallflower Orchid', 23, N'Framing (Steel)', NULL, 81, 129, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (514, 12, 84, N'IS-4', N'Broadleaf Spurge', 148, N'Retaining Wall and Brick Pavers', NULL, 44, 502, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (515, 1, 23, N'CV-S', N'Palapalai', 138, N'Casework', N'Marlite Panels (FED)', 97, 364, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (516, 25, 56, N'AU-WA', N'Birch', 41, N'Structural & Misc Steel Erection', NULL, 73, 364, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (517, 9, 69, N'CY-06', N'Sixangle Foldwing', 95, N'Plumbing & Medical Gas', NULL, 83, 54, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (518, 28, 18, N'CA-MB', N'Windmill Grass', 66, N'Casework', NULL, 27, 755, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (519, 30, 114, N'US-VA', N'Twistedstalk', 102, N'Rebar & Wire Mesh Install', N'Construction Clean and Final Clean', 45, 753, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (520, 17, 46, N'SB-WE', N'Lemmon''s Keckiella', 107, N'Drywall & Acoustical (FED)', NULL, 88, 395, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (521, 46, 34, N'NP-DH', N'Diente De Perro', 120, N'Retaining Wall and Brick Pavers', NULL, 24, 68, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (522, 26, 63, N'KG-Y', N'Jones'' Springparsley', 136, N'Waterproofing & Caulking', NULL, 26, 1069, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (523, 22, 144, N'MX-CHP', N'Orthotrichum Moss', 119, N'Hard Tile & Stone', NULL, 97, 233, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (524, 47, 6, N'BZ-SC', N'Neckweed', 119, N'Retaining Wall and Brick Pavers', NULL, 88, 563, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (525, 48, 73, N'GB-SCT', N'Pygmypipes', 149, N'Electrical and Fire Alarm', NULL, 75, 96, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (526, 8, 63, N'US-CA', N'Birdfoot Cliffbrake', 20, N'Construction Clean and Final Clean', NULL, 78, 927, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (527, 21, 99, N'US-DE', N'Small Camas', 114, N'Curb & Gutter', NULL, 22, 1038, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (528, 47, 5, N'KH-18', N'Funaria Moss', 66, N'Roofing (Metal)', NULL, 17, 338, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (529, 2, 58, N'MZ-A', N'Bayrumtree', 61, N'Construction Clean and Final Clean', N'Doors, Frames & Hardware', 11, 597, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (530, 36, 107, N'NP-SA', N'Wild Quinine', 127, N'Painting & Vinyl Wall Covering', NULL, 46, 197, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (531, 5, 22, N'CA-QC', N'Idaho Fescue', 22, N'Prefabricated Aluminum Metal Canopies', NULL, 19, 1022, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (532, 31, 130, N'CA-BC', N'Tranquil Goldenweed', 144, N'Fire Protection', N'Sitework & Site Utilities', 41, 986, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (533, 19, 110, N'GY-PT', N'Little Sagebrush', 65, N'Casework', N'Retaining Wall and Brick Pavers', 59, 69, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (534, 24, 56, N'US-MS', N'Globe Penstemon', 56, N'Drywall & Acoustical (MOB)', NULL, 98, 956, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (535, 44, 112, N'MM-16', N'Henrieville Woodyaster', 117, N'Painting & Vinyl Wall Covering', N'Hard Tile & Stone', 88, 729, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (536, 23, 90, N'JP-35', N'Texas Indian Paintbrush', 35, N'Epoxy Flooring', N'Rebar & Wire Mesh Install', 50, 764, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (537, 48, 28, N'CA-NT', N'Ottoschulzia', 74, N'Drywall & Acoustical (MOB)', NULL, 47, 913, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (538, 21, 138, N'GN-F', N'Questionable Rush', 21, N'HVAC', NULL, 45, 181, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (539, 3, 21, N'MG-U', N'Lanceleaf Buckwheat', 21, N'Overhead Doors', NULL, 86, 619, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (540, 21, 93, N'PG-NSB', N'Goldenfruit Sedge', 107, N'Soft Flooring and Base', N'Glass & Glazing', 81, 416, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (541, 37, 83, N'PG-ESW', N'Kern County Evening Primrose', 23, N'Exterior Signage', N'Marlite Panels (FED)', 76, 578, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (542, 26, 47, N'US-TX', N'Scalystem', 139, N'Framing (Wood)', NULL, 19, 1094, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (543, 37, 18, N'CA-QC', N'False Tiger Orchid', 69, N'Prefabricated Aluminum Metal Canopies', NULL, 58, 394, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (544, 35, 149, N'DZ-11', N'Hybrid Oak', 127, N'Casework', NULL, 35, 876, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (545, 12, 92, N'AU-QLD', N'Pendantgrass', 149, N'Glass & Glazing', NULL, 81, 786, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (546, 3, 11, N'CA-BC', N'Burroweed', 123, N'Epoxy Flooring', NULL, 97, 150, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (547, 41, 147, N'PA-5', N'Tiger-pear', 148, N'Electrical', N'Asphalt Paving', 41, 332, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (548, 49, 135, N'MY-12', N'Oysterleaf', 106, N'Framing (Wood)', NULL, 17, 713, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (549, 9, 100, N'US-OK', N'Island Senecio', 85, N'Painting & Vinyl Wall Covering', NULL, 78, 436, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (550, 25, 28, N'SK-PV', N'Tranquil Goldenweed', 124, N'Masonry', N'Drywall & Acoustical (FED)', 16, 321, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (551, 40, 81, N'US-AK', N'Bladder Senna', 100, N'Retaining Wall and Brick Pavers', NULL, 12, 893, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (552, 32, 56, N'VN-56', N'Grimmia Dry Rock Moss', 128, N'Roofing (Asphalt)', NULL, 75, 494, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (553, 34, 84, N'US-UT', N'Fernald''s Beaksedge', 119, N'Doors, Frames & Hardware', NULL, 95, 77, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (554, 50, 11, N'PH-AKL', N'Texas Chrysopsis', 147, N'EIFS', NULL, 20, 364, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (555, 46, 82, N'US-AR', N'Mountain Leafystem Orchid', 40, N'Temp Fencing, Decorative Fencing and Gates', NULL, 33, 440, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (556, 15, 15, N'CA-ON', N'Saltmarsh Dodder', 25, N'Rebar & Wire Mesh Install', N'Framing (Wood)', 30, 491, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (557, 3, 114, N'FR-G', N'Abrams'' Allium', 142, N'Framing (Steel)', NULL, 7, 944, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (558, 3, 86, N'DE-BY', N'Cup Grass', 93, N'Structural and Misc Steel (Fabrication)', NULL, 47, 750, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (559, 21, 131, N'DE-NI', N'Longflower Tuberose', 128, N'Soft Flooring and Base', N'Sitework & Site Utilities', 55, 1006, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (560, 16, 93, N'BR-MS', N'Siberian Wormwood', 118, N'Rebar & Wire Mesh Install', NULL, 14, 431, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (561, 4, 131, N'US-VA', N'Foothill Deathcamas', 92, N'Granite Surfaces', N'Structural & Misc Steel Erection', 70, 148, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (562, 24, 113, N'CO-CAS', N'Desmatodon Moss', 55, N'Painting & Vinyl Wall Covering', N'EIFS', 79, 585, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (563, 4, 109, N'US-CA', N'Texas Bluestar', 111, N'Structural & Misc Steel Erection', N'Rebar & Wire Mesh Install', 97, 670, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (564, 18, 106, N'MX-CHP', N'Manac', 149, N'Masonry & Precast', NULL, 18, 219, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (565, 13, 114, N'MT-62', N'Dusky Onion', 75, N'Epoxy Flooring', NULL, 67, 512, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (566, 9, 11, N'VE-M', N'Giant Shield Lichen', 147, N'Framing (Wood)', NULL, 42, 705, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (567, 14, 98, N'SA-14', N'Narrowleaf Lupine', 112, N'Roofing (Asphalt)', NULL, 10, 146, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (568, 14, 118, N'CL-CO', N'Pot Marjoram', 114, N'Exterior Signage', NULL, 27, 1001, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (569, 39, 13, N'PG-MPL', N'Common Rush', 39, N'Retaining Wall and Brick Pavers', NULL, 85, 852, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (570, 22, 49, N'AR-Z', N'Whitehead Spikesedge', 145, N'Prefabricated Aluminum Metal Canopies', N'Painting & Vinyl Wall Covering', 49, 615, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (571, 5, 85, N'US-MN', N'Largeflowered Wintergreen', 142, N'Prefabricated Aluminum Metal Canopies', NULL, 60, 546, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (572, 26, 79, N'FR-C', N'Rim Lichen', 143, N'RF Shielding', N'Roofing (Metal)', 83, 642, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (573, 11, 52, N'JP-47', N'Dewey Sedge', 28, N'Curb & Gutter', NULL, 25, 638, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (574, 10, 57, N'BR-SP', N'Coville''s Bundleflower', 20, N'Fire Protection', N'Structural & Misc Steel Erection', 50, 311, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (575, 15, 57, N'IN-LD', N'Parry''s Rabbitbrush', 90, N'Granite Surfaces', N'Drywall & Acoustical (FED)', 9, 536, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (576, 10, 143, N'AO-MOX', N'Waialeale Dubautia', 38, N'Structural and Misc Steel (Fabrication)', N'Exterior Signage', 22, 1052, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (577, 46, 9, N'CV-S', N'Bolander''s Monkeyflower', 107, N'Soft Flooring and Base', NULL, 11, 424, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (578, 46, 107, N'US-AZ', N'Sarcosagium Lichen', 71, N'Sitework & Site Utilities', NULL, 34, 938, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (579, 4, 127, N'GB-ENG', N'Low False Bindweed', 71, N'Asphalt Paving', NULL, 8, 808, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (580, 19, 48, N'NA-OT', N'Early Sandgrass', 31, N'Fire Sprinkler System', N'Fire Protection', 58, 188, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (581, 14, 146, N'ET-BE', N'Catillaria Lichen', 97, N'Drilled Shafts', NULL, 56, 92, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (582, 17, 109, N'SE-U', N'Wright''s Goldenrod', 21, N'Marlite Panels (FED)', NULL, 84, 223, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (583, 30, 110, N'ID-MA', N'Variable Starviolet', 148, N'Plumbing & Medical Gas', NULL, 14, 832, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (584, 42, 37, N'US-KY', N'Giant Philodendron', 31, N'Rebar & Wire Mesh Install', NULL, 46, 288, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (585, 43, 7, N'EG-ASN', N'Johnston''s Knotweed', 116, N'Termite Control', NULL, 41, 655, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (586, 35, 75, N'IN-GJ', N'Bush Pea', 77, N'Drilled Shafts', N'Fire Protection', 25, 415, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (587, 8, 112, N'SB-ML', N'Crescent Buckwheat', 61, N'Fire Protection', NULL, 24, 797, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (588, 25, 147, N'UG-406', N'Indian Strawberry', 75, N'Structural and Misc Steel (Fabrication)', NULL, 41, 104, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (589, 48, 113, N'BR-PR', N'Carrizo Sands Woollywhite', 93, N'Masonry', N'Elevator', 7, 343, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (590, 42, 150, N'DM-10', N'Lindenleaf Sage', 85, N'Granite Surfaces', NULL, 34, 529, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (591, 3, 150, N'SL-N', N'Wagner''s Plume Fern', 120, N'Elevator', N'Soft Flooring and Base', 38, 670, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (592, 20, 131, N'AE-DU', N'Broadleaf Rice', 22, N'Doors, Frames & Hardware', NULL, 97, 208, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (593, 36, 84, N'ZA-NP', N'Champin''s Grape', 55, N'Ornamental Railings', NULL, 9, 1039, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (594, 32, 81, N'CA-ON', N'Diploicia Lichen', 90, N'Framing (Steel)', NULL, 84, 897, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (595, 15, 81, N'US-IN', N'Caespitose Four-nerve Daisy', 124, N'Overhead Doors', NULL, 64, 1069, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (596, 23, 20, N'US-ND', N'Suksdorf''s Brome', 120, N'Roofing (Asphalt)', N'HVAC', 61, 604, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (597, 15, 55, N'ZA-NW', N'Citron', 139, N'Roofing (Metal)', NULL, 11, 933, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (598, 41, 137, N'VC-04', N'Fissidens Moss', 114, N'Structural & Misc Steel Erection', NULL, 46, 83, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (599, 18, 87, N'US-TX', N'Idaho Trillium', 61, N'Epoxy Flooring', N'Drilled Shafts', 52, 261, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (600, 15, 11, N'US-NC', N'Mallow', 149, N'Drywall & Acoustical (FED)', NULL, 60, 329, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (601, 18, 99, N'US-IN', N'Ironweed', 82, N'Elevator', N'Retaining Wall and Brick Pavers', 97, 762, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (602, 1, 50, N'MR-09', N'Nevada Cracked Lichen', 112, N'Construction Clean and Final Clean', NULL, 37, 76, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (603, 38, 120, N'UZ-QR', N'Mediterranean Hairgrass', 93, N'Retaining Wall and Brick Pavers', NULL, 67, 960, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (604, 6, 69, N'ID-PA', N'Pacific Anemone', 31, N'Termite Control', NULL, 73, 919, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (605, 2, 94, N'CA-QC', N'Tiger Grass', 112, N'Retaining Wall and Brick Pavers', NULL, 93, 141, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (606, 3, 3, N'VE-F', N'Orange Lichen', 146, N'Rebar & Wire Mesh Install', NULL, 99, 279, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (607, 35, 58, N'US-NH', N'Puerto Rico Jointvetch', 30, N'Framing (Wood)', NULL, 45, 814, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (608, 21, 22, N'US-NH', N'Japanese Persimmon', 47, N'Retaining Wall and Brick Pavers', N'Roofing (Asphalt)', 67, 978, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (609, 4, 73, N'PK-NW', N'Redspot Clarkia', 104, N'Structural and Misc Steel (Fabrication)', NULL, 38, 635, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (610, 32, 90, N'CX-U-A', N'Alpine Polytrichastrum Moss', 110, N'Termite Control', NULL, 86, 57, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (611, 13, 129, N'HU-SO', N'Siberian Crab Apple', 56, N'Glass & Glazing', NULL, 100, 768, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (612, 31, 141, N'CA-NT', N'Jarrah', 129, N'Asphalt Paving', NULL, 24, 676, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (613, 25, 26, N'ID-SU', N'Carolina Joe Pye Weed', 104, N'Prefabricated Aluminum Metal Canopies', NULL, 80, 185, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (614, 28, 24, N'US-AK', N'Hairy-fruit Spurge', 53, N'Granite Surfaces', N'Doors, Frames & Hardware', 9, 59, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (615, 9, 89, N'LR-LO', N'Rattan''s Beardtongue', 88, N'Site Furnishings', NULL, 14, 664, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (616, 32, 102, N'US-FL', N'Red-hot Cat''s Tail', 136, N'Ornamental Railings', NULL, 92, 946, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (617, 29, 93, N'NI-AN', N'Streamside Bryum Moss', 105, N'Landscaping & Irrigation', NULL, 56, 409, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (618, 47, 52, N'US-NM', N'Henderson''s Sedge', 97, N'Elevator', NULL, 32, 1037, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (619, 10, 42, N'MR-11', N'Javanese Fanpetals', 96, N'Fire Protection', NULL, 63, 270, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (620, 15, 105, N'CM-EN', N'Nuttall''s Oxytrope', 96, N'Curb & Gutter', N'Landscaping & Irrigation', 74, 514, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (621, 27, 106, N'AU-QLD', N'Chalk Dudleya', 22, N'Fire Sprinkler System', NULL, 73, 1086, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (622, 16, 112, N'PH-PLW', N'Twelfth Rush', 132, N'Wall Protection', NULL, 97, 89, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (623, 38, 45, N'CD-KA', N'Cliffbrake', 27, N'Framing (Wood)', NULL, 80, 1080, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (624, 13, 35, N'SI-061', N'Whitemargin Phlox', 148, N'Masonry & Precast', NULL, 76, 682, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (625, 38, 25, N'DE-SH', N'Sunbright', 50, N'Framing (Steel)', NULL, 47, 217, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (626, 14, 4, N'US-NM', N'Ditta', 85, N'Exterior Signage', NULL, 54, 886, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (627, 20, 84, N'ID-JI', N'Greene''s Mariposa Lily', 38, N'Roofing (Asphalt)', NULL, 46, 558, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (628, 39, 144, N'VE-X', N'Shiny Bugseed', 145, N'Drilled Shafts', NULL, 34, 132, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (629, 24, 149, N'DE-NW', N'Forked Fimbry', 23, N'Drywall & Acoustical (MOB)', NULL, 9, 975, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (630, 20, 44, N'ET-OR', N'Vouaux''s Leproloma Lichen', 145, N'Wall Protection', NULL, 75, 348, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (631, 35, 19, N'US-FL', N'Iguana Hackberry', 111, N'Sitework & Site Utilities', NULL, 51, 477, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (632, 12, 24, N'ID-PA', N'Curveseed Butterwort', 143, N'Electrical and Fire Alarm', NULL, 74, 285, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (633, 17, 24, N'CN-65', N'Arizona Needle Grama', 103, N'Ornamental Railings', NULL, 27, 815, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (634, 13, 30, N'CM-SW', N'Lehmann Lovegrass', 149, N'Wall Protection', N'Structural and Misc Steel (Fabrication)', 50, 777, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (635, 36, 11, N'BR-MT', N'Siberian Crab Apple', 80, N'Drilled Shafts', N'Painting & Vinyl Wall Covering', 87, 585, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (636, 27, 86, N'US-MO', N'Feathered Mosquitofern', 118, N'Elevator', NULL, 34, 666, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (637, 33, 8, N'PG-NSB', N'Hooker''s Ceanothus', 75, N'Elevator', NULL, 4, 1056, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (638, 39, 111, N'ID-MA', N'Scarlet Globemallow', 105, N'Doors, Frames & Hardware', N'Waterproofing & Caulking', 44, 1024, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (639, 49, 25, N'US-ME', N'Hau Kuahiwi', 78, N'Masonry & Precast', NULL, 44, 590, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (640, 31, 34, N'ZA-NW', N'Hitchcock''s Sedge', 60, N'Painting & Vinyl Wall Covering', N'Structural & Misc Steel Erection', 69, 478, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (641, 48, 70, N'PG-SAN', N'Moss Phlox', 144, N'Prefabricated Aluminum Metal Canopies', NULL, 59, 614, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (642, 46, 123, N'MM-16', N'Green Dragon', 76, N'Fire Sprinkler System', NULL, 47, 741, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (643, 41, 5, N'MR-10', N'Mountain Fly Honeysuckle', 116, N'Marlite Panels (FED)', NULL, 17, 125, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (644, 10, 30, N'BR-MG', N'Fourpart Horsebrush', 113, N'Granite Surfaces', N'Fire Protection', 27, 929, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (645, 16, 114, N'US-CA', N'Virginia Strawberry', 82, N'Sitework & Site Utilities', NULL, 9, 725, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (646, 29, 41, N'RU-BA', N'Myrtlecroton', 44, N'Electrical and Fire Alarm', N'Structural & Misc Steel Erection', 43, 850, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (647, 47, 65, N'US-NY', N'Pakaha', 41, N'Prefabricated Aluminum Metal Canopies', NULL, 12, 83, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (648, 5, 121, N'AU-NSW', N'Florida Mudmidget', 89, N'Structural and Misc Steel (Fabrication)', N'Masonry & Precast', 19, 56, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (649, 37, 49, N'GB-ENG', N'Poorman''s Umbrella', 55, N'Structural and Misc Steel (Fabrication)', NULL, 66, 160, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (650, 31, 43, N'US-AK', N'White Cushion Fleabane', 112, N'Framing (Steel)', NULL, 82, 165, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (651, 4, 67, N'BR-PE', N'Helminthocarpon Lichen', 25, N'Glass & Glazing', NULL, 20, 318, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (652, 44, 100, N'CY-02', N'Dwarf Lousewort', 100, N'Drywall & Acoustical (MOB)', NULL, 50, 1005, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (653, 25, 54, N'GB-ENG', N'Shortstalk False Bindweed', 26, N'Landscaping & Irrigation', NULL, 50, 303, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (654, 12, 45, N'BR-MG', N'Wattapama', 93, N'Hard Tile & Stone', NULL, 98, 462, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (655, 4, 55, N'FI-ES', N'Horsebush', 88, N'Soft Flooring and Base', NULL, 76, 494, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (656, 38, 39, N'RU-KB', N'Engelmann''s Desertparsley', 92, N'Electrical', NULL, 24, 870, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (657, 46, 148, N'RU-TA', N'Canistel', 93, N'Landscaping & Irrigation', NULL, 19, 641, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (658, 26, 109, N'US-NY', N'Herman''s Dwarf Rush', 88, N'EIFS', NULL, 77, 376, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (659, 8, 69, N'NO-18', N'Yerba De Plata', 93, N'Curb & Gutter', NULL, 100, 941, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (660, 26, 57, N'US-IL', N'Rim Lichen', 133, N'Termite Control', N'Fire Sprinkler System', 8, 88, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (661, 43, 91, N'SI-061', N'False Goat''s Beard', 41, N'Structural & Misc Steel Erection', NULL, 81, 517, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (662, 34, 48, N'DZ-47', N'Twogrooved Milkvetch', 59, N'Temp Fencing, Decorative Fencing and Gates', NULL, 46, 339, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (663, 14, 14, N'DO-20', N'Blackfruit Spikerush', 131, N'EIFS', NULL, 67, 291, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (664, 49, 99, N'AR-B', N'Shiny Blueberry', 133, N'Wall Protection', N'Rebar & Wire Mesh Install', 73, 206, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (665, 11, 117, N'US-TX', N'Wenatchee Desertparsley', 63, N'Drywall & Acoustical (MOB)', NULL, 16, 692, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (666, 10, 27, N'ID-SG', N'Cotorrilla', 92, N'Soft Flooring and Base', N'Fire Protection', 84, 157, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (667, 45, 89, N'US-CA', N'Blue Ridge Carrionflower', 80, N'Drilled Shafts', NULL, 46, 373, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (668, 28, 21, N'CF-AC', N'Threeleaf Indigo', 105, N'Site Furnishings', N'Granite Surfaces', 31, 407, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (669, 10, 73, N'DZ-04', N'Pancratium', 63, N'Marlite Panels (FED)', N'Overhead Doors', 32, 835, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (670, 22, 100, N'GT-AV', N'Parmelia Abrothallus Lichen', 123, N'Site Furnishings', NULL, 84, 293, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (671, 33, 26, N'US-GA', N'Knotted Hedgeparsley', 31, N'Drywall & Acoustical (MOB)', NULL, 34, 827, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (672, 7, 124, N'BR-MA', N'Arrowleaf Falsepickerelweed', 52, N'Structural and Misc Steel (Fabrication)', N'Overhead Doors', 85, 1054, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (673, 46, 22, N'MY-12', N'Dogtooth Violet', 66, N'Fire Protection', N'EIFS', 48, 83, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (674, 3, 36, N'MM-02', N'Fewflower Clover', 97, N'Hard Tile & Stone', N'Roofing (Asphalt)', 93, 89, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (675, 16, 131, N'ZW-MN', N'Buffalo Hawthorn', 74, N'Roofing (Asphalt)', NULL, 26, 114, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (676, 45, 53, N'TD-MK', N'Bitter Yam', 84, N'Curb & Gutter', N'Waterproofing & Caulking', 93, 827, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (677, 37, 116, N'NZ-WGN', N'Snow Lichen', 138, N'Electrical', NULL, 27, 407, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (678, 20, 76, N'US-AK', N'Flatsedge', 48, N'Retaining Wall and Brick Pavers', N'Electrical and Fire Alarm', 59, 687, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (679, 46, 75, N'CA-AB', N'Rim Lichen', 146, N'Fire Sprinkler System', N'Framing (Steel)', 13, 1018, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (680, 14, 103, N'PA-KY', N'Yosemite Onion', 77, N'Temp Fencing, Decorative Fencing and Gates', N'Masonry & Precast', 35, 184, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (681, 21, 105, N'FR-L', N'Tall Brome', 90, N'Plumbing & Medical Gas', N'Doors, Frames & Hardware', 16, 353, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (682, 1, 49, N'GB-ENG', N'Berlandier''s Yellow Flax', 101, N'Wall Protection', NULL, 17, 811, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (683, 1, 102, N'US-NY', N'Lip Maiden Fern', 101, N'Masonry & Precast', N'Drywall & Acoustical (MOB)', 46, 133, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (684, 39, 115, N'BR-RN', N'Mt. Lassen Fleabane', 145, N'Epoxy Flooring', N'Framing (Steel)', 25, 92, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (685, 27, 101, N'US-IN', N'Abey Amarillo', 68, N'Drywall & Acoustical (FED)', N'EIFS', 75, 968, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (686, 34, 48, N'AU-WA', N'Rusby''s Flatsedge', 57, N'Drilled Shafts', NULL, 100, 610, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (687, 34, 4, N'BR-RJ', N'Smallhead Rush', 79, N'Drywall & Acoustical (FED)', NULL, 96, 792, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (688, 41, 41, N'NZ-AUK', N'Aniseia', 127, N'Masonry', NULL, 57, 482, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (689, 25, 126, N'FR-H', N'Mangrove', 134, N'Ornamental Railings', NULL, 35, 655, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (690, 48, 61, N'AR-Q', N'Texas Snowbell', 22, N'Site Furnishings', NULL, 90, 464, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (691, 41, 127, N'PF-U-A', N'Northern Bog Clubmoss', 119, N'Soft Flooring and Base', NULL, 57, 60, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (692, 30, 108, N'CH-TI', N'Pineland St. Johnswort', 115, N'Glass & Glazing', N'Drywall & Acoustical (FED)', 45, 177, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (693, 9, 150, N'PL-MZ', N'Palmer''s Clover', 22, N'Electrical', NULL, 76, 614, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (694, 34, 52, N'MG-A', N'Hygrohypnum Moss', 132, N'Framing (Wood)', N'Soft Flooring and Base', 69, 110, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (695, 18, 114, N'CN-44', N'Luna County Globemallow', 124, N'Fire Sprinkler System', NULL, 95, 1019, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (696, 33, 147, N'US-AK', N'Sulphur-flower Buckwheat', 90, N'Overhead Doors', NULL, 18, 97, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (697, 8, 123, N'AU-WA', N'Orange Lichen', 105, N'HVAC', NULL, 98, 217, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (698, 19, 50, N'SA-08', N'Venegasia', 98, N'RF Shielding', NULL, 28, 165, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (699, 16, 30, N'US-OK', N'Watermelon', 25, N'Soft Flooring and Base', NULL, 35, 328, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (700, 8, 116, N'AR-Q', N'Pin-leaf Seepweed', 112, N'Electrical', N'Landscaping & Irrigation', 20, 253, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (701, 47, 41, N'CL-LL', N'Monkeypuzzle Tree', 27, N'Epoxy Flooring', NULL, 85, 520, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (702, 38, 113, N'IR-15', N'Flatglobe Dodder', 94, N'Waterproofing & Caulking', NULL, 80, 714, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (703, 33, 131, N'PG-SAN', N'California Bedstraw', 95, N'Overhead Doors', NULL, 75, 179, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (704, 30, 66, N'US-TX', N'Hartweg''s Twinevine', 33, N'Temp Fencing, Decorative Fencing and Gates', N'Roofing (Metal)', 39, 948, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (705, 46, 3, N'AU-NSW', N'Matamat', 93, N'Fire Sprinkler System', NULL, 13, 290, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (706, 18, 133, N'AU-QLD', N'Alpine Pennycress', 103, N'Exterior Signage', NULL, 21, 910, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (707, 2, 35, N'CO-RIS', N'Arrowleaf Buckwheat', 140, N'Hard Tile & Stone', NULL, 24, 718, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (708, 25, 54, N'BG-16', N'Mosquito Bills', 108, N'Granite Surfaces', N'Masonry & Precast', 65, 477, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (709, 26, 80, N'PG-WBK', N'Sullivan City Flax', 118, N'Electrical and Fire Alarm', NULL, 53, 551, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (710, 8, 1, N'CU-14', N'Shaggy Fleabane', 125, N'Asphalt Paving', NULL, 52, 623, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (711, 1, 126, N'RU-PRI', N'Least Snapdragon', 83, N'Landscaping & Irrigation', N'Ornamental Railings', 28, 984, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (712, 35, 123, N'IR-02', N'Prairie Groundcherry', 89, N'Doors, Frames & Hardware', N'HVAC', 43, 369, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (713, 39, 102, N'LB-JL', N'Hybrid Oak', 50, N'Overhead Doors', NULL, 94, 926, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (714, 46, 125, N'JP-15', N'Jamaican Broom', 117, N'Curb & Gutter', NULL, 68, 782, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (715, 33, 124, N'TC-MC', N'Lithographa Lichen', 63, N'Glass & Glazing', N'Temp Fencing, Decorative Fencing and Gates', 62, 527, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (716, 35, 9, N'SL-S', N'Capeweed', 118, N'Hard Tile & Stone', N'Roofing (Asphalt)', 43, 357, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (717, 22, 27, N'BO-S', N'Mexican Skullcap', 148, N'Wall Protection', NULL, 26, 307, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (718, 4, 40, N'VN-24', N'Antilles Fanpetals', 21, N'Roofing (Metal)', NULL, 67, 1096, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (719, 49, 103, N'CN-33', N'Cacao', 89, N'Structural & Misc Steel Erection', N'Waterproofing & Caulking', 81, 1053, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (720, 4, 76, N'US-IA', N'Giant Chainfern', 149, N'Ornamental Railings', NULL, 29, 481, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (721, 32, 58, N'VE-F', N'Sierra Pea', 96, N'Granite Surfaces', NULL, 70, 673, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (722, 1, 61, N'GB-WLS', N'Blueblossom', 87, N'Drywall & Acoustical (MOB)', N'Overhead Doors', 5, 843, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (723, 20, 17, N'ES-CM', N'Garden Lovage', 130, N'Marlite Panels (FED)', NULL, 51, 114, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (724, 11, 93, N'AU-QLD', N'Maui Kihifern', 63, N'Drywall & Acoustical (FED)', N'Roofing (Asphalt)', 60, 94, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (725, 50, 24, N'BR-SC', N'Longstalk Clover', 143, N'Framing (Steel)', NULL, 83, 514, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (726, 14, 117, N'AU-NSW', N'Slough Sedge', 20, N'Granite Surfaces', NULL, 24, 153, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (727, 49, 132, N'KZ-VOS', N'Yellow Water Buttercup', 70, N'Electrical', NULL, 74, 662, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (728, 9, 7, N'VN-43', N'Dog Fescue', 55, N'Retaining Wall and Brick Pavers', N'Granite Surfaces', 95, 309, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (729, 31, 29, N'CN-14', N'Lecania Lichen', 20, N'Waterproofing & Caulking', NULL, 86, 55, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (730, 48, 77, N'US-AK', N'Perennial Wallrocket', 37, N'Electrical', N'Elevator', 7, 701, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (731, 27, 126, N'CA-NT', N'Entodon Moss', 51, N'Drywall & Acoustical (FED)', N'Elevator', 53, 356, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (732, 23, 32, N'IN-JK', N'Pinkflower Hedgehog Cactus', 83, N'Rebar & Wire Mesh Install', N'Wall Protection', 70, 929, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (733, 15, 72, N'NA-KA', N'Serviceberry', 132, N'Overhead Doors', NULL, 45, 99, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (734, 32, 72, N'US-GA', N'Narrowleaf Pussytoes', 32, N'Painting & Vinyl Wall Covering', NULL, 59, 643, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (735, 6, 12, N'DE-BY', N'Pacific Dewberry', 139, N'Roofing (Metal)', N'Structural & Misc Steel Erection', 58, 412, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (736, 33, 77, N'US-NY', N'Jacob''s Dotted Lichen', 69, N'Temp Fencing, Decorative Fencing and Gates', N'Structural and Misc Steel (Fabrication)', 6, 629, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (737, 33, 111, N'US-IL', N'Damiana', 44, N'Exterior Signage', NULL, 44, 710, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (738, 34, 45, N'PG-MPL', N'Low Sandwort', 127, N'Masonry', NULL, 12, 854, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (739, 12, 106, N'IL-D', N'Sidebells Wintergreen', 53, N'Curb & Gutter', N'Rebar & Wire Mesh Install', 49, 863, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (740, 14, 49, N'GB-SCT', N'Crusty Jelly Lichen', 109, N'RF Shielding', NULL, 59, 552, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (741, 32, 70, N'US-CA', N'Woolly Fimbry', 98, N'Epoxy Flooring', NULL, 23, 994, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (742, 16, 76, N'US-OK', N'Christmastree', 33, N'Framing (Wood)', NULL, 75, 952, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (743, 41, 55, N'KE-110', N'Amur Maple', 108, N'Waterproofing & Caulking', NULL, 49, 775, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (744, 45, 135, N'US-MN', N'Blandow''s Helodium Moss', 138, N'EIFS', NULL, 28, 745, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (745, 7, 97, N'CL-AI', N'Mulberry', 108, N'Overhead Doors', N'Marlite Panels (FED)', 41, 540, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (746, 17, 140, N'CR-A', N'Smallfruit Agrimony', 136, N'EIFS', N'Epoxy Flooring', 62, 389, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (747, 49, 106, N'VE-E', N'Searchlight Pricklypear', 59, N'HVAC', NULL, 65, 546, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (748, 48, 58, N'IN-RJ', N'Little Green Sedge', 125, N'Curb & Gutter', NULL, 71, 1095, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (749, 21, 122, N'CA-NB', N'Papyrus', 55, N'Exterior Signage', NULL, 58, 78, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (750, 19, 80, N'US-NM', N'Warnstorfia Moss', 62, N'Waterproofing & Caulking', N'Fire Protection', 90, 792, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (751, 31, 3, N'GB-ENG', N'Leadwood', 23, N'Rebar & Wire Mesh Install', N'Painting & Vinyl Wall Covering', 72, 369, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (752, 14, 66, N'BG-16', N'Coinvine', 133, N'Termite Control', NULL, 86, 803, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (753, 14, 40, N'PK-NW', N'Desertbeauty', 123, N'Framing (Wood)', NULL, 51, 719, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (754, 43, 140, N'BR-MA', N'Porpidia Lichen', 124, N'Ornamental Railings', N'RF Shielding', 100, 471, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (755, 20, 66, N'HR-17', N'Drummond''s False Pennyroyal', 39, N'Temp Fencing, Decorative Fencing and Gates', NULL, 22, 1058, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (756, 15, 77, N'SE-Q', N'Alder', 147, N'Drywall & Acoustical (FED)', NULL, 30, 1049, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (757, 8, 145, N'CN-51', N'Hippocratea', 59, N'Framing (Steel)', N'Fire Sprinkler System', 69, 72, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (758, 31, 89, N'CK-U-A', N'Recurved Milkvetch', 121, N'Site Furnishings', NULL, 69, 480, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (759, 7, 31, N'FR-R', N'Sherman Hoyt Woolstar', 67, N'Soft Flooring and Base', NULL, 80, 1095, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (760, 25, 25, N'US-VA', N'Greene''s Bird''s-foot Trefoil', 128, N'Construction Clean and Final Clean', NULL, 32, 153, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (761, 25, 66, N'MN-046', N'Olapalapa', 122, N'Granite Surfaces', N'Curb & Gutter', 88, 774, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (762, 27, 101, N'VU-TAE', N'Baker''s Lupine', 121, N'Granite Surfaces', NULL, 17, 542, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (763, 19, 136, N'RU-NEN', N'Greenman''s Bluet', 104, N'Ornamental Railings', NULL, 84, 281, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (764, 40, 35, N'CL-ML', N'Frosted Lichen', 101, N'Casework', N'Painting & Vinyl Wall Covering', 79, 658, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (765, 7, 68, N'CU-14', N'Rydberg''s Blackberry', 46, N'Electrical', N'Roofing (Metal)', 54, 592, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (766, 37, 16, N'US-WA', N'Brigantiaea Lichen', 73, N'Asphalt Paving', N'Drywall & Acoustical (MOB)', 81, 231, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (767, 22, 108, N'US-MN', N'Pale St. Johnswort', 62, N'Framing (Steel)', N'Fire Sprinkler System', 37, 59, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (768, 14, 60, N'US-TX', N'Jungermann''s Platydictya Moss', 149, N'Temp Fencing, Decorative Fencing and Gates', N'Drywall & Acoustical (FED)', 5, 275, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (769, 42, 91, N'US-NE', N'Strand Tangantangan', 88, N'Retaining Wall and Brick Pavers', NULL, 43, 390, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (770, 6, 123, N'BO-B', N'Banana', 40, N'Masonry & Precast', NULL, 15, 63, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (771, 1, 36, N'BR-PA', N'Weak Rush', 110, N'Framing (Wood)', N'Asphalt Paving', 69, 676, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (772, 18, 42, N'PK-BA', N'Mountain-avens', 48, N'Painting & Vinyl Wall Covering', NULL, 56, 769, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (773, 16, 32, N'BR-PR', N'Mt. Desert Island Blackberry', 60, N'Termite Control', NULL, 85, 1084, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (774, 28, 55, N'SB-WE', N'Bridges'' Gilia', 37, N'Soft Flooring and Base', N'EIFS', 38, 1048, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (775, 41, 89, N'PG-NPP', N'Mock Pennyroyal', 49, N'Structural and Misc Steel (Fabrication)', N'Termite Control', 97, 415, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (776, 50, 77, N'US-WI', N'Roundfruit Hedgehyssop', 97, N'Plumbing & Medical Gas', N'Retaining Wall and Brick Pavers', 65, 124, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (777, 2, 40, N'RO-SV', N'Atlantic Pigeonwings', 141, N'Sitework & Site Utilities', NULL, 21, 621, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (778, 39, 119, N'ML-1', N'Foothill Larkspur', 71, N'Soft Flooring and Base', N'Waterproofing & Caulking', 29, 696, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (779, 47, 7, N'CU-14', N'Yellow Fumewort', 83, N'Fire Sprinkler System', N'Curb & Gutter', 93, 75, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (780, 21, 106, N'BR-MS', N'Polar Sedge', 110, N'Waterproofing & Caulking', NULL, 13, 512, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (781, 16, 147, N'BR-PR', N'Bigflower Clover', 106, N'Glass & Glazing', NULL, 42, 836, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (782, 36, 128, N'VN-56', N'Tara Vine', 27, N'Marlite Panels (FED)', N'Casework', 43, 161, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (783, 2, 93, N'CC-U-A', N'Rice', 54, N'Temp Fencing, Decorative Fencing and Gates', NULL, 14, 302, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (784, 28, 75, N'IR-15', N'Mauritia', 20, N'Granite Surfaces', NULL, 29, 601, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (785, 35, 146, N'ZA-NP', N'Owens Valley Beardtongue', 119, N'Masonry', NULL, 91, 827, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (786, 33, 3, N'PG-NPP', N'Creeping Bentgrass', 26, N'Masonry', N'Structural and Misc Steel (Fabrication)', 46, 667, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (787, 31, 117, N'CA-BC', N'Glacial Kiaeria Moss', 46, N'Wall Protection', NULL, 49, 615, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (788, 33, 118, N'FR-R', N'Emperor''s Candlesticks', 93, N'Construction Clean and Final Clean', NULL, 68, 957, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (789, 18, 110, N'SY-HA', N'Mountain Mock Vervain', 94, N'Painting & Vinyl Wall Covering', N'Electrical', 57, 147, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (790, 46, 100, N'RU-SA', N'Northern Orange Lichen', 143, N'Epoxy Flooring', N'Electrical and Fire Alarm', 26, 131, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (791, 25, 103, N'SR-NI', N'Blood-red Pricklypear', 81, N'Casework', NULL, 20, 589, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (792, 12, 90, N'US-TX', N'Marsh Fimbry', 107, N'Doors, Frames & Hardware', N'Site Furnishings', 69, 505, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (793, 17, 123, N'FJ-R', N'Pale Wallflower', 87, N'Overhead Doors', N'Termite Control', 55, 698, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (794, 7, 141, N'PK-NW', N'Wart Lichen', 61, N'Electrical and Fire Alarm', NULL, 8, 439, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (795, 26, 52, N'CO-MET', N'Nevada Lupine', 76, N'Construction Clean and Final Clean', N'Termite Control', 12, 238, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (796, 26, 103, N'BW-CE', N'Rim Lichen', 109, N'Roofing (Metal)', NULL, 25, 102, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (797, 13, 24, N'BR-PA', N'Netvein Hollyfern', 117, N'Asphalt Paving', NULL, 77, 378, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (798, 21, 109, N'RU-YAR', N'Dwarf Muellerella Lichen', 69, N'Temp Fencing, Decorative Fencing and Gates', N'Epoxy Flooring', 86, 591, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (799, 40, 125, N'GA-4', N'Groundcover Milkvetch', 72, N'Waterproofing & Caulking', NULL, 49, 895, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (800, 45, 49, N'TR-41', N'Wasatch Beardtongue', 127, N'Framing (Wood)', N'Drywall & Acoustical (MOB)', 76, 718, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (801, 9, 127, N'US-VA', N'Tucker''s Anisomeridium Lichen', 57, N'Electrical and Fire Alarm', NULL, 72, 719, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (802, 14, 98, N'AR-Z', N'Northwest Sandbar Willow', 42, N'Plumbing & Medical Gas', N'Waterproofing & Caulking', 14, 449, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (803, 24, 28, N'US-IL', N'Birthwort', 85, N'HVAC', N'Soft Flooring and Base', 16, 115, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (804, 24, 102, N'US-CA', N'Silver Draba', 42, N'Drywall & Acoustical (MOB)', N'Landscaping & Irrigation', 92, 540, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (805, 37, 8, N'US-AK', N'Earth Lichen', 136, N'Waterproofing & Caulking', N'Soft Flooring and Base', 74, 996, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (806, 47, 150, N'US-CA', N'Perennial Veldtgrass', 88, N'Framing (Wood)', N'Masonry & Precast', 11, 178, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (807, 40, 22, N'NP-SE', N'Plumed Goldenrod', 55, N'Construction Clean and Final Clean', NULL, 98, 765, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (808, 50, 102, N'AO-LNO', N'Fourwing Milkvetch', 94, N'EIFS', NULL, 53, 182, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (809, 30, 73, N'PY-1', N'El Tuque', 43, N'HVAC', N'Epoxy Flooring', 18, 747, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (810, 26, 136, N'US-AK', N'Menzies'' Campion', 130, N'EIFS', NULL, 56, 924, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (811, 48, 63, N'AE-AZ', N'Yellow Chiodecton Lichen', 51, N'Fire Protection', NULL, 7, 667, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (812, 31, 87, N'FR-H', N'Tropical Wild Petunia', 74, N'Overhead Doors', NULL, 45, 314, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (813, 38, 142, N'GN-N', N'Steere''s Pylaisiella Moss', 93, N'Masonry', N'Epoxy Flooring', 60, 276, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (814, 1, 59, N'US-CO', N'Krug''s Clearweed', 57, N'Granite Surfaces', N'Doors, Frames & Hardware', 25, 665, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (815, 25, 20, N'MX-OAX', N'Valley Peperomia', 110, N'Structural & Misc Steel Erection', NULL, 43, 227, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (816, 7, 82, N'SO-NU', N'O''ahu Cyanea', 37, N'Landscaping & Irrigation', NULL, 76, 1060, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (817, 22, 51, N'US-AK', N'Parathesis', 112, N'Landscaping & Irrigation', N'Fire Protection', 32, 279, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (818, 28, 116, N'MA-CAS', N'Halimodendron', 128, N'Rebar & Wire Mesh Install', N'Drywall & Acoustical (MOB)', 69, 239, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (819, 1, 77, N'UA-74', N'Sharp''s Homaliadelphus Moss', 118, N'Granite Surfaces', N'Roofing (Asphalt)', 96, 470, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (820, 25, 36, N'PG-SAN', N'Funeral Mountain Blue-eyed Grass', 56, N'Asphalt Paving', N'Prefabricated Aluminum Metal Canopies', 14, 845, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (821, 49, 148, N'NC-U-A', N'Eschscholtz''s Buttercup', 150, N'EIFS', NULL, 68, 294, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (822, 12, 137, N'ZA-EC', N'Slimlobe Bahia', 67, N'Electrical and Fire Alarm', N'Elevator', 9, 1072, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (823, 21, 100, N'BR-AM', N'Island Mallow', 119, N'Hard Tile & Stone', N'Waterproofing & Caulking', 10, 1005, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (824, 22, 125, N'CA-BC', N'Eastern Poison Ivy', 53, N'Structural & Misc Steel Erection', N'Hard Tile & Stone', 51, 575, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (825, 29, 127, N'ZM-03', N'Lilac Penstemon', 148, N'HVAC', NULL, 91, 234, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (826, 8, 66, N'FR-U', N'Saguaro', 78, N'Marlite Panels (FED)', N'Wall Protection', 69, 670, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (827, 46, 42, N'US-CA', N'Bugseed', 75, N'Retaining Wall and Brick Pavers', NULL, 51, 437, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (828, 12, 31, N'JP-40', N'Broadbeard Beardtongue', 130, N'Masonry', NULL, 83, 412, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (829, 49, 37, N'US-TN', N'Dipogon', 69, N'Rebar & Wire Mesh Install', NULL, 46, 858, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (830, 10, 42, N'FR-R', N'Meager Pygmydaisy', 99, N'Hard Tile & Stone', N'Granite Surfaces', 91, 592, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (831, 32, 142, N'CO-CHO', N'Whitetop-box', 126, N'Ornamental Railings', NULL, 81, 418, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (832, 9, 144, N'US-MA', N'Blackish Oxytrope', 106, N'Exterior Signage', N'Structural & Misc Steel Erection', 28, 513, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (833, 44, 134, N'PG-CPM', N'Field Woodrush', 44, N'Structural & Misc Steel Erection', N'Termite Control', 42, 149, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (834, 49, 144, N'AF-HEL', N'Red Star Apple', 125, N'Retaining Wall and Brick Pavers', N'Overhead Doors', 70, 1090, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (835, 24, 88, N'CU-99', N'Bluegrass', 120, N'Plumbing & Medical Gas', NULL, 37, 943, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (836, 14, 38, N'YE-BA', N'Congdon''s Mock Stonecrop', 149, N'Elevator', N'Retaining Wall and Brick Pavers', 10, 330, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (837, 9, 107, N'NG-LA', N'Convallaria', 143, N'Construction Clean and Final Clean', NULL, 68, 826, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (838, 8, 118, N'DO-13', N'Soft Greeneyes', 52, N'Drywall & Acoustical (MOB)', N'Framing (Steel)', 27, 476, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (839, 4, 27, N'US-WI', N'Pipsissewa', 106, N'Fire Protection', NULL, 91, 515, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (840, 10, 94, N'PE-UCA', N'Narrowleaf Rhombopod', 136, N'Casework', N'Fire Sprinkler System', 69, 188, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (841, 5, 26, N'US-AZ', N'Spiderwort', 78, N'RF Shielding', NULL, 53, 620, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (842, 49, 49, N'ID-PB', N'Red Brome', 135, N'Sitework & Site Utilities', NULL, 40, 226, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (843, 12, 106, N'MG-M', N'Forked Jelly Lichen', 149, N'Waterproofing & Caulking', N'Epoxy Flooring', 79, 246, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (844, 32, 143, N'US-MN', N'Doubleclaw', 23, N'Marlite Panels (FED)', NULL, 68, 295, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (845, 44, 28, N'BR-SC', N'Platonia', 148, N'Fire Sprinkler System', N'Waterproofing & Caulking', 33, 674, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (846, 1, 142, N'US-MT', N'Candlewood', 100, N'Curb & Gutter', N'Electrical', 95, 114, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (847, 41, 14, N'IT-42', N'Stiff Yellow Flax', 53, N'HVAC', NULL, 77, 936, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (848, 26, 4, N'CA-QC', N'Tufted Evening Primrose', 91, N'Wall Protection', NULL, 85, 799, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (849, 46, 80, N'US-MT', N'Hairy Purslane', 67, N'Roofing (Asphalt)', NULL, 67, 874, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (850, 43, 104, N'BW-KG', N'Indianhemp', 144, N'Site Furnishings', NULL, 65, 672, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (851, 35, 11, N'TR-46', N'Variableleaf Water Hyacinth', 39, N'Drywall & Acoustical (MOB)', NULL, 46, 376, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (852, 40, 126, N'PG-WPD', N'Debeque Phacelia', 101, N'Site Furnishings', N'Prefabricated Aluminum Metal Canopies', 25, 731, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (853, 41, 1, N'CI-09', N'Lake Tahoe Draba', 35, N'Roofing (Asphalt)', N'Wall Protection', 68, 650, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (854, 9, 60, N'BR-ES', N'Velvetleaf', 108, N'Painting & Vinyl Wall Covering', NULL, 34, 622, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (855, 39, 24, N'US-AL', N'Bride''s Feathers', 122, N'Waterproofing & Caulking', NULL, 27, 546, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (856, 29, 47, N'MF-U-A', N'Hairawn Muhly', 73, N'Drilled Shafts', NULL, 60, 420, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (857, 14, 30, N'MG-M', N'Indian Mallow', 42, N'Site Furnishings', N'Granite Surfaces', 32, 521, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (858, 50, 115, N'MZ-N', N'Neofuscelia Lichen', 34, N'Masonry & Precast', N'Rebar & Wire Mesh Install', 48, 686, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (859, 13, 56, N'BR-RS', N'Rinodina Lichen', 145, N'Asphalt Paving', NULL, 21, 789, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (860, 23, 2, N'CA-QC', N'Cassava', 130, N'Fire Sprinkler System', NULL, 99, 958, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (861, 41, 19, N'TC-PN', N'Yellow Unicorn-plant', 55, N'Plumbing & Medical Gas', NULL, 59, 260, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (862, 5, 121, N'BW-NW', N'Lanceleaf Grapefern', 109, N'Soft Flooring and Base', NULL, 17, 767, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (863, 39, 4, N'RU-PRI', N'Slender Wild Cabbage', 44, N'Roofing (Metal)', NULL, 7, 318, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (864, 50, 110, N'US-TN', N'Howelliella', 20, N'Termite Control', N'Site Furnishings', 53, 499, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (865, 3, 10, N'IE-C', N'Carolina Canoparmelia Lichen', 139, N'Rebar & Wire Mesh Install', N'Masonry', 41, 504, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (866, 37, 138, N'PG-SAN', N'Toetoe', 96, N'Fire Protection', N'Electrical', 46, 464, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (867, 8, 21, N'IR-27', N'Poisonbean', 96, N'Sitework & Site Utilities', N'Plumbing & Medical Gas', 60, 98, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (868, 31, 88, N'ES-CN', N'Klamath Sedge', 102, N'Overhead Doors', N'Electrical', 91, 136, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (869, 48, 128, N'ZA-NL', N'Lettuce Wirelettuce', 99, N'Hard Tile & Stone', NULL, 58, 522, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (870, 12, 123, N'US-WA', N'Xanthoparmelia Lichen', 146, N'HVAC', N'Sitework & Site Utilities', 24, 992, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (871, 47, 133, N'ID-SG', N'Burdock Clover', 117, N'Masonry & Precast', NULL, 39, 827, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (872, 7, 102, N'TH-80', N'Savannah Meadowbeauty', 67, N'Marlite Panels (FED)', NULL, 41, 761, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (873, 19, 90, N'ET-OR', N'Incomplete Syrrhopodon Moss', 150, N'Electrical and Fire Alarm', NULL, 50, 289, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (874, 26, 92, N'RO-TL', N'Cyanea', 68, N'Hard Tile & Stone', NULL, 64, 832, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (875, 31, 97, N'US-AK', N'Cracked Lichen', 65, N'Framing (Steel)', NULL, 92, 168, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (876, 32, 38, N'CN-21', N'Canadian White Violet', 57, N'Framing (Wood)', NULL, 87, 836, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (877, 3, 87, N'GB-ENG', N'Coastal Plain Umbrella-sedge', 21, N'Temp Fencing, Decorative Fencing and Gates', N'Elevator', 35, 675, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (878, 49, 131, N'CL-LL', N'Leafy Pondweed', 96, N'Structural & Misc Steel Erection', NULL, 18, 595, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (879, 14, 75, N'PG-WBK', N'Cup Lichen', 56, N'Electrical and Fire Alarm', NULL, 58, 240, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (880, 40, 94, N'CA-SK', N'Waianae Range Hala Pepe', 33, N'Curb & Gutter', NULL, 17, 625, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (881, 11, 102, N'MX-COA', N'Alpine Bearberry', 50, N'Overhead Doors', NULL, 80, 967, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (882, 49, 5, N'US-CA', N'Na''ena''e Pua Kea', 26, N'HVAC', NULL, 41, 1049, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (883, 20, 137, N'PA-8', N'Stiff Fendlerbush', 59, N'Landscaping & Irrigation', N'Overhead Doors', 50, 676, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (884, 13, 143, N'CO-LAG', N'Soapwort', 66, N'Electrical and Fire Alarm', NULL, 28, 455, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (885, 27, 54, N'ID-RI', N'Fall Rosette Grass', 46, N'Fire Protection', NULL, 20, 940, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (886, 4, 85, N'BR-PA', N'Tweedy''s Willow', 72, N'Drywall & Acoustical (MOB)', NULL, 16, 920, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (887, 32, 120, N'CA-QC', N'Little Green Sedge', 77, N'Masonry & Precast', N'Marlite Panels (FED)', 7, 837, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (888, 19, 145, N'US-TX', N'Cypress Graphina Lichen', 117, N'Drywall & Acoustical (FED)', N'Plumbing & Medical Gas', 99, 89, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (889, 18, 57, N'CA-NT', N'Mountain Slope Thistle', 36, N'Electrical and Fire Alarm', N'Painting & Vinyl Wall Covering', 30, 948, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (890, 9, 81, N'CN-33', N'Pohlia Moss', 77, N'Landscaping & Irrigation', N'Doors, Frames & Hardware', 68, 322, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (891, 45, 64, N'US-NE', N'Larkspur', 59, N'Plumbing & Medical Gas', NULL, 66, 654, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (892, 42, 31, N'CD-KE', N'Parry''s Jepsonia', 136, N'Sitework & Site Utilities', NULL, 21, 135, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (893, 49, 2, N'SA-01', N'Lemmon''s Rockdaisy', 99, N'Casework', NULL, 89, 717, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (894, 20, 47, N'CO-AMA', N'Map Lichen', 78, N'Landscaping & Irrigation', N'Overhead Doors', 93, 364, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (895, 18, 35, N'GB-ENG', N'Texas Star', 105, N'Electrical and Fire Alarm', NULL, 91, 691, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (896, 37, 91, N'US-WI', N'Bog Dubautia', 89, N'HVAC', NULL, 20, 911, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (897, 43, 65, N'US-OR', N'Cobwebby Wild Indigo', 59, N'Roofing (Asphalt)', N'Termite Control', 78, 587, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (898, 46, 93, N'US-CA', N'Bigtop Lovegrass', 142, N'Framing (Wood)', NULL, 21, 91, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (899, 18, 30, N'US-UT', N'Woolly Cottonflower', 23, N'Curb & Gutter', NULL, 17, 470, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (900, 4, 5, N'IN-GJ', N'Sierra Ancha Fleabane', 81, N'Electrical', NULL, 31, 443, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (901, 30, 49, N'US-TX', N'False Monkeyflower', 27, N'Structural and Misc Steel (Fabrication)', NULL, 82, 252, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (902, 8, 128, N'MY-13', N'Variegated Liveforever', 142, N'Drywall & Acoustical (FED)', N'HVAC', 63, 627, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (903, 30, 19, N'BF-SMT', N'Rock Lupine', 121, N'Marlite Panels (FED)', NULL, 39, 807, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (904, 25, 22, N'VN-52', N'Polyblastia Lichen', 21, N'Epoxy Flooring', NULL, 23, 1022, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (905, 33, 117, N'MA-CAS', N'Zarzabacoa Comun', 58, N'Overhead Doors', NULL, 10, 845, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (906, 41, 135, N'US-ID', N'Eastern Mojave Buckwheat', 132, N'Casework', N'Temp Fencing, Decorative Fencing and Gates', 8, 185, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (907, 36, 27, N'CL-TA', N'Bonpland''s Scribble Lichen', 31, N'Curb & Gutter', N'Overhead Doors', 83, 789, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (908, 44, 112, N'TZ-12', N'European Olive', 124, N'Roofing (Asphalt)', NULL, 14, 416, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (909, 26, 87, N'PH-DAO', N'Costus', 92, N'Masonry & Precast', NULL, 39, 623, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (910, 16, 44, N'US-CO', N'Claspingleaf St. Johnswort', 68, N'Ornamental Railings', N'Curb & Gutter', 19, 809, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (911, 19, 58, N'US-IA', N'Cohune Palm', 126, N'Temp Fencing, Decorative Fencing and Gates', NULL, 18, 1040, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (912, 24, 117, N'US-AK', N'Red Fescue', 24, N'Masonry & Precast', N'Asphalt Paving', 14, 496, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (913, 38, 105, N'HN-CL', N'Monarch Redstem', 33, N'Curb & Gutter', NULL, 39, 435, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (914, 45, 72, N'BR-MA', N'Tall Alumroot', 65, N'Roofing (Metal)', N'Plumbing & Medical Gas', 40, 73, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (915, 31, 84, N'GA-8', N'Hayscented Fern', 55, N'Electrical', NULL, 13, 260, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (916, 7, 44, N'DZ-33', N'San Joaquin Tarweed', 100, N'Fire Sprinkler System', N'Ornamental Railings', 69, 688, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (917, 36, 30, N'PG-WPD', N'Molokai Cyanea', 126, N'HVAC', NULL, 68, 1075, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (918, 29, 81, N'AU-QLD', N'Fewseed Sedge', 129, N'Fire Protection', NULL, 62, 316, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (919, 20, 87, N'CA-BC', N'Two-color Orange Lichen', 144, N'Masonry & Precast', NULL, 18, 769, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (920, 40, 86, N'EC-Y', N'Annual Bluegrass', 104, N'Termite Control', NULL, 49, 53, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (921, 9, 137, N'US-GA', N'Howell''s Pussytoes', 79, N'Electrical', N'Drywall & Acoustical (FED)', 47, 768, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (922, 9, 30, N'US-FL', N'Oahu Tetramolopium', 106, N'Epoxy Flooring', N'Rebar & Wire Mesh Install', 32, 428, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (923, 30, 92, N'LU-L', N'Island Schiedea', 25, N'Retaining Wall and Brick Pavers', NULL, 66, 77, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (924, 13, 144, N'DE-SH', N'Gingerleaf', 98, N'Curb & Gutter', NULL, 32, 326, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (925, 3, 41, N'SD-13', N'Wild Tantan', 114, N'Fire Sprinkler System', N'Roofing (Asphalt)', 80, 448, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (926, 3, 19, N'MZ-P', N'Sedge', 29, N'Rebar & Wire Mesh Install', N'Drilled Shafts', 53, 144, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (927, 27, 113, N'US-AK', N'False Rosemary', 125, N'Site Furnishings', N'Framing (Steel)', 69, 852, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (928, 43, 132, N'CA-BC', N'Japanese Bittercress', 115, N'Termite Control', NULL, 44, 51, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (929, 45, 102, N'BR-PR', N'Herbaceous Periwinkle', 149, N'Masonry & Precast', N'Electrical and Fire Alarm', 69, 1089, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (930, 41, 119, N'MG-M', N'Fragrant Mimosa', 33, N'Plumbing & Medical Gas', N'Hard Tile & Stone', 12, 391, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (931, 16, 93, N'PG-EPW', N'Slenderstalk Beeblossom', 132, N'Exterior Signage', NULL, 82, 235, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (932, 50, 142, N'AO-CNN', N'Limpleaf Spikemoss', 119, N'Marlite Panels (FED)', N'Prefabricated Aluminum Metal Canopies', 82, 970, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (933, 29, 107, N'PG-GPK', N'Camphor Daisy', 128, N'Fire Protection', NULL, 23, 728, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (934, 35, 74, N'PR-U-A', N'Heller''s Grape', 115, N'Ornamental Railings', N'Overhead Doors', 32, 606, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (935, 37, 64, N'US-TX', N'Steere''s Sphagnum', 102, N'Marlite Panels (FED)', N'EIFS', 96, 443, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (936, 14, 97, N'AU-TAS', N'Puerto Rico Thoroughwort', 51, N'Fire Protection', N'Ornamental Railings', 30, 608, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (937, 42, 129, N'PY-7', N'Gambel''s Yellowcress', 119, N'Ornamental Railings', NULL, 91, 803, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (938, 46, 94, N'ZA-NP', N'Sticky Pincushionplant', 95, N'Curb & Gutter', N'Casework', 16, 764, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (939, 14, 112, N'DO-01', N'Nevada Blazingstar', 134, N'Framing (Steel)', N'Structural & Misc Steel Erection', 43, 555, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (940, 44, 14, N'NU-U-A', N'Bower Wattle', 77, N'Drywall & Acoustical (FED)', NULL, 85, 727, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (941, 20, 31, N'PG-EHG', N'Canary Island St. Johnswort', 119, N'Drilled Shafts', N'Termite Control', 27, 536, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (942, 27, 146, N'BR-SP', N'Cordillera Maiden Fern', 60, N'Electrical', NULL, 47, 365, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (943, 43, 29, N'BR-BA', N'Navajo Cinquefoil', 71, N'Glass & Glazing', NULL, 60, 363, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (944, 39, 15, N'US-MS', N'Pride-of-rochester', 32, N'Construction Clean and Final Clean', NULL, 53, 196, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (945, 23, 132, N'NI-AN', N'Stinking Strawflower', 115, N'Asphalt Paving', NULL, 39, 318, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (946, 25, 97, N'CO-TOL', N'Brisselet', 82, N'Casework', NULL, 28, 544, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (947, 5, 111, N'US-IL', N'Graceful Lipfern', 49, N'Roofing (Asphalt)', N'Marlite Panels (FED)', 43, 849, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (948, 9, 17, N'RU-AMU', N'Erectleaf Panicgrass', 92, N'Hard Tile & Stone', NULL, 72, 382, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (949, 47, 46, N'CL-LL', N'Gray Field Speedwell', 149, N'Doors, Frames & Hardware', NULL, 68, 441, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (950, 26, 140, N'CR-L', N'Rugel''s Nailwort', 150, N'Fire Sprinkler System', N'Electrical', 36, 757, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (951, 30, 139, N'GE-AJ', N'Harvestbells', 44, N'Casework', N'Framing (Wood)', 56, 783, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (952, 15, 122, N'PG-EHG', N'Rough Buttonweed', 112, N'Framing (Steel)', N'Casework', 38, 729, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (953, 6, 23, N'IN-AP', N'Steerecleus Moss', 113, N'Fire Protection', N'Overhead Doors', 35, 508, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (954, 30, 113, N'TD-BET', N'Smooth Rodwood', 61, N'Rebar & Wire Mesh Install', NULL, 23, 882, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (955, 21, 92, N'US-AK', N'Varioushair Fescue', 127, N'Roofing (Asphalt)', NULL, 67, 912, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (956, 7, 15, N'US-IL', N'Goldenrain Tree', 60, N'Marlite Panels (FED)', N'Roofing (Asphalt)', 46, 930, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (957, 42, 102, N'CO-CUN', N'Dortmann''s Cardinalflower', 133, N'Fire Sprinkler System', NULL, 51, 747, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (958, 11, 87, N'GB-ENG', N'Snow Lichen', 146, N'Painting & Vinyl Wall Covering', NULL, 43, 345, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (959, 36, 132, N'US-MN', N'Panamint Mountain Buckwheat', 101, N'Granite Surfaces', N'Structural & Misc Steel Erection', 10, 668, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (960, 36, 81, N'US-OH', N'Metzler''s Licheothelia Lichen', 110, N'Fire Protection', N'Temp Fencing, Decorative Fencing and Gates', 91, 162, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (961, 5, 37, N'CA-ON', N'Rio Grande Beeblossom', 144, N'Fire Protection', NULL, 83, 977, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (962, 30, 45, N'CA-NT', N'Masonhalea Lichen', 24, N'Elevator', NULL, 68, 592, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (963, 29, 10, N'BR-MG', N'Mohr''s Barbara''s Buttons', 106, N'Exterior Signage', NULL, 45, 633, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (964, 12, 112, N'TN-51', N'Otay Mesamint', 97, N'Casework', NULL, 88, 498, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (965, 5, 4, N'US-MT', N'Lace Hedgehog Cactus', 149, N'Painting & Vinyl Wall Covering', N'Electrical', 31, 969, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (966, 26, 59, N'CN-51', N'Florida Grape', 24, N'Wall Protection', N'Structural & Misc Steel Erection', 63, 381, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (967, 26, 97, N'GR-21', N'Parks'' Stoneseed', 23, N'HVAC', N'Electrical and Fire Alarm', 79, 1039, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (968, 27, 122, N'DZ-31', N'Smallflowered Anemone', 67, N'Painting & Vinyl Wall Covering', N'Drywall & Acoustical (FED)', 95, 930, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (969, 13, 117, N'ZA-NC', N'Jumbypotato', 72, N'Electrical', NULL, 67, 168, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (970, 48, 99, N'ZM-01', N'Glory Of Texas', 93, N'Marlite Panels (FED)', N'Masonry & Precast', 40, 303, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (971, 26, 6, N'SE-I', N'Calamus', 33, N'Curb & Gutter', NULL, 67, 496, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (972, 49, 76, N'PF-U-A', N'Apiculate Bryum Moss', 128, N'Landscaping & Irrigation', NULL, 16, 60, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (973, 21, 69, N'NO-20', N'Buckwheat Milkvetch', 105, N'Framing (Wood)', NULL, 90, 304, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (974, 19, 146, N'EE-67', N'Torrey''s Cryptantha', 27, N'Painting & Vinyl Wall Covering', NULL, 90, 720, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (975, 50, 53, N'FR-V', N'Showy Forsythia', 136, N'Roofing (Metal)', N'Rebar & Wire Mesh Install', 44, 625, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (976, 37, 140, N'PG-WPD', N'Autumn Olive', 114, N'Exterior Signage', NULL, 26, 805, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (977, 29, 131, N'IN-WB', N'Venus'' Chariot', 92, N'Temp Fencing, Decorative Fencing and Gates', NULL, 38, 935, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (978, 22, 91, N'FR-B', N'Roundleaf Alumroot', 76, N'Roofing (Metal)', N'Fire Protection', 20, 284, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (979, 33, 61, N'SE-AC', N'Desert Yellowhead', 100, N'Exterior Signage', NULL, 26, 413, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (980, 4, 20, N'CI-14', N'Cherrybark Oak', 93, N'Casework', N'Masonry', 52, 325, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (981, 39, 82, N'BR-TO', N'Icecreambean', 35, N'Framing (Steel)', NULL, 82, 734, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (982, 35, 73, N'CD-KW', N'Clusterspike False Indigo', 104, N'HVAC', N'RF Shielding', 28, 437, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (983, 8, 120, N'US-NC', N'Red Bartsia', 106, N'Masonry & Precast', N'Site Furnishings', 56, 151, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (984, 10, 48, N'TW-X-LK', N'Thorn Wattle', 116, N'Site Furnishings', NULL, 77, 162, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (985, 40, 4, N'US-WY', N'Martorell''s Lidflower', 144, N'Rebar & Wire Mesh Install', NULL, 77, 818, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (986, 5, 86, N'BD-2', N'American White Waterlily', 135, N'Electrical and Fire Alarm', NULL, 67, 486, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (987, 28, 74, N'ZA-EC', N'Brittle Spineflower', 76, N'Soft Flooring and Base', NULL, 73, 845, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (988, 44, 68, N'CA-BC', N'Washington Physcomitrium Moss', 76, N'Glass & Glazing', N'Hard Tile & Stone', 92, 705, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (989, 40, 41, N'JP-28', N'Smallflower Buttercup', 21, N'Exterior Signage', N'Drywall & Acoustical (FED)', 18, 929, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (990, 46, 82, N'MZ-P', N'Mule-fat', 145, N'Waterproofing & Caulking', NULL, 98, 897, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (991, 16, 48, N'US-AL', N'Wavyleaf Thoroughwort', 108, N'RF Shielding', N'Drywall & Acoustical (FED)', 15, 1067, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (992, 1, 98, N'CN-54', N'Bluejacket', 72, N'Waterproofing & Caulking', N'Structural & Misc Steel Erection', 39, 1068, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (993, 23, 68, N'ID-PA', N'Sorghum', 123, N'Drywall & Acoustical (FED)', NULL, 93, 397, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (994, 25, 50, N'RU-KHA', N'Aloina Moss', 150, N'Drywall & Acoustical (MOB)', NULL, 67, 347, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (995, 37, 138, N'MM-03', N'Tree Lavatera', 93, N'Fire Protection', NULL, 55, 922, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (996, 23, 34, N'US-AK', N'Groovestem Indian Plantain', 123, N'Painting & Vinyl Wall Covering', NULL, 10, 509, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (997, 29, 109, N'RU-SAK', N'Fellhanera Lichen', 118, N'Site Furnishings', NULL, 19, 1075, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (998, 44, 9, N'US-OR', N'Stone Rubberweed', 99, N'Electrical and Fire Alarm', N'Temp Fencing, Decorative Fencing and Gates', 83, 180, N'Türkçe', 1)
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (999, 45, 126, N'CA-QC', N'Inkbush', 34, N'Curb & Gutter', NULL, 27, 118, N'Türkçe', 1)
GO
INSERT [dbo].[tbl_Kitaplar] ([ID], [SATICI_ID], [YAZAR_ID], [URUN_KODU], [URUN_ADI], [FIYAT], [KATEGORI_1], [KATEGORI_2], [URUN_ADEDI], [SAYFA_SAYISI], [DIL], [DURUM]) VALUES (1000, 17, 28, N'CA-ON', N'Ash Meadows Lady''s Tresses', 58, N'Drywall & Acoustical (FED)', NULL, 84, 1068, N'Türkçe', 1)
SET IDENTITY_INSERT [dbo].[tbl_Kitaplar] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Kullanicilar] ON 

INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (1, N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'Muhammed Altunışık', N'muhammedaaltunisik@hotmail.com', N'Erkek', N'A')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (2, N'hfleetham0', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Hubert Fleetham', N'hfleetham0@aol.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (3, N'lbaskerville1', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Luis Baskerville', N'lbaskerville1@domainmarket.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (4, N'tcardoso2', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Tim Cardoso', N'tcardoso2@delicious.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (5, N'djouannot3', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Damian Jouannot', N'djouannot3@springer.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (6, N'ewhitta4', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Eberhard Whitta', N'ewhitta4@ehow.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (7, N'tpeppin5', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Timmie Peppin', N'tpeppin5@washingtonpost.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (8, N'cstopher6', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Carree Stopher', N'cstopher6@addtoany.com', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (9, N'msivills7', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Malvin Sivills', N'msivills7@pen.io', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (10, N'kmelburg8', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Kirsten Melburg', N'kmelburg8@irs.gov', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (11, N'jbadcock9', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Jillian Badcock', N'jbadcock9@slashdot.org', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (12, N'sbelwarda', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Susan Belward', N'sbelwarda@theglobeandmail.com', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (13, N'ldunseithb', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Lincoln Dunseith', N'ldunseithb@domainmarket.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (14, N'gwincottc', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Gabie Wincott', N'gwincottc@skyrock.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (15, N'ffranssend', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Frayda Franssen', N'ffranssend@mapy.cz', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (16, N'rtullye', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Robina Tully', N'rtullye@newyorker.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (17, N'kribyf', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Kincaid Riby', N'kribyf@state.gov', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (18, N'sbugdaleg', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Sigrid Bugdale', N'sbugdaleg@themeforest.net', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (19, N'dshereh', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Danyelle Shere', N'dshereh@desdev.cn', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (20, N'gtayei', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Giffie Taye', N'gtayei@cloudflare.com', N'Erkek', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (21, N'awaistellj', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Amity Waistell', N'awaistellj@cnbc.com', N'Kadın', N'M')
INSERT [dbo].[tbl_Kullanicilar] ([ID], [KULLANICI_ADI], [SIFRE], [TAM_AD], [MAIL], [CINSIYET], [KULLANICI_TIPI]) VALUES (22, N'mami5253', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', N'Muhammed Altunışık', N'muhammedaaltunisik@hotmail.com', N'Erkek', N'M')
SET IDENTITY_INSERT [dbo].[tbl_Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Saticilar] ON 

INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (1, N'vpacker0', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Roberts, Halvorson and Crona')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (2, N'smcilwraith1', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Zieme, Langworth and Bashirian')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (3, N'eiles2', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Murray-Krajcik')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (4, N'ldevaney3', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Waelchi, Rutherford and Sanford')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (5, N'ejurgensen4', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Moen-Friesen')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (6, N'thusset5', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Graham LLC')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (7, N'aparkinson6', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Rogahn, Effertz and Harvey')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (8, N'jmallison7', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Paucek-Schowalter')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (9, N'lmacgiollapheadair8', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Barrows, Kertzmann and Crona')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (10, N'jjamieson9', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Mertz-Hyatt')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (11, N'mmiddlehursta', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Gottlieb, Kassulke and Considine')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (12, N'rperrenb', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Rutherford LLC')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (13, N'mrummeryc', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Blanda and Sons')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (14, N'epatesd', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Metz-Lind')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (15, N'hthunderse', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Kilback, Jakubowski and McDermott')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (16, N'jfinnisf', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Kozey-O''Connell')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (17, N'gstidworthyg', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Grant-Von')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (18, N'lpykeh', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Nienow and Sons')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (19, N'nburretti', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Daugherty, Ritchie and Hessel')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (20, N'charmondj', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Aufderhar-Murray')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (21, N'aturneyk', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Welch-Walsh')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (22, N'dtrousdalel', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Wisozk Group')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (23, N'pcarlylem', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Reichert, Stark and Douglas')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (24, N'ljennrichn', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Kiehn LLC')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (25, N'samirandao', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Adams-Hartmann')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (26, N'bdolphinp', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Upton-Becker')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (27, N'acapperq', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Nikolaus, McCullough and Harber')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (28, N'jciccarellir', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Mann-Medhurst')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (29, N'smckanes', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Hartmann, Langosh and Runolfsdottir')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (30, N'lshitliffet', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Feeney, Schroeder and Sipes')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (31, N'dfarthinu', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Berge-Steuber')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (32, N'tdovestonv', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Heller-Gottlieb')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (33, N'sleew', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Lindgren, Farrell and Hahn')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (34, N'rfransewichx', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Schmeler, Schamberger and Rau')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (35, N'cwyburny', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Dickinson-Sipes')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (36, N'gcordelettez', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Schimmel-Wilderman')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (37, N'pecclestone10', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Dare, Schroeder and Gaylord')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (38, N'bmcewan11', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Mayer-Zulauf')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (39, N'taskew12', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Schneider, Kilback and Wisoky')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (40, N'afeldmann13', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Johnston-Lubowitz')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (41, N'kmadden14', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Toy, Mraz and Mertz')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (42, N'ekilgallen15', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Lemke Group')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (43, N'rvaillant16', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Mitchell Inc')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (44, N'ksharpling17', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Becker LLC')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (45, N'kgunston18', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Klocko-Kling')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (46, N'cbleue19', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Gleichner LLC')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (47, N'faucock1a', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Rogahn LLC')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (48, N'kcino1b', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Ferry and Sons')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (49, N'gthick1c', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Lesch Inc')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (50, N'mspyer1d', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'Langosh-Willms')
INSERT [dbo].[tbl_Saticilar] ([ID], [KULLANICI_ADI], [SIFRE], [YAYINEVI_ADI]) VALUES (52, N'deneme', N'25B80B3556CA3A15353DD2FD312062FAD27ADCF5A1DE51B75BDADEA1FA8214AB', N'deneme')
SET IDENTITY_INSERT [dbo].[tbl_Saticilar] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Siparisler] ON 

INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (1, 22, 1, 1, 13, N'IN-UP', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 147, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (2, 22, 2, 1, 7, N'US-AK', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 64, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (3, 22, 3, 1, 34, N'JP-34', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 52, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (4, 22, 4, 1, 49, N'SY-DY', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 71, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (5, 22, 5, 1, 31, N'SB-MK', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 67, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (6, 22, 6, 1, 43, N'BR-RJ', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 50, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (7, 22, 8, 1, 50, N'BS-MG', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 57, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (8, 22, 11, 1, 20, N'AR-R', 1, CAST(N'2023-02-06T05:04:00' AS SmallDateTime), 29, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (9, 22, 8, 1, 50, N'BS-MG', 2, CAST(N'2023-02-06T05:10:00' AS SmallDateTime), 57, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (10, 22, 168, 1, 50, N'PG-SAN', 3, CAST(N'2023-02-06T05:10:00' AS SmallDateTime), 32, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (11, 22, 1, 1, 13, N'IN-UP', 4, CAST(N'2023-02-06T05:10:00' AS SmallDateTime), 147, 1, 1)
INSERT [dbo].[tbl_Siparisler] ([ID], [KULLANICI_ID], [ITEM_ID], [ADDRESS_ID], [SATICI_ID], [URUN_KODU], [SIPARIS_KODU], [TARIH], [TOPLAM_FIYAT], [DURUM], [ADET]) VALUES (12, 22, 252, 1, 50, N'US-UT', 4, CAST(N'2023-02-06T05:10:00' AS SmallDateTime), 116, 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_Siparisler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Yazarlar] ON 

INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (1, N'Donn Holyland')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (2, N'Evanne Tinniswood')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (3, N'Beitris Bertouloume')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (4, N'Buck O''Leagham')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (5, N'Nissa de Werk')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (6, N'Malena Lidington')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (7, N'Inge Arro')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (8, N'Freedman Scrymgeour')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (9, N'Aubine Knott')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (10, N'Marta Comiskey')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (11, N'Packston Bedborough')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (12, N'Sarette Vannet')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (13, N'Rochella Mattioni')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (14, N'Chelsae Markel')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (15, N'Ahmed Careless')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (16, N'Smith Musson')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (17, N'Karlee Creevy')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (18, N'Naoma Bilbee')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (19, N'Camilla Skelhorn')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (20, N'Rudolf Woodvine')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (21, N'Sherilyn Tesauro')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (22, N'Peria Estable')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (23, N'Jaime Duplock')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (24, N'Lindsy Goalley')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (25, N'Stacee Dumbar')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (26, N'Elie Growy')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (27, N'Audry Brissard')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (28, N'Ursola Fiander')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (29, N'Drusilla Barbosa')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (30, N'Vanya Gallon')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (31, N'Nataniel Bartholomieu')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (32, N'Arvin Stoller')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (33, N'Reyna Tanby')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (34, N'Chico Fenty')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (35, N'Bryn Ivashechkin')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (36, N'Janine Sprague')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (37, N'Gertrud Ewing')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (38, N'Berkly Mapp')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (39, N'Flore Smart')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (40, N'Koo Dumbreck')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (41, N'Fancy Duncan')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (42, N'Gage Janosevic')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (43, N'Hildegaard Pozzo')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (44, N'Torrence Pedri')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (45, N'Zelig Riggulsford')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (46, N'Gigi Jakubowski')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (47, N'Leonardo Chotty')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (48, N'Hephzibah Hayley')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (49, N'Odelle Hamly')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (50, N'Tades Gherardi')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (51, N'Mirabelle Gair')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (52, N'Bernardina Meran')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (53, N'Seumas Jerams')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (54, N'Jarrett Saltern')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (55, N'Laverne Woodfine')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (56, N'Edna McClaughlin')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (57, N'Huntley Scay')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (58, N'Ewen Greenacre')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (59, N'Aldrich Aucoate')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (60, N'Richmound Filchagin')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (61, N'Valene Grahamslaw')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (62, N'Poppy Ugoletti')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (63, N'Augusto Bonsall')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (64, N'Dore Durbann')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (65, N'Bethanne Benedikt')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (66, N'Rusty Blackie')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (67, N'Alvinia Wear')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (68, N'Gaby O''Glassane')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (69, N'Ted Bleddon')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (70, N'Stanfield Huck')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (71, N'Jehanna Langman')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (72, N'Benetta Morhall')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (73, N'Talyah Barhims')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (74, N'Zolly Stephen')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (75, N'Anneliese Henri')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (76, N'Deidre Boni')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (77, N'Griffith Greggs')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (78, N'Izabel Muffitt')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (79, N'Willi Howie')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (80, N'Hermann Pleven')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (81, N'Olivia Rowling')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (82, N'Maritsa Canniffe')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (83, N'Ephraim Di Bernardo')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (84, N'Julieta Bock')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (85, N'Dallas Whaley')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (86, N'Chaim Ivashnyov')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (87, N'Adrianna Bench')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (88, N'Bogart Spirritt')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (89, N'Patrick Bonelle')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (90, N'Kizzee Saye')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (91, N'Sally Charleston')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (92, N'Mariana Lacheze')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (93, N'Victoir Capineer')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (94, N'Gabriellia Mintram')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (95, N'Rollins Dudley')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (96, N'Clarance Lumbers')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (97, N'Alden Dawdary')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (98, N'Anstice Windebank')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (99, N'Conrado Chamberlayne')
GO
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (100, N'Rosella Jedrasik')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (101, N'Fidelity Keys')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (102, N'Monika Stolberger')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (103, N'Rob Jandourek')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (104, N'Meris Andrieux')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (105, N'Mathian Overthrow')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (106, N'Augy Tolmie')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (107, N'Clayton Ion')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (108, N'Devina Widdocks')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (109, N'Sutton Coggill')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (110, N'Sonnie Maber')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (111, N'Mitch Greathead')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (112, N'Eleanora Hurll')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (113, N'Shea Lower')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (114, N'Martin Moresby')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (115, N'Kanya Rider')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (116, N'Chase Kilgallon')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (117, N'Hart Frears')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (118, N'Cooper Anthona')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (119, N'Edyth Bristow')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (120, N'Mignonne Weedall')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (121, N'Jackson Huntall')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (122, N'Karrah Squibb')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (123, N'Jaime Natalie')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (124, N'Haley Colquit')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (125, N'Torrin Duchasteau')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (126, N'Yance Swales')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (127, N'Rolph Chazier')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (128, N'Noni Sapp')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (129, N'Josh Mapother')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (130, N'Sharity Musgrove')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (131, N'Farleigh Benettini')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (132, N'Erda Faux')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (133, N'Jameson Kempshall')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (134, N'Sheppard Skouling')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (135, N'Glennie Pigot')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (136, N'Clo Cale')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (137, N'Gerri Stayt')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (138, N'Elonore Trevon')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (139, N'Christiana Schreiner')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (140, N'Milicent Wildblood')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (141, N'Ethe Dossantos')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (142, N'Grannie Petrecz')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (143, N'Kaitlyn Ferrige')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (144, N'Judon Leal')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (145, N'Dal Attard')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (146, N'Berty Welfair')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (147, N'Bordie Plastow')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (148, N'Miriam Chapiro')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (149, N'Nana Matuszewski')
INSERT [dbo].[tbl_Yazarlar] ([ID], [TAM_AD]) VALUES (150, N'Gwennie Vondrasek')
SET IDENTITY_INSERT [dbo].[tbl_Yazarlar] OFF
GO
ALTER TABLE [dbo].[tbl_Kitaplar] ADD  CONSTRAINT [DF_tbl_Kitaplar_DURUM]  DEFAULT ((1)) FOR [DURUM]
GO
ALTER TABLE [dbo].[tbl_Adress]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Adress_tbl_Kullanicilar] FOREIGN KEY([KULLANICI_ID])
REFERENCES [dbo].[tbl_Kullanicilar] ([ID])
GO
ALTER TABLE [dbo].[tbl_Adress] CHECK CONSTRAINT [FK_tbl_Adress_tbl_Kullanicilar]
GO
ALTER TABLE [dbo].[tbl_Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kitaplar_tbl_Saticilar] FOREIGN KEY([SATICI_ID])
REFERENCES [dbo].[tbl_Saticilar] ([ID])
GO
ALTER TABLE [dbo].[tbl_Kitaplar] CHECK CONSTRAINT [FK_tbl_Kitaplar_tbl_Saticilar]
GO
ALTER TABLE [dbo].[tbl_Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kitaplar_tbl_Yazarlar] FOREIGN KEY([YAZAR_ID])
REFERENCES [dbo].[tbl_Yazarlar] ([ID])
GO
ALTER TABLE [dbo].[tbl_Kitaplar] CHECK CONSTRAINT [FK_tbl_Kitaplar_tbl_Yazarlar]
GO
ALTER TABLE [dbo].[tbl_silinen_Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_tbl_silinen_Kitaplar_tbl_Kitaplar] FOREIGN KEY([ID_2])
REFERENCES [dbo].[tbl_Kitaplar] ([ID])
GO
ALTER TABLE [dbo].[tbl_silinen_Kitaplar] CHECK CONSTRAINT [FK_tbl_silinen_Kitaplar_tbl_Kitaplar]
GO
ALTER TABLE [dbo].[tbl_silinen_Kullanicilar]  WITH CHECK ADD  CONSTRAINT [FK_tbl_silinen_Kullanicilar_tbl_Kullanicilar] FOREIGN KEY([ID_2])
REFERENCES [dbo].[tbl_Kullanicilar] ([ID])
GO
ALTER TABLE [dbo].[tbl_silinen_Kullanicilar] CHECK CONSTRAINT [FK_tbl_silinen_Kullanicilar_tbl_Kullanicilar]
GO
ALTER TABLE [dbo].[tbl_Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Siparisler_tbl_Adress] FOREIGN KEY([ADDRESS_ID])
REFERENCES [dbo].[tbl_Adress] ([ID])
GO
ALTER TABLE [dbo].[tbl_Siparisler] CHECK CONSTRAINT [FK_tbl_Siparisler_tbl_Adress]
GO
ALTER TABLE [dbo].[tbl_Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Siparisler_tbl_Kitaplar] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[tbl_Kitaplar] ([ID])
GO
ALTER TABLE [dbo].[tbl_Siparisler] CHECK CONSTRAINT [FK_tbl_Siparisler_tbl_Kitaplar]
GO
ALTER TABLE [dbo].[tbl_Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Siparisler_tbl_Kullanicilar] FOREIGN KEY([KULLANICI_ID])
REFERENCES [dbo].[tbl_Kullanicilar] ([ID])
GO
ALTER TABLE [dbo].[tbl_Siparisler] CHECK CONSTRAINT [FK_tbl_Siparisler_tbl_Kullanicilar]
GO
ALTER TABLE [dbo].[tbl_Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Siparisler_tbl_Saticilar] FOREIGN KEY([SATICI_ID])
REFERENCES [dbo].[tbl_Saticilar] ([ID])
GO
ALTER TABLE [dbo].[tbl_Siparisler] CHECK CONSTRAINT [FK_tbl_Siparisler_tbl_Saticilar]
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriAra]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_kategoriAra](
	@kategori varchar(50)
)
AS
BEGIN
	SELECT URUN_ADI,Y.TAM_AD,FIYAT,KATEGORI_1,KATEGORI_2,URUN_ADEDI,SAYFA_SAYISI,DIL,S.ID,K.URUN_KODU,K.ID
    FROM tbl_Kitaplar K 
	INNER JOIN  tbl_Saticilar S ON K.SATICI_ID=S.ID 
	INNER JOIN tbl_Yazarlar Y ON Y.ID = K.YAZAR_ID
	WHERE (K.KATEGORI_1 LIKE '%'+ @kategori +'%' OR K.KATEGORI_2 LIKE '%'+ @kategori +'%' )AND K.URUN_ADEDI > 0
	ORDER BY  URUN_ADI ASC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_kitapAra]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_kitapAra](
	@arananDeger nvarchar(50)
)
AS
BEGIN
	SELECT URUN_ADI,Y.TAM_AD,FIYAT,KATEGORI_1,KATEGORI_2,URUN_ADEDI,SAYFA_SAYISI,DIL,SATICI_ID,URUN_KODU,K.ID
	FROM tbl_Kitaplar K inner join tbl_Yazarlar Y ON Y.ID = K.YAZAR_ID WHERE K.URUN_ADI like '%'+ @arananDeger +'%' AND K.URUN_ADEDI > 0
	ORDER BY  URUN_ADI ASC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KitaplariGetir]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KitaplariGetir](
	@deger int,
	@ID int
)
AS
BEGIN
	SELECT K.ID AS [KITAP ID],
	Y.TAM_AD AS [YAZAR ADI],
	URUN_KODU AS [URUN KODU],
	URUN_ADI AS [URUN ADI],
	FIYAT, 
	KATEGORI_1 AS [KATEGORI 1], 
	KATEGORI_2 AS [KATEGORI 2],
	URUN_ADEDI AS [URUN ADEDI],
	SAYFA_SAYISI AS [SAYFA SAYISI],
	DIL,
	Y.ID AS [YAZAR ID]
    FROM tbl_Kitaplar K 
	INNER JOIN tbl_Saticilar S ON S.ID = K.SATICI_ID 
	INNER JOIN tbl_Yazarlar Y ON K.YAZAR_ID = Y.ID
	WHERE URUN_ADEDI <= @deger AND SATICI_ID = @ID AND DURUM = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_kullaniciID]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_kullaniciID](
	@kAd nvarchar(50)
)
AS
BEGIN
	
	SELECT ID FROM tbl_Kullanicilar WHERE KULLANICI_ADI = @kAd
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tumKitaplariGetir]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_tumKitaplariGetir]
AS
BEGIN
	select URUN_ADI,Y.TAM_AD,FIYAT,KATEGORI_1,KATEGORI_2,URUN_ADEDI,SAYFA_SAYISI,DIL,SATICI_ID,URUN_KODU,K.ID
    from tbl_Kitaplar K inner join tbl_Yazarlar Y ON Y.ID = K.YAZAR_ID WHERE URUN_ADEDI > 0 AND DURUM = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_yazarAra]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_yazarAra](
	@arananDeger nvarchar(50)
)
AS
BEGIN
	SELECT URUN_ADI,Y.TAM_AD,FIYAT,KATEGORI_1,KATEGORI_2,URUN_ADEDI,SAYFA_SAYISI,DIL,SATICI_ID,URUN_KODU,K.ID
	FROM tbl_Kitaplar K inner join tbl_Yazarlar Y ON Y.ID = K.YAZAR_ID WHERE Y.TAM_AD like '%'+ @arananDeger +'%' AND K.URUN_ADEDI > 0
	ORDER BY  URUN_ADI ASC
END
GO
/****** Object:  Trigger [dbo].[trigger_Silinen_Kitaplar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_Silinen_Kitaplar]
ON [dbo].[tbl_Kitaplar]
FOR UPDATE
AS
BEGIN
	DECLARE @DURUM BIT = 0
	SELECT @DURUM = DURUM FROM inserted

	IF @DURUM = 0 
	BEGIN
		INSERT INTO [dbo].[tbl_silinen_Kitaplar](ID_2,SATICI_ID,YAZAR_ID,URUN_KODU,URUN_ADI,FIYAT,KATEGORI_1,KATEGORI_2,URUN_ADEDI,SAYFA_SAYISI,DIL) 
		SELECT ID,SATICI_ID,YAZAR_ID,URUN_KODU,URUN_ADI,FIYAT,KATEGORI_1,KATEGORI_2,URUN_ADEDI,SAYFA_SAYISI,DIL FROM inserted
	END
END
GO
ALTER TABLE [dbo].[tbl_Kitaplar] ENABLE TRIGGER [trigger_Silinen_Kitaplar]
GO
/****** Object:  Trigger [dbo].[trigger_Silinen_Kullanicilar]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_Silinen_Kullanicilar]
ON [dbo].[tbl_Kullanicilar]
FOR UPDATE
AS
BEGIN
	DECLARE @kullaniciTipi VARCHAR(1)
	SELECT @kullaniciTipi = KULLANICI_TIPI from inserted
	
	IF @kullaniciTipi = 'D'
	BEGIN
		INSERT INTO [dbo].[tbl_silinen_Kullanicilar](ID_2,KULLANICI_ADI,SIFRE,TAM_AD,MAIL,CINSIYET,KULLANICI_TIPI) 
		SELECT  ID,KULLANICI_ADI,SIFRE,TAM_AD,MAIL,CINSIYET,KULLANICI_TIPI FROM inserted
	END
END
GO
ALTER TABLE [dbo].[tbl_Kullanicilar] ENABLE TRIGGER [trigger_Silinen_Kullanicilar]
GO
/****** Object:  Trigger [dbo].[trigger_update_Kitap_Adeti]    Script Date: 6.02.2023 18:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_update_Kitap_Adeti]
ON [dbo].[tbl_Siparisler]
FOR INSERT
AS
BEGIN
	DECLARE @ID INT
	SELECT @ID = ITEM_ID FROM inserted

	UPDATE tbl_Kitaplar SET URUN_ADEDI = (URUN_ADEDI - 1) WHERE ID = @ID

END
GO
ALTER TABLE [dbo].[tbl_Siparisler] ENABLE TRIGGER [trigger_update_Kitap_Adeti]
GO
USE [master]
GO
ALTER DATABASE [KitapYurdu] SET  READ_WRITE 
GO
