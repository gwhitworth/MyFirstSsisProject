Deployment Part 1
Advanced Integration Services Part 2
Stacia Misner
www.pluralsight.com



1. You must install a database engine instance of SQL Server 2014 (Developer or Enterprise edition), SQL Server Management Studio, SQL Server Data Tools for Visual Studio 2012, and Integration Services. 

2. This demonstration assumes that you have installed AdventureWorks2012 database in the local SQL Server 2012 database instance. You can download the database available from Codeplex, http://msftdbprodsamples.codeplex.com, labeled SQL Server 2012 OLTP. Installation instructions are at  http://social.technet.microsoft.com/wiki/contents/articles/3735.sql-server-samples-readme-en-us.aspx#Readme_for_Adventure_Works_Sample_Databases.

3. Open SQL Server Management Studio. Click File, Open, and then File. Navigate to the module folder, and double-click ssis-adv-2-m3-demo-setup.sql. 
Press F5 to execute the script. This script creates two databases, one for staging and for a data warehouse, and adds schemas and tables to these databases. 

4. Open SQL Server Data Tools. Click File, Open, and then Project/Solution. Navigate to the before or after folder for this module and then double-click the ssis-adv-2-m3.SLN file in that folder to work with the module’s demo files.  

5. Extract the ssis-adv-data-2.zip file to the C:\ drive.

