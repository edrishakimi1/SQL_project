--
-- File generated with SQLiteStudio v3.3.3 on la touko 7 15:36:57 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Ajoneuvo
CREATE TABLE Ajoneuvo (
    rekisteriNum TEXT NOT NULL,
    PRIMARY KEY (
        rekisteriNum
    )
);

INSERT INTO Ajoneuvo (
                         rekisteriNum
                     )
                     VALUES (
                         'ABC-123'
                     );

INSERT INTO Ajoneuvo (
                         rekisteriNum
                     )
                     VALUES (
                         'HJK-069'
                     );


-- Table: Asiakas
CREATE TABLE Asiakas (
    Hl�Tunnus   TEXT NOT NULL,
    nimi        TEXT,
    osoite      TEXT,
    maksutiedot TEXT,
    PRIMARY KEY (
        Hl�Tunnus
    )
);

INSERT INTO Asiakas (
                        Hl�Tunnus,
                        nimi,
                        osoite,
                        maksutiedot
                    )
                    VALUES (
                        '12011999A1234',
                        'Matias Kuusisto',
                        'J�mer�taival 5',
                        '1234 1242 9450 0323'
                    );

INSERT INTO Asiakas (
                        Hl�Tunnus,
                        nimi,
                        osoite,
                        maksutiedot
                    )
                    VALUES (
                        '23062002A2730',
                        'Matti Meik�l�inen',
                        'Albertinkatu 7',
                        '4320 0213 9322 1230'
                    );


-- Table: Huolto
CREATE TABLE Huolto (
    HuoltoID     INTEGER NOT NULL,
    TuojaID      INTEGER REFERENCES Asiakas (Hl�Tunnus),
    rekisteriNum TEXT    REFERENCES Ajoneuvo (RekisteriNum),
    Ty�tunnus    INTEGER REFERENCES Ty�ntekij� (Ty�tunnus),
    aloitusaika  DATE    NOT NULL,
    loppu        DATE,
    PRIMARY KEY (
        HuoltoID
    )
);

INSERT INTO Huolto (
                       HuoltoID,
                       TuojaID,
                       rekisteriNum,
                       Ty�tunnus,
                       aloitusaika,
                       loppu
                   )
                   VALUES (
                       1,
                       '12011999A1234',
                       'ABC-123',
                       1,
                       '2022-05-14',
                       '2022-05-16'
                   );

INSERT INTO Huolto (
                       HuoltoID,
                       TuojaID,
                       rekisteriNum,
                       Ty�tunnus,
                       aloitusaika,
                       loppu
                   )
                   VALUES (
                       2,
                       '23062002A2730',
                       'HJK-069',
                       2,
                       '2022-06-17',
                       '2022-06-21'
                   );

INSERT INTO Huolto (
                       HuoltoID,
                       TuojaID,
                       rekisteriNum,
                       Ty�tunnus,
                       aloitusaika,
                       loppu
                   )
                   VALUES (
                       3,
                       '12011999A1234',
                       'ABC-123',
                       1,
                       '2022-08-14',
                       '2022-08-16'
                   );

INSERT INTO Huolto (
                       HuoltoID,
                       TuojaID,
                       rekisteriNum,
                       Ty�tunnus,
                       aloitusaika,
                       loppu
                   )
                   VALUES (
                       4,
                       '23062002A2730',
                       'HJK-069',
                       2,
                       '2022-09-17',
                       '2022-09-21'
                   );


-- Table: Korjaus
CREATE TABLE Korjaus (
    korjausID     INTEGER NOT NULL,
    korjausTyyppi TEXT    DEFAULT �Tuntematon�,
    PRIMARY KEY (
        korjausID
    )
);

INSERT INTO Korjaus (
                        korjausID,
                        korjausTyyppi
                    )
                    VALUES (
                        1,
                        '�Tuntematon�'
                    );

INSERT INTO Korjaus (
                        korjausID,
                        korjausTyyppi
                    )
                    VALUES (
                        2,
                        'Jakohihnan vaihto'
                    );


