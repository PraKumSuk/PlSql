DELIMITER //  
CREATE FUNCTION GetProductFeature_F1(brand varchar(100)  )   
RETURNS VARCHAR(20)  
DETERMINISTIC  
BEGIN  
    DECLARE distinguishedFeature VARCHAR(20);  
    IF brand = 'Oppo' THEN  
        SET distinguishedFeature = 'Nice Camera';  
    ELSEIF brand = 'Nokia' THEN  
        SET distinguishedFeature = 'Reliable';  
    ELSEIF brand = 'Apple' THEN  
        SET distinguishedFeature = 'Performance';  
    END IF;   
    RETURN (distinguishedFeature);  
END//  
DELIMITER ;  