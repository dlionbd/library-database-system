USE biblioteka
SELECT TOP(10) 
    t.Tytul AS "Najchętniej wypożyczane książki ostatnich 6 miesięcy"
FROM
    -- Wybór wypożyczeń tylko z ostatnich 6 miesięcy
    (SELECT k.Tytul, w.Ksiazka_ID
     FROM dbo.Wypozyczenie AS w
     INNER JOIN dbo.Ksiazka AS k ON w.Ksiazka_ID = k.ID
     WHERE w.Data_Wypozyczenia >= DATEADD(MONTH, -6, GETDATE())) AS t
-- Grupowanie danych po tytule
GROUP BY t.Tytul
-- Sortowanie malejąco, aby uzyskać najczęściej wypożyczane tytuły
ORDER BY COUNT(t.Ksiazka_ID) DESC;
