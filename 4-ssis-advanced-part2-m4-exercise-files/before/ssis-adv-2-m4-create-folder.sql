
Declare @folder_id bigint
EXEC [SSISDB].[catalog].[create_folder]
       @folder_name=N'DW_ETL',
       @folder_id=@folder_id OUTPUT
 
EXEC [SSISDB].[catalog].[set_folder_description]
       @folder_name=N'DW_ETL',
       @folder_description=N'This folder contains packages for data warehouse loads.'