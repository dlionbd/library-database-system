USE biblioteka
DECLARE @isbn VARCHAR(13);
DECLARE @tytul VARCHAR(200);
DECLARE @autor_id INT;

-- Bibliotekarz podaje do zmiennych ISBN LUB tytuł ORAZ ID autora
SELECT @isbn = '1404904483432';
SELECT @tytul = '.';
SELECT @autor_id = '';
--One military single.2024  1953166044226
--Development.1404904483432
DECLARE @dostepna DATE;

--sprawdzenie czy data zwrotu ksiazki jest podana, jesli tak - ksiazka jest caly czas u innego uzytkownika
SELECT @dostepna = (
    SELECT TOP (1) Data_Zwrotu
    FROM dbo.Wypozyczenie
    INNER JOIN dbo.Ksiazka ON dbo.Wypozyczenie.Ksiazka_ID = dbo.Ksiazka.ID
    INNER JOIN dbo.Autor_Ksiazka ON dbo.Ksiazka.ID = dbo.Autor_Ksiazka.Ksiazka_ID
    INNER JOIN dbo.Autor ON dbo.Autor_Ksiazka.Autor_ID = dbo.Autor.ID
    WHERE dbo.Ksiazka.Numer_ISBN = @isbn 
        OR (dbo.Ksiazka.Tytul = @tytul AND dbo.Autor.ID = @autor_id)
    ORDER BY dbo.Wypozyczenie.Data_Wypozyczenia DESC
);

-- Sprawdzenie, czy książka jest dostępna
IF @dostepna IS NOT NULL
    SELECT 'ksiazka jest dostepna' AS "czy dostepna?";
ELSE
BEGIN
    DECLARE @data DATE;

    -- Jeśli nie, sprawdzamy datę zwrotu książki
    SELECT @data = (
        SELECT TOP (1) Termin_Zwrotu
        FROM dbo.Wypozyczenie
        INNER JOIN dbo.Ksiazka ON dbo.Wypozyczenie.Ksiazka_ID = dbo.Ksiazka.ID
        INNER JOIN dbo.Autor_Ksiazka ON dbo.Ksiazka.ID = dbo.Autor_Ksiazka.Ksiazka_ID
        INNER JOIN dbo.Autor ON dbo.Autor_Ksiazka.Autor_ID = dbo.Autor.ID
        WHERE dbo.Ksiazka.Numer_ISBN = @isbn 
            OR (dbo.Ksiazka.Tytul = @tytul AND dbo.Autor.ID = @autor_id)
        ORDER BY dbo.Wypozyczenie.Data_Wypozyczenia DESC
    );

    SELECT 'ksiazka jest niedostepna' AS "czy dostepna?", @data AS "kiedy bedzie dostepna?";
END;
