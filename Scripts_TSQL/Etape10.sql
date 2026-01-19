

-- Etape10.sql
-- Véhicules NON loués (jointure externe obligatoire)
USE MultiLocations;
GO

SELECT
  v.NIV, v.Annee, v.Valeur,
  m.NomModele, m.Marque,
  t.NomType,
  co.NomCouleur
FROM dbo.Vehicules v
JOIN dbo.Modeles m ON m.ModeleID = v.ModeleID
JOIN dbo.Types_Vehicule t ON t.TypeID = v.TypeID
JOIN dbo.Couleurs co ON co.CouleurID = v.CouleurID
LEFT JOIN dbo.Locations l ON l.VehiculeNIV = v.NIV
WHERE l.LocationID IS NULL
ORDER BY v.Annee DESC;
