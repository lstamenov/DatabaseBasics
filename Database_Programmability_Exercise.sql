#1. Task

DROP PROCEDURE usp_get_employees_salary_above_35000;
DELIMITER //
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT first_name, last_name FROM employees
    WHERE salary > 35000
    ORDER BY first_name, last_name, employee_id ASC;
END//

CALL usp_get_employees_salary_above_35000();

#2. Task
DELIMITER //
CREATE PROCEDURE usp_get_employees_with_higher_salary(min_salary DOUBLE)
BEGIN
	SELECT first_name, last_name FROM employees
    WHERE salary >= min_salary
    ORDER BY first_name, last_name, employee_id;
END//

CALL usp_get_employees_with_higher_salary(48100);

#3. Task
DELIMITER //
CREATE PROCEDURE usp_get_towns_starting_with(start_name VARCHAR(50))
BEGIN
	SELECT `name` AS town_name FROM towns
    WHERE `name` LIKE CONCAT(start_name, '%')
    ORDER BY `name`;
END//

CALL usp_get_towns_starting_with('S');

#4. Task
DELIMITER //
CREATE PROCEDURE usp_get_employees_from_town(town VARCHAR(50))
BEGIN
	SELECT e.first_name, e.last_name FROM employees AS e
    JOIN addresses AS a
    ON e.address_id = a.address_id
    JOIN towns AS t
    ON a.town_id = t.town_id
    WHERE t.name LIKE town
    ORDER BY e.first_name, e.last_name, e.employee_id;
END//

CALL usp_get_employees_from_town('Sofia');

#5. Task
DELIMITER //
CREATE FUNCTION ufn_get_salary_level(salary DOUBLE)
RETURNS VARCHAR(40)
BEGIN
	RETURN(
		CASE 
		WHEN salary < 30000 
		THEN 'Low'
		WHEN salary >= 30000 AND  salary <= 50000 
		THEN 'Average'
		ELSE 'High'
		END
    );
END//

DELIMITER //
CREATE PROCEDURE usp_get_employees_salary_level()
BEGIN
	SELECT `salary`, ufn_get_salary_level(salary) as `salary_level`
    FROM employees;
END//

CALL usp_get_employees_salary_level();

#6. Task
DELIMITER //
CREATE PROCEDURE 
usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
SELECT first_name, last_name FROM employees
WHERE ufn_get_salary_level(salary) LIKE salary_level
ORDER BY first_name DESC, last_name DESC;
END//

CALL usp_get_employees_by_salary_level('High');

#7. Task
DELIMITER //
CREATE FUNCTION ufn_is_word_comprised(set_of_chars VARCHAR(50),
word VARCHAR(50))
RETURNS BIT
BEGIN
	RETURN word REGEXP (concat('^[', set_of_chars, ']+$'));
END//

#8. Task
DELIMITER //
CREATE PROCEDURE usp_get_holders_name()
BEGIN
	SELECT CONCAT(first_name ,' ', last_name) AS full_name
    FROM account_holders
    ORDER BY full_name, id;
END//

CALL usp_get_holders_name();

#9. Task
DELIMITER//
CREATE PROCEDURE 
usp_get_holders_with_balance_higher_than(min_balance DOUBLE)
BEGIN
    SELECT 
         h.first_name, h.last_name
    FROM
        `account_holders` AS h
            JOIN
        (SELECT 
            a.id, a.account_holder_id, SUM(a.balance) AS 'total_balance'
        FROM
            `accounts` AS a
        GROUP BY a.account_holder_id
        HAVING `total_balance` > min_balance) as a ON h.id = a.account_holder_id
    ORDER BY a.id;
END//

CALL usp_get_holders_with_balance_higher_than(7000);

#10. Task
#11. Task
#12. Task
#13. Task
#14. Task
#15. Task
#16. Task