
USE [master]
GO
ALTER DATABASE [AdventureWorks2012] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

restore database AdventureWorks2012
from database_snapshot = 'AdventureWorks2012_dbsscdc'




USE [msdb]
GO
EXEC msdb.dbo.sp_delete_job @job_name=N'cdc.AdventureWorks2012_capture', @delete_unused_schedule=1
GO
EXEC msdb.dbo.sp_delete_job @job_name=N'cdc.AdventureWorks2012_cleanup', @delete_unused_schedule=1
GO
