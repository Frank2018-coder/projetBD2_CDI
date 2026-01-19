

-- 09_Trigger_TR_AuditLocations.sql
USE MultiLocations;
GO

CREATE OR ALTER TRIGGER dbo.TR_AuditLocations
ON dbo.Locations
AFTER UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @user NVARCHAR(120) = SUSER_SNAME();

  -- Exemple: audit de Statut
  INSERT INTO dbo.Audit_Locations(LocationID, Champ, AncienneValeur, NouvelleValeur, Utilisateur)
  SELECT
    i.LocationID,
    'Statut',
    d.Statut,
    i.Statut,
    @user
  FROM inserted i
  JOIN deleted d ON d.LocationID = i.LocationID
  WHERE ISNULL(d.Statut,'') <> ISNULL(i.Statut,'');

  -- Exemple: audit de MontantMensuel
  INSERT INTO dbo.Audit_Locations(LocationID, Champ, AncienneValeur, NouvelleValeur, Utilisateur)
  SELECT
    i.LocationID,
    'MontantMensuel',
    CONVERT(NVARCHAR(200), d.MontantMensuel),
    CONVERT(NVARCHAR(200), i.MontantMensuel),
    @user
  FROM inserted i
  JOIN deleted d ON d.LocationID = i.LocationID
  WHERE ISNULL(d.MontantMensuel, -1) <> ISNULL(i.MontantMensuel, -1);
END
GO
