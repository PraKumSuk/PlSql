
    
DELIMITER //

CREATE PROCEDURE HelloWorld_SP1()
BEGIN
	DECLARE message VARCHAR(100);
	SET message="Hello HCLites";
	SELECT CONCAT(message,' ','Welcome to PLSQL');
END //

DELIMITER ;