-- Table: KorjausToimenpide
CREATE TABLE KorjausToimenpide (
    KorjausID  INTEGER NOT NULL,
    ToimintaID INTEGER NOT NULL,
    FOREIGN KEY (
        KorjausID
    )
    REFERENCES Korjaus (KorjausID),
    FOREIGN KEY (
        ToimintaID
    )
    REFERENCES Toimenpide (toimintaID),
    PRIMARY KEY (
        KorjausID,
        toimintaID
    )
);

INSERT INTO KorjausToimenpide (
                                  KorjausID,
                                  ToimintaID
                              )
                              VALUES (
                                  1,
                                  1
                              );


-- Table: Kuuluu
CREATE TABLE Kuuluu (
    VaraosaID INTEGER NOT NULL,
    HuoltoID  INTEGER NOT NULL,
    m��r�     INTEGER,
    FOREIGN KEY (
        VaraosaID
    )
    REFERENCES Varaosa (VaraosaID),
    FOREIGN KEY (
        HuoltoID
    )
    REFERENCES Huolto (HuoltoID),
    PRIMARY KEY (
        VaraosaID,
        HuoltoID
    )
);

INSERT INTO Kuuluu (
                       VaraosaID,
                       HuoltoID,
                       m��r�
                   )
                   VALUES (
                       1,
                       1,
                       1
                   );

INSERT INTO Kuuluu (
                       VaraosaID,
                       HuoltoID,
                       m��r�
                   )
                   VALUES (
                       2,
                       2,
                       5
                   );


-- Table: K�ytt��
CREATE TABLE K�ytt�� (
    HuoltoID INTEGER NOT NULL,
    LaiteID  INTEGER NOT NULL,
    FOREIGN KEY (
        LaiteID
    )
    REFERENCES Laitekappale (LaiteID),
    FOREIGN KEY (
        HuoltoID
    )
    REFERENCES Huolto (HuoltoID),
    PRIMARY KEY (
        LaiteID,
        HuoltoID
    )
);

INSERT INTO K�ytt�� (
                        HuoltoID,
                        LaiteID
                    )
                    VALUES (
                        1,
                        1
                    );

INSERT INTO K�ytt�� (
                        HuoltoID,
                        LaiteID
                    )
                    VALUES (
                        1,
                        2
                    );

INSERT INTO K�ytt�� (
                        HuoltoID,
                        LaiteID
                    )
                    VALUES (
                        2,
                        3
                    );

INSERT INTO K�ytt�� (
                        HuoltoID,
                        LaiteID
                    )
                    VALUES (
                        3,
                        1
                    );


-- Table: Laitekappale
CREATE TABLE Laitekappale (
    LaiteID INTEGER NOT NULL,
    PRIMARY KEY (
        LaiteID
    )
);

INSERT INTO Laitekappale (
                             LaiteID
                         )
                         VALUES (
                             1
                         );

INSERT INTO Laitekappale (
                             LaiteID
                         )
                         VALUES (
                             2
                         );

INSERT INTO Laitekappale (
                             LaiteID
                         )
                         VALUES (
                             3
                         );


-- Table: Laitetyyppi
CREATE TABLE Laitetyyppi (
    nimi TEXT NOT NULL,
    PRIMARY KEY (
        nimi
    )
);

INSERT INTO Laitetyyppi (
                            nimi
                        )
                        VALUES (
                            'Nosturi'
                        );

INSERT INTO Laitetyyppi (
                            nimi
                        )
                        VALUES (
                            'Saha'
                        );


-- Table: Lasku
CREATE TABLE Lasku (
    LaskuID   INTEGER NOT NULL,
    HuoltoID  INTEGER NOT NULL
                      REFERENCES Huolto (HuoltoID),
    maksajaID INTEGER REFERENCES Asiakas (Hl�Tunnus),
    summa     REAL,
    er�p�iv�  DATE,
    PRIMARY KEY (
        LaskuID
    )
);

