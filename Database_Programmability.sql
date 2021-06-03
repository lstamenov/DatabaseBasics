#1. Task
DELIMITER **
CREATE FUNCTION ufn_count_employees_by_town (town_name VARCHAR(50))
RETURNS INTEGER
	BEGIN
		DECLARE count INT;
        SET count := (SELECT COUNT(*) FROM `employees` AS e
        JOIN `addresses` AS a
        ON e.`address_id` = a.`address_id`
        JOIN `towns` AS t
        ON a.`town_id` = t.`town_id`
        WHERE town_name = t.`name`
        );
		RETURN count;
	END **
    
#2. Task
DELIMITER //
CREATE PROCEDURE insrease_salary_in_department(department VARCHAR(45))
	BEGIN
		UPDATE employees AS e
        JOIN departments AS d
        ON e.department_id = d.department_id
        SET e.salary = e.salary * 1.05
        WHERE d.`name` = department;
    END//
    

CALL insrease_salary_in_department('Engineering');
SELECT * FROM employees
WHERE department_id = 1;

#3. Task
DELIMITER//
CREATE FUNCTION get_user_count(id INT)
RETURNS INTEGER
BEGIN
	RETURN (SELECT COUNT(*) FROM `employees`
    WHERE `employee_id` = id);
END //

DELIMITER //
CREATE PROCEDURE increase_salary_by_employee_id(id INT)
BEGIN
START TRANSACTION;
IF (get_user_count(id) <> 1) THEN ROLLBACK;
ELSE 
UPDATE employees
SET `salary` = salary * 1.05
WHERE employee_id = id;
END IF;
END//

CREATE TABLE `deleted_employees`(
id INT NOT NULL PRIMARY KEY, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50),
job_title VARCHAR(50) NOT NULL,
department_id INT NOT NULL,
salary DECIMAL(10, 2) NOT NULL
);

DELIMITER $$
CREATE TRIGGER on_deleted_employees
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
INSERT INTO deleted_employees
(employee_id , first_name, last_name,
middle_name, job_title, department_id, salary)
VALUES
(OLD.employee_id , OLD.first_name, OLD.last_name,
OLD.middle_name, OLD.job_title, OLD.department_id, OLD.salary);
END $$