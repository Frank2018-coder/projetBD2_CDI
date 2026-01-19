

-- 08_Procedure_SP_AjouterPaiement.sql
USE MultiLocations;
GO

CREATE OR ALTER PROCEDURE dbo.SP_AjouterPaiement
  @LocationID INT,
  @DatePaiement DATE,
  @Montant DECIMAL(12,2),
  @ModePaiement NVARCHAR(30),
  @RaisonAnnulation NVARCHAR(200) = NULL
AS
BEGIN
  SET NOCOUNT ON;

  -- Règle: on ne supprime pas un paiement. Une annulation => montant 0 + raison
  IF @RaisonAnnulation IS NOT NULL
  BEGIN
    SET @Montant = 0;
  END

  INSERT INTO dbo.Paiements(LocationID, DatePaiement, Montant, ModePaiement, RaisonAnnulation)
  VALUES(@LocationID, @DatePaiement, @Montant, @ModePaiement, @RaisonAnnulation);
END
GO
