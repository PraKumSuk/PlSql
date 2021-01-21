-- With error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5b`()
BEGIN
    SELECT p.price FROM products p; -- invalid | Error thrown here
    SELECT p.brand FROM products p; -- valid | Non executable statement
END //