#1. Problem
SELECT `first_name`, `last_name` FROM `employees`
WHERE SUBSTRING(`first_name`, 1, 2) = 'Sa';

#2. Problem
SELECT * FROM `employees`
WHERE LOCATE('ei', `last_name`);

#3. Problem
SELECT `first_name` FROM `employees`
WHERE (`department_id` = 3 OR `department_id` = 10)
AND YEAR(`hire_date`) BETWEEN 1995 AND 2005
ORDER BY `employee_id`;

#4. Problem
SELECT `first_name`, `last_name` FROM `employees`
WHERE `job_title` NOT LIKE '%engineer%';

#5. Problem
SELECT `name`FROM `towns`
WHERE character_length(`name`) IN (5, 6)
ORDER BY `name`;

#6. Problem
SELECT * FROM `towns`
WHERE  SUBSTRING(`name`, 1, 1) IN ('M', 'K', 'B', 'E')
ORDER BY `name`;

#7. Problem
SELECT * FROM `towns`
WHERE SUBSTRING(`name`, 1, 1) NOT IN ('R', 'D', 'B')
ORDER BY `name`;

#8. Problem
CREATE VIEW `v_employees_hired_after_2000` AS
 SELECT `first_name`, `last_name` FROM `employees`
 WHERE YEAR(`hire_date`) > 2000;
 
#9. Problem
SELECT `first_name`, `last_name` FROM `employees`
WHERE character_length(`last_name`) = 5;

#10. Problem
SELECT `country_name`, `iso_code` FROM `countries`
WHERE `country_name` LIKE '%A%A%A%'
ORDER BY `iso_code`;

#11. Problem
SELECT `peak_name`, `river_name`, CONCAT(`peak_name`, `river_name`) AS `mix`
FROM `peaks`, `rivers`
WHERE RIGHT(`peak_name`, 1) = LEFT(`river_name`, 1)
ORDER BY `mix`;

#12. Problem
SELECT `name`, `start` FROM `games`
WHERE YEAR(`start`) IN (2011, 2012)
ORDER BY `start`;

#13. Problem
SELECT `user_name`, SUBSTRING(`email`, LOCATE('@', `email`) + 1) AS `email_provider`
FROM `users`
ORDER BY `email_provider`;

#14. Problem
SELECT `user_name`, `ip_address` FROM `users`
WHERE `ip_address` LIKE '___\\.1%\\.___'
ORDER BY `user_name`;

#15. Problem
SELECT `name`, 
(CASE
WHEN HOUR(`start` BETWEEN 0 AND 11) THEN 'Morning'
WHEN HOUR(`start` BETWEEN 12 AND 17) THEN 'Afternoon'
WHEN HOUR(`start` BETWEEN 18 AND 23) THEN 'Evening'
END) AS `part_of_the_day`,
(CASE
WHEN `duration` <= 3 THEN 'Extra short'
WHEN `duration` BETWEEN 3 AND 6 THEN 'Short'
WHEN `duration` BETWEEN 7 AND 10 THEN 'Long'
ELSE 'Extra long'
END) AS `game_duration`
FROM `games`;

#16. Problem
SELECT `product_name`, `order_date`, 
DATE_ADD(`order_date`,INTERVAL 3 DAY) AS `pay_due`,
DATE_ADD(`order_date`, INTERVAL 1 MONTH) AS `deliver_due`
FROM `orders`; 