USE [master]
GO
/****** Object:  Database [XYZTrucking]    Script Date: 6/25/2021 6:44:45 PM ******/
CREATE DATABASE [XYZTrucking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XYZTrucking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XYZTrucking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XYZTrucking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XYZTrucking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XYZTrucking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XYZTrucking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XYZTrucking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XYZTrucking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XYZTrucking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XYZTrucking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XYZTrucking] SET ARITHABORT OFF 
GO
ALTER DATABASE [XYZTrucking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XYZTrucking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XYZTrucking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XYZTrucking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XYZTrucking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XYZTrucking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XYZTrucking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XYZTrucking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XYZTrucking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XYZTrucking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XYZTrucking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XYZTrucking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XYZTrucking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XYZTrucking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XYZTrucking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XYZTrucking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XYZTrucking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XYZTrucking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XYZTrucking] SET  MULTI_USER 
GO
ALTER DATABASE [XYZTrucking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XYZTrucking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XYZTrucking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XYZTrucking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XYZTrucking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [XYZTrucking]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drivers](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[DateofHire] [date] NULL,
	[CDL] [bit] NOT NULL,
 CONSTRAINT [EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulManifest]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulManifest](
	[Item] [varchar](30) NOT NULL,
	[Itemdesc] [varchar](30) NOT NULL,
	[ItemWeightPU] [varchar](15) NOT NULL,
	[Quantity] [int] NOT NULL,
	[HaulNumber] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulRecord]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulRecord](
	[HaulNumber] [int] IDENTITY(1,1) NOT NULL,
	[TrailerID] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[TruckUsed] [int] NOT NULL,
	[Client] [varchar](40) NOT NULL,
	[CargoTypeID] [int] NOT NULL,
	[DateHBegan] [date] NOT NULL,
	[DateHDelivered] [date] NOT NULL,
	[Mileage] [int] NOT NULL,
	[HaulNotes] [varchar](400) NULL,
 CONSTRAINT [PK_HaulRecord] PRIMARY KEY CLUSTERED 
(
	[HaulNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUCargoTypeID]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUCargoTypeID](
	[CargoTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CargoType] [varchar](30) NULL,
 CONSTRAINT [PK_LUCargoTypeID] PRIMARY KEY CLUSTERED 
(
	[CargoTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUMaintenanceCode]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUMaintenanceCode](
	[MaintenanceCodeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceCode] [varchar](20) NOT NULL,
 CONSTRAINT [MaintenanceCodeID] PRIMARY KEY CLUSTERED 
(
	[MaintenanceCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUMaintenanceTypeInfo]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUMaintenanceTypeInfo](
	[MaintenanceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceType] [varchar](20) NOT NULL,
 CONSTRAINT [MaintenanceTypeID] PRIMARY KEY CLUSTERED 
(
	[MaintenanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LUTrailerTypeID]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUTrailerTypeID](
	[TrailerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerType] [varchar](20) NULL,
 CONSTRAINT [PK_LUTrailerTypeID] PRIMARY KEY CLUSTERED 
(
	[TrailerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Maintenance]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[Truck] [int] NOT NULL,
	[MaintenanceStart] [date] NOT NULL,
	[MaintenanceEnd] [date] NOT NULL,
	[MaintenanceTypeID] [int] NOT NULL,
	[MaintenanceCodeID] [int] NOT NULL,
	[MaintenanceLogNumber] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[MaintenanceLogNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrailerInfo]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrailerInfo](
	[TrailerID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerTypeID] [int] NOT NULL,
	[TrailerCapacity] [varchar](20) NOT NULL,
	[TrailerMileage] [int] NOT NULL,
	[TrailerDescription] [varchar](200) NULL,
 CONSTRAINT [PK_TrailerInfo] PRIMARY KEY CLUSTERED 
(
	[TrailerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trucks]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trucks](
	[TruckNumber] [int] IDENTITY(1,1) NOT NULL,
	[TruckDesc] [varchar](400) NULL,
	[TruckType] [varchar](40) NULL,
	[BodyType] [varchar](40) NULL,
	[LicenseNumber] [varchar](10) NULL,
	[EngineType] [varchar](30) NULL,
	[FuelType] [varchar](15) NULL,
	[CurrentMileage] [int] NOT NULL,
	[TrailerID] [int] NULL,
 CONSTRAINT [TruckNumber] PRIMARY KEY CLUSTERED 
(
	[TruckNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Drivers] ON 

INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (1, N'Aaron', N'Gockley', CAST(N'2016-07-01' AS Date), 0)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (2, N'Paul', N'McCosby', CAST(N'2016-09-05' AS Date), 1)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (3, N'Derek', N'Alexander', CAST(N'2010-02-19' AS Date), 1)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (4, N'Matt', N'McMuscles', CAST(N'2004-08-01' AS Date), 0)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (5, N'Adam', N'Jensen', CAST(N'2020-08-28' AS Date), 1)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (6, N'Woolie', N'Madden', CAST(N'2019-05-03' AS Date), 0)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (7, N'Billy', N'Minh', CAST(N'2018-02-08' AS Date), 1)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (8, N'Liam ', N'Allen-Miller', CAST(N'2016-03-10' AS Date), 0)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (9, N'Liana', N'McMuscles', CAST(N'2017-10-04' AS Date), 0)
INSERT [dbo].[Drivers] ([EmployeeID], [FirstName], [LastName], [DateofHire], [CDL]) VALUES (10, N'Ross', N'Scott', CAST(N'2016-10-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Drivers] OFF
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'AGX603PTP', N'60 GALLON SPRAYER', N'60', 5, 7)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'F1000I', N'FOAM DRUM APPLICATOR', N'40', 5, 5)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'F1500', N'5 GALLON FOAM MARKER', N'40', 5, 5)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'F1515 ', N'1 GALLON FOAM CONCENTRATE', N'4', 40, 5)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'F2500', N'2.5 GALLON FOAM MARKER', N'20', 10, 5)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'LG25', N'25 GALLON SPRAYER', N'40', 10, 6)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'F2500', N'2.5 GALLON', N'20', 5, 7)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'ATX60', N'60 GALLON SPRAYER', N'50', 4, 7)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'Milk', N'Milk by Gallon', N'8.6', 5000, 4)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'RoundUp', N'Herbicide', N'10', 8000, 3)
INSERT [dbo].[HaulManifest] ([Item], [Itemdesc], [ItemWeightPU], [Quantity], [HaulNumber]) VALUES (N'4680', N'2500 Gallon Tank', N'400', 3, 13)
SET IDENTITY_INSERT [dbo].[HaulRecord] ON 

INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (2, 1, 3, 11, N'Dante', 4, CAST(N'2021-09-30' AS Date), CAST(N'2021-10-02' AS Date), 500, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (3, NULL, 1, 10, N'Cloud Strife', 1, CAST(N'2021-10-18' AS Date), CAST(N'2021-10-18' AS Date), 200, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (4, NULL, 1, 10, N'Lucas', 3, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-02' AS Date), 600, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (5, NULL, 4, 12, N'Virgil', 4, CAST(N'2021-11-27' AS Date), CAST(N'2021-12-01' AS Date), 2000, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (6, NULL, 1, 14, N'Dante', 5, CAST(N'2021-09-27' AS Date), CAST(N'2021-09-28' AS Date), 400, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (7, NULL, 6, 15, N'Cloud Strife', 1, CAST(N'2021-10-30' AS Date), CAST(N'2021-10-31' AS Date), 600, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (8, 4, 10, 18, N'Eivor', 3, CAST(N'2021-11-02' AS Date), CAST(N'2021-11-03' AS Date), 300, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (10, 6, 7, 16, N'Lucas', 2, CAST(N'2021-11-04' AS Date), CAST(N'2021-11-06' AS Date), 800, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (11, NULL, 8, 22, N'Dante', 4, CAST(N'2021-11-04' AS Date), CAST(N'2021-11-04' AS Date), 150, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (12, 10, 3, 11, N'Virgil', 3, CAST(N'2021-11-06' AS Date), CAST(N'2021-11-08' AS Date), 600, NULL)
INSERT [dbo].[HaulRecord] ([HaulNumber], [TrailerID], [EmployeeID], [TruckUsed], [Client], [CargoTypeID], [DateHBegan], [DateHDelivered], [Mileage], [HaulNotes]) VALUES (13, 2, 5, 11, N'Ezio', 4, CAST(N'2021-12-05' AS Date), CAST(N'2021-12-06' AS Date), 300, NULL)
SET IDENTITY_INSERT [dbo].[HaulRecord] OFF
SET IDENTITY_INSERT [dbo].[LUCargoTypeID] ON 

INSERT [dbo].[LUCargoTypeID] ([CargoTypeID], [CargoType]) VALUES (1, N'Hazardous')
INSERT [dbo].[LUCargoTypeID] ([CargoTypeID], [CargoType]) VALUES (2, N'Liquid')
INSERT [dbo].[LUCargoTypeID] ([CargoTypeID], [CargoType]) VALUES (3, N'Refrigerated')
INSERT [dbo].[LUCargoTypeID] ([CargoTypeID], [CargoType]) VALUES (4, N'Standard')
INSERT [dbo].[LUCargoTypeID] ([CargoTypeID], [CargoType]) VALUES (5, N'Other')
SET IDENTITY_INSERT [dbo].[LUCargoTypeID] OFF
SET IDENTITY_INSERT [dbo].[LUMaintenanceCode] ON 

INSERT [dbo].[LUMaintenanceCode] ([MaintenanceCodeID], [MaintenanceCode]) VALUES (1, N'Routine')
INSERT [dbo].[LUMaintenanceCode] ([MaintenanceCodeID], [MaintenanceCode]) VALUES (2, N'Unscheduled')
SET IDENTITY_INSERT [dbo].[LUMaintenanceCode] OFF
SET IDENTITY_INSERT [dbo].[LUMaintenanceTypeInfo] ON 

INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (1, N'Engine')
INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (2, N'Transmission')
INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (3, N'Tires')
INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (4, N'Body')
INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (5, N'Electrical')
INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (6, N'Hydraulic')
INSERT [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID], [MaintenanceType]) VALUES (7, N'Pneumatic')
SET IDENTITY_INSERT [dbo].[LUMaintenanceTypeInfo] OFF
SET IDENTITY_INSERT [dbo].[LUTrailerTypeID] ON 

INSERT [dbo].[LUTrailerTypeID] ([TrailerTypeID], [TrailerType]) VALUES (1, N'Tanker')
INSERT [dbo].[LUTrailerTypeID] ([TrailerTypeID], [TrailerType]) VALUES (2, N'Flat Bed')
INSERT [dbo].[LUTrailerTypeID] ([TrailerTypeID], [TrailerType]) VALUES (3, N'Box')
INSERT [dbo].[LUTrailerTypeID] ([TrailerTypeID], [TrailerType]) VALUES (4, N'Refrigerated')
SET IDENTITY_INSERT [dbo].[LUTrailerTypeID] OFF
SET IDENTITY_INSERT [dbo].[Maintenance] ON 

INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (1, CAST(N'2021-08-28' AS Date), CAST(N'2021-09-01' AS Date), 1, 1, 1)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (1, CAST(N'2021-08-29' AS Date), CAST(N'2021-09-02' AS Date), 5, 2, 2)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (10, CAST(N'2021-07-30' AS Date), CAST(N'2021-07-31' AS Date), 3, 1, 3)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (14, CAST(N'2021-09-19' AS Date), CAST(N'2021-09-26' AS Date), 6, 1, 4)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (20, CAST(N'2021-10-20' AS Date), CAST(N'2021-10-22' AS Date), 6, 1, 5)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (15, CAST(N'2021-09-21' AS Date), CAST(N'2021-09-30' AS Date), 4, 2, 6)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (18, CAST(N'2021-10-01' AS Date), CAST(N'2021-10-08' AS Date), 1, 1, 7)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (14, CAST(N'2021-08-01' AS Date), CAST(N'2021-08-02' AS Date), 3, 1, 9)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (11, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-21' AS Date), 5, 1, 10)
INSERT [dbo].[Maintenance] ([Truck], [MaintenanceStart], [MaintenanceEnd], [MaintenanceTypeID], [MaintenanceCodeID], [MaintenanceLogNumber]) VALUES (16, CAST(N'2021-10-21' AS Date), CAST(N'2021-10-31' AS Date), 2, 2, 11)
SET IDENTITY_INSERT [dbo].[Maintenance] OFF
SET IDENTITY_INSERT [dbo].[TrailerInfo] ON 

INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (1, 1, N'80,000 lb', 30000, N'Liquid Tanker')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (2, 2, N'57,000 lb', 50000, N'Large Flatbed')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (3, 3, N'57,000 lb', 55789, N'Mid Capacity Box')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (4, 4, N'57,000 lb', 88472, N'Mid Capacity Refrigerated')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (5, 4, N'80,000 lb', 100000, N'High Capacity Refrigerated Truck')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (6, 1, N'80,000 lb', 10000, N'New Tanker')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (8, 2, N'35,000 lb', 20000, N'Low Capacity Flat Bed')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (9, 3, N'80,000 lb', 15000, N'High Capacity Box Truck')
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerTypeID], [TrailerCapacity], [TrailerMileage], [TrailerDescription]) VALUES (10, 4, N'35,000 lb', 10000, N'Small Capacity Refrigerated')
SET IDENTITY_INSERT [dbo].[TrailerInfo] OFF
SET IDENTITY_INSERT [dbo].[Trucks] ON 

INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (1, N'Long Haul Truck', N'Long Haul', N'Tractor Trailer', N'XYZ 8654', N'10 Cylinder', N'Diesel', 10000, 1)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (10, N'Short Haul Truck', N'Short Haul', N'Single Unit', N'HGE 8654', N'8 Cylinder', N'Gasoline', 20000, NULL)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (11, N'Short Haul Tractor Trailer', N'Short Haul', N'Tractor Trailer', N'GTE 6534', N'6 Cylinder', N'Diesel', 30000, 1)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (12, N'Long Haul Single Unit', N'Long Haul', N'Single Unit', N'NYE 3827', N'4 Cylinder', N'Gasoline', 40000, NULL)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (14, N'Long Haul Single Unit', N'Long Haul', N'Single Unit', N'UET 7638', N'6 Cylinder', N'Diesel', 20000, NULL)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (15, N'Short Haul Single Unit', N'Short Haul', N'Single Unit', N'TES 1135', N'8 Cylinder', N'Gasoline', 10000, NULL)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (16, N'Test Truck', N'Long Haul', N'Tractor Trailer', N'HEK 1186', N'Automatic', N'Diesel', 20000, 1)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (18, N'Test Truck2', N'Short Haul', N'Tractor Trailer', N'HKR 9876', N'Manual', N'Gasoline', 30000, 2)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (20, N'Truck 20', N'Long Haul', N'Tractor Trailer', N'ISO 7849', N'Automatic', N'Diesel', 25000, 8)
INSERT [dbo].[Trucks] ([TruckNumber], [TruckDesc], [TruckType], [BodyType], [LicenseNumber], [EngineType], [FuelType], [CurrentMileage], [TrailerID]) VALUES (22, N'Truck 88', N'Short Haul', N'Single Unit', N'JKE 8657', N'Automatic', N'Gasoline', 17000, NULL)
SET IDENTITY_INSERT [dbo].[Trucks] OFF
ALTER TABLE [dbo].[HaulManifest]  WITH CHECK ADD  CONSTRAINT [FK_HaulManifest_HaulRecord] FOREIGN KEY([HaulNumber])
REFERENCES [dbo].[HaulRecord] ([HaulNumber])
GO
ALTER TABLE [dbo].[HaulManifest] CHECK CONSTRAINT [FK_HaulManifest_HaulRecord]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_Drivers] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Drivers] ([EmployeeID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_Drivers]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_LUCargoTypeID] FOREIGN KEY([CargoTypeID])
REFERENCES [dbo].[LUCargoTypeID] ([CargoTypeID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_LUCargoTypeID]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_TrailerInfo] FOREIGN KEY([TrailerID])
REFERENCES [dbo].[TrailerInfo] ([TrailerID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_TrailerInfo]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_Trucks] FOREIGN KEY([TruckUsed])
REFERENCES [dbo].[Trucks] ([TruckNumber])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_Trucks]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_LUMaintenanceCode] FOREIGN KEY([MaintenanceCodeID])
REFERENCES [dbo].[LUMaintenanceCode] ([MaintenanceCodeID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_LUMaintenanceCode]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_LUMaintenanceTypeInfo] FOREIGN KEY([MaintenanceTypeID])
REFERENCES [dbo].[LUMaintenanceTypeInfo] ([MaintenanceTypeID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_LUMaintenanceTypeInfo]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Trucks] FOREIGN KEY([Truck])
REFERENCES [dbo].[Trucks] ([TruckNumber])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Trucks]
GO
ALTER TABLE [dbo].[TrailerInfo]  WITH CHECK ADD  CONSTRAINT [FK_TrailerInfo_LUTrailerTypeID] FOREIGN KEY([TrailerTypeID])
REFERENCES [dbo].[LUTrailerTypeID] ([TrailerTypeID])
GO
ALTER TABLE [dbo].[TrailerInfo] CHECK CONSTRAINT [FK_TrailerInfo_LUTrailerTypeID]
GO
ALTER TABLE [dbo].[Trucks]  WITH CHECK ADD  CONSTRAINT [FK_Trucks_TrailerInfo] FOREIGN KEY([TrailerID])
REFERENCES [dbo].[TrailerInfo] ([TrailerID])
GO
ALTER TABLE [dbo].[Trucks] CHECK CONSTRAINT [FK_Trucks_TrailerInfo]
GO
ALTER TABLE [dbo].[Trucks]  WITH CHECK ADD  CONSTRAINT [CHK_TractorTrailer] CHECK  (([BodyType]='Tractor Trailer' AND [TrailerID] IS NOT NULL OR [BodyType]='Single Unit' AND [TrailerID] IS NULL))
GO
ALTER TABLE [dbo].[Trucks] CHECK CONSTRAINT [CHK_TractorTrailer]
GO
ALTER TABLE [dbo].[Trucks]  WITH CHECK ADD  CONSTRAINT [CK__Trucks__BodyType__1367E606] CHECK  (([BodyType]='Single Unit' OR [BodyType]='Tractor Trailer'))
GO
ALTER TABLE [dbo].[Trucks] CHECK CONSTRAINT [CK__Trucks__BodyType__1367E606]
GO
ALTER TABLE [dbo].[Trucks]  WITH CHECK ADD  CONSTRAINT [CK__Trucks__TruckTyp__1273C1CD] CHECK  (([TruckType]='Short Haul' OR [TruckType]='Long Haul'))
GO
ALTER TABLE [dbo].[Trucks] CHECK CONSTRAINT [CK__Trucks__TruckTyp__1273C1CD]
GO
/****** Object:  StoredProcedure [dbo].[DriverHaulReport]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Initially I wanted you to be able to look up a driver name and then be able to look up their hauls--
-- However I was unable to get that to work, so I decided to do this instead, it has the same idea--
-- except it used the Employee ID. 
CREATE PROCEDURE [dbo].[DriverHaulReport] (@EmployeeID INT)
AS
BEGIN
SELECT H.HaulNumber, H.Client, H.DateHBegan, H.DateHDelivered, H.Mileage, H.HaulNotes,
CONCAT(D.FirstName, ' ', D.LastName) AS Name, L.CargoType, TU.TruckDesc
-- The following section joins a number of tables together to give a nice readable end result--
FROM HaulRecord AS H
INNER JOIN dbo.Drivers as D
ON H.EmployeeID = D.EmployeeID
INNER JOIN dbo.LUCargoTypeID as L
ON H.CargoTypeID = L.CargoTypeID
INNER JOIN dbo.Trucks as TU
ON H.TruckUsed = TU.TruckNumber
--This is what picks which hauls are used--
WHERE H.EmployeeID = @EmployeeID
GROUP BY D.FirstName, D.LastName, H.HaulNumber, H.Client, TU.TruckDesc,
L.CargoType, H.DateHBegan, H.DateHDelivered, H.Mileage, H.HaulNotes
--Orders this by oldest Haul first--
ORDER BY H.DateHBegan ASC

END

GO
/****** Object:  StoredProcedure [dbo].[DriverHaulReporttest]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DriverHaulReporttest] (@EmployeeID INT = 1)
AS
BEGIN
SELECT H.HaulNumber, H.Client, H.DateHBegan, H.DateHDelivered, H.Mileage, H.HaulNotes,
CONCAT(D.FirstName, ' ', D.LastName) AS Name, L.CargoType, TU.TruckDesc
FROM dbo.Drivers AS D
INNER JOIN dbo.HaulRecord as H
ON H.EmployeeID = D.EmployeeID
INNER JOIN dbo.LUCargoTypeID as L
ON H.CargoTypeID = L.CargoTypeID
INNER JOIN dbo.Trucks as TU
ON H.TruckUsed = TU.TruckNumber
WHERE H.EmployeeID = @EmployeeID
GROUP BY D.FirstName, D.LastName, H.HaulNumber, H.Client, TU.TruckDesc,
L.CargoType, H.DateHBegan, H.DateHDelivered, H.Mileage, H.HaulNotes
ORDER BY H.DateHBegan ASC

END
GO
/****** Object:  StoredProcedure [dbo].[DriversDelete]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DriversDelete] @EmployeeID int

AS

SET NOCOUNT ON

DELETE FROM dbo.Drivers WHERE EmployeeID = @EmployeeID;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[DriversUpdate]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DriversUpdate]  @EmployeeID INT, @FirstName VARCHAR(40), @LastName VARCHAR(40), @DateofHire DATE,
@CDL bit

AS

SET NOCOUNT ON
--Updates the Drivers table with the new values when the IDs match--
UPDATE Drivers
SET FirstName = ISNULL(@FirstName, FirstName),
	LastName = ISNULL(@LastName, LastName),
	DateofHire = ISNULL(@DateofHire, DateofHire),
	CDL = ISNULL(@CDL, CDL)
WHERE EmployeeID = @EmployeeID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[HaulDelete]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HaulDelete] @HaulNumber int

AS

SET NOCOUNT ON

DELETE FROM HaulRecord WHERE HaulNumber = @HaulNumber;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[HaulInventory]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HaulInventory] (@TruckNumber INT, @Date1 DATE, @Date2 DATE)
AS
BEGIN
SELECT H.*, I.*
FROM dbo.HaulRecord as H
INNER JOIN dbo.HaulManifest as I
ON H.HaulNumber = I.HaulNumber
WHERE H.TruckUsed = @TruckNumber
AND H.DateHBegan >= @Date1
AND H.DateHDelivered <= @Date2
ORDER BY H.DateHBegan DESC

END
GO
/****** Object:  StoredProcedure [dbo].[HaulRecordUpdate]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HaulRecordUpdate] @HaulNumber INT, @TrailerID INT, @EmployeeID INT, @TruckUsed INT, @Client VARCHAR(40),
@CargoTypeID INT, @DateHBegan DATE, @DateHDelivered DATE, @Mileage INT, @HaulNotes VARCHAR(300)

AS

SET NOCOUNT ON
--Updates table with values that are specified, if none are specified return original value--
UPDATE HaulRecord
SET TrailerID = ISNULL(@TrailerID, TrailerID),
	EmployeeID = ISNULL(@EmployeeID, EmployeeID),
	TruckUsed = ISNULL(@TruckUsed, TruckUsed),
	Client = ISNULL(@Client, Client),
	CargoTypeID = ISNULL(@CargoTypeID, Client),
	DateHBegan = ISNULL(@DateHBegan, DateHBegan),
	DateHDelivered = ISNULL(@DateHDelivered, DateHDelivered),
	Mileage = ISNULL(@Mileage, Mileage)
WHERE HaulNumber = @HaulNumber

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[HaulReport]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HaulReport] (@TruckNumber INT, @Date1 DATE, @Date2 DATE)
AS
BEGIN
SELECT * 
FROM dbo.HaulRecord
WHERE TruckUsed = @TruckNumber
AND DateHBegan >= @Date1
AND DateHDelivered <= @Date2
ORDER BY DateHBegan ASC

END
GO
/****** Object:  StoredProcedure [dbo].[InsertDrivers]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertDrivers] @FirstName varchar(40), @LastName varchar(40), @DateofHire date, @CDL bit

AS

SET NOCOUNT ON

INSERT INTO dbo.Drivers
(FirstName,
LastName,
DateofHire,
CDL)

VALUES
(@FirstName,
@LastName,
@DateofHire,
@CDL)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[InsertHaulRecord]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertHaulRecord] @TrailerID int, @EmployeeID int, @TruckUsed int, @Client varchar(40),
@CargoTypeID int, @DateHBegan date, @DateHDelivered date, @Mileage int, @HaulNotes varchar(400)

AS 

SET NOCOUNT ON

INSERT INTO dbo.HaulRecord
(TrailerID,
EmployeeID,
TruckUsed,
Client,
CargoTypeID,
DateHBegan,
DateHDelivered,
Mileage,
HaulNotes)

VALUES
(@TrailerID, 
@EmployeeID, 
@TruckUsed, 
@Client, 
@CargoTypeID, 
@DateHBegan, 
@DateHDelivered, 
@Mileage, 
@HaulNotes)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[InsertMaintenance]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertMaintenance] @Truck int, @MaintenanceStart date, @MaintenanceEnd date, @MaintenanceTypeID int, @MaintenanceCodeID int

AS

SET NOCOUNT ON

INSERT INTO dbo.Maintenance
(Truck,
MaintenanceStart,
MaintenanceEnd,
MaintenanceTypeID,
MaintenanceCodeID)

VALUES
(@Truck,
@MaintenanceStart,
@MaintenanceEnd,
@MaintenanceTypeID,
@MaintenanceCodeID)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[InsertManifest]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertManifest] @Item varchar(30), @Itemdesc varchar(30), @ItemWeightPU varchar(15), @Quantity int, @HaulNumber int

AS

SET NOCOUNT ON

INSERT INTO dbo.HaulManifest
(Item,
Itemdesc,
ItemWeightPU,
Quantity,
HaulNumber)

VALUES
(@Item,
@Itemdesc,
@ItemWeightPU,
@Quantity,
@HaulNumber)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[InsertTrailers]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertTrailers] @TrailerTypeID int, @TrailerCapacity varchar(20), @TrailerMileage int, @TrailerDescription varchar(200)

AS

SET NOCOUNT ON

INSERT INTO dbo.TrailerInfo
(TrailerTypeID,
TrailerCapacity,
TrailerMileage,
TrailerDescription)

VALUES
(@TrailerTypeID,
@TrailerCapacity,
@TrailerMileage,
@TrailerDescription)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[InsertTrucks]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertTrucks] @TruckDesc varchar(400), @TruckType varchar(40), @BodyType varchar(40), 
@LicenseNumber varchar(10), @EngineType varchar(30), @FuelType varchar(15), @CurrentMileage int

AS

SET NOCOUNT ON

INSERT INTO dbo.Trucks
(TruckDesc,
TruckType,
BodyType,
LicenseNumber,
EngineType,
FuelType,
CurrentMileage)

VALUES
(@TruckDesc,
@TruckType,
@BodyType,
@LicenseNumber,
@EngineType,
@FuelType,
@CurrentMileage)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[MaintenanceDelete]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MaintenanceDelete] @MaintenanceLogNumber int

AS

SET NOCOUNT ON

DELETE FROM dbo.Maintenance WHERE MaintenanceLogNumber = @MaintenanceLogNumber;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[MaintenanceReport]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MaintenanceReport](@BeginDate DATE, @EndDate DATE)
AS
BEGIN
SELECT M.MaintenanceStart, M.MaintenanceEnd, M.Truck, T.TruckType
FROM dbo.Maintenance AS M
INNER JOIN Trucks as T
ON M.Truck = T.TruckNumber
WHERE M.MaintenanceStart >= @BeginDate
AND M.MaintenanceEnd <= @EndDate
GROUP BY M.MaintenanceStart, M.MaintenanceEnd, M.Truck, T.TruckType
ORDER BY T.TruckType, M.MaintenanceStart

END
GO
/****** Object:  StoredProcedure [dbo].[MaintenanceUpdate]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MaintenanceUpdate] @MaintenanceLogNumber INT, @Truck INT, @MaintenanceStart DATE, @MaintenanceEnd DATE,
@MaintenanceTypeID INT, @MaintenanceCodeID INT

AS

SET NOCOUNT ON
--If the input is null, it repeats the original value, otherwise udpates the values.--
UPDATE Maintenance
SET Truck = ISNULL(@Truck, Truck),
	MaintenanceStart = ISNULL(@MaintenanceStart, MaintenanceStart),
	MaintenanceEnd = ISNULL(@MaintenanceEnd, MaintenanceEnd),
	MaintenanceTypeID = ISNULL(@MaintenanceTypeID, MaintenanceTypeID),
	MaintenanceCodeID = ISNULL(@MaintenanceCodeID, MaintenanceCodeID)
WHERE MaintenanceLogNumber = @MaintenanceLogNumber

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[ManifestDelete1]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ManifestDelete1] @Item varchar(30)

AS

SET NOCOUNT ON

DELETE FROM dbo.HaulManifest WHERE Item = @Item;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[ManifestDelete2]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ManifestDelete2] @HaulNumber int

AS

SET NOCOUNT ON

DELETE FROM dbo.HaulManifest WHERE HaulNumber = @HaulNumber;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[ManifestDelete3]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ManifestDelete3] @Item varchar(30), @HaulNumber int

AS

SET NOCOUNT ON

DELETE FROM dbo.HaulManifest WHERE Item = @Item AND HaulNumber = @HaulNumber;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[TrailerDelete]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TrailerDelete] @TrailerID int

AS

SET NOCOUNT ON

DELETE FROM dbo.TrailerInfo WHERE TrailerID = @TrailerID;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[TrailerInfoUpdate]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TrailerInfoUpdate] @TrailerID INT, @TrailerTypeID INT, @TrailerCapacity VARCHAR(20), @TrailerMileage INT,
@TrailerDescription VARCHAR(200)

AS

SET NOCOUNT ON
--Updates the columns with new rows unless input is null, if input is null then repeat original value.--
UPDATE TrailerInfo
SET TrailerTypeID = ISNULL(@TrailerTypeID, TrailerTypeID),
	TrailerCapacity = ISNULL(@TrailerCapacity, TrailerCapacity),
	TrailerMileage = ISNULL(@TrailerMileage, TrailerMileage),
	TrailerDescription = ISNULL(@TrailerDescription, TrailerDescription)
WHERE TrailerID = @TrailerID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[TruckDelete]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TruckDelete] @TruckNumber int

AS

SET NOCOUNT ON

DELETE FROM dbo.Trucks WHERE TruckNumber = @TruckNumber;

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[UpdateHaulManifest]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateHaulManifest] @Item VARCHAR(30), @ItemDesc VARCHAR(30), @ItemWeightPU VARCHAR(30),
@Quantity INT, @HaulNumber INT

AS

SET NOCOUNT ON
--This updates the Items associated with a Haul--
UPDATE HaulManifest
SET Item = ISNULL(@Item, Item),
	Itemdesc = ISNULL(@ItemDesc, Itemdesc),
	ItemWeightPU = ISNULL(@ItemWeightPU, ItemWeightPU),
	Quantity = ISNULL(@Quantity, Quantity)
WHERE HaulNumber = @HaulNumber

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[UpdateItem]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateItem] @Item VARCHAR(30), @ItemDesc VARCHAR(30), @ItemWeightPU VARCHAR(15)

AS

SET NOCOUNT ON
--This updates the information on an item--
UPDATE HaulManifest
SET Itemdesc  = ISNULL(@ItemDesc, Itemdesc),
	ItemWeightPU = ISNULL(@ItemWeightPU, ItemWeightPU)
WHERE Item = @Item

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[UpdateTrucks]    Script Date: 6/25/2021 6:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateTrucks] @TruckNumber INT, @TruckDesc VARCHAR(400), @TruckType VARCHAR(40), @BodyType VARCHAR(40),
@LicenseNumber VARCHAR(10), @EngineType VARCHAR(30), @FuelType VARCHAR(15), @CurrentMileage INT

AS

SET NOCOUNT ON

UPDATE Trucks
SET TruckDesc = ISNULL(@TruckDesc, TruckDesc),
	TruckType = ISNULL(@TruckType, TruckType),
	BodyType = ISNULL(@BodyType, BodyType),
	LicenseNumber = ISNULL(@LicenseNumber, LicenseNumber),
	EngineType = ISNULL(@EngineType, EngineType),
	FuelType = ISNULL(@FuelType, FuelType),
	CurrentMileage = ISNULL(@CurrentMileage, CurrentMileage)
WHERE TruckNumber = @TruckNumber

SET NOCOUNT OFF

GO
USE [master]
GO
ALTER DATABASE [XYZTrucking] SET  READ_WRITE 
GO
