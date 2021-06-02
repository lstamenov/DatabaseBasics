#1. Task

USE soft_uni;
SELECT e.`employee_id`, 
CONCAT(e.first_name, ' ', e.last_name) AS full_name, e.`department_id`,
d.name FROM `employees` AS e
JOIN `departments` AS d
ON d.department_id = e.department_id
ORDER BY e.employee_id
LIMIT 5;

#2. Task
SELECT t.`town_id`, t.`name`, a.address_text
FROM towns AS t
JOIN addresses AS a
ON t.town_id = a.town_id
WHERE t.`name` LIKE 
'San Francisco' OR 
t.`name` LIKE 'Sofia'
OR t.`name` LIKE 'Carnation';

#3. Task
SELECT `employee_id`, `first_name`, `last_name`, `department_id`, `salary`
FROM employees
WHERE manager_id IS NULL;

#3. Task(1)
SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS full_name,
d.`name` ,e.`salary` FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.`manager_id` IS NULL;

#4. Task
SELECT COUNT(`salary`) AS count FROM employees
WHERE salary > (
SELECT AVG(`salary`) FROM employees
);