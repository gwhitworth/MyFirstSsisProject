Data Flow
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

1. In SSMS, execute the prepare-demo.sql script found in the ssis-basic-data-flow\begin folder. This script assumes you are using the default instance of SQL Server 2008 R2. It creates a database named Performance.

2. Extract the contents of the ssis-basic-data.zip file to the c:\ drive. This zip file is found in the found in the ssis-basic-data-flow\begin folder.

3. In SSMS, execute the alter-aw-dsv.xmla found in the ssis-basic-data-flow\begin folder.

4. In SSMS, execute the alter-aw-sales-targets-measure-group.xmla found in the ssis-basic-data-flow\begin folder.

5. In SSMS, execute the process-update-date.xmla found in the ssis-basic-data-flow\begin folder.

6. In SSMS, execute the alter-mdx-script.xmla found in the ssis-basic-data-flow\begin folder.
 
NOTE: To return the Adventure Works DW 2008 R2 database in Analysis Services to its original condition, redeploy it following the same procedure for original deployment.



