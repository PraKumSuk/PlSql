-- Create Proc
DELIMITER //
CREATE PROCEDURE ConditionalSamplesIf_SP3()
BEGIN
    DECLARE titleValue VARCHAR(100);
    DECLARE message VARCHAR(100);
    SET message = 'This is ';
    
    select p.title into titleValue from products p where p.id = 3;
    
    IF titleValue = 'Mobile' THEN
        SELECT CONCAT(message,' ','telecom product');
	else
		SELECT CONCAT(message,' ','someother product');
    END IF;
  
END //
DELIMITER ;