CREATE DATABASE SQLix 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

CREATE TABLE QUALITE
	(	
	NumQualite INT NOT NULL AUTO_INCREMENT,
	LibQualite VARCHAR(30),
	PRIMARY KEY (NumQualite)
	) 
ENGINE = InnoDB;

CREATE TABLE PROVINCE
	(
	NumProvince INT NOT NULL AUTO_INCREMENT,
	NomProvince VARCHAR(30),
	NomGouverneur VARCHAR(30),
	PRIMARY KEY (NumProvince)
	) 
ENGINE=InnoDB;

CREATE TABLE VILLAGE
	(
	NumVillage INT NOT NULL AUTO_INCREMENT,
	NomVillage VARCHAR(30),
	NbHuttes INT,
	NumProvince INT,
	PRIMARY KEY (NumVillage),
	FOREIGN KEY (NumProvince) REFERENCES PROVINCE(NumProvince)
	) 
ENGINE=InnoDB;

CREATE TABLE HABITANT
	(
	NumHab INT NOT NULL AUTO_INCREMENT,
	Nom VARCHAR(30),
	Age INT,
	NumQualite INT,
	NumVillage INT,
	PRIMARY KEY (NumHab),
	FOREIGN KEY (NumQualite) REFERENCES QUALITE(NumQualite),
	FOREIGN KEY (NumVillage) REFERENCES VILLAGE(NumVillage)
	) 
ENGINE=InnoDB;

CREATE TABLE RESSERRE
	(
	NumResserre INT NOT NULL AUTO_INCREMENT,
	NomResserre VARCHAR(30),
	Superficie INT,
	NumVillage INT,
	PRIMARY KEY (NumResserre),
	FOREIGN KEY (NumVillage) REFERENCES VILLAGE(NumVillage)
	) 
ENGINE=InnoDB;

CREATE TABLE CATEGORIE
	(
	CodeCat CHAR(3),
	NomCateg VARCHAR(50),
	NbPoints INT,
	PRIMARY KEY (CodeCat)
	) 
ENGINE=InnoDB;

CREATE TABLE TROPHEE
	(
	NumTrophee INT NOT NULL AUTO_INCREMENT,
	DatePrise DATETIME,
	CodeCat CHAR(3),
	NumPreneur INT,
	NumResserre INT,
	PRIMARY KEY (NumTrophee),
	FOREIGN KEY (CodeCat) REFERENCES CATEGORIE(CodeCat),
	FOREIGN KEY (NumPreneur) REFERENCES HABITANT(NumHab),
	FOREIGN KEY (NumResserre) REFERENCES RESSERRE(NumResserre)
	) 
ENGINE=InnoDB;

CREATE TABLE POTION
	(
	NumPotion INT NOT NULL AUTO_INCREMENT,
	LibPotion VARCHAR(40),
	Formule VARCHAR(30),
	ConstituantPrincipal VARCHAR(30),
	PRIMARY KEY (NumPotion)
	) 
ENGINE=InnoDB;

CREATE TABLE FABRIQUER
	(
	NumPotion INT NOT NULL,
	NumHab INT NOT NULL,
	PRIMARY KEY (NumPotion, NumHab),
	FOREIGN KEY (NumPotion) REFERENCES POTION(NumPotion),
	FOREIGN KEY (NumHab) REFERENCES HABITANT(NumHab)
	) 
ENGINE=InnoDB;

CREATE TABLE ABSORBER
	(
	NumPotion INT NOT NULL,
	DateA DATETIME NOT NULL,
	NumHab INT NOT NULL,
	Quantite INT,
	PRIMARY KEY(NumPotion, DateA, NumHab),
	FOREIGN KEY (NumPotion) REFERENCES POTION(NumPotion),
	FOREIGN KEY (NumHab) REFERENCES HABITANT(NumHab)
	) 
ENGINE=InnoDB;