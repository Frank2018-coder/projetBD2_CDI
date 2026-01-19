

-- 02_CreateTables.sql
USE MultiLocations;
GO

CREATE TABLE dbo.Clients (
  ClientID       INT IDENTITY(1,1) CONSTRAINT PK_Clients PRIMARY KEY,
  Prenom         NVARCHAR(50)  NOT NULL,
  Nom            NVARCHAR(50)  NOT NULL,
  Adresse        NVARCHAR(120) NOT NULL,
  Ville          NVARCHAR(60)  NOT NULL,
  Province       NVARCHAR(60)  NOT NULL,
  CodePostal     NVARCHAR(12)  NOT NULL,
  Telephone      NVARCHAR(20)  NOT NULL,
  Email          NVARCHAR(120) NULL
);
GO

CREATE TABLE dbo.Termes_Location (
  TermeID            INT IDENTITY(1,1) CONSTRAINT PK_Termes PRIMARY KEY,
  Libelle            NVARCHAR(50) NOT NULL,     -- ex: '12 mois'
  DureeMois          INT NOT NULL,              -- ex: 12
  NbPaiementsAttendus INT NOT NULL              -- ex: 12 (mensuel)
);
GO

CREATE TABLE dbo.Types_Vehicule (
  TypeID    INT IDENTITY(1,1) CONSTRAINT PK_Types PRIMARY KEY,
  NomType   NVARCHAR(60) NOT NULL
);
GO

CREATE TABLE dbo.Couleurs (
  CouleurID  INT IDENTITY(1,1) CONSTRAINT PK_Couleurs PRIMARY KEY,
  NomCouleur NVARCHAR(40) NOT NULL
);
GO

CREATE TABLE dbo.Modeles (
  ModeleID   INT IDENTITY(1,1) CONSTRAINT PK_Modeles PRIMARY KEY,
  NomModele  NVARCHAR(60) NOT NULL,
  Marque     NVARCHAR(60) NULL
);
GO

CREATE TABLE dbo.Vehicules (
  NIV              NVARCHAR(40) CONSTRAINT PK_Vehicules PRIMARY KEY, -- PK non IDENTITY
  ModeleID         INT NOT NULL,
  TypeID           INT NOT NULL,
  CouleurID        INT NOT NULL,
  Annee            INT NOT NULL,
  Valeur           DECIMAL(12,2) NOT NULL,
  TransmissionAuto BIT NOT NULL,
  AirClimatise     BIT NOT NULL,
  AntiDemarreur    BIT NOT NULL
);
GO

CREATE TABLE dbo.Locations (
  LocationID     INT IDENTITY(1,1) CONSTRAINT PK_Locations PRIMARY KEY,
  ClientID       INT NOT NULL,
  VehiculeNIV    NVARCHAR(40) NOT NULL,
  TermeID        INT NOT NULL,
  DateDebut      DATE NOT NULL,
  DateFin        DATE NOT NULL,
  MontantMensuel DECIMAL(12,2) NOT NULL,
  Depot          DECIMAL(12,2) NOT NULL DEFAULT(0),
  Statut         NVARCHAR(20) NOT NULL DEFAULT('Active') -- Active/Terminee/Annulee
);
GO

CREATE TABLE dbo.Paiements (
  PaiementID       INT IDENTITY(1,1) CONSTRAINT PK_Paiements PRIMARY KEY,
  LocationID       INT NOT NULL,
  DatePaiement     DATE NOT NULL,
  Montant          DECIMAL(12,2) NOT NULL,
  ModePaiement     NVARCHAR(30) NOT NULL,
  RaisonAnnulation NVARCHAR(200) NULL
);
GO

CREATE TABLE dbo.Audit_Locations (
  AuditID          INT IDENTITY(1,1) CONSTRAINT PK_Audit PRIMARY KEY,
  LocationID       INT NOT NULL,
  Champ            NVARCHAR(80) NOT NULL,
  AncienneValeur   NVARCHAR(200) NULL,
  NouvelleValeur   NVARCHAR(200) NULL,
  DateChangement   DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
  Utilisateur      NVARCHAR(120) NULL
);
GO
