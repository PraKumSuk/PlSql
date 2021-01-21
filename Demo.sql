-- Create Proc
DELIMITER //
CREATE PROCEDURE HelloWorldDemo1()
BEGIN
	DECLARE message VARCHAR(100);
	SET message="Hello HCLites";
	SELECT CONCAT(message,' ','Welcome Awesome Guys');
END //
DELIMITER ;