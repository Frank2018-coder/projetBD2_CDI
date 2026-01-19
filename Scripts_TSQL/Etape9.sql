

-- Etape9.sql
-- Liste des clients avec le nombre total de véhicules loués (toutes locations confondues)
USE MultiLocations;
GO

SELECT
  c.ClientID, c.Prenom, c.Nom,
  COUNT(DISTINCT l.VehiculeNIV) AS NbVehiculesLoues
FROM dbo.Clients c
LEFT JOIN dbo.Locations l ON l.ClientID = c.ClientID
GROUP BY c.ClientID, c.Prenom, c.Nom
ORDER BY NbVehiculesLoues DESC, c.Nom, c.Prenom;
