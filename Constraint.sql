-- Ajout contraint de clé étrangère.

ALTER TABLE Ouvrage
ADD CONSTRAINT fk_ouvrage_genre FOREIGN KEY (genre) REFERENCES Genre(code);

ALTER TABLE exemplaire
ADD CONSTRAINT fk_exemplaire_isbn FOREIGN KEY (isbn) REFERENCES Ouvrage(isbn);

ALTER TABLE emprunt
ADD CONSTRAINT fk_emprunt_membre FOREIGN KEY (membre) REFERENCES membre(numero);

ALTER TABLE detailsemprunt
ADD CONSTRAINT fk_emprunt_numero FOREIGN KEY (emprunt) REFERENCES emprunt(numero);

ALTER TABLE detailsemprunt
ADD CONSTRAINT fk_detailsemprunt_isbn FOREIGN KEY (isbn) REFERENCES exemplaire(isbn);

-- Eviter les doublons avec la contrainte d'unicité.

ALTER TABLE membre
ADD CONSTRAINT UQ_membre_nom
UNIQUE (nom);

ALTER TABLE membre
ADD CONSTRAINT UQ_membre_prenom
UNIQUE (prenom);

ALTER TABLE membre
ADD CONSTRAINT UQ_membre_telephone
UNIQUE (telephone);

-- Creation colonne téléphone portable et mise en place de la contraint CHECK '06' ou '07'.

ALTER TABLE membre
ADD telephone_p CHAR(10); 

ALTER TABLE membre
ADD CONSTRAINT CHK_telephone_p
CHECK (telephone_p LIKE '06%' 
OR telephone_p LIKE '07%');


-- Au dessus c'est valide !!! Placer au dessus de doublons et tel portable après debug.

--Problème : Impossible d'ajouter des contraintes d'index externes. 
ALTER TABLE detailsemprunt
ADD CONSTRAINT fk_detailsemprunt_exemplaire FOREIGN KEY (exemplaire) REFERENCES exemplaire(numero);

-- Problème : Erreur syntax au niveau de 'DEFAULT NOW() FOR creeLe' Ligne 3. 
ALTER TABLE emprunt
ADD CONSTRAINT DF_Creele
DEFAULT NOW() FOR CreeLe;

-- Ajout d'un index 

CREATE INDEX I_FK_isbn ON exemplaire(isbn);
CREATE INDEX I_FK_genre ON Ouvrage(genre);
CREATE INDEX I_FK_membre ON emprunt(membre);
CREATE INDEX I_FK_detailsemp ON detailsemprunt(emprunt, isbn, exemplaire);














