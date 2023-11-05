CREATE TABLE Utilisateurs (
    ID_Utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Email VARCHAR(100),
    MotDePasse VARCHAR(255),
    AutresInfos TEXT
);

CREATE TABLE Achats (
    ID_Achat INT PRIMARY KEY AUTO_INCREMENT,
    ID_Utilisateur INT,
    DateAchat DATE,
    MontantTotal DECIMAL(10, 2),
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateurs(ID_Utilisateur)
);

CREATE TABLE Produits (
    ID_Produit INT PRIMARY KEY AUTO_INCREMENT,
    NomProduit VARCHAR(100),
    Description TEXT,
    Prix DECIMAL(10, 2),
    StockDisponible INT
);

CREATE TABLE PointsFidelite (
    ID_Point INT PRIMARY KEY AUTO_INCREMENT,
    ID_Utilisateur INT,
    NombrePoints INT,
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateurs(ID_Utilisateur)
);

CREATE TABLE HistoriquePoints (
    ID_Historique INT PRIMARY KEY AUTO_INCREMENT,
    ID_Utilisateur INT,
    NombrePoints INT,
    TypeOperation ENUM('Gagne', 'Utilise'),
    DateOperation DATE,
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateurs(ID_Utilisateur)
);
