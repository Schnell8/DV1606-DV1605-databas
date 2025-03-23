use eshop;

--
-- Function for getting status on order.
--
DROP FUNCTION IF EXISTS order_status;
DELIMITER ;;

CREATE FUNCTION order_status(
    skapad VARCHAR(80),
    uppdaterad VARCHAR(80),
    raderad VARCHAR(80),
    beställd VARCHAR(80),
    skickad VARCHAR(80)
)
RETURNS CHAR(20)
DETERMINISTIC
BEGIN
    IF raderad IS NOT NULL THEN
        RETURN 'raderad';
    ELSEIF skickad IS NOT NULL THEN
        RETURN 'skickad';
    ELSEIF beställd IS NOT NULL THEN
        RETURN 'beställd';
    ELSEIF uppdaterad IS NOT NULL THEN
        RETURN 'uppdaterad';
    ELSEIF skapad IS NOT NULL THEN
        RETURN 'skapad';
    END IF;
    RETURN "Can't find order status";
END
;;

DELIMITER ;

--
-- Function for getting date on order.
--
DROP FUNCTION IF EXISTS order_date;
DELIMITER ;;

CREATE FUNCTION order_date(
    skapad VARCHAR(80),
    uppdaterad VARCHAR(80)
)
RETURNS CHAR(20)
DETERMINISTIC
BEGIN
    IF uppdaterad IS NOT NULL THEN
        RETURN uppdaterad;
    END IF;
    RETURN skapad;
END
;;

DELIMITER ;

--
-- Function for getting messsage if antal is bigger than lagersaldo
--
DROP FUNCTION IF EXISTS func_lager;
DELIMITER ;;

CREATE FUNCTION func_lager(
    antal INT,
    lagersaldo INT
)
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
    IF antal > lagersaldo THEN
        RETURN 'OBS! Antal överstiger lagersaldo';
    END IF;
    RETURN "Ok";
END
;;

DELIMITER ;

-- skapa vy som visar produkttabellen + antal och kategori
DROP VIEW IF EXISTS v_produktinfo;
CREATE VIEW v_produktinfo
AS
SELECT
    p.produktkod,
    p.namn,
    p.beskrivning,
    p.pris,
    ptl.antal,
    GROUP_CONCAT(k.kategori) AS kategori
FROM `produkt` AS p
    JOIN `produkt_till_lager` AS ptl
        ON ptl.produkt_id = p.produktkod
    JOIN `produkt_till_kategori` AS ptk
        ON p.produktkod = ptk.produkt_id
    JOIN `kategori` AS k
        ON k.kategori = ptk.kategori_id
GROUP BY p.produktkod
;

-- skapa vy som visar lagret med produkter
DROP VIEW IF EXISTS v_inv;
CREATE VIEW v_inv
AS
SELECT
    p.produktkod,
    p.namn,
    l.hylla,
    ptl.antal
FROM `produkt_till_lager` AS ptl
    JOIN `lager` AS l
        ON ptl.lager_id = l.hylla
    JOIN `produkt` AS p
        ON p.produktkod = ptl.produkt_id
;

-- skapa vy som visar plocklista
DROP VIEW IF EXISTS v_plocklista;
CREATE VIEW v_plocklista
AS
SELECT
    otp.order_id AS 'ordernummer',
    otp.produkt_id AS 'produktkod',
    otp.antal,
    l.hylla,
    l.beskrivning,
    ptl.antal AS 'lagersaldo'
FROM `order_till_produkt` AS otp
    JOIN `produkt` AS p
        ON p.produktkod = otp.produkt_id
    JOIN `produkt_till_lager` AS ptl
        ON ptl.produkt_id = p.produktkod
    JOIN `lager` AS l
        ON l.hylla = ptl.lager_id
;

-- Create procedure for select kategori from kategori
DROP PROCEDURE IF EXISTS show_categories;
DELIMITER ;;
CREATE PROCEDURE show_categories()
BEGIN
    SELECT * 
    FROM kategori
    ;
