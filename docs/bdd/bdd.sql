Enum "TypeOperation_enum" {
  "Gagne"
  "Utilise"
}

Table "Utilisateurs" {
  "ID_Utilisateur" INT [pk, increment]
  "Nom" VARCHAR(50)
  "Prenom" VARCHAR(50)
  "Email" VARCHAR(100)
  "MotDePasse" VARCHAR(255)
  "Points" INT
}

Table "Achats" {
  "ID_Achat" INT [pk, increment]
  "ID_Utilisateur" INT [ref: > Utilisateurs.ID_Utilisateur]
  "ID_Produit" INT [ref: > Produits.ID_Produit]
  "DateAchat" DATE
}

Table "Produits" {
  "ID_Produit" INT [pk, increment]
  "NomProduit" VARCHAR(100)
  "Description" TEXT
  "Prix" DECIMAL(10,2)
  "StockDisponible" INT
}

Table "HistoriquePoints" {
  "ID_Historique" INT [pk, increment]
  "ID_Utilisateur" INT [ref: > Utilisateurs.ID_Utilisateur]
  "NombrePoints" INT
  "TypeOperation" TypeOperation_enum
  "DateOperation" DATE
}

