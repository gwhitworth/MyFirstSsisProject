USE AdventureWorks2012
GO
EXEC sys.sp_cdc_enable_table
   @source_schema = N'Production'
   ,@source_name = N'Product'
   ,@role_name = N'cdc_Admin'
   ,@capture_instance = N'Production_Product'
   ,@supports_net_changes = 1
