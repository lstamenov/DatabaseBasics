#1. Task
USE soft_uni;
SELECT e.`employee_id`, e.`job_title`, e.`address_id`, a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`;

#2. Task
SELECT e.`first_name`, e.`last_name`, t.`name` AS `town`, a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
JOIN `towns` AS t
ON t.`town_id` = a.`town_id`
ORDER BY e.`first_name`, `last_name`
LIMIT 5;

#3. Task
SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name` AS
`department_name` FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE d.`name` LIKE 'Sales'
ORDER BY e.`employee_id` DESC; 

#4. Task
SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name` AS
`department_name` FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`salary` > 15000
ORDER BY e.`department_id` DESC
LIMIT 5;

#5. Task
SELECT e.`employee_id`, e.`first_name` FROM 
`employees` AS e
LEFT JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
WHERE ep.`project_id` IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;


#6. Task
#7. Task
#8. Task
#9. Task
#10. Task
#11. Task
#12. Task
#13. Task