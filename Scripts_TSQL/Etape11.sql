

-- Etape11.sql
-- Véhicules avec air climatisé ET anti-démarreur
USE MultiLocations;
GO

SELECT
  v.NIV, v.Annee, v.Valeur,
  v.AirClimatise, v.AntiDemarreur,
  m.NomModele, m.Marque,
  t.NomType,
  co.NomCouleur
FROM dbo.Vehicules v
JOIN dbo.Modeles m ON m.ModeleID = v.ModeleID
JOIN dbo.Types_Vehicule t ON t.TypeID = v.TypeID
JOIN dbo.Couleurs co ON co.CouleurID = v.CouleurID
WHERE v.AirClimatise = 1 AND v.AntiDemarreur = 1
ORDER BY v.Annee DESC;
