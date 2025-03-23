use eshop;

--
-- insert
--
DELETE FROM `produkt_till_lager`;
DELETE FROM `produkt_till_kategori`;
DELETE FROM `lager`;
DELETE FROM `kategori`;
DELETE FROM `produkt`;
DELETE FROM `order`;
DELETE FROM `faktura`;
DELETE FROM `kund`;

LOAD DATA LOCAL INFILE 'kund.csv'
INTO TABLE kund
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

INSERT INTO `faktura`(fakturanummer) VALUES
    ('fak1'),
    ('fak2'),
    ('fak3'),
    ('fak4'),
    ('fak5')
;

INSERT INTO `order`(produktkod, antal, kund_id, faktura_id) VALUES
    ('kaffe1', 4, 'kund1', 'fak1'),
    ('kaffe2', 12, 'kund2', 'fak2'),
    ('te1', 6, 'kund3', 'fak3'),
    ('te2', 15, 'kund4', 'fak4'),
    ('2-in-1', 8, 'kund5', 'fak5')
;

LOAD DATA LOCAL INFILE 'produkt.csv'
INTO TABLE produkt
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(produktkod, namn, beskrivning, pris)
;

LOAD DATA LOCAL INFILE 'kategori.csv'
INTO TABLE kategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

LOAD DATA LOCAL INFILE 'lager.csv'
INTO TABLE lager
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

INSERT INTO `order_till_produkt` (antal, order_id, produkt_id) VALUES
(4, 1, 'kaffe1'),
(12, 2, 'kaffe2'),
(6, 3, 'te1'),
(15, 4, 'te2'),
(8, 5, '2-in-1')
;

INSERT INTO `produkt_till_kategori` (produkt_id, kategori_id) VALUES
('kaffe1', 'Kaffe'), ('kaffe1', 'Mugg'),
('kaffe2', 'Kaffe'), ('kaffe2', 'Förbrukning'),
('te1', 'Te'), ('te1', 'Mugg'),
('te2', 'Te'), ('te2', 'Förbrukning'),
('2-in-1', 'Kaffe'), ('2-in-1', 'Te'),
('2-in-1', 'Förbrukning'), ('2-in-1', 'Special')
;

INSERT INTO `produkt_till_lager` (antal, produkt_id, lager_id) VALUES
(20, 'kaffe1', 'K1'),
(25, 'kaffe2', 'K1'),
(30, 'te1', 'T1'),
(35, 'te2', 'T1'),
(40, '2-in-1', 'K1')
;

--
-- update på databasen för att få grundstruktur
--

--uppdatera
UPDATE `order`
SET
    `antal` = 14
WHERE
    `ordernummer` = 2
;

-- raderad
UPDATE `order`
SET
    `raderades` = CURRENT_TIMESTAMP
WHERE
    `ordernummer` = 3
;

-- beställd
UPDATE `order`
SET
    `beställdes` = CURRENT_TIMESTAMP
WHERE
    `ordernummer` IN (4, 5)
;

-- skickad
UPDATE `order`
SET
    `skickades` = CURRENT_TIMESTAMP
WHERE
    `ordernummer` = 5
;

--
-- check
--

-- översikt kundregister
SELECT * FROM kund;

-- översikt vilka produkter som finns samt pris
SELECT * FROM produkt;

-- översikt vilka kategorier som finns
SELECT * FROM kategori;

-- översikt vilka hyllor som finns på lagret
SELECT * FROM lager;

-- översikt kopplingstabell mellan order och produkt
SELECT * FROM order_till_produkt;

-- översikt kopplingstabell mellan produkt och kategori
SELECT * FROM produkt_till_kategori;

-- översikt kopplingstabell mellan produkt och lager
SELECT * FROM produkt_till_lager;

-- översikt på vilken kategori produkterna tillhör
SELECT
    p.produktkod,
    p.namn,
    GROUP_CONCAT(k.kategori) AS kategori
FROM `produkt` AS p
    JOIN `produkt_till_kategori` AS ptk
        ON p.produktkod = ptk.produkt_id
    JOIN `kategori` AS k
        ON k.kategori = ptk.kategori_id
GROUP BY p.produktkod
;

-- översikt på var produkten återfinns och antalet som finns i lager
SELECT
    l.hylla,
    l.beskrivning,
    ptl.antal,
    p.namn
FROM `produkt_till_lager` AS ptl
    JOIN `lager` AS l
        ON ptl.lager_id = l.hylla
    JOIN `produkt` AS p
        ON p.produktkod = ptl.produkt_id
ORDER BY ptl.antal
;

-- översikt på om något skett i produkttabellen (triggas vid update eller insert)
SELECT * FROM logg;

-- översikt för status på order
SELECT
    ordernummer,
    IF(`skapades` IS NOT NULL, 'skapad', '') AS skapa,
    IF(`uppdaterades` IS NOT NULL, 'uppdaterad', '') AS uppdatera,
    IF(`raderades` IS NOT NULL, 'raderad', '') AS radera,
    IF(`beställdes` IS NOT NULL, 'beställd', '') AS beställa,
    IF(`skickades` IS NOT NULL, 'skickad', '') AS skicka
FROM `order`
;

-- översikt order
SELECT * FROM `order`;

-- översikt för status på order (lättläst)
SELECT 
    ordernummer,
    order_status(skapades, uppdaterades, raderades, beställdes, skickades) AS 'status'
FROM `order`
;
