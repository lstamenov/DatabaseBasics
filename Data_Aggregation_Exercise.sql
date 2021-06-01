#1. Problem
SELECT count(*) FROM `wizzard_deposits`;	

#2. Problem
SELECT MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM `wizzard_deposits`;

#3. Problem
SELECT `deposit_group`, 
MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;

#4. Problem
SELECT `deposit_group` FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY AVG(`magic_wand_size`)
LIMIT 1;

#5. Problem
SELECT `deposit_group`, SUM(`deposit_amount`) AS `total_sum`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `total_sum`;

#6. Problem
SELECT `deposit_group`, SUM(`deposit_amount`) AS `total_sum`
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;

#7. Problem
SELECT `deposit_group`, SUM(`deposit_amount`) AS `total_sum`
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

#8. Problem
SELECT `deposit_group`, `magic_wand_creator`,
MIN(`deposit_charge`) AS `min_deposit_charge`
FROM `wizzard_deposits`
GROUP BY `deposit_group`, `magic_wand_creator`
ORDER BY `deposit_group`, `magic_wand_creator`;

#9. Problem
SELECT (
CASE
WHEN `age` BETWEEN 0 AND 10 THEN '[0-10]'
WHEN `age` BETWEEN 11 AND 20 THEN '[11-20]'
WHEN `age` BETWEEN 21 AND 30 THEN '[21-30]'
WHEN `age` BETWEEN 31 AND 40 THEN '[31-40]'
WHEN `age` BETWEEN 41 AND 50 THEN '[41-50]'
WHEN `age` BETWEEN 51 AND 60 THEN '[51-60]'
ELSE '[61+]'
END
) AS `age_group`, 
COUNT(*) AS `wizard_count`
FROM `wizzard_deposits`
GROUP BY `age_group`
ORDER BY `wizard_count`; 

#10. Problem
SELECT (SUBSTRING(`first_name`, 1, 1)) AS `first_letter`
 FROM `wizzard_deposits`
 WHERE `deposit_group` = 'Troll Chest'
 GROUP BY `first_letter`
 ORDER BY `first_letter`;
 
#11. Problem
SELECT `deposit_group`, `is_deposit_expired`, 
AVG(`deposit_interest`) AS `average_interest`
FROM `wizzard_deposits`
WHERE `deposit_start_date` > '1985/01/01'
GROUP BY `deposit_group`, `is_deposit_expired`
ORDER BY `deposit_group` DESC, `is_deposit_expired`; 

#12. Problem
SELECT `hw`.`first_name` as `host_wizard`,
`hw`.`deposit_amount` as `host_wizard_deposit`,
`gw`.`first_name` as `guest_wizard`,
`gw`.`deposit_amount` as `guest_wizard_deposit`,
(`hw`.`deposit_amount` - `gw`.`deposit_amount`) AS `difference`
FROM `wizzard_deposits` as `hw`,
`wizzard_deposits` as `gw`
WHERE `hw`.`id` - `gw`.`id` = -1;


SELECT SUM(`first`.`deposit_amount` - `second`.`deposit_amount`) as `difference`
FROM `wizzard_deposits` as `first`,
`wizzard_deposits` AS `second`
WHERE first.id - second.id = -1;

#13. Problem
SELECT `department_id`, MIN(`salary`)
FROM `employees` WHERE `employee_id` IN (2, 5, 7)
AND `hire_date` > '2000/01/01'
GROUP BY `department_id`
ORDER BY `department_id`;

#14. Problem
SELECT department_id, ROUND(CASE
WHEN department_id = 1 THEN AVG(`salary`) + 5000
ELSE AVG(`salary`)
END, 4) AS `avg_salary`
FROM employees
WHERE manager_id != 42 AND `salary` > 30000
GROUP BY department_id
ORDER BY department_id;


#15. Problem
SELECT department_id, MAX(salary) AS `max_salary`
FROM `employees`
GROUP BY `department_id`
HAVING `max_salary` NOT BETWEEN 30000 AND 70000
ORDER BY `department_id`;

#16. Problem
SELECT COUNT(*) as `` 
FROM `employees`
WHERE manager_id IS NULL;

#17. Problem
SELECT `department_id`, (
SELECT e1.`salary` FROM `employees` as e1
WHERE e1.department_id = e.department_id
ORDER BY `salary` DESC
LIMIT 2, 1
) AS `third_highest_salary` FROM employees AS `e`
GROUP BY e.`department_id`
ORDER BY e.`department_id`;

#18. Problem
SELECT e.`first_name`, e.`last_name`, e.`department_id`
FROM employees AS e
WHERE e.salary > (
SELECT AVG(e1.salary) AS `avg_salary`
FROM `employees` AS e1
WHERE e1.department_id = e.department_id
)
ORDER BY e.`department_id`, e.`employee_id`
LIMIT 10;	

#19. Problem
SELECT department_id, SUM(salary) FROM employees
GROUP BY department_id
ORDER BY department_id;