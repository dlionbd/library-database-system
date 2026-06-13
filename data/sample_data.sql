USE biblioteka;
GO

-- Minimal sample dataset for local testing of the library database project.
-- The original university project used generated test data; this file provides
-- a compact reproducible dataset for GitHub reviewers.

INSERT INTO Adres (ID, Ulica, Nr_budynku, Nr_Mieszkania, Kod_pocztowy, Miasto) VALUES
(1, 'Marszalkowska', '10', '5', '00-001', 'Warszawa'),
(2, 'Nowowiejska', '20', '12', '00-002', 'Warszawa'),
(3, 'Prosta', '8', '1', '00-003', 'Warszawa');

INSERT INTO Osoba (ID, Imie, nazwisko) VALUES
(1, 'Jan', 'Kowalski'),
(2, 'Anna', 'Nowak'),
(3, 'Olga', 'Lem'),
(4, 'Stanislaw', 'Lem'),
(5, 'George', 'Orwell'),
(6, 'Maria', 'Pracownik');

INSERT INTO Czytelnik (ID, Nr_czytelnika, Osoba_ID, Adres_ID, Email, Nr_Telefonu) VALUES
(1, '3201507563', 1, 1, 'jan.kowalski@example.com', '500100100'),
(2, '7178698143', 2, 2, 'anna.nowak@example.com', '500200200');

INSERT INTO Pracownik (ID, Osoba_ID) VALUES
(1, 6);

INSERT INTO Autor (ID, Osoba_ID) VALUES
(1, 4),
(2, 5);

INSERT INTO Wydawnictwo (ID, nazwa) VALUES
(1, 'Czytelnik'),
(2, 'Penguin');

INSERT INTO Ksiazka (ID, Numer_ISBN, Tytul, Rok_wydania, Data_zakupu, Dostepne, Wydawnictwo_ID) VALUES
(1, '9788374694907', 'Solaris', 1961, '2024-01-10', 2, 1),
(2, '9780141036144', '1984', 1949, '2024-02-20', 1, 2),
(3, '9788374694914', 'Cyberiada', 1965, '2024-03-15', 0, 1);

INSERT INTO Autor_Ksiazka (Ksiazka_ID, Autor_ID) VALUES
(1, 1),
(2, 2),
(3, 1);

INSERT INTO Wypozyczenie (ID, Data_Wypozyczenia, Termin_Zwrotu, Data_Zwrotu, Czytelnik_ID, Pracownik_ID, Ksiazka_ID) VALUES
(1, DATEADD(DAY, -20, GETDATE()), DATEADD(DAY, -6, GETDATE()), DATEADD(DAY, -3, GETDATE()), 1, 1, 1),
(2, DATEADD(DAY, -10, GETDATE()), DATEADD(DAY, 4, GETDATE()), NULL, 1, 1, 2),
(3, DATEADD(DAY, -5, GETDATE()), DATEADD(DAY, 9, GETDATE()), NULL, 2, 1, 3),
(4, DATEADD(MONTH, -2, GETDATE()), DATEADD(MONTH, -2, DATEADD(DAY, 14, GETDATE())), DATEADD(MONTH, -2, DATEADD(DAY, 10, GETDATE())), 2, 1, 1);
GO
