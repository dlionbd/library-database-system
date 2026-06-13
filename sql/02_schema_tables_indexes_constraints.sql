-- Tabela: Adres
USE biblioteka
CREATE TABLE Adres (
    ID integer  NOT NULL,
    Ulica varchar(100)  NOT NULL,
    Nr_budynku varchar(10)  NOT NULL,
    Nr_Mieszkania varchar(10)  NOT NULL,
    Kod_pocztowy char(6)  NOT NULL,
    Miasto varchar(50)  NOT NULL,
    CONSTRAINT Adres_pk PRIMARY KEY (ID)
) ;

-- Tabela: Autor
CREATE TABLE Autor (
    ID integer  NOT NULL,
    Osoba_ID integer  NOT NULL,
    CONSTRAINT Autor_pk PRIMARY KEY (ID)
) ;

-- Tabela: Autor_Ksiazka
CREATE TABLE Autor_Ksiazka (
    Ksiazka_ID integer  NOT NULL,
    Autor_ID integer  NOT NULL,
    CONSTRAINT Autor_Ksiazka_pk PRIMARY KEY (Ksiazka_ID,Autor_ID)
) ;

-- Tabela: Czytelnik
CREATE TABLE Czytelnik (
    ID integer  NOT NULL,
    Nr_czytelnika varchar(10) NOT NULL,
    Osoba_ID integer  NOT NULL,
    Adres_ID integer  NOT NULL,
    Email varchar(200)  NOT NULL,
    Nr_Telefonu varchar(30)  NOT NULL,
    CONSTRAINT Czytelnik_pk PRIMARY KEY (ID)
) ;

CREATE UNIQUE INDEX idx_czytelnik_email 
on Czytelnik 
(Email ASC)
;

-- Tabela: Ksiazka
CREATE TABLE Ksiazka (
    ID integer  NOT NULL,
    Numer_ISBN varchar(13)  NOT NULL,
    Tytul varchar(200)  NOT NULL,
    Rok_wydania smallint  NOT NULL,
    Data_zakupu date  NOT NULL,
    Dostepne smallint  NOT NULL CHECK (Dostepne >= 0),
    Wydawnictwo_ID integer  NOT NULL,
    CONSTRAINT Ksiazka_pk PRIMARY KEY (ID)
) ;

CREATE UNIQUE INDEX idx_ksiazka_isbn 
on Ksiazka 
(Numer_ISBN ASC)
;

-- Tabela: Osoba
CREATE TABLE Osoba (
    ID integer  NOT NULL,
    Imie varchar(20)  NOT NULL,
    nazwisko varchar(20)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (ID)
) ;

-- Tabela: Pracownik
CREATE TABLE Pracownik (
    ID integer  NOT NULL,
    Osoba_ID integer  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (ID)
) ;

-- Tabela: Wydawnictwo
CREATE TABLE Wydawnictwo (
    ID integer  NOT NULL,
    nazwa varchar(20)  NOT NULL,
    CONSTRAINT Wydawnictwo_pk PRIMARY KEY (ID)
) ;

-- Tabela: Wypozyczenie
CREATE TABLE Wypozyczenie (
    ID integer  NOT NULL,
    Data_Wypozyczenia date  NOT NULL,
    Termin_Zwrotu date  NOT NULL,
    Data_Zwrotu date  NULL,
    Czytelnik_ID integer  NOT NULL,
    Pracownik_ID integer  NOT NULL,
    Ksiazka_ID integer  NOT NULL,
    CONSTRAINT Wypozyczenie_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- referencja: Autor_Ksiazka_Autor (tabela: Autor_Ksiazka)
ALTER TABLE Autor_Ksiazka ADD CONSTRAINT Autor_Ksiazka_Autor
    FOREIGN KEY (Autor_ID)
    REFERENCES Autor (ID);

-- referencja: Autor_Ksiazka_Ksiazka (tabela: Autor_Ksiazka)
ALTER TABLE Autor_Ksiazka ADD CONSTRAINT Autor_Ksiazka_Ksiazka
    FOREIGN KEY (Ksiazka_ID)
    REFERENCES Ksiazka (ID);

-- referencja: Autor_Osoba (tabela: Autor)
ALTER TABLE Autor ADD CONSTRAINT Autor_Osoba
    FOREIGN KEY (Osoba_ID)
    REFERENCES Osoba (ID);

-- referencja: Czytelnik_Dane (tabela: Czytelnik)
ALTER TABLE Czytelnik ADD CONSTRAINT Czytelnik_Dane
    FOREIGN KEY (Adres_ID)
    REFERENCES Adres (ID);

-- referencja: Czytelnik_Osoba (tabela: Czytelnik)
ALTER TABLE Czytelnik ADD CONSTRAINT Czytelnik_Osoba
    FOREIGN KEY (Osoba_ID)
    REFERENCES Osoba (ID);

-- referencja: Ksiazka_Wydawnictwo (tabela: Ksiazka)
ALTER TABLE Ksiazka ADD CONSTRAINT Ksiazka_Wydawnictwo
    FOREIGN KEY (Wydawnictwo_ID)
    REFERENCES Wydawnictwo (ID);

-- referencja: Pracownik_Osoba (tabela: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Osoba
    FOREIGN KEY (Osoba_ID)
    REFERENCES Osoba (ID);

-- referencja: Wypozyczenie_Czytelnik (tabela: Wypozyczenie)
ALTER TABLE Wypozyczenie ADD CONSTRAINT Wypozyczenie_Czytelnik
    FOREIGN KEY (Czytelnik_ID)
    REFERENCES Czytelnik (ID);

-- referencja: Wypozyczenie_Ksiazka (tabela: Wypozyczenie)
ALTER TABLE Wypozyczenie ADD CONSTRAINT Wypozyczenie_Ksiazka
    FOREIGN KEY (Ksiazka_ID)
    REFERENCES Ksiazka (ID);

-- referencja: Wypozyczenie_Pracownik (tabela: Wypozyczenie)
ALTER TABLE Wypozyczenie ADD CONSTRAINT Wypozyczenie_Pracownik
    FOREIGN KEY (Pracownik_ID)
    REFERENCES Pracownik (ID);
