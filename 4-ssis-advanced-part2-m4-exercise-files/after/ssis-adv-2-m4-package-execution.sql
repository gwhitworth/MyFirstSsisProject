--ssis-adv-2-m4-package-execution.sql

--execute this code to retrieve reference_id for environment
USE [SSISDB]
GO

SELECT [reference_id]
      ,[project_id]
      ,[reference_type]
      ,[environment_folder_name]
      ,[environment_name]
      ,[validation_status]
      ,[last_validation_time]
  FROM [catalog].[environment_references]
GO



--execute this code for package execution after replacing reference_id with correct value

Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] 
@package_name=N'00-master-dw-etl.dtsx', 
@execution_id=@execution_id OUTPUT, @folder_name=N'DW_ETL', 
@project_name=N'ssis-adv-2-m4', 
@use32bitruntime=False, 
@reference_id=1

Select @execution_id
DECLARE @firstLoad smallint = 0
EXEC [SSISDB].[catalog].[set_execution_parameter_value] 
@execution_id,  
@object_type=20, 
@parameter_name=N'initialLoad', 
@parameter_value=@firstLoad

EXEC [SSISDB].[catalog].[start_execution] @execution_id
GO
