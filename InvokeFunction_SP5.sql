DELIMITER //
CREATE PROCEDURE InvokeFunction_SP5()
BEGIN
	DECLARE distinguishedFeature VARCHAR(100);
    DECLARE brandValue VARCHAR(100);
	SET distinguishedFeature = "The feature for ";
    select p.brand into brandValue from products p where p.id = 5;
    SELECT CONCAT(distinguishedFeature,' ',GetProductFeature_F1(brandValue));
END //
DELIMITER ;