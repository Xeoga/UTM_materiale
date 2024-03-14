-- Crearea bazei de date
CREATE DATABASE IF NOT EXISTS Riuri;
USE Riuri;

-- Crearea tabelului 'orase'
CREATE TABLE orase (
    Nume VARCHAR(255) NOT NULL,
    Judet VARCHAR(255) NOT NULL,
    NumarLocuitori INT,
    PRIMARY KEY (Nume)
);

-- Crearea tabelului 'riuri'
CREATE TABLE riuri (
    Rau VARCHAR(255) NOT NULL,
    Lungime INT,
    PRIMARY KEY (Rau)
);

-- Crearea tabelului 'traversari'
CREATE TABLE traversari (
    Oras VARCHAR(255) NOT NULL,
    Rau VARCHAR(255) NOT NULL,
    FOREIGN KEY (Oras) REFERENCES orase(Nume),
    FOREIGN KEY (Rau) REFERENCES riuri(Rau)
);

-- Crearea tabelului 'detalii_orase'
CREATE TABLE detalii_orase (
    OrasNume VARCHAR(255) NOT NULL,
    Descriere TEXT,
    AtractiiTuristice TEXT,
    PRIMARY KEY (OrasNume),
    FOREIGN KEY (OrasNume) REFERENCES orase(Nume)
);
