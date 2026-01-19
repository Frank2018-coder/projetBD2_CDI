

-- 03_CreateRelationships.sql
USE MultiLocations;
GO

ALTER TABLE dbo.Vehicules
  ADD CONSTRAINT FK_Vehicules_Modeles FOREIGN KEY (ModeleID) REFERENCES dbo.Modeles(ModeleID),
      CONSTRAINT FK_Vehicules_Types   FOREIGN KEY (TypeID)   REFERENCES dbo.Types_Vehicule(TypeID),
      CONSTRAINT FK_Vehicules_Couleurs FOREIGN KEY (CouleurID) REFERENCES dbo.Couleurs(CouleurID);
GO

ALTER TABLE dbo.Locations
  ADD CONSTRAINT FK_Locations_Clients FOREIGN KEY (ClientID) REFERENCES dbo.Clients(ClientID),
      CONSTRAINT FK_Locations_Vehicules FOREIGN KEY (VehiculeNIV) REFERENCES dbo.Vehicules(NIV),
      CONSTRAINT FK_Locations_Termes FOREIGN KEY (TermeID) REFERENCES dbo.Termes_Location(TermeID);
GO

ALTER TABLE dbo.Paiements
  ADD CONSTRAINT FK_Paiements_Locations FOREIGN KEY (LocationID) REFERENCES dbo.Locations(LocationID);
GO

ALTER TABLE dbo.Audit_Locations
  ADD CONSTRAINT FK_Audit_Locations FOREIGN KEY (LocationID) REFERENCES dbo.Locations(LocationID);
GO
