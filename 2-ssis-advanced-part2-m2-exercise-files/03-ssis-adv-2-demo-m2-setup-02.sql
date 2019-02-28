--03-ssis-adv-2-demo-m2-setup-02.sql
--connect to AzureAdventureWorksDW

create schema dw
go

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
	[ErrorRowCnt] [bigint] NULL,
	[TableInitialRowCnt] [bigint] NULL,
	[TableFinalRowCnt] [bigint] NULL,
	[TableMaxDateTime] [datetime] NULL,
	[SuccessfulProcessingInd] [char](1) NOT NULL,
 CONSTRAINT [PK_dbo.DimAudit] PRIMARY KEY CLUSTERED 
(
	[AuditKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 
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

CREATE TABLE [dw].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductAlternateKey] [nvarchar](25) NULL,
	[ProductSubcategoryKey] [int] NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[EnglishProductName] [nvarchar](50) NOT NULL,
	
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
	[EnglishDescription] [nvarchar](400) NULL,
	
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [nvarchar](7) NULL,
	[AuditKey] int NOT NULL,
 CONSTRAINT [PK_DimProduct_ProductKey] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
,
 CONSTRAINT [AK_DimProduct_ProductAlternateKey_StartDate] UNIQUE NONCLUSTERED 
(
	[ProductAlternateKey] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO

CREATE TABLE [dw].[DimProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryAlternateKey] [int] NULL,
	[EnglishProductCategoryName] [nvarchar](50) NOT NULL,
	[AuditKey] int NOT NULL,
 CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
,
 CONSTRAINT [AK_DimProductCategory_ProductCategoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductCategoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO


CREATE TABLE [dw].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryAlternateKey] [int] NULL,
	[EnglishProductSubcategoryName] [nvarchar](50) NOT NULL,
	
	[ProductCategoryKey] [int] NULL,
	[AuditKey] int NOT NULL,
 CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
,
 CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryAlternateKey] UNIQUE NONCLUSTERED 
(
	[ProductSubcategoryAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO


ALTER TABLE [dw].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY([ProductSubcategoryKey])
REFERENCES [dw].[DimProductSubcategory] ([ProductSubcategoryKey])
GO
ALTER TABLE [dw].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimProductSubcategory]
GO
ALTER TABLE [dw].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimAudit] FOREIGN KEY([AuditKey])
REFERENCES [dw].[DimAudit] ([AuditKey])
GO

ALTER TABLE [dw].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimAudit]
ALTER TABLE [dw].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dw].[DimProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dw].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimProductCategory]
GO

ALTER TABLE [dw].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimAudit] FOREIGN KEY([AuditKey])
REFERENCES [dw].[DimAudit] ([AuditKey])
GO

ALTER TABLE [dw].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimAudit]
ALTER TABLE [dw].[DimProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductCategory_DimAudit] FOREIGN KEY([AuditKey])
REFERENCES [dw].[DimAudit] ([AuditKey])
GO

ALTER TABLE [dw].[DimProductCategory] CHECK CONSTRAINT [FK_DimProductCategory_DimAudit]
GO 



create schema tmp
go

CREATE TABLE [tmp].[scdProduct] (
    [Name] nvarchar(50),
    [rowguid] uniqueidentifier,
    [ModifiedDate] datetime,
    [ProductSubcategoryID] int,
    [ProductID] nvarchar(25),
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
    [ProductModelID] int,
    [SellStartDate] datetime,
    [SellEndDate] datetime,
    [DiscontinuedDate] datetime,
    [AuditKey] int,
    [ProductSubcategoryKey] int,
	PRIMARY KEY ([ProductNumber])
)
GO

CREATE TABLE [tmp].[scdProductCategory](
	[Name] [nvarchar](50) ,
	[rowguid] [uniqueidentifier] ,
	[ModifiedDate] [datetime] ,
	[ProductCategoryID] [int] ,
	[AuditKey] [int],
	PRIMARY KEY ([ProductCategoryID])
) 

GO
CREATE TABLE [tmp].[scdProductSubcategory](
	[Name] [nvarchar](50) ,
	[ProductSubcategoryID] [int] ,
	[rowguid] [uniqueidentifier] ,
	[ModifiedDate] [datetime] ,
	[ProductCategoryID] [int],
	[ProductCategoryKey] [int],
	[AuditKey] [int] ,
	PRIMARY KEY ([ProductSubcategoryID])
) 

GO

