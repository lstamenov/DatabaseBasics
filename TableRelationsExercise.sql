#1. Task
CREATE DATABASE `exercise_test`;

CREATE TABLE `passports`(
passport_id INT AUTO_INCREMENT NOT NULL
PRIMARY KEY,
passport_number VARCHAR(50) NOT NULL UNIQUE 
);

ALTER TABLE passports
AUTO_INCREMENT = 100;


CREATE TABLE `persons`(
person_id INT NOT NULL AUTO_INCREMENT
PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
salary DOUBLE(8, 2) NOT NULL,
passport_id INT NOT NULL
);

ALTER TABLE persons
ADD CONSTRAINT `fk_persons_passports`
FOREIGN KEY (passport_id)
REFERENCES passports(passport_id);

INSERT INTO passports
(passport_number) VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2');

ALTER TABLE persons
DROP COLUMN `last_name`;

SELECT * FROM passports;
INSERT INTO persons
(first_name, salary, passport_id)
VALUES ('Roberto', 43300.00, 101),
	('Tom', 56100.00, 102),
    ('Yana', 60200.00, 100);
    
    
SELECT * FROM persons;

#2. Task
CREATE DATABASE `cars`;

CREATE TABLE `manifactures`(
manifacturer_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
`established_on` DATE
);

CREATE TABLE `models`(
model_id INT NOT NULL
AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
manifacturer_id INT NOT NULL
);

ALTER TABLE models
ADD CONSTRAINT `fk_manifacturers_models`
FOREIGN KEY (`manifacturer_id`)
REFERENCES manifactures(manifacturer_id),
AUTO_INCREMENT = 101;

INSERT INTO manifactures
(`name`, `established_on`)
VALUES ('BMW', '1916/03/01'),
	('Tesla', '2003/01/01'),
    ('Lada', '1966/05/01');
    
SELECT * FROM manifactures;

INSERT INTO models
(`name`, `manifacturer_id`)
VALUES ('X1', 1),
	('i6', 1),
	('Model s', 2),
	('Model X', 2),
	('Model 3', 2),
	('Niva', 3);
    
SELECT * FROM models;

SELECT mdl.`name`, man.`name`
FROM `models` AS mdl
JOIN manifactures AS man
ON man.manifacturer_id = mdl.manifacturer_id;

#3. Task
CREATE DATABASE `school`;

CREATE TABLE `students`(
student_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `exams`(
exam_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `students_exams`(
student_id INT NOT NULL,
exam_id INT NOT NULL
);

ALTER TABLE exams
AUTO_INCREMENT = 101;

ALTER TABLE students_exams
ADD CONSTRAINT `fk_student_id`
FOREIGN KEY (student_id)
REFERENCES students(student_id),
ADD CONSTRAINT `fk_exams_id`
FOREIGN KEY (exam_id)
REFERENCES exams(exam_id);

SELECT * FROM students_exams;

INSERT INTO students 
(`name`) VALUES
	('Mila'),
    ('Toni'),
    ('Ron');
    
INSERT INTO exams
(`name`) VALUES
	('Spring MVC'),
    ('NodeJs'),
    ('Oracle');
    
SELECT * FROM exams;

INSERT INTO `students_exams`
(`student_id`, `exam_id`)
VALUES (1, 101),
	(1, 102),
    (2, 101),
    (3, 103),
    (2, 102),
    (2, 103);
    
SELECT * FROM students_exams;

SELECT s.`name`, e.`name` FROM students_exams AS s_e
JOIN students AS s
ON s.student_id = s_e.student_id
JOIN exams AS e
ON e.exam_id = s_e.exam_id;

#4. Task
CREATE DATABASE teachers_db;

CREATE TABLE teachers(
teacher_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
manager_id INT
);

ALTER TABLE `teachers`
ADD CONSTRAINT fk_manager_id
FOREIGN KEY (manager_id)
REFERENCES teachers(teacher_id);

SELECT * FROM teachers;

INSERT INTO teachers
(`name`, manager_id)
VALUES ('John', NULL),
	('Maya', NULL),
	('Silvia', NULL),
	('Ted', NULL),
	('Mark', NULL),
	('Greta', NULL);
	
SELECT * FROM 	teachers;
    
UPDATE teachers
SET manager_id = (
CASE
WHEN teacher_id = 2 THEN 6
WHEN teacher_id = 3 THEN 6
WHEN teacher_id = 4 THEN 5
WHEN teacher_id = 5 THEN 1
WHEN teacher_id = 6 THEN 1
END
);

SELECT * FROM teachers;

SELECT t.`name`, m.`name` FROM teachers AS t
JOIN teachers AS m
ON t.manager_id = m.teacher_id;

#5. Task

CREATE DATABASE `online_store`;

CREATE TABLE `customers`(
customer_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
birthday DATE,
city_id INT NOT NULL
);

CREATE TABLE `cities`(
city_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);


ALTER TABLE customers
ADD CONSTRAINT `fk_city_id`
FOREIGN KEY (`city_id`)
REFERENCES cities(city_id);

CREATE TABLE `orders`(
order_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
customer_id INT NOT NULL,
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE `items`(
item_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
item_type_id INT NOT NULL
);

CREATE TABLE `item_types`(
type_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50)
);

ALTER TABLE `items`
ADD CONSTRAINT `fk_item_types`
FOREIGN KEY (item_type_id)
REFERENCES item_types(type_id);


CREATE TABLE `order_items`(
order_id INT NOT NULL,
item_id INT NOT NULL,
CONSTRAINT `fk_items_order`
FOREIGN KEY (`item_id`)
REFERENCES items(item_id),
CONSTRAINT `fk_order_items`
FOREIGN KEY (`order_id`)
REFERENCES orders(order_id)
);


#6. Task

CREATE DATABASE `university`;

CREATE TABLE `majors`(
major_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE `students`(
student_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
student_number VARCHAR(12) NOT NULL,
student_name VARCHAR(50) NOT NULL,
major_id INT NOT NULL,
CONSTRAINT `fk_majors_students`
FOREIGN KEY (`major_id`)
REFERENCES majors(major_id)
);

CREATE TABLE `payments`(
payment_id INT AUTO_INCREMENT
NOT NULL PRIMARY KEY,
payment_date DATE NOT NULL,
payment_amount DECIMAL(8, 2) NOT NULL,
student_id INT NOT NULL,
CONSTRAINT `fk_student_payments`
FOREIGN KEY (student_id)
REFERENCES students(student_id)
);

CREATE TABLE `agenda`(
student_id INT NOT NULL,
subject_id INT NOT NULL,
CONSTRAINT `fk_student_agenda`
FOREIGN KEY (`student_id`)
REFERENCES students(student_id)
);

CREATE TABLE `subjects`(
subject_id INT NOT NULL
AUTO_INCREMENT PRIMARY KEY,
`subject_name` VARCHAR(50) NOT NULL
);

ALTER TABLE `agenda`
ADD CONSTRAINT `fk_subject_agenda`
FOREIGN KEY (subject_id)
REFERENCES subjects(subject_id);

USE soft_uni;
SELECT * FROM employees;







