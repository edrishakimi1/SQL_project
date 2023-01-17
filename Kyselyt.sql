SELECT VaraosaID 
FROM Varaosa 
WHERE Hinta < 10;

SELECT LaskuID, summa, maksajaID, nimi  
FROM Lasku, Asiakas 
WHERE eräpäivä = "2022-06-01" AND summa > 100 AND maksajaID = HlöTunnus;

SELECT korjausTyyppi  
FROM Korjaus  
WHERE korjausID = 2;
 
SELECT puhelin, Poissaolotyyppi 
FROM Työntekijä, Poissaolo 
WHERE tuntipalkka > 12 AND Työntekijä.Työtunnus = Poissaolo.Työtunnus;

SELECT TuojaID, nimi, maksutiedot  
FROM Huolto, Asiakas 
WHERE aloitusaika > "2022-07-01" AND TuojaID = HlöTunnus;
 
SELECT RekisteriNum  
FROM Omistaa  
WHERE HlöTunnus = "12011999A1234";

SELECT HuoltoID, Määräaikainen.MäärättyID  
FROM TehdäMääräaikainen, Määräaikainen 
WHERE TehdäMääräaikainen.MäärättyID = Määräaikainen.määrättyID AND HuoltoTyyppi = "20000km huolto";

SELECT määrättyID, tyyppi  
FROM MääräaikainenToimenpide NATURAL JOIN Toimenpide 
WHERE määrättyID = 1;

SELECT LaiteID 
FROM Ontyyppiä
WHERE nimi = "Nosturi";

SELECT Huolto.Työtunnus, Huolto.rekisteriNum 
FROM (Toimenpide  
NATURAL JOIN KorjausToimenpide  
NATURAL JOIN TehdäKorjaus) AS T 
JOIN Huolto ON T.HuoltoID = Huolto.HuoltoID 
WHERE Huolto.aloitusaika = "2022-05-14" AND T.aloitusaika > "14:00";

SELECT SUM(summa) AS TulotLaskuista, SUM(lisämaksu) AS TulotLisämaksuista 
FROM Lasku LEFT OUTER JOIN Maksumuistutus ON Lasku.LaskuID = Maksumuistutus.LaskuID 
WHERE eräpäivä > "2022-01-01" AND eräpäivä < "2023-01-01";

SELECT M.tyyppi 
FROM (Toimenpide NATURAL JOIN  
MääräaikainenToimenpide NATURAL JOIN Määräaikainen  
NATURAL JOIN TehdäMääräaikainen) AS M  
JOIN Huolto ON Huolto.HuoltoID = M.HuoltoID 
WHERE Huolto.HuoltoID = 3;

SELECT rekisteriNum, varaosanNimi, määrä, Hinta, Hinta * Määrä AS KokonaisHinta 
FROM Huolto NATURAL JOIN Kuuluu NATURAL JOIN Varaosa;
 
SELECT rekisteriNum, aloitusaika, julianday(loppu) - julianday(aloitusaika) AS päivääKorjaamolla 
FROM Huolto NATURAL JOIN Ajoneuvo;

SELECT rekisteriNum, HlöTunnus, osoite, maksutiedot
FROM AjoneuvotJaOmistajat NATURAL JOIN Asiakas; 