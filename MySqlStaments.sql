-- Create table
create table products(
   id INT NOT NULL AUTO_INCREMENT,
   title VARCHAR(100) NOT NULL,
   brand VARCHAR(40) NOT NULL,
   description VARCHAR(200),
   manufacture_date DATE,
   PRIMARY KEY ( id )
);

INSERT INTO `spk_db01a`.`products`
(`title`,
`brand`,
`description`,
`manufacture_date`)
VALUES
('Mobile Phone',
'Samsung',
'4G Mobile Phone',
curdate());

commit;

SELECT * FROM spk_db01a.products;

-- Create Proc
DELIMITER //
CREATE PROCEDURE HelloWorld_SP1()
BEGIN
	DECLARE message VARCHAR(100);
	SET message="Hello HCLites";
	SELECT CONCAT(message,' ','Welcome to PLSQL');
END //
DELIMITER ;

-- Call Proc
call HelloWorld_SP1();

-- Call Proc
call GetAllProducts_SP2()

================

-- Create a View
CREATE VIEW products_v (id , title) AS
    SELECT 
        p.id, p.title
    FROM
        products p;

-- Read from a view        
select * from products_v;

================================


-- If condition
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


===================================

-- Insert Statement
INSERT INTO `spk_db01a`.`products`
(`title`,
`brand`,
`description`,
`manufacture_date`)
VALUES
('Mobile Phone',
'Apple',
'3G Mobile Phone',
curdate());
commit;



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

======================================

--Create Function
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
    ELSEIF brand = 'Samsung' THEN  
        SET distinguishedFeature = 'Reliable'; 
    ELSEIF brand = 'Huawei' THEN  
        SET distinguishedFeature = 'Performance';
    ELSEIF brand = 'Apple' THEN  
        SET distinguishedFeature = 'Performance';  
    END IF;   
    RETURN (distinguishedFeature);  
END//  
DELIMITER ;    

-- Proc that invokes a function
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

======================================

-- Without error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5a`()
BEGIN
    SELECT p.title FROM products p; -- valid
    SELECT p.brand FROM products p; -- valid
END //

-- With error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5b`()
BEGIN
    SELECT p.price FROM products p; -- invalid | Error thrown here
    SELECT p.brand FROM products p; -- valid | Non executable statement
END //

-- With error
DELIMITER //
CREATE PROCEDURE `ExceptionHandler_SP5c`()
BEGIN
    SELECT p.brand FROM products p; -- valid
    SELECT p.price FROM products p; -- invalid | Error thrown here | No more statements to execute
END //

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

================

-- Create a View
CREATE VIEW products_v (id , title) AS
    SELECT 
        p.id, p.title
    FROM
        products p;

-- Read from a view        
select * from products_v;

=================

Ref 

https://www.dbrnd.com/2015/05/mysql-error-handling/
https://www.mysqltutorial.org/create-sql-updatable-views.aspx
https://flylib.com/books/en/1.142.1/exception_handling.html
https://stackoverflow.com/questions/35867207/exception-using-try-catch-in-mysql-stored-procedure
https://docs.oracle.com/cd/B10501_01/appdev.920/a96624/07_errs.htm
https://docs.oracle.com/cd/E11882_01/timesten.112/e21639/exceptions.htm#TTPLS196
https://www.tutorialspoint.com/mysql/mysql-indexes.htm

==================


Index

Pros - Speed, performance for sel, joins etc
Cons - Slow for ins, ups, too many bad, optimised designs, cannot view actual indexes


SHOW INDEX FROM orders;

INSERT INTO `spk_db01a`.`orders`
(
`order_date`,
`delivery_address`,
`delivery_contact`,
`delivery_mobile`)
VALUES
(
current_date(),
'No 1, Jigani Main Street, Jigani, Bangalore',
'Ching Chang',
'982234343');

-- CREATE UNIQUE INDEX index_name ON table_name ( column1, column2,...);
CREATE INDEX del_mob_I ON orders ( delivery_mobile);

SHOW INDEX FROM orders;

-- ALTER TABLE table_name DROP INDEX index_name ;
ALTER TABLE orders DROP INDEX del_mob_I ;

commit;


=================

ER Diagram

-- Create fk for existing tables and create a standalone table
ALTER TABLE orders ADD FOREIGN KEY (products_id) REFERENCES products(id);

=================


Online Shopping

Minimal Tables : 
	Product, Order, 
	Product_History, Order_History
Usecase : 
	Create procedure/func to CRUD an order
	Create procedure to move orders to history table if its older than given date.
	
	
User Profiles

Minimal Tables : 
	User, Address, ContactInfo
Usecase : 
	Create procedure/func to CRUD a user
	Create procedure to update user status to child, adult, senior provided his age is 0<>18<>60
	
Deliverables
Sql stmts
er diagram
instruction to execute proc wit sample

	


