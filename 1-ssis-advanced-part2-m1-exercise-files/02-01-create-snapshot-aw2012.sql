use master
go

CREATE DATABASE AdventureWorks2012_dbsscdc ON
( NAME = AdventureWorks2012_Data, FILENAME = 
'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLServer\MSSQL\Data\AdventureWorks2012_cdc.ss' )
AS SNAPSHOT OF AdventureWorks2012
