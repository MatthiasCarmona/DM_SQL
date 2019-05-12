-- Partie 1 : Le langage de définition de données 

CREATE DATABASE Bibliothèque;

USE Bibliothèque;

CREATE TABLE Ouvrage(

isbn 		INTEGER(10) NOT NULL,
titre 		VARCHAR(200),
auteur 		VARCHAR(80),
genre 		VARCHAR(5),
editeur 	VARCHAR(80),

CONSTRAINT PK_Ouvrage PRIMARY KEY(isbn)
)
ENGINE=Innodb;

CREATE TABLE Exemplaire(

isbn 		INTEGER(10) NOT NULL,
numero 		TINYINT(3) NOT NULL,
etat 		CHAR(5) CHECK(etat="NE" OR etat="BO" OR etat="MO" OR etat="MA"),

CONSTRAINT PK_Exemplaire PRIMARY KEY(isbn,numero)
)
ENGINE=Innodb;

CREATE TABLE Genre(

code 		CHAR(5) NOT NULL,
libelle 	VARCHAR(80),

CONSTRAINT PK_Genre PRIMARY KEY(code)
)
ENGINE=Innodb;

CREATE TABLE Membre(

numero 		INTEGER(10) NOT NULL,
nom 		VARCHAR(80),
prenom 		VARCHAR(80),
adresse 	VARCHAR(200),
telephone 	CHAR(10),
adhesion 	DATE,
duree 		TINYINT(2) CHECK(duree<=0),

CONSTRAINT PK_Membre PRIMARY KEY(numero)
)
ENGINE=Innodb;

CREATE TABLE Emprunt(

numero 		INTEGER(10) NOT NULL,
membre 		INTEGER(6),
creeLe 		DATE,	

CONSTRAINT PK_Emprunt PRIMARY KEY(numero)
)
ENGINE=Innodb;

CREATE TABLE DetailsEmprunt(

emprunt 	INTEGER(10) NOT NULL,
numero 		TINYINT(3) NOT NULL,
isbn 		INTEGER(10),
exemplaire 	TINYINT(3),
renduLe 	DATE,	

CONSTRAINT PK_DetailsEmprunt PRIMARY KEY(emprunt,numero)
)
ENGINE=Innodb;