END
;;
DELIMITER ;

-- Create procedure for select * from product
DROP PROCEDURE IF EXISTS show_products;
DELIMITER ;;
CREATE PROCEDURE show_products()
BEGIN
    SELECT * FROM v_produktinfo
    ;
END
;;
DELIMITER ;

--
-- Create procedure for show single product details
--
DROP PROCEDURE IF EXISTS show_single_product;
DELIMITER ;;
CREATE PROCEDURE show_single_product(
    a_produktkod VARCHAR(80)
)
BEGIN
    SELECT * FROM v_produktinfo
    WHERE produktkod = a_produktkod
    GROUP BY produktkod
    ;
END
;;
DELIMITER ;

--
-- Create procedure for insert into produkt
--
DROP PROCEDURE IF EXISTS create_product;
DELIMITER ;;
CREATE PROCEDURE create_product(
    a_produktkod VARCHAR(80),
    a_namn VARCHAR(80),
    a_beskrivning VARCHAR(80),
    a_pris INT,
    a_antal INT,
    a_kategori VARCHAR (80)
)
BEGIN
    INSERT INTO produkt (produktkod, namn, beskrivning, pris)
        VALUES (a_produktkod, a_namn, a_beskrivning, a_pris);
    INSERT INTO produkt_till_lager (produkt_id, antal)
        VALUES (a_produktkod, a_antal);
    INSERT INTO kategori (kategori)
        VALUES (a_kategori);
    INSERT INTO produkt_till_kategori (produkt_id, kategori_id)
        VALUES (a_produktkod, a_kategori);
END
;;
DELIMITER ;

--
-- Create procedure for delete product
--
DROP PROCEDURE IF EXISTS delete_product;
DELIMITER ;;
CREATE PROCEDURE delete_product(
    a_produktkod VARCHAR(80)
)
BEGIN
    DELETE FROM produkt_till_kategori
    WHERE
        `produkt_id` = a_produktkod;
    DELETE FROM produkt_till_lager
    WHERE
        `produkt_id` = a_produktkod;
    DELETE FROM produkt
    WHERE
        `produktkod` = a_produktkod;
END
;;
DELIMITER ;

--
-- Create procedure for edit account details
--
DROP PROCEDURE IF EXISTS edit_product;
DELIMITER ;;
CREATE PROCEDURE edit_product(
    a_produktkod VARCHAR(80),
    a_namn VARCHAR(80),
    a_beskrivning VARCHAR(80),
    a_pris INT
)
BEGIN
    UPDATE produkt SET
        `namn` = a_namn,
        `beskrivning` = a_beskrivning,
        `pris` = a_pris
    WHERE
        `produktkod` = a_produktkod
    ;
END
;;
DELIMITER ;

--
-- Create procedure for showing log table
--
DROP PROCEDURE IF EXISTS show_log;
DELIMITER ;;
CREATE PROCEDURE show_log(
    a_number INT
)
BEGIN
    SELECT *
    FROM logg
    ORDER BY id DESC
    LIMIT a_number
    ;
END
;;
DELIMITER ;

--
-- Create procedure showing shelfs in inventory
--
DROP PROCEDURE IF EXISTS show_shelfs;
DELIMITER ;;
CREATE PROCEDURE show_shelfs(
)
BEGIN
    SELECT *
    FROM lager
    ;
END
;;
DELIMITER ;

--
-- Create procedure showing location of products in inventory
--
DROP PROCEDURE IF EXISTS show_inv;
DELIMITER ;;
CREATE PROCEDURE show_inv(
)
BEGIN
    SELECT *
    FROM v_inv
    ORDER BY hylla
    ;
END
;;
DELIMITER ;

--
-- Create procedure for searching in inventory
--
DROP PROCEDURE IF EXISTS search_inv;
DELIMITER ;;
CREATE PROCEDURE search_inv(
    a_input VARCHAR(80)
)
BEGIN
    SELECT *
    FROM v_inv
    WHERE
        produktkod LIKE CONCAT('%', a_input, '%')
        OR namn LIKE CONCAT('%', a_input, '%')
        OR hylla LIKE CONCAT('%', a_input, '%')
    ORDER BY hylla
    ;
