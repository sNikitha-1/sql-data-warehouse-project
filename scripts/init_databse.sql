/*
===========================================================================
Create Database and Schemas
===========================================================================
Script purpose:
    This script create a new databse named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated . Additionally, the script sets up three schemas
    within the datbase: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the databse will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script
*/

USE master;
Go

--Drop and recreate the 'DataWarehouse' databse
IF EXISTS (SELECT 1 FROM sys.databses WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABSE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATBASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABSE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
