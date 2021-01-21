-- Without error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5a`()
BEGIN
    SELECT p.title FROM products p; -- valid
    SELECT p.brand FROM products p; -- valid
END //