INSERT INTO Lasku (
                      LaskuID,
                      HuoltoID,
                      maksajaID,
                      summa,
                      er�p�iv�
                  )
                  VALUES (
                      1,
                      1,
                      '12011999A1234',
                      200.0,
                      '2022-06-01'
                  );

INSERT INTO Lasku (
                      LaskuID,
                      HuoltoID,
                      maksajaID,
                      summa,
                      er�p�iv�
                  )
                  VALUES (
                      2,
                      2,
                      '23062002A2730',
                      50.0,
                      '2022-07-07'
                  );

INSERT INTO Lasku (
                      LaskuID,
                      HuoltoID,
                      maksajaID,
                      summa,
                      er�p�iv�
                  )
                  VALUES (
                      3,
                      3,
                      '12011999A1234',
                      100.0,
                      '2022-08-29'
                  );

INSERT INTO Lasku (
                      LaskuID,
                      HuoltoID,
                      maksajaID,
                      summa,
                      er�p�iv�
                  )
                  VALUES (
                      4,
                      4,
                      '23062002A2730',
                      NULL,
                      NULL
                  );


-- Table: Maksumuistutus
CREATE TABLE Maksumuistutus (
    LaskuID   INTEGER NOT NULL,
    l�hetetty DATE    NOT NULL,
    lis�maksu REAL    DEFAULT 5.0,
    FOREIGN KEY (
        LaskuID
    )
    REFERENCES Lasku (LaskuID),
    PRIMARY KEY (
        LaskuID,
        l�hetetty
    )
);

INSERT INTO Maksumuistutus (
                               LaskuID,
                               l�hetetty,
                               lis�maksu
                           )
                           VALUES (
                               1,
                               '2022-06-03',
                               25.0
                           );

INSERT INTO Maksumuistutus (
                               LaskuID,
                               l�hetetty,
                               lis�maksu
                           )
                           VALUES (
                               3,
                               '2022-09-03',
                               5.0
                           );


-- Table: M��r�aikainen
CREATE TABLE M��r�aikainen (
    m��r�ttyID   INTEGER NOT NULL,
    huoltoTyyppi TEXT    NOT NULL,
    PRIMARY KEY (
        m��r�ttyID
    )
);

INSERT INTO M��r�aikainen (
                              m��r�ttyID,
                              huoltoTyyppi
                          )
                          VALUES (
                              1,
                              '20000km huolto'
                          );

INSERT INTO M��r�aikainen (
                              m��r�ttyID,
                              huoltoTyyppi
                          )
                          VALUES (
                              2,
                              'Vaihdelaatikon �ljynvaihto'
                          );


-- Table: M��r�aikainenToimenpide
CREATE TABLE M��r�aikainenToimenpide (
    m��r�ttyID INTEGER NOT NULL,
    ToimintaID INTEGER NOT NULL,
    FOREIGN KEY (
        m��r�ttyID
    )
    REFERENCES M��r�aikainen (m��r�ttyID),
    FOREIGN KEY (
        ToimintaID
    )
    REFERENCES Toimenpide (toimintaID),
    PRIMARY KEY (
        m��r�ttyID,
        toimintaID
    )
);

INSERT INTO M��r�aikainenToimenpide (
                                        m��r�ttyID,
                                        ToimintaID
                                    )
                                    VALUES (
                                        1,
                                        2
                                    );

INSERT INTO M��r�aikainenToimenpide (
                                        m��r�ttyID,
                                        ToimintaID
                                    )
                                    VALUES (
                                        1,
                                        3
                                    );


-- Table: Omistaa
CREATE TABLE Omistaa (
    Hl�Tunnus    INTEGER NOT NULL,
    RekisteriNum TEXT    NOT NULL,
    FOREIGN KEY (
        Hl�Tunnus
    )
    REFERENCES Asiakas (Hl�Tunnus),
    FOREIGN KEY (
        RekisteriNum
    )
    REFERENCES Ajoneuvo (RekisteriNum),
    PRIMARY KEY (
        Hl�Tunnus,
        RekisteriNum
    )
);

