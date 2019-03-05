--
-- Script to create a database for storing demonstration data
--
SET NOCOUNT ON

use [Master]
go


if not exists(select * from sys.databases where name='AW')
	BEGIN
	

		CREATE DATABASE [AW] ON  PRIMARY 
		( NAME = N'AW_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\AW_Data.mdf' , SIZE = 35648KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
		 LOG ON 
		( NAME = N'AW_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\AW_Log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
		

		ALTER DATABASE [AW] SET COMPATIBILITY_LEVEL = 100
		

		IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
		begin
		EXEC [AW].[dbo].[sp_fulltext_database] @action = 'enable'
		end
		

		ALTER DATABASE [AW] SET ANSI_NULL_DEFAULT OFF 
		

		ALTER DATABASE [AW] SET ANSI_NULLS OFF 
		

		ALTER DATABASE [AW] SET ANSI_PADDING OFF 
		

		ALTER DATABASE [AW] SET ANSI_WARNINGS OFF 
		

		ALTER DATABASE [AW] SET ARITHABORT OFF 
		

		ALTER DATABASE [AW] SET AUTO_CLOSE OFF 
		

		ALTER DATABASE [AW] SET AUTO_CREATE_STATISTICS ON 
		

		ALTER DATABASE [AW] SET AUTO_SHRINK OFF 
		

		ALTER DATABASE [AW] SET AUTO_UPDATE_STATISTICS ON 
		

		ALTER DATABASE [AW] SET CURSOR_CLOSE_ON_COMMIT OFF 
		

		ALTER DATABASE [AW] SET CURSOR_DEFAULT  GLOBAL 
		

		ALTER DATABASE [AW] SET CONCAT_NULL_YIELDS_NULL OFF 
		

		ALTER DATABASE [AW] SET NUMERIC_ROUNDABORT OFF 
		

		ALTER DATABASE [AW] SET QUOTED_IDENTIFIER OFF 
		

		ALTER DATABASE [AW] SET RECURSIVE_TRIGGERS OFF 
		

		ALTER DATABASE [AW] SET  ENABLE_BROKER 
		

		ALTER DATABASE [AW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
		

		ALTER DATABASE [AW] SET DATE_CORRELATION_OPTIMIZATION OFF 
		

		ALTER DATABASE [AW] SET TRUSTWORTHY OFF 
		

		ALTER DATABASE [AW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
		

		ALTER DATABASE [AW] SET PARAMETERIZATION SIMPLE 
		

		ALTER DATABASE [AW] SET READ_COMMITTED_SNAPSHOT OFF 
		

		ALTER DATABASE [AW] SET HONOR_BROKER_PRIORITY OFF 
		

		ALTER DATABASE [AW] SET  READ_WRITE 
		

		ALTER DATABASE [AW] SET RECOVERY FULL 
		

		ALTER DATABASE [AW] SET  MULTI_USER 
		

		ALTER DATABASE [AW] SET PAGE_VERIFY CHECKSUM  
		

		ALTER DATABASE [AW] SET DB_CHAINING OFF 
		

		if exists(select * from sys.databases where name = 'AW')
			PRINT 'AW database created.'

	
	END
	
go

use [AdventureWorksDW2008R2]
go

if exists(select * from sys.objects o where o.name = 'vSalesQuota2009' and o.type = 'V')
	begin
		drop view [dbo].[vSalesQuota2009]
	end
go
	
CREATE VIEW [dbo].[vSalesQuota2009]
AS
SELECT     
dbo.FactSalesQuota.EmployeeKey, 
convert(smallint, dbo.FactSalesQuota.CalendarYear + 1) AS CalendarYear, 
dbo.FactSalesQuota.CalendarQuarter, 
convert(float, dbo.FactSalesQuota.SalesAmountQuota * 1.15) AS SalesAmountQuota, 
dbo.DimEmployee.SalesTerritoryKey
FROM         
dbo.FactSalesQuota 
INNER JOIN
dbo.DimEmployee ON 
dbo.FactSalesQuota.EmployeeKey = dbo.DimEmployee.EmployeeKey
WHERE     
(dbo.FactSalesQuota.CalendarYear = 2008)

go

PRINT 'View vSalesQuota2009 created.'
go
CREATE PROC [dbo].[uspInsertTimeDim]
 @DateBegin  SMALLDATETIME,
 @DateTarget SMALLDATETIME
AS
 SET NOCOUNT ON

 DECLARE
  @Date SMALLDATETIME,
  @i INT

 SELECT
  @Date = @DateBegin, --dateadd(d, 1, (SELECT MAX(FullDateAlternateKey) FROM dbo.DimDate)),
  @i = 0

 WHILE (@Date <= @DateTarget)
 BEGIN
  INSERT [dbo].[DimDate]
   ([DateKey]
   ,[FullDateAlternateKey]
   ,[DayNumberOfWeek]
   ,[EnglishDayNameOfWeek]
   ,[SpanishDayNameOfWeek]
   ,[FrenchDayNameOfWeek]
   ,[DayNumberOfMonth]
   ,[DayNumberOfYear]
   ,[WeekNumberOfYear]
   ,[EnglishMonthName]
   ,[SpanishMonthName]
   ,[FrenchMonthName]
   ,[MonthNumberOfYear]
   ,[CalendarQuarter]
   ,[CalendarYear]
   ,[CalendarSemester]
   ,[FiscalQuarter]
   ,[FiscalYear]
   ,[FiscalSemester])
  SELECT
   convert(int,CONVERT(varchar, @Date, 112)) DateKey,
   @Date FullDateAlternateKey,
   DATEPART(dw, @Date) DayNumberOfWeek,
   CASE DATEPART(dw, @Date)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
   END EnglishDayNameOfWeek,
   CASE DATEPART(dw, @Date)
    WHEN 1 THEN 'Domingo'
    WHEN 2 THEN 'Lunes'
    WHEN 3 THEN 'Martes'
    WHEN 4 THEN 'Mircoles'
    WHEN 5 THEN 'Jueves'
    WHEN 6 THEN 'Viernes'
    WHEN 7 THEN 'Sbado'
   END SpanishDayNameOfWeek,
   CASE DATEPART(dw, @Date)
    WHEN 1 THEN 'Dimanche'
    WHEN 2 THEN 'Lundi'
    WHEN 3 THEN 'Mardi'
    WHEN 4 THEN 'Mercredi'
    WHEN 5 THEN 'Jeudi'
    WHEN 6 THEN 'Vendredi'
    WHEN 7 THEN 'Samedi'
   END FrenchDayNameOfWeek,
   DATEPART(d, @Date) DayNumberOfMonth,
   DATEPART(dy, @Date) DayNumberOfYear,
   DATEPART(wk, @Date) WeekNumberOfYear,
   CASE DATEPART(m, @Date)
    WHEN 1 THEN 'January'
    WHEN 2 THEN 'February'
    WHEN 3 THEN 'March'
    WHEN 4 THEN 'April'
    WHEN 5 THEN 'May'
    WHEN 6 THEN 'June'
    WHEN 7 THEN 'July'
    WHEN 8 THEN 'August'
    WHEN 9 THEN 'September'
    WHEN 10 THEN 'October'
    WHEN 11 THEN 'November'
    WHEN 12 THEN 'December'
   END EnglishMonthName,
   CASE DATEPART(m, @Date)
    WHEN 1 THEN 'Enero'
    WHEN 2 THEN 'Febrero'
    WHEN 3 THEN 'Marzo'
    WHEN 4 THEN 'Abril'
    WHEN 5 THEN 'Mayo'
    WHEN 6 THEN 'Junio'
    WHEN 7 THEN 'Julio'
    WHEN 8 THEN 'Agosto'
    WHEN 9 THEN 'Septiembre'
    WHEN 10 THEN 'Octubre'
    WHEN 11 THEN 'Noviembre'
    WHEN 12 THEN 'Diciembre'
   END SpanishMonthName,
   CASE DATEPART(m, @Date)
    WHEN 1 THEN 'Janvier'
    WHEN 2 THEN 'Fvrier'
    WHEN 3 THEN 'Mars'
    WHEN 4 THEN 'Avril'
    WHEN 5 THEN 'Mai'
    WHEN 6 THEN 'Juin'
    WHEN 7 THEN 'Juillet'
    WHEN 8 THEN 'Aot'
    WHEN 9 THEN 'Septembre'
    WHEN 10 THEN 'Octobre'
    WHEN 11 THEN 'Novembre'
    WHEN 12 THEN 'Decembre'
   END FrenchMonthName,
   DATEPART(m, @Date) MonthNumberOfYear,
   DATEPART(q, @Date) CalendarQuarter,
   DATEPART(yyyy, @Date) CalendarYear,
   ((DATEPART(q, @Date) + 1) / 2) CalendarSemester,
   DATEPART(q, DATEADD(m, 6, @Date)) FiscalQuarter,
   DATEPART(yyyy, DATEADD(m, 6, @Date)) FiscalYear,
   ((DATEPART(q, DATEADD(m, 6, @Date)) + 1) / 2) FiscalSemester

  SELECT
   @Date = @Date + 1,
   @i = @i + 1
 END

 PRINT CAST(@i AS VARCHAR) + ' DimDate record(s) inserted'

GO
EXEC dbo.uspInsertTimeDim '9/1/2008', '12/31/2009'
GO


PRINT 'Script completed.'


