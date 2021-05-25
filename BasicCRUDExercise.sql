#first problem
SELECT * FROM departments;

#second problem
SELECT `name` FROM departments;

#third problem
SELECT `first_name`, `last_name`, `salary` FROM employees;

#fourth problem
SELECT `first_name`, `middle_name`,`last_name` FROM employees;

#fifth problem
SELECT CONCAT(first_name, '.' ,last_name , '@softuni.bg') `full_email_address`
FROM employees;

#sixth problem
SELECT DISTINCT `salary`
FROM employees;

#sevent problem
SELECT * FROM employees
WHERE `job_title` = 'Sales Representative';

#eighth problem
SELECT `first_name`, `last_name`, `job_title`
FROM employees
WHERE `salary` BETWEEN 20000 AND 30000;

#ninth problem
SELECT `first_name`, `last_name`, `job_title`
FROM employees
WHERE `salary` = 25000 OR `salary` = 14000
OR `salary` = 12500 OR `salary` = 23600;

#tenth problem
SELECT `first_name`, `last_name` FROM employees
WHERE `manager_id` IS NULL;

#eleventh problem
SELECT `first_name`, `last_name`, `salary` FROM employees
WHERE `salary` > 50000
ORDER BY `salary` DESC;

#twelfth problem
SELECT `first_name`, `last_name` FROM employees
ORDER BY `salary` DESC LIMIT 5;

#thirtheenth problem
SELECT `first_name`, `last_name` FROM employees
WHERE `department_id` != 4;

#fourteenth problem
SELECT * FROM employees
ORDER BY `salary` DESC,
`first_name`, `last_name` DESC, `middle_name`; 

#fifteenth problem
CREATE VIEW `v_employees_salaries` AS	
SELECT `first_name`, `last_name`, `salary` FROM employees;
SELECT * FROM `v_employees_salaries`; 

#sixteenth problem
CREATE VIEW `v_employees_job_titles` AS
SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`) AS `full_name`,
`job_title` FROM employees;
SELECT * FROM `v_employees_job_titles`;

#seventeenth problem
SELECT DISTINCT `job_title` FROM employees
ORDER BY `job_title`;

#eighteenth problem
SELECT * FROM `projects`
ORDER BY `start_date` , `name` , `project_id`
LIMIT 10;

#nineteenth problem
SELECT `first_name`, `last_name`, `hire_date` FROM employees
ORDER BY `hire_date` DESC LIMIT 7;

#twentieth problem
UPDATE `employees`
SET `salary` = `salary` * 1.12 
WHERE `department_id` IN (1, 2, 4, 11);
SELECT `salary` FROM `employees`;

#twentyfirst problem
USE geography;
SELECT `peak_name` FROM `peaks`
ORDER BY `peak_name`;

#twentysecond problem
SELECT * FROM continents;
SELECT `country_name`, `population` FROM `countries`
WHERE `continent_code` = 'EU'
ORDER BY `population` DESC, `country_name`;

#twentythird problem
SELECT `country_name`, `country_code`,
IF(`country_code` = 'EUR', 'Euro', 'Not Euro') AS `currency`
FROM `countries`
ORDER BY `country_name`;

#twentyfourth problem
USE `diablo`;
SELECT `name` FROM `characters`
ORDER BY `name`;



