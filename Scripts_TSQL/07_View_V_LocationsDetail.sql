

-- 07_View_V_LocationsDetail.sql
USE MultiLocations;
GO

CREATE OR ALTER VIEW dbo.V_LocationsDetail
AS
SELECT
  l.LocationID,
  c.ClientID, c.Prenom, c.Nom, c.Telephone, c.Ville,
  v.NIV, v.Annee, v.Valeur,
  m.NomModele, m.Marque,
  t.NomType,
  co.NomCouleur,
  tl.Libelle AS TermeLibelle, tl.DureeMois, tl.NbPaiementsAttendus,
  l.DateDebut, l.DateFin, l.MontantMensuel, l.Depot, l.Statut,
  COUNT(p.PaiementID) AS NbPaiementsEffectues,
  SUM(p.Montant) AS TotalPaye
FROM dbo.Locations l
JOIN dbo.Clients c ON c.ClientID = l.ClientID
JOIN dbo.Vehicules v ON v.NIV = l.VehiculeNIV
JOIN dbo.Modeles m ON m.ModeleID = v.ModeleID
JOIN dbo.Types_Vehicule t ON t.TypeID = v.TypeID
JOIN dbo.Couleurs co ON co.CouleurID = v.CouleurID
JOIN dbo.Termes_Location tl ON tl.TermeID = l.TermeID
LEFT JOIN dbo.Paiements p ON p.LocationID = l.LocationID
GROUP BY
  l.LocationID,
  c.ClientID, c.Prenom, c.Nom, c.Telephone, c.Ville,
  v.NIV, v.Annee, v.Valeur,
  m.NomModele, m.Marque,
  t.NomType,
  co.NomCouleur,
  tl.Libelle, tl.DureeMois, tl.NbPaiementsAttendus,
  l.DateDebut, l.DateFin, l.MontantMensuel, l.Depot, l.Statut;
GO
