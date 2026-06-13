USE biblioteka
DECLARE @czytelnik VARCHAR(10);
-- Bibliotekarz podaje numer czytelnika do zmiennej
SELECT @czytelnik = '3201507563';
--1832276439
DECLARE @Ilosc INT;
-- Sprawdzenie liczby wypożyczeń dla danego czytelnika
SELECT @Ilosc = (
    SELECT COUNT(*)
    FROM dbo.Wypozyczenie
    INNER JOIN dbo.Czytelnik ON dbo.Wypozyczenie.Czytelnik_ID = dbo.Czytelnik.ID
    WHERE dbo.Czytelnik.Nr_czytelnika = @czytelnik AND dbo.Wypozyczenie.Data_Zwrotu IS NULL
);

DECLARE @odpowiedz VARCHAR(3);
-- Sprawdzenie, czy czytelnik ma wypożyczone więcej niż 5 książek
IF @Ilosc >= 5
    SELECT @odpowiedz = 'nie';
ELSE
    SELECT @odpowiedz = 'tak';

-- Wyświetlenie odpowiedzi
SELECT 
    @czytelnik AS 'Numer czytelnika',
    @odpowiedz AS 'Czy czytelnik może wyporzyczyc ksiazke?';
