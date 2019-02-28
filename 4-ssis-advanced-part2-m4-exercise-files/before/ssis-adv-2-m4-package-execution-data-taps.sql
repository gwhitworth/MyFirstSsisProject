--ssis-adv-2-m4-package-execution-data-taps.sql

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
@package_name=N'01-01-sales-territory-extract.dtsx', 
@execution_id=@execution_id OUTPUT, 
@folder_name=N'DW_ETL', 
@project_name=N'ssis-adv-2-m4', 
@use32bitruntime=False, 
@reference_id=1

Select @execution_id
DECLARE @var0 bit = 0
EXEC [SSISDB].[catalog].[set_execution_parameter_value] 
@execution_id,  
@object_type=20, 
@parameter_name=N'initialLoad', 
@parameter_value=@var0

DECLARE @var int = 1
EXEC [SSISDB].[catalog].[set_object_parameter_value] 
@object_type=30, 
@parameter_name=N'ParentAuditKey', 
@object_name=N'01-01-sales-territory-extract.dtsx', 
@folder_name=N'DW_ETL', 
@project_name=N'ssis-adv-2-m4', 
@value_type=V, @parameter_value=@var

DECLARE @var1 smallint = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  
@object_type=50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@var1


-- add in the data tap prior to start_execution
EXEC [SSISDB].[catalog].[add_data_tap] @execution_id=@execution_id, 
@task_package_path=N'\Package\DFT Extract to Staging', 
@dataflow_path_id_string=N'Paths[OLEDB Source.OLE DB Source Output]', 
@data_filename='mydatatap.csv'

EXEC [SSISDB].[catalog].[start_execution] @execution_id
GO
