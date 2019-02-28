Control Flow Tasks
Stacia Misner
www.pluralsight.com


These demonstrations assume that you have installed AdventureWorks2008R2 database 
in the local SQL Server 2008 R2 database instance. You can download the database
available from http://msftdbprodsamples.codeplex.com.

Some demonstrations also assume that you have installed Adventure Works DW 2008R2 database
in the local Analysis Services instance. The solution for this database is part of the same 
download for the SQL Server 2008 R2 database, and must be deployed manually following the 
instructions available at 
http://msftdbprodsamples.codeplex.com/wikipage?title=Installing%20Analysis%20Services%20Database. In the project properties, be sure to change the database name to Adventure Works DW 2008R2.


In addition, you must perform the following steps:

1. Execute the prepare-demo script found in the ssis-basic-control-flow-tasks\begin folder. This script assumes you are using the default instance of SQL Server 2008 R2. It creates a database named Performance.

2. Create a System DSN for SQL Server named Performance that references the local SQL Server. See http://msdn.microsoft.com/en-us/library/cc879308.aspx for instructions. IMPORTANT: Do NOT use the SQL Server Native 10.0 provider. Use only the 'SQL Server' provider.

3. Extract the contents of the ssis-basic-data.zip file to the c:\ drive. This zip file is found in the found in the ssis-basic-control-flow-tasks\begin folder.

4. Configure an FTP server with a path to C:\ssis-basic-data\data.

5. Configure Message Queuing with a private queue called ssis-msmq-demo. For more information, see http://www.sqlservercurry.com/2009/07/working-with-message-queuing-task-with.html.


