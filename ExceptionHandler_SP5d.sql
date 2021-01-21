-- Handling error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5d`()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
    BEGIN 
        GET DIAGNOSTICS CONDITION 1 @errorState = RETURNED_SQLSTATE, @errorMessage = MESSAGE_TEXT;
        SELECT CONCAT(@errorState, ':', @errorMessage);
    END;
    SELECT p.price FROM products p; -- invalid | Going to throw error | Catch error | Continue
    SELECT p.brand FROM products p; -- valid
END //