
-- 04_Constraints_BusinessRules.sql
USE MultiLocations;
GO

-- Règle 1 (exemple): durée max location = 4 ans (48 mois) -> DateFin <= DateDebut + 4 ans
ALTER TABLE dbo.Locations
  ADD CONSTRAINT CK_Locations_DureeMax
  CHECK (DateFin <= DATEADD(YEAR, 4, DateDebut));
GO

-- Règle 2 (exemple simple): MontantMensuel et Depot >= 0
ALTER TABLE dbo.Locations
  ADD CONSTRAINT CK_Locations_MontantsPositifs
  CHECK (MontantMensuel >= 0 AND Depot >= 0);
GO

-- Règle 3 (exemple): AntiDemarreur interdit si AirClimatise = 0
ALTER TABLE dbo.Vehicules
  ADD CONSTRAINT CK_Vehicules_AntiDemarreur_AC
  CHECK (NOT (AntiDemarreur = 1 AND AirClimatise = 0));
GO

/* Règle "paiements cohérents" : dépend du terme (NbPaiementsAttendus) et de la durée.
   Cette règle est plus facile en TRIGGER (voir 08_Trigger_ValidationPaiements.sql),
   car CHECK ne peut pas compter des lignes dans Paiements.
*/