END
;;
DELIMITER ;

--
-- Create procedure to add to inventory
--
DROP PROCEDURE IF EXISTS inv_add;
DELIMITER ;;
CREATE PROCEDURE inv_add(
    a_produktkod VARCHAR(80),
    a_hylla CHAR(2),
    a_antal INT
)
BEGIN
    INSERT INTO produkt_till_lager (produkt_id, lager_id, antal)
        VALUES (a_produktkod, a_hylla, a_antal)
            ON DUPLICATE KEY UPDATE antal = antal + a_antal
    ;
END
;;
DELIMITER ;

--
-- Create procedure to remove from inventory
--
DROP PROCEDURE IF EXISTS inv_del;
DELIMITER ;;
CREATE PROCEDURE inv_del(
    a_produktkod VARCHAR(80),
    a_hylla CHAR(2),
    a_antal INT
)
BEGIN
    DECLARE produkt_antal INT;
    SET produkt_antal = (SELECT antal FROM produkt_till_lager WHERE produkt_id = a_produktkod AND lager_id = a_hylla);

    IF produkt_antal - a_antal > 0 THEN
        UPDATE produkt_till_lager SET
            antal = antal - a_antal
        WHERE
            (produkt_id = a_produktkod AND lager_id = a_hylla)
        ;
    ELSE
        DELETE FROM produkt_till_lager 
        WHERE
            (produkt_id = a_produktkod AND lager_id = a_hylla)
        ;
    END IF;
END
;;
DELIMITER ;

--
-- ESHOP DEL 2
--

-- Create procedure for select * from kund
DROP PROCEDURE IF EXISTS show_customers;
DELIMITER ;;
CREATE PROCEDURE show_customers()
BEGIN
    SELECT * 
    FROM kund
    ;
END
;;
DELIMITER ;

--
-- Create procedure for show single customer
--
DROP PROCEDURE IF EXISTS show_single_customer;
DELIMITER ;;
CREATE PROCEDURE show_single_customer(
    a_kundnummer VARCHAR(80)
)
BEGIN
    SELECT * FROM kund
    WHERE kundnummer = a_kundnummer
    ;
END
;;
DELIMITER ;

-- Create procedure for select details from order
DROP PROCEDURE IF EXISTS show_orders;
DELIMITER ;;
CREATE PROCEDURE show_orders()
BEGIN
    SELECT
        o.ordernummer,
        order_date(o.skapades, o.uppdaterades) AS 'datum',
        o.kund_id AS kundnummer,
        COUNT(otp.produkt_id) AS orderrader,
        order_status(o.skapades, o.uppdaterades, o.raderades, o.beställdes, o.skickades) AS 'status'
    FROM `order` AS o
        LEFT JOIN `order_till_produkt` AS otp
            ON otp.order_id = o.ordernummer
    GROUP BY 
        o.ordernummer
    ;
END
;;
DELIMITER ;

--
-- Create procedure for show single order
--
DROP PROCEDURE IF EXISTS show_single_order;
DELIMITER ;;
CREATE PROCEDURE show_single_order(
    a_order_id VARCHAR(80)
)
BEGIN
    SELECT
        o.ordernummer,
        order_status(o.skapades, o.uppdaterades, o.raderades, o.beställdes, o.skickades) AS 'status',
        otp.produkt_id,
        p.namn,
        otp.antal,
        p.pris,
        (p.pris * otp.antal) AS 'summa'
    FROM `order` AS o
        JOIN `order_till_produkt` AS otp
            ON otp.order_id = o.ordernummer
        JOIN `produkt` AS p
            ON p.produktkod = otp.produkt_id
    WHERE
        order_id = a_order_id
    GROUP BY 
        otp.produkt_id
    ;
END
;;
DELIMITER ;

