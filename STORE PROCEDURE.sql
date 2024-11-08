CREATE DATABASE N1;
USE N1;
*/ PROCEDURE TO FIND OUT SQUARE ROOT OF ANY NUMBER */

DELIMITER $$
CREATE PROCEDURE SQRT_ROOT(A INT, OUT B FLOAT)
BEGIN
    SET B = SQRT(A);
END $$
DELIMITER ;

CALL SQRT_ROOT(64, @B);
SELECT @B;

SELECT SQRT(4);

#FOR POWER
DELIMITER $$
CREATE PROCEDURE POWER_2(A INT, B INT, OUT C INT)
BEGIN
    SET C = POWER(A,B);
END $$
DELIMITER ;

CALL POWER_2(3,2,@C);
SELECT @C

#FOR INOUT PROCEDURE
DELIMITER $$ 
CREATE PROCEDURE SETCOUNTER(INOUT COUNTER INT, IN B INT)
BEGIN
    SET COUNTER = COUNTER + B;
END $$
DELIMITER ;

SET @COUNTER = 2;
CALL SETCOUNTER(@COUNTER, 6);
SELECT @COUNTER;

#USER VARIABLES
DELIMITER $$
CREATE PROCEDURE USER_VAR1()
BEGIN
    SET @X = 15;
    SET @Y = 10;
    SELECT @X, @Y, @X-@Y, @X+@Y;
END $$
DELIMITER ;

CALL USER_VAR1();
