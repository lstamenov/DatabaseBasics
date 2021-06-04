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
DELIMITER $$
CREATE FUNCTION ufn_calc_future_value(init_sum DOUBLE, 
interest_rate DOUBLE, years INT)
RETURNS DOUBLE
BEGIN
	RETURN (SELECT ROUND(init_sum * POWER((1 + interest_rate), years)), 2);
END$$

SELECT ufn_calc_future_value(1000, 0.1, 5);
SELECT * FROM account_holders;
#11. Task
DELIMITER $$
CREATE FUNCTION usp_calc_future_value_five_years(
init_sum DOUBLE, interest_rate DOUBLE)
RETURNS DOUBLE
BEGIN
	RETURN (SELECT ROUND((init_sum * POW((1 + interest_rate), 5)), 4));
END$$

CREATE PROCEDURE calc_future_value_for_account(init_sum DOUBLE,
interest_rate DOUBLE)
BEGIN
	SELECT a.`id` AS account_id, h.first_name, h.last_name,
    a.balance AS current_balance, 
    usp_calc_future_value_five_years(init_sum, interest_rate)
    AS balance_in_5_years
    FROM accounts AS a
    JOIN account_holders AS h
    ON a.account_holder_id = h.id;
END$$

CALL calc_future_value_for_account(1000, 0.1);

#12. Task
DELIMITER //
CREATE PROCEDURE usp_deposit_money(
    account_id INT, money_amount DECIMAL(19, 4))
BEGIN
 IF money_amount > 0 THEN
	START TRANSACTION;
    #starts trans
    UPDATE accounts AS a
    SET a.balance = balance + money_amount
    WHERE a.id = account_id;
	
    IF (
		SELECT COUNT(*) FROM accounts AS ac
        WHERE ac.id = account_id
    ) = 1 THEN
    COMMIT;
    ELSE ROLLBACK;
	END IF;
  END IF;
END//

SELECT id, account_holder_id, balance FROM accounts
WHERE id = 1;


#13. Task
DELIMITER $$
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DOUBLE)
BEGIN
#check if amount > 0
	IF money_amount > 0 THEN
    START TRANSACTION;
		UPDATE accounts AS ac
		SET ac.balance = balance - money_amount
		WHERE ac.id = account_id;
		IF (
			SELECT COUNT(*) FROM accounts AS a
			WHERE a.id = account_id
        ) <> 1 THEN ROLLBACK;
        ELSE
			IF(	SELECT balance FROM accounts
                WHERE id = account_id
            ) > money_amount
            THEN COMMIT;
            END IF;
        END IF;       
    END IF;
END$$

SELECT * FROM accounts
WHERE id = 1;

#14. Task
DELIMITER //
CREATE FUNCTION does_id_exist(acc_id INT)
RETURNS BOOL
BEGIN
	RETURN (
		SELECT COUNT(*) FROM accounts
        WHERE acc_id = id
    );
END//

DELIMITER //
CREATE FUNCTION get_acc_balance(acc_id INT)
RETURNS DOUBLE
BEGIN
	RETURN(
		SELECT balance FROM accounts
        WHERE id = acc_id
    );
END//

DELIMITER //
CREATE PROCEDURE usp_money_transfer(sender_id INT, 
receiver_id INT, money_amount DOUBLE)
BEGIN
IF money_amount > 0 THEN START TRANSACTION; 
UPDATE accounts
SET balance = balance - money_amount
WHERE id = sender_id;
UPDATE accounts
SET balance = balance + money_amount
WHERE id = receiver_id;
	IF does_id_exist(sender_id) = 0
    OR does_id_exist(receiver_id) = 0
    THEN ROLLBACK;
    ELSE
		IF get_acc_balance(sender_id) >= money_amount
        THEN COMMIT;
        ELSE ROLLBACK;
        END IF;
	END IF;
END IF;
END//

#15. Task

CREATE TABLE `logs`(
id INT AUTO_INCREMENT PRIMARY KEY,
account_id INT NOT NULL,
old_sum DECIMAL NOT NULL,
new_sum DECIMAL NOT NULL,
CONSTRAINT fk_account_id
FOREIGN KEY (account_id)
REFERENCES accounts(id)
);

DELIMITER //

CREATE TRIGGER log_data AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
IF OLD.balance <> NEW.balance THEN
INSERT INTO `logs`
(account_id, old_sum, new_sum)
VALUES(OLD.id, OLD.balance, NEW.balance);
END IF;	
END//

CALL usp_deposit_money(1, 100);

SELECT * FROM accounts;
#16. Task