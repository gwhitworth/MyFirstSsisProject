USE [AdventureWorksDW_demo]
GO

select 'New', * from dw.DimProduct where ProductAlternateKey in ('AR-5382', 'AR-5383')
select 'Update Type 2', * from dw.DimProduct where ProductAlternateKey = 'CA-5965'
select 'Update Type 1', * from dw.DimProduct where ProductAlternateKey like 'AR-5381'