INSERT INTO Omistaa (
                        Hl�Tunnus,
                        RekisteriNum
                    )
                    VALUES (
                        '12011999A1234',
                        'ABC-123'
                    );

INSERT INTO Omistaa (
                        Hl�Tunnus,
                        RekisteriNum
                    )
                    VALUES (
                        '23062002A2730',
                        'HJK-069'
                    );


-- Table: OnTyyppi�
CREATE TABLE OnTyyppi� (
    LaiteID INTEGER NOT NULL,
    nimi    INTEGER NOT NULL,
    FOREIGN KEY (
        LaiteID
    )
    REFERENCES Laitekappale (LaiteID),
    FOREIGN KEY (
        nimi
    )
    REFERENCES Laitetyyppi (nimi),
    PRIMARY KEY (
        LaiteID,
        nimi
    )
);

INSERT INTO OnTyyppi� (
                          LaiteID,
                          nimi
                      )
                      VALUES (
                          1,
                          'Nosturi'
                      );

INSERT INTO OnTyyppi� (
                          LaiteID,
                          nimi
                      )
                      VALUES (
                          2,
                          'Saha'
                      );

INSERT INTO OnTyyppi� (
                          LaiteID,
                          nimi
                      )
                      VALUES (
                          3,
                          'Nosturi'
                      );


-- Table: Poissaolo
CREATE TABLE Poissaolo (
    Ty�tunnus       INTEGER NOT NULL,
    Alku            DATE    NOT NULL,
    Loppu           DATE,
    Poissaolotyyppi TEXT,
    FOREIGN KEY (
        Ty�tunnus
    )
    REFERENCES Ty�ntekij� (Ty�tunnus),
    PRIMARY KEY (
        Ty�tunnus,
        Alku
    )
);

INSERT INTO Poissaolo (
                          Ty�tunnus,
                          Alku,
                          Loppu,
                          Poissaolotyyppi
                      )
                      VALUES (
                          1,
                          '2023-01-01',
                          '2023-02-01',
                          'Ibizalla rantsulla'
                      );


-- Table: Tarvitsee
CREATE TABLE Tarvitsee (
    toimintaID INTEGER NOT NULL,
    nimi       TEXT    NOT NULL,
    m��r�      INTEGER,
    FOREIGN KEY (
        toimintaID
    )
    REFERENCES Toimenpide (ToimintaID),
    FOREIGN KEY (
        nimi
    )
    REFERENCES Laitetyyppi (nimi),
    PRIMARY KEY (
        toimintaID,
        nimi
    )
);

INSERT INTO Tarvitsee (
                          toimintaID,
                          nimi,
                          m��r�
                      )
                      VALUES (
                          1,
                          'Saha',
                          1
                      );

INSERT INTO Tarvitsee (
                          toimintaID,
                          nimi,
                          m��r�
                      )
                      VALUES (
                          2,
                          'Nosturi',
                          1
                      );


-- Table: Tehd�Korjaus
CREATE TABLE Tehd�Korjaus (
    HuoltoID  INTEGER NOT NULL,
    KorjausID INTEGER NOT NULL,
    FOREIGN KEY (
        HuoltoID
    )
    REFERENCES Huolto (HuoltoID),
    FOREIGN KEY (
        KorjausID
    )
    REFERENCES Korjaus (KorjausID),
    PRIMARY KEY (
        HuoltoID,
        KorjausID
    )
);

INSERT INTO Tehd�Korjaus (
                             HuoltoID,
                             KorjausID
                         )
                         VALUES (
                             1,
                             1
                         );

INSERT INTO Tehd�Korjaus (
                             HuoltoID,
                             KorjausID
                         )
                         VALUES (
                             2,
                             2
                         );


