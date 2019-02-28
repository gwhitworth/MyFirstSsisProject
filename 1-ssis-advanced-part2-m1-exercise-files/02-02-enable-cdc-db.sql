USE AdventureWorks2012
GO
EXEC sp_changedbowner 'sa'
GO
EXEC sys.sp_cdc_enable_db
GO
CREATE TABLE [dbo].[cdc_states] 
 ([name] [nvarchar](256) NOT NULL, 
 [state] [nvarchar](256) NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON 
 [dbo].[cdc_states] 
 ( [name] ASC ) 
 WITH (PAD_INDEX  = OFF) ON [PRIMARY]
GO
