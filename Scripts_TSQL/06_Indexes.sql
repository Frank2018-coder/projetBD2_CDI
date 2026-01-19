
-- 06_Indexes.sql
USE MultiLocations;
GO

-- Indexes proposés (à justifier dans le tableau des index)
CREATE NONCLUSTERED INDEX IX_Clients_Telephone ON dbo.Clients(Telephone);
CREATE NONCLUSTERED INDEX IX_Locations_ClientID ON dbo.Locations(ClientID);
CREATE NONCLUSTERED INDEX IX_Locations_Vehicule ON dbo.Locations(VehiculeNIV);
CREATE NONCLUSTERED INDEX IX_Paiements_LocationID ON dbo.Paiements(LocationID);
