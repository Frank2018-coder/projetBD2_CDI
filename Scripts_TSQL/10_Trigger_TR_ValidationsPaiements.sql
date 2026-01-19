

-- 10_Trigger_TR_ValidationPaiements.sql
USE MultiLocations;
GO

CREATE OR ALTER TRIGGER dbo.TR_ValidationPaiements
ON dbo.Paiements
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  /* Règle: le nombre de paiements ne doit pas dépasser le nombre attendu par le terme.
     Ici, on bloque si un INSERT ferait dépasser le plafond.
  */
  IF EXISTS (
    SELECT 1
    FROM inserted ins
    JOIN dbo.Locations l ON l.LocationID = ins.LocationID
    JOIN dbo.Termes_Location tl ON tl.TermeID = l.TermeID
    CROSS APPLY (
      SELECT COUNT(*) AS Nb
      FROM dbo.Paiements p
      WHERE p.LocationID = ins.LocationID
    ) c
    WHERE c.Nb > tl.NbPaiementsAttendus
  )
  BEGIN
    RAISERROR('Nombre de paiements dépasse le nombre attendu pour ce terme.', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END
END
GO
