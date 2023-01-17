SELECT VaraosaID 
FROM Varaosa 
WHERE Hinta < 10;

SELECT LaskuID, summa, maksajaID, nimi  
FROM Lasku, Asiakas 
WHERE er�p�iv� = "2022-06-01" AND summa > 100 AND maksajaID = Hl�Tunnus;

SELECT korjausTyyppi  
FROM Korjaus  
WHERE korjausID = 2;
 
SELECT puhelin, Poissaolotyyppi 
FROM Ty�ntekij�, Poissaolo 
WHERE tuntipalkka > 12 AND Ty�ntekij�.Ty�tunnus = Poissaolo.Ty�tunnus;

SELECT TuojaID, nimi, maksutiedot  
FROM Huolto, Asiakas 
WHERE aloitusaika > "2022-07-01" AND TuojaID = Hl�Tunnus;
 
SELECT RekisteriNum  
FROM Omistaa  
WHERE Hl�Tunnus = "12011999A1234";

SELECT HuoltoID, M��r�aikainen.M��r�ttyID  
FROM Tehd�M��r�aikainen, M��r�aikainen 
WHERE Tehd�M��r�aikainen.M��r�ttyID = M��r�aikainen.m��r�ttyID AND HuoltoTyyppi = "20000km huolto";

SELECT m��r�ttyID, tyyppi  
FROM M��r�aikainenToimenpide NATURAL JOIN Toimenpide 
WHERE m��r�ttyID = 1;

SELECT LaiteID 
FROM Ontyyppi�
WHERE nimi = "Nosturi";

SELECT Huolto.Ty�tunnus, Huolto.rekisteriNum 
FROM (Toimenpide  
NATURAL JOIN KorjausToimenpide  
NATURAL JOIN Tehd�Korjaus) AS T 
JOIN Huolto ON T.HuoltoID = Huolto.HuoltoID 
WHERE Huolto.aloitusaika = "2022-05-14" AND T.aloitusaika > "14:00";

SELECT SUM(summa) AS TulotLaskuista, SUM(lis�maksu) AS TulotLis�maksuista 
FROM Lasku LEFT OUTER JOIN Maksumuistutus ON Lasku.LaskuID = Maksumuistutus.LaskuID 
WHERE er�p�iv� > "2022-01-01" AND er�p�iv� < "2023-01-01";

SELECT M.tyyppi 
FROM (Toimenpide NATURAL JOIN  
M��r�aikainenToimenpide NATURAL JOIN M��r�aikainen  
NATURAL JOIN Tehd�M��r�aikainen) AS M  
JOIN Huolto ON Huolto.HuoltoID = M.HuoltoID 
WHERE Huolto.HuoltoID = 3;

SELECT rekisteriNum, varaosanNimi, m��r�, Hinta, Hinta * M��r� AS KokonaisHinta 
FROM Huolto NATURAL JOIN Kuuluu NATURAL JOIN Varaosa;
 
SELECT rekisteriNum, aloitusaika, julianday(loppu) - julianday(aloitusaika) AS p�iv��Korjaamolla 
FROM Huolto NATURAL JOIN Ajoneuvo;

SELECT rekisteriNum, Hl�Tunnus, osoite, maksutiedot
FROM AjoneuvotJaOmistajat NATURAL JOIN Asiakas; 