-- Table: Tehd�M��r�aikainen
CREATE TABLE Tehd�M��r�aikainen (
    HuoltoID   INTEGER NOT NULL,
    M��r�ttyID INTEGER NOT NULL,
    FOREIGN KEY (
        HuoltoID
    )
    REFERENCES Huolto (HuoltoID),
    FOREIGN KEY (
        M��r�ttyID
    )
    REFERENCES M��r�aikainen (m��r�ttyID),
    PRIMARY KEY (
        HuoltoID,
        m��r�ttyID
    )
);

INSERT INTO Tehd�M��r�aikainen (
                                   HuoltoID,
                                   M��r�ttyID
                               )
                               VALUES (
                                   3,
                                   1
                               );

INSERT INTO Tehd�M��r�aikainen (
                                   HuoltoID,
                                   M��r�ttyID
                               )
                               VALUES (
                                   4,
                                   2
                               );


-- Table: Toimenpide
CREATE TABLE Toimenpide (
    toimintaID  INTEGER NOT NULL,
    tyyppi      TEXT,
    aloitusaika TIME,
    loppu       TIME,
    PRIMARY KEY (
        toimintaID
    )
);

INSERT INTO Toimenpide (
                           toimintaID,
                           tyyppi,
                           aloitusaika,
                           loppu
                       )
                       VALUES (
                           1,
                           '�ljynvaihto',
                           '15:00:00',
                           '16:00:00'
                       );

INSERT INTO Toimenpide (
                           toimintaID,
                           tyyppi,
                           aloitusaika,
                           loppu
                       )
                       VALUES (
                           2,
                           'Ruuvien kiristys',
                           '18:00:00',
                           '19:00:00'
                       );

INSERT INTO Toimenpide (
                           toimintaID,
                           tyyppi,
                           aloitusaika,
                           loppu
                       )
                       VALUES (
                           3,
                           'Renkaanvaihto',
                           '16:00:00',
                           '17:00:00'
                       );


-- Table: Ty�ntekij�
CREATE TABLE Ty�ntekij� (
    Ty�tunnus   INTEGER NOT NULL,
    puhelin     INTEGER,
    tuntipalkka INTEGER,
    PRIMARY KEY (
        Ty�tunnus
    )
);

INSERT INTO Ty�ntekij� (
                           Ty�tunnus,
                           puhelin,
                           tuntipalkka
                       )
                       VALUES (
                           1,
                           4012354313,
                           15
                       );

INSERT INTO Ty�ntekij� (
                           Ty�tunnus,
                           puhelin,
                           tuntipalkka
                       )
                       VALUES (
                           2,
                           5012395346,
                           25
                       );


-- Table: Varaosa
CREATE TABLE Varaosa (
    VaraosaID    INTEGER NOT NULL,
    varaosanNimi TEXT    NOT NULL,
    Hinta        INTEGER,
    PRIMARY KEY (
        VaraosaID
    )
);

INSERT INTO Varaosa (
                        VaraosaID,
                        varaosanNimi,
                        Hinta
                    )
                    VALUES (
                        1,
                        'Rengas',
                        100
                    );

INSERT INTO Varaosa (
                        VaraosaID,
                        varaosanNimi,
                        Hinta
                    )
                    VALUES (
                        2,
                        'Ruuvi',
                        3
                    );

INSERT INTO Varaosa (
                        VaraosaID,
                        varaosanNimi,
                        Hinta
                    )
                    VALUES (
                        3,
                        'Jakohihna',
                        500
                    );


-- Index: HuoltoIndex
CREATE INDEX HuoltoIndex ON Huolto (
    HuoltoID
);


-- Index: LaskuSummat
CREATE INDEX LaskuSummat ON Lasku (
    summa
);


-- View: AjoneuvotJaOmistajat
CREATE VIEW AjoneuvotJaOmistajat AS
    SELECT rekisteriNum,
           Hl�Tunnus
      FROM Ajoneuvo
           NATURAL JOIN
           Omistaa
           NATURAL JOIN
           Asiakas;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
