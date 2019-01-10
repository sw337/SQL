USE classicmodels;

DELIMITER $$

CREATE PROCEDURE do_something()

BEGIN

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET @do_rollback := 1;

SET autocommit = 0;
SET @do_rollback := 0;



START TRANSACTION;

SELECT @orderNumber := MAX(orderNumber) FROM orders;

SET @orderNumber = @orderNumber  + 1;
 
INSERT INTO orders(orderNumber, orderDate, requiredDate, shippedDate, status, customerNumber)
VALUES(@orderNumber, now(), date_add(now(), INTERVAL 5 DAY), 
       date_add(now(), INTERVAL 2 DAY), 'In Process', 145);

INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES(@orderNumber,'S18_1749', 30, '136', 1),
      (@orderNumber,'S18_2248', 50, '55.09', 2); 

COMMIT;       
 
IF (@do_rollback = 1) THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END $$


