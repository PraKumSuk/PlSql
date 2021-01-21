-- Cursor and For procedure
DELIMITER //
CREATE PROCEDURE CursorAndForSample_SP4()
BEGIN
    DECLARE idValue VARCHAR(100);
    DECLARE titleValue VARCHAR(100);
    DECLARE brandValue VARCHAR(100);
    DECLARE cursor1 CURSOR FOR SELECT p.id, p.title, p.brand FROM products p;
    OPEN cursor1;
		my_first_loop: LOOP
			FETCH cursor1 into idValue, titleValue, brandValue;
			IF brandValue = 'Apple' THEN
                UPDATE products pr SET pr.brand = 'Nokia' where pr.id = idValue;
                commit;
			END IF;
		END LOOP;
    CLOSE cursor1;
END //
DELIMITER ;