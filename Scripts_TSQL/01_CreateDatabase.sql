
-- 01_CreateDatabase.sql
IF DB_ID('MultiLocations') IS NOT NULL
BEGIN
  ALTER DATABASE MultiLocations SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE MultiLocations;
END
GO

CREATE DATABASE MultiLocations;
GO
USE MultiLocations;
GO
