--00-ssis-adv-2-demo-m2-setup-01.sql
-- connect to AzureAdventureWorksStage

CREATE TABLE [dbo].[stageProduct](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NOT NULL,
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
	[ModifiedDate] [datetime] NULL,
	PRIMARY KEY ([ProductNumber])
) 

GO
CREATE TABLE [dbo].[stageProductCategory](
	[Name] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ProductCategoryID] [int] NOT NULL,
	PRIMARY KEY ([ProductCategoryID])
)

GO
CREATE TABLE [dbo].[stageProductSubcategory](
	[Name] [nvarchar](50) NULL,
	[ProductSubcategoryID] [int] NOT NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ProductCategoryID] [int] NULL,
	PRIMARY KEY ([ProductSubcategoryID])
) 

GO

