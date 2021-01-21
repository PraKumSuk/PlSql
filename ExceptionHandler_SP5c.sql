-- With error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5c`()
BEGIN
    SELECT p.brand FROM products p; -- valid
    SELECT p.price FROM products p; -- invalid | Error thrown here | No more statements to execute
END //