USE biblioteka
DECLARE @czytelnik VARCHAR(10);
-- Bibliotekarz podaje numer czytelnika do zmiennej
SELECT @czytelnik = '7178698143';
--3201507563 nie zwrócone
-- Historia wypożyczonych przez użytkownika tytułów
SELECT 
    Czytelnik.Nr_czytelnika AS 'Numer czytelnika', 
    Ksiazka.Tytul AS 'Tytuł książki', 
    Wypozyczenie.Data_Wypozyczenia AS 'Data wypożyczenia', 
    Wypozyczenie.Termin_Zwrotu AS 'Termin zwrotu', 
    Wypozyczenie.Data_Zwrotu AS 'Data zwrotu'
FROM 
    dbo.Ksiazka
INNER JOIN 
    dbo.Wypozyczenie ON Wypozyczenie.Ksiazka_ID = Ksiazka.ID
INNER JOIN 
    dbo.Czytelnik ON Czytelnik.ID = Wypozyczenie.Czytelnik_ID
WHERE 
    Czytelnik.Nr_czytelnika = @czytelnik;
