-- See Matt Mason's excellent walkthrough at 
-- http://www.mattmasson.com/2011/12/cdc-in-ssis-for-sql-server-2012-2/

USE SSISDesignPatterns
GO

-- Reset source, if needed
DECLARE @MaxRows    BIGINT = 100000
EXEC DDL.CreateSourceTable 'Source', '07_CDC', @MaxRows

-- If needed, reset target table
EXEC DDL.CreateTargetTable 'Target', '07_CDC'


-- Show data prior to first run, will be empty table.
SELECT [07_CDCSK]
      ,[BigNumber]
      ,[FormattedComma]
      ,[FormattedZero]
      ,[SourceCIUD]
      ,[TargetCIUD]
      ,[IsRowDeleted]
      ,[LastUpdateDate]
  FROM [Target].[07_CDC]
 ORDER BY [BigNumber]

 -- Run the 07_1_CDC_Inital_Load package to do the initial load. 

 -- Show the table with rows in it.
SELECT [07_CDCSK]
      ,[BigNumber]
      ,[FormattedComma]
      ,[FormattedZero]
      ,[SourceCIUD]
      ,[TargetCIUD]
      ,[IsRowDeleted]
      ,[LastUpdateDate]
  FROM [Target].[07_CDC]
 ORDER BY [BigNumber]

-- Show number of rows by update type
SELECT 'Source' AS SourceTarget, [SourceCIUD] AS CIUD, FORMAT(COUNT([SourceCIUD]), '#,##0') AS CIUDCount
  FROM [Target].[07_CDC]
 GROUP BY [SourceCIUD]
UNION
SELECT 'Target' AS SourceTarget, [TargetCIUD] AS CIUD, FORMAT(COUNT([TargetCIUD]), '#,##0') AS CIUDCount
  FROM [Target].[07_CDC]
 GROUP BY [TargetCIUD]
 ORDER BY [SourceTarget], [CIUD]


-- Update rows in the source
DECLARE @MaxInsertRowsT1  BIGINT = 150000
DECLARE @UpdateFromT1     BIGINT = 5000
DECLARE @UpdateThruT1     BIGINT = 9999
DECLARE @IncludeType2ChangeT1 BIT = 0
DECLARE @DeleteFrom       BIGINT = 20000
DECLARE @DeleteThru       BIGINT = 21999

EXECUTE [CUD].[07_CDC] @MaxInsertRowsT1, @UpdateFromT1, @UpdateThruT1, @DeleteFrom, @DeleteThru, @IncludeType2ChangeT1


-- Now run the 07_2_CDC_Incremental_Load package

-- Show data post update

-- Again, show number of rows by update type
SELECT 'Source' AS SourceTarget, [SourceCIUD] AS CIUD, FORMAT(COUNT([SourceCIUD]), '#,##0') AS CIUDCount
  FROM [Target].[07_CDC]
 GROUP BY [SourceCIUD]
UNION
SELECT 'Target' AS SourceTarget, [TargetCIUD] AS CIUD, FORMAT(COUNT([TargetCIUD]), '#,##0') AS CIUDCount
  FROM [Target].[07_CDC]
 GROUP BY [TargetCIUD]
 ORDER BY [SourceTarget], [CIUD]


-- New records 
SELECT [07_CDCSK]
      ,[BigNumber]
      ,[FormattedComma]
      ,[FormattedZero]
      ,[SourceCIUD]
      ,[TargetCIUD]
      ,[IsRowDeleted]
      ,[LastUpdateDate]
  FROM [Target].[07_CDC]
 WHERE [BigNumber] > (SELECT MAX(BigNumber) -50 FROM [Target].[07_CDC] WHERE TargetCIUD = 'Insert' )
 ORDER BY [BigNumber]

-- Updated rows 
SELECT [07_CDCSK]
      ,[BigNumber]
      ,[FormattedComma]
      ,[FormattedZero]
      ,[SourceCIUD]
      ,[TargetCIUD]
      ,[IsRowDeleted]
      ,[LastUpdateDate]
  FROM [Target].[07_CDC]
 WHERE [BigNumber] > (SELECT MIN(BigNumber) -3 FROM [Target].[07_CDC] WHERE TargetCIUD = 'Update' )
   AND [BigNumber] < (SELECT MAX(BigNumber) +3 FROM [Target].[07_CDC] WHERE TargetCIUD = 'Update' )
 ORDER BY [BigNumber]

-- Deleted rows 
SELECT [07_CDCSK]
      ,[BigNumber]
      ,[FormattedComma]
      ,[FormattedZero]
      ,[SourceCIUD]
      ,[TargetCIUD]
      ,[IsRowDeleted]
      ,[LastUpdateDate]
  FROM [Target].[07_CDC]
 WHERE [BigNumber] > (SELECT MIN(BigNumber) -3 FROM [Target].[07_CDC] WHERE TargetCIUD = 'Delete' )
   AND [BigNumber] < (SELECT MAX(BigNumber) +3 FROM [Target].[07_CDC] WHERE TargetCIUD = 'Delete' )
 ORDER BY [BigNumber]