--
-- Create procedure for insert into order
--
DROP PROCEDURE IF EXISTS create_order;
DELIMITER ;;
CREATE PROCEDURE create_order(
    a_kund_id VARCHAR(80)
)
BEGIN
    INSERT INTO `order` (kund_id)
        VALUES (a_kund_id)
    ;
END
;;
DELIMITER ;

--
-- Create procedure to add products to order
--
DROP PROCEDURE IF EXISTS add_to_order;
DELIMITER ;;
CREATE PROCEDURE add_to_order(
    a_order_id INT,
    a_produkt_id VARCHAR(80),
    a_antal INT
)
BEGIN
    DECLARE product_in_order INT;
    SET product_in_order = (SELECT EXISTS(
        SELECT *
        FROM v_plocklista
        WHERE
            (ordernummer = a_order_id AND produktkod = a_produkt_id))
        );
    IF product_in_order = 1 THEN
        UPDATE order_till_produkt SET
            antal = antal + a_antal
        WHERE 
            (order_id = a_order_id AND produkt_id = a_produkt_id)
    ;
    ELSEIF product_in_order = 0 THEN
        INSERT INTO order_till_produkt (order_id, produkt_id, antal)
            VALUES (a_order_id, a_produkt_id, a_antal)
    ;
    END IF;
END
;;
DELIMITER ;

--
-- Create procedure to order the order
--
DROP PROCEDURE IF EXISTS bestall_order;
DELIMITER ;;
CREATE PROCEDURE bestall_order(
    a_ordernummer INT
)
BEGIN
    UPDATE `order` SET
        `beställdes` = CURRENT_TIMESTAMP
    WHERE
        (ordernummer = a_ordernummer)
    ;
END
;;
DELIMITER ;

--
-- Create procedure for order page
--
DROP PROCEDURE IF EXISTS order_add_page;
DELIMITER ;;
CREATE PROCEDURE order_add_page(
    a_ordernummer INT
)
BEGIN
    SELECT
        ordernummer
    FROM `order`
    WHERE
        (ordernummer = a_ordernummer)
    ;
END
;;
DELIMITER ;

--
-- Create procedure searching for orders
--
DROP PROCEDURE IF EXISTS search_order;
DELIMITER ;;
CREATE PROCEDURE search_order(
    a_input VARCHAR(80)
)
BEGIN
    SELECT
        o.ordernummer,
        order_date(o.skapades, o.uppdaterades) AS 'datum',
        o.kund_id AS kundnummer,
        COUNT(otp.produkt_id) AS orderrader,
        order_status(o.skapades, o.uppdaterades, o.raderades, o.beställdes, o.skickades) AS 'status'
    FROM `order` AS o
        JOIN `order_till_produkt` AS otp
            ON otp.order_id = o.ordernummer
        JOIN `produkt` AS p
            ON p.produktkod = otp.produkt_id
    WHERE
        o.ordernummer LIKE CONCAT('%', a_input, '%')
        OR o.kund_id LIKE CONCAT('%', a_input, '%')
    GROUP BY 
        o.ordernummer
    ;
END
;;
DELIMITER ;

--
-- Create procedure for "plocklista"
--
DROP PROCEDURE IF EXISTS pick_list;
DELIMITER ;;
CREATE PROCEDURE pick_list(
    a_ordernummer INT
)
BEGIN
    SELECT
        *,
        func_lager(antal, lagersaldo) AS 'meddelande'
    FROM
        v_plocklista
    WHERE
        ordernummer = a_ordernummer
    GROUP BY 
        produktkod
    ;
END
;;
DELIMITER ;

--
-- Create procedure to ship the order
--
DROP PROCEDURE IF EXISTS ship_order;
DELIMITER ;;
CREATE PROCEDURE ship_order(
    a_ordernummer INT
)
BEGIN
    UPDATE `order` SET
        `skickades` = CURRENT_TIMESTAMP
    WHERE
        (ordernummer = a_ordernummer)
    ;
END
;;
DELIMITER ;