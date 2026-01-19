

-- 05_SeedData.sql
USE MultiLocations;
GO

-- Référentiels
INSERT INTO dbo.Types_Vehicule (NomType) VALUES (N'Berline'), (N'SUV'), (N'Compacte');
INSERT INTO dbo.Couleurs (NomCouleur) VALUES (N'Noir'), (N'Blanc'), (N'Gris'), (N'Rouge');
INSERT INTO dbo.Modeles (NomModele, Marque) VALUES (N'Civic', N'Honda'), (N'Corolla', N'Toyota'), (N'CR-V', N'Honda');

INSERT INTO dbo.Termes_Location (Libelle, DureeMois, NbPaiementsAttendus)
VALUES (N'12 mois',12,12),(N'24 mois',24,24),(N'36 mois',36,36);

-- Clients (exemples à adapter selon votre PDF)
INSERT INTO dbo.Clients (Prenom, Nom, Adresse, Ville, Province, CodePostal, Telephone, Email)
VALUES
(N'Jean',N'Dupont',N'10 Rue Principale',N'Montreal',N'QC',N'H1H1H1',N'514-000-0001',N'jean.dupont@email.com'),
(N'Sarah',N'Martin',N'22 Avenue Nord',N'Montreal',N'QC',N'H2H2H2',N'514-000-0002',N'sarah.martin@email.com'),
(N'Karim',N'Bensaid',N'5 Boulevard Est',N'Laval',N'QC',N'H3H3H3',N'450-000-0003',N'karim.bensaid@email.com');

-- Véhicules (NIV unique)
INSERT INTO dbo.Vehicules (NIV, ModeleID, TypeID, CouleurID, Annee, Valeur, TransmissionAuto, AirClimatise, AntiDemarreur)
VALUES
(N'NIV000000000000000000000000000001', 1, 3, 2, 2021, 22000, 1, 1, 1),
(N'NIV000000000000000000000000000002', 2, 3, 3, 2020, 20000, 1, 1, 0),
(N'NIV000000000000000000000000000003', 3, 2, 1, 2022, 32000, 1, 1, 1),
(N'NIV000000000000000000000000000004', 1, 1, 4, 2019, 18000, 0, 1, 0);

-- Locations
INSERT INTO dbo.Locations (ClientID, VehiculeNIV, TermeID, DateDebut, DateFin, MontantMensuel, Depot, Statut)
VALUES
(1, N'NIV000000000000000000000000000001', 1, '2024-01-01', '2024-12-31', 450, 500, 'Active'),
(2, N'NIV000000000000000000000000000002', 2, '2023-06-01', '2025-05-31', 390, 400, 'Active'),
(3, N'NIV000000000000000000000000000003', 1, '2024-03-01', '2025-02-28', 520, 600, 'Active'),
(1, N'NIV000000000000000000000000000004', 1, '2022-01-01', '2022-12-31', 300, 300, 'Terminee'),
(2, N'NIV000000000000000000000000000004', 1, '2024-05-01', '2025-04-30', 310, 300, 'Active');

-- Paiements (exemple : 6 paiements minimum)
INSERT INTO dbo.Paiements (LocationID, DatePaiement, Montant, ModePaiement, RaisonAnnulation)
VALUES
(1, '2024-01-05', 450, N'Carte', NULL),
(1, '2024-02-05', 450, N'Carte', NULL),
(2, '2023-06-05', 390, N'Virement', NULL),
(2, '2023-07-05', 390, N'Virement', NULL),
(3, '2024-03-05', 520, N'Carte', NULL),
(4, '2022-01-05', 300, N'Cash', NULL);
