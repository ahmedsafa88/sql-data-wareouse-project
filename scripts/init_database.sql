/*
============================================================
Create Database and Schemas
============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

-- Switch to the master database (system level, required to create/drop databases)
USE master;
GO

-- Drop and recreate the 'DataWarehouse' database

-- Check if the database already exists in the system catalog
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force all other users out of the database before dropping it
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Permanently delete the existing DataWarehouse database
    DROP DATABASE DataWarehouse;
END

-- Create a fresh DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch into the newly created DataWarehouse database
USE DataWarehouse;
GO

-- Create the Bronze schema (raw data layer — untouched source data)
CREATE SCHEMA bronze;
GO

-- Create the Silver schema (cleaned data layer — filtered and standardized)
CREATE SCHEMA silver;
GO

-- Create the Gold schema (business-ready layer — aggregated and reporting-ready)
CREATE SCHEMA gold;
GO
