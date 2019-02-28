Security
Advanced Integration Services Part 2
Stacia Misner
www.pluralsight.com


The first demonstration assumes that you have installed AdventureWorksDW2012 database in a local SQL Server 2012 database instance, although this step is required only for the first demonstration. You can use any database, however. This demonstration also requires that this instance is a mixed mode authentication instance. To change an existing instance to mixed mode, see http://msdn.microsoft.com/en-us/library/ms188670.aspx.

Several demonstrations in this module require you to create additional users:
1. In SQL Server Management Studio, connect to the mixed mode instance, add a SQL login named SSISDev1, and assign the db_datareader role to this login for the AdventureWorksDW2012 database.
2. In Computer Management, add another Windows 	user called SSISDev1 to your computer. Assign this user to the local Administrators group. 

The demonstration for digital security requires you to create a digital certificate. There are multiple ways to do this. You can find thorough instructions at http://www.databasejournal.com/features/mssql/securing-sql-server-2012-integration-services-packages-using-digital-certificates.html. I used makecert.exe from the Windows SDK to create a self-signed certificate for testing purposes.

Note: The packages in the demonstration file require SQL Server 2012 or higher. The concepts apply to earlier versions of SQL Server, but the packages are not backwards compatible.

