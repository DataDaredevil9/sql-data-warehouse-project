--***************************************************************
         --Creating the database for the project
--***************************************************************

--Script Purpose:
--"This is the script that contains the code for creating the database for the DataWarehouse project which is the most essential part of the project
 -- and also creates the three schemas bronze,silver,gold."
-- ------------------------------------------------------------------------------------------------------

USE master;
IF NOT EXISTS(
  SELECT name FROM sys.databases WHERE name='DataWarehouse'
  )
BEGIN
-- Creating the database DataWarehouse
CREATE DATABASE DataWarehouse;
END

USE DataWarehouse;
-- Creating the schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
