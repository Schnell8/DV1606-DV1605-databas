use eshop;

--
-- triggers
--
DROP TRIGGER IF EXISTS logg_produkt_update;
DROP TRIGGER IF EXISTS logg_produkt_insert;

-- trigger som loggar om en produkt uppdaterats
CREATE TRIGGER `logg_produkt_update`
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO `logg` (händelse) VALUES
    (CONCAT('Produkt med produktkod "', NEW.produktkod, '" uppdaterades'))
;

-- trigger som loggar om en ny produkt läggs till
CREATE TRIGGER `logg_produkt_insert`
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO `logg` (händelse) VALUES
    (CONCAT('Produkt med produktkod "', NEW.produktkod, '" lades till'))
;
