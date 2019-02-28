USE [master]
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'AdventureWorksDW_stage_demo')
DROP DATABASE [AdventureWorksDW_stage_demo]

CREATE DATABASE [AdventureWorksDW_stage_demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureWorksDW_stage_demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW_stage_demo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdventureWorksDW_stage_demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW_stage_demo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET COMPATIBILITY_LEVEL = 110
GO


ALTER DATABASE [AdventureWorksDW_stage_demo] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET ARITHABORT OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET  DISABLE_BROKER 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET RECOVERY FULL 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET  MULTI_USER 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET DB_CHAINING OFF 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [AdventureWorksDW_stage_demo] SET  READ_WRITE 
GO

use [AdventureWorksDW_stage_demo]
go


create schema stage
go

CREATE TABLE [stage].[stageProduct_Inserts] (
    [__$start_lsn] binary(10),
    [__$operation] int,
    [__$update_mask] binary(128),
    [ProductID] int,
    [Name] nvarchar(50),
    [ProductNumber] nvarchar(25),
    [MakeFlag] bit,
    [FinishedGoodsFlag] bit,
    [Color] nvarchar(15),
    [SafetyStockLevel] smallint,
    [ReorderPoint] smallint,
    [StandardCost] money,
    [ListPrice] money,
    [Size] nvarchar(5),
    [SizeUnitMeasureCode] nvarchar(3),
    [WeightUnitMeasureCode] nvarchar(3),
    [Weight] numeric(8,2),
    [DaysToManufacture] int,
    [ProductLine] nvarchar(2),
    [Class] nvarchar(2),
    [Style] nvarchar(2),
    [ProductSubcategoryID] int,
    [ProductModelID] int,
    [SellStartDate] datetime,
    [SellEndDate] datetime,
    [DiscontinuedDate] datetime,
    [rowguid] uniqueidentifier,
    [ModifiedDate] datetime
)
GO
CREATE TABLE [stage].[stageProduct_Updates](
    [__$start_lsn] binary(10),
    [__$operation] int,
    [__$update_mask] binary(128),
    ChangeType int NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[MakeFlag] [bit] NULL,
	[FinishedGoodsFlag] [bit] NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nvarchar](3) NULL,
	[WeightUnitMeasureCode] [nvarchar](3) NULL,
	[Weight] [numeric](8, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nvarchar](2) NULL,
	[Class] [nvarchar](2) NULL,
	[Style] [nvarchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
CREATE TABLE [stage].[stageProduct_Deletes](
    [__$start_lsn] binary(10),
    [__$operation] int,
    [__$update_mask] binary(128),
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[MakeFlag] [bit] NULL,
	[FinishedGoodsFlag] [bit] NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nvarchar](3) NULL,
	[WeightUnitMeasureCode] [nvarchar](3) NULL,
	[Weight] [numeric](8, 2) NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nvarchar](2) NULL,
	[Class] [nvarchar](2) NULL,
	[Style] [nvarchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [datetime] NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO

CREATE TABLE [stage].[stageProductCategory](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL   NULL ,
	[ModifiedDate] [datetime]  NULL ,
) ON [PRIMARY]


GO
CREATE TABLE [stage].[stageProductSubcategory](
	[ProductSubcategoryID] [int]  NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL 
) ON [PRIMARY]


GO







use [master]
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'AdventureWorksDW_demo')
	DROP DATABASE [AdventureWorksDW_demo]

CREATE DATABASE [AdventureWorksDW_demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureWorksDW_demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW_demo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdventureWorksDW_demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW_demo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [AdventureWorksDW_demo] SET COMPATIBILITY_LEVEL = 110
GO


ALTER DATABASE [AdventureWorksDW_demo] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET ARITHABORT OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET  DISABLE_BROKER 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET RECOVERY FULL 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET  MULTI_USER 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [AdventureWorksDW_demo] SET DB_CHAINING OFF 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [AdventureWorksDW_demo] SET  READ_WRITE 
GO



use [AdventureWorksDW_demo]
go

create schema dw
go


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO




CREATE TABLE [dw].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductAlternateKey] [nvarchar](25) NULL,
	[ProductSubcategoryKey] [int] NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[EnglishProductName] [nvarchar](50) NOT NULL,
	[SpanishProductName] [nvarchar](50) NOT NULL,
	[FrenchProductName] [nvarchar](50) NOT NULL,
	[StandardCost] [money] NULL,
	[FinishedGoodsFlag] [bit] NOT NULL,
	[Color] [nvarchar](15) NOT NULL,
	[SafetyStockLevel] [smallint] NULL,
	[ReorderPoint] [smallint] NULL,
	[ListPrice] [money] NULL,
	[Size] [nvarchar](50) NULL,
	[SizeRange] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[DaysToManufacture] [int] NULL,
	[ProductLine] [nchar](2) NULL,
	[DealerPrice] [money] NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ModelName] [nvarchar](50) NULL,
	[LargePhoto] [varbinary](max) NULL,
	[EnglishDescription] [nvarchar](400) NULL,
	[FrenchDescription] [nvarchar](400) NULL,
	[ChineseDescription] [nvarchar](400) NULL,
	[ArabicDescription] [nvarchar](400) NULL,
	[HebrewDescription] [nvarchar](400) NULL,
	[ThaiDescription] [nvarchar](400) NULL,
	[GermanDescription] [nvarchar](400) NULL,
	[JapaneseDescription] [nvarchar](400) NULL,
	[TurkishDescription] [nvarchar](400) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](7) NULL,
	[AuditKey] int NOT NULL,
 CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimProduct_ProductAlternateKey_StartDate] UNIQUE NONCLUSTERED 
