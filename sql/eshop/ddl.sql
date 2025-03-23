use eshop;

DROP TABLE IF EXISTS `produkt_till_kategori`;
DROP TABLE IF EXISTS `produkt_till_lager`;
DROP TABLE IF EXISTS `order_till_produkt`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `produkt`;
DROP TABLE IF EXISTS `kund`;
DROP TABLE IF EXISTS `faktura`;
DROP TABLE IF EXISTS `kategori`;
DROP TABLE IF EXISTS `lager`;
DROP TABLE IF EXISTS `logg`;

--
-- create tables
--
CREATE TABLE `logg`
(
    `id` INT AUTO_INCREMENT NOT NULL,
    `händelse` VARCHAR(80),
    `datum` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`)
);

CREATE TABLE `lager`
(
    `hylla` CHAR(2),
    `beskrivning` VARCHAR(80),

    PRIMARY KEY (`hylla`)
);

CREATE TABLE `kategori`
(
    `kategori` VARCHAR(80),

    PRIMARY KEY (`kategori`)
);

CREATE TABLE `faktura`
(
    `fakturanummer` VARCHAR(80),
    `pris` INT DEFAULT NULL,
    `summa` INT DEFAULT NULL,

    PRIMARY KEY (`fakturanummer`)
);

CREATE TABLE `kund`
(
    `kundnummer` VARCHAR(80),
    `namn` VARCHAR(80),
    `stad` VARCHAR(80),
    `telefon` VARCHAR(80),

    PRIMARY KEY (`kundnummer`),
    UNIQUE KEY `namn_unique` (`namn`)
);

CREATE TABLE `produkt`
(
    `produktkod` VARCHAR(80),
    `namn` VARCHAR(80),
    `beskrivning` VARCHAR(80),
    `pris` INT,

    PRIMARY KEY (`produktkod`),
    UNIQUE KEY `namn_unique` (`namn`)
);

CREATE TABLE `order`
(
    `ordernummer` INT AUTO_INCREMENT NOT NULL,
    `produktkod` VARCHAR(80) DEFAULT NULL,
    `antal` INT DEFAULT NULL,
    `kund_id` VARCHAR(80),
    `faktura_id` VARCHAR(80) DEFAULT NULL,
    `skapades` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `uppdaterades`TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `raderades` TIMESTAMP NULL,
    `beställdes` TIMESTAMP NULL,
    `skickades` TIMESTAMP NULL,

    PRIMARY KEY (`ordernummer`),
    FOREIGN KEY (`kund_id`) REFERENCES `kund` (`kundnummer`),
    FOREIGN KEY (`faktura_id`) REFERENCES `faktura` (`fakturanummer`)
);

CREATE TABLE `order_till_produkt`
(
    `id` INT AUTO_INCREMENT NOT NULL,
    `order_id` INT NOT NULL,
    `produkt_id` VARCHAR(80),
    `antal` INT,

    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `order` (`ordernummer`),
    FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktkod`)
);

CREATE TABLE `produkt_till_lager`
(
    `id` INT AUTO_INCREMENT NOT NULL,
    `antal` INT DEFAULT NULL,
    `produkt_id` VARCHAR(80),
    `lager_id` CHAR(2),

    PRIMARY KEY (`id`),
    FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktkod`),
    FOREIGN KEY (`lager_id`) REFERENCES `lager` (`hylla`)
);

CREATE TABLE `produkt_till_kategori`
(
    `id` INT AUTO_INCREMENT NOT NULL,
    `produkt_id` VARCHAR(80),
    `kategori_id` VARCHAR(80),

    PRIMARY KEY (`id`),
    FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`produktkod`),
    FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori`)
);

-- check
SHOW TABLES;
