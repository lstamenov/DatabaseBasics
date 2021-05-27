#1. ProblemC
SELECT `department_id`, COUNT(`id`) AS `Number of employees`
FROM `employees` 
GROUP BY `department_id`
ORDER BY `department_id`;

#2. Problem
SELECT `department_id`, 
ROUND(AVG(`salary`), 2) AS `average_salary`
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;

#3. Problem
SELECT `department_id`, 	
ROUND(MIN(`salary`), 2) AS `min_salary`
FROM `employees`
GROUP BY `department_id`
HAVING `min_salary` > 800;

#4. Problem
SELECT COUNT(*) FROM `products`
WHERE `category_id` = 2 AND `price` > 8;

#5. Problem
SELECT `category_id`, 
ROUND(AVG(`price`), 2) AS `avg_price`,
MIN(`price`) AS `cheapest_product`,
MAX(`price`) AS `most_expensive_product`
FROM `products`
GROUP BY `category_id`;
