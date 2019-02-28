--ssis-adv-2-m4-deployment.sql

USE SSISDB
Declare @folder_id bigint
EXEC [SSISDB].[catalog].[create_folder]
       @folder_name=N'DW_ETL_Copy',
       @folder_id=@folder_id OUTPUT
 
EXEC [SSISDB].[catalog].[set_folder_description]
       @folder_name=N'DW_ETL_Copy',
       @folder_description=N'This folder contains a copy of packages for data warehouse loads for demonstration purposes.'

DECLARE @ProjectBinary as varbinary(max)
DECLARE @operation_id as bigint
Set @ProjectBinary = (SELECT * FROM OPENROWSET(BULK 'C:\etl\dw_etl.ispac', SINGLE_BLOB) as BinaryData)

Exec catalog.deploy_project @folder_name = 'DW_ETL_copy', @project_name = 'dw_etl', @Project_Stream = @ProjectBinary, @operation_id = @operation_id out
