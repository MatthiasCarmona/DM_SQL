-- Partie 1 : Le langage de définition de données 

CREATE DATABASE Bibliothèque;

USE Bibliothèque;

CREATE TABLE Ouvrage(

isbn 		NUMBER(10) NOT NULL,
titre 		VARCHAR(200),
auteur 		VARCHAR(80),
genre 		VARCHAR(5),
editeur		VARCHAR(80)

CONSTRAINT PK_Ouvrage PRIMARY KEY (isbn));

CREATE TABLE Exemplaire(

isbn 		INTEGER(10) NOT NULL,
numero 		NUMBER(3) NOT NULL,
etat 		CHAR(5)

CONSTRAINT PK_Exemplaire PRIMARY KEY (isbn,numero));

CREATE TABLE Genre(

code 		CHAR(5) NOT NULL,
libelle		VARCHAR(80)

CONSTRAINT PK_Genre PRIMARY KEY (code));

CREATE TABLE Membre(

numero 		NUMBER(10) NOT NULL,
nom			VARCHAR(80),
prenom 		VARCHAR(80),
adresse		VARCHAR(200),
telephone 	CHAR(10),
adhesion 	DATE,
duree 		NUMBER(2)

CONSTRAINT PK_Membre PRIMARY KEY (numero));

CREATE TABLE Emprunt(

numero 		NUMBER(10) NOT NULL,
membre 		NUMBER(6),
creeLe 		DATE	

CONSTRAINT PK_Emprunt PRIMARY KEY (numero));

CREATE TABLE DetailsEmprunt(

emprunt 	NUMBER(10) NOT NULL,
numero 		NUMBER(3) NOT NULL,
isbn 		NUMBER(10),
exemplaire 	NUMBER(3),
renduLe 	DATE	

CONSTRAINT PK_DetailsEmprunt PRIMARY KEY (emprunt,numero));