CREATE TABLE geography.mountains(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
`name` VARCHAR(40) NOT NULL
);

CREATE TABLE geography.peaks(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(40) NOT NULL
);

ALTER TABLE `peaks`
ADD COLUMN (
`mountain_id` INT NOT NULL
);


ALTER TABLE peaks
ADD CONSTRAINT fk_peaks_mountains
FOREIGN KEY (`mountain_id`)
REFERENCES mountains(id);

INSERT INTO `mountains`(`name`)
VALUES ('Rila'),
('Pirin'),
('Stara Planina');

INSERT INTO peaks(`name`, `mountain_id`)
VALUES 
('Musala', 1), ('Malyovitsa', 1),
 ('Vihren', 2), ('Botev', 3);
 
 SELECT * FROM peaks;
 
 SELECT p.`name`, m.`name` FROM peaks as p
 JOIN mountains as m
 WHERE p.mountain_id = m.id;
 
 SELECT CONCAT(e.first_name, ' ', e.last_name) AS `full_name`, e.`salary`,
 d.`name` FROM employees AS e
 JOIN departments AS d
 WHERE e.`department_id` = d.`id` AND  e.`salary` > (
	SELECT AVG(salary) AS `avg_salary` 
    FROM `employees` AS e1
    WHERE e1.department_id = e.department_id
    GROUP BY `department_id`
 )
ORDER BY `salary`; 

SELECT m.title, m.copyright_year, d.director_name,
g.genre_name, c.category_name
FROM movies AS m
JOIN directors AS d
ON m.director_id = d.id
JOIN genres AS g
ON g.id = m.genre_id
JOIN categories AS c
ON m.category_id = c.id; 
 