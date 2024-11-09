
DROP PROCEDURE IF EXISTS empSearch;
DELIMITER $$
CREATE PROCEDURE empSearch(IN edeptno INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(255);
    DECLARE emp_cursor CURSOR FOR SELECT empno, ename FROM emp WHERE deptno = edeptno;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN emp_cursor;

    
    FETCH emp_cursor INTO emp_id, emp_name;
    IF done THEN
        SELECT 'Employee not found' AS message;
    ELSE
        
        SET done = FALSE;
        SELECT emp_id, emp_name;
        WHILE NOT done DO
            FETCH emp_cursor INTO emp_id, emp_name;
            IF NOT done THEN
                SELECT emp_id, emp_name;
            END IF;
        END WHILE;
    END IF;

    CLOSE emp_cursor;
END $$
DELIMITER ;