(
	[ProductAlternateKey] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dw].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryAlternateKey] [int] NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductCategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductCategoryName] [nvarchar](50) NOT NULL,
	[AuditKey] [int] NOT NULL,
 CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimProductCategory_ProductCategoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductCategoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dw].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[SpanishProductSubcategoryName] [nvarchar](50) NOT NULL,
	[FrenchProductSubcategoryName] [nvarchar](50) NOT NULL,
	[ProductCategoryKey] [int] NULL,
	[AuditKey] [int] NOT NULL,
 CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductSubcategoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dw].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY([ProductSubcategoryKey])
REFERENCES [dw].[DimProductSubcategory] ([ProductSubcategoryKey])
GO
ALTER TABLE [dw].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimProductSubcategory]
GO
ALTER TABLE [dw].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dw].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dw].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimProductCategory]
GO

INSERT INTO [dw].[DimProductCategory]
SELECT 
       [ProductCategoryAlternateKey]
      ,[EnglishProductCategoryName]
      ,[SpanishProductCategoryName]
      ,[FrenchProductCategoryName]
	  , -1 as AuditKey
  FROM [AdventureWorksDW2012].[dbo].[DimProductCategory]
GO

INSERT INTO [dw].[DimProductSubcategory]
SELECT [ProductSubcategoryAlternateKey]
      ,[EnglishProductSubcategoryName]
      ,[SpanishProductSubcategoryName]
      ,[FrenchProductSubcategoryName]
      ,[ProductCategoryKey]
	  , -1 as AuditKey
  FROM [AdventureWorksDW2012].[dbo].[DimProductSubcategory]
GO



CREATE TABLE [dw].[DimAudit](
	[AuditKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAuditKey] [int] NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[PkgName] [varchar](50) NOT NULL,
	[PkgGUID] [uniqueidentifier] NULL,
	[PkgVersionGUID] [uniqueidentifier] NULL,
	[PkgVersionMajor] [smallint] NULL,
	[PkgVersionMinor] [smallint] NULL,
	[ExecStartDT] [datetime] NOT NULL,
	[ExecStopDT] [datetime] NULL,
	[ExecutionInstanceGUID] [uniqueidentifier] NULL,
	[ExtractRowCnt] [bigint] NULL,
	[InsertRowCnt] [bigint] NULL,
	[UpdateRowCnt] [bigint] NULL,
	[DeleteRowCnt] [bigint] NULL,
	[ErrorRowCnt] [bigint] NULL,
	[TableInitialRowCnt] [bigint] NULL,
	[TableFinalRowCnt] [bigint] NULL,
	[TableMaxDateTime] [datetime] NULL,
	[SuccessfulProcessingInd] [char](1) NOT NULL,
 CONSTRAINT [PK_dbo.DimAudit] PRIMARY KEY CLUSTERED 
(
	[AuditKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dw].[DimAudit] ON 

INSERT [dw].[DimAudit] ([AuditKey], [ParentAuditKey], [TableName], [PkgName], [PkgGUID], [PkgVersionGUID], [PkgVersionMajor], [PkgVersionMinor], [ExecStartDT], [ExecStopDT], [ExecutionInstanceGUID], [ExtractRowCnt], [InsertRowCnt], [UpdateRowCnt], [ErrorRowCnt], [TableInitialRowCnt], [TableFinalRowCnt], [TableMaxDateTime], [SuccessfulProcessingInd]) VALUES (-1, -1, N'Not Applicable', N'Initial Load', NULL, NULL, 0, 0, getdate(), getdate(), NULL, 0, 0, 0, 0, 0, 0, getdate(), N' ')
SET IDENTITY_INSERT [dw].[DimAudit] OFF
ALTER TABLE [dw].[DimAudit] ADD  DEFAULT ('Unknown') FOR [TableName]
GO
ALTER TABLE [dw].[DimAudit] ADD  DEFAULT ('Unknown') FOR [PkgName]
GO
ALTER TABLE [dw].[DimAudit] ADD  DEFAULT (getdate()) FOR [ExecStartDT]
GO
ALTER TABLE [dw].[DimAudit] ADD  DEFAULT ('N') FOR [SuccessfulProcessingInd]
GO

ALTER TABLE [dw].[DimAudit]  WITH CHECK ADD  CONSTRAINT [FK_dbo_DimAudit_ParentAuditKey] FOREIGN KEY([ParentAuditKey])
REFERENCES [dw].[DimAudit] ([AuditKey])
GO
ALTER TABLE [dw].[DimAudit] CHECK CONSTRAINT [FK_dbo_DimAudit_ParentAuditKey]
GO







