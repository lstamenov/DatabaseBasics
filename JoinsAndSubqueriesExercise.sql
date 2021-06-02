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
SELECT e.`first_name`, e.`last_name`, e.`hire_date`, d.`name`
AS `dept_name` FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999/01/01'
AND (d.`name` LIKE 'Sales' OR d.`name` LIKE 'Finance')
ORDER BY e.`hire_date`;

#7. Task
SELECT e.`employee_id`, e.`first_name`, p.`name` AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p
ON ep.`project_id` = p.`project_id`
WHERE p.`start_date` > '2002/08/13'
AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name`
LIMIT 5;

#8. Task
SELECT e.`employee_id`, e.`first_name`, IF(
p.`start_date` >= '2005/01/01', NULL, p.`name`
) AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p
ON ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24
ORDER BY `project_name`;

#9. Task
SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, 
m.`first_name` AS `manager_name` FROM `employees` AS e
JOIN `employees` AS m
ON e.`manager_id` = m.`employee_id`
WHERE e.`manager_id` IN (3, 7)
ORDER BY e.`first_name`;

#10. Task
SELECT e.`employee_id`, CONCAT(e.`first_name`, ' ', e.`last_name`)
AS `employee_name`, CONCAT(m.`first_name`, ' ', m.`last_name`)
AS `manager_name`, d.`name` FROM `employees` AS e
LEFT JOIN `employees` AS m
ON e.`manager_id` = m.`employee_id`
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
ORDER BY e.`employee_id`; 

#11. Task
SELECT AVG(`salary`) AS `min_avg_salary` FROM `employees`
GROUP BY `department_id`
ORDER BY `min_avg_salary`
LIMIT 1;

#12. Task
USE `geography`;	
SELECT c.`country_code`, m.`mountain_range`, 
p.`peak_name`, p.`elevation`
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON mc.`mountain_id` = m.`id`
JOIN `peaks` AS p
ON m.`id` = p.`mountain_id`
WHERE p.`elevation` > 2835
AND c.`country_code` LIKE 'BG'
ORDER BY p.`elevation` DESC;

#13. Task
SELECT c.`country_code`, COUNT(mc.`country_code`) AS `mountain_range`
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
WHERE c.`country_code` IN ('BG', 'RU', 'US')
GROUP BY c.`country_code`
ORDER BY `mountain_range` DESC;