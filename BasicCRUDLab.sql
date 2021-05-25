USE `hotel`;

SELECT `id`, `first_name`, `last_name`, `job_title`
FROM `employees`;

SELECT `id`, CONCAT(`first_name`,' ', `last_name`) 
AS `full name`, `job_title`, `salary`
FROM `employees` WHERE `salary` > 1000;

UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';

SELECT * FROM `employees`
WHERE `job_title` = 'Manager';

CREATE VIEW `top_paid_employee` AS
SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name`, `salary`
FROM `employees` ORDER BY `salary` DESC
LIMIT 1;

SELECT * FROM `top_paid_employee`;

SELECT * FROM `employees`
WHERE `department_id` = 4 AND `salary` >= 1000;

DELETE FROM `employees`
WHERE `department_id` = 1 
OR `department_id` = 2;
