create Database Addmision_portal1;
use Addmision_portal1;
-- Create the Cities table
CREATE TABLE Cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL
);

-- Create the Department table
CREATE TABLE Department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create the Admin table
CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Create the Students table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    city_id INT,
    department_id INT,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
-- Insert sample data into Cities
INSERT INTO Cities (city_name) VALUES
('Karachi'),
('Lahore'),
('Islamabad'),
('Rawalpindi'),
('Peshawar');

-- Insert sample data into Department
INSERT INTO Department (department_name) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Civil Engineering'),
('Biotechnology');


SELECT * FROM Cities;
SELECT * FROM Department;


-- Insert sample data into Students
INSERT INTO Students (student_name, age, city_id, department_id) VALUES
('Aisha Ahmed', 20, 1, 1),
('Bilal Sheikh', 22, 2, 2),
('Fatima Khan', 23, 3, 3),
('Hassan Raza', 21, 4, 4),
('Zainab Malik', 24, 5, 5);


-- Insert sample data into Admin
INSERT INTO Admin (admin_name, email, password) VALUES
('Ahmed Khan', 'ahmed.khan@example.com', 'password123'),
('Sara Ali', 'sara.ali@example.com', 'password456');


-- Query to select all data from Students, Cities, and Department
SELECT 
    s.student_id, s.student_name, s.age, c.city_name, d.department_name
FROM 
    Students s
JOIN 
    Cities c ON s.city_id = c.city_id
JOIN 
    Department d ON s.department_id = d.department_id;

-- Query to select all data from Admin
SELECT * FROM Admin;



SELECT * FROM Cities WHERE city_id = 1;
SELECT * FROM Department WHERE department_id = 1;




-- Insert a valid record into Students
INSERT INTO Students (student_name, age, city_id, department_id) VALUES ('Omesh Kumar', 22, 1, 1);


-- now 50 quries
SELECT * FROM Students;

SELECT * FROM Department;

SELECT * FROM Cities;

SELECT * FROM Admin;

SELECT s.student_name, c.city_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id;

SELECT s.student_name, d.department_name
FROM Students s
JOIN Department d ON s.department_id = d.department_id;

SELECT * FROM Students
WHERE age > 22;

SELECT s.student_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
WHERE c.city_name = 'Karachi';

SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Department d ON s.department_id = d.department_id
GROUP BY d.department_name;

SELECT * FROM Students
ORDER BY age ASC
LIMIT 1;

INSERT INTO Cities (city_name) VALUES ('Quetta');

INSERT INTO Department (department_name) VALUES ('Data Science');

INSERT INTO Admin (admin_name, email, password) VALUES ('Ali Raza', 'ali.raza@example.com', 'pass1234');

INSERT INTO Students (student_name, age, city_id, department_id) VALUES ('Mariam Khan', 21, 1, 1);

UPDATE Students
SET age = 21
WHERE student_name = 'Aisha Ahmed';

DELETE FROM Students
WHERE student_name = 'Aisha Ahmed';

UPDATE Admin
SET email = 'new.email@example.com'
WHERE admin_name = 'Ahmed Khan';

DELETE FROM Cities
WHERE city_name = 'Quetta';

SELECT AVG(age) AS average_age FROM Students;

SELECT COUNT(*) AS total_students FROM Students;

SELECT MAX(age) AS max_age FROM Students;

SELECT MIN(age) AS min_age FROM Students;

SELECT DISTINCT age FROM Students;

SELECT * FROM Students
WHERE age BETWEEN 20 AND 25;

SELECT s.student_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
WHERE c.city_name != 'Islamabad';

SELECT c.city_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
GROUP BY c.city_name;

SELECT * FROM Students
WHERE student_name LIKE '%Ali%';

SELECT s.student_name, c.city_name, d.department_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
JOIN Department d ON s.department_id = d.department_id;

SELECT * FROM Students
ORDER BY age;

SELECT * FROM Department
ORDER BY department_name;

SELECT * FROM Cities
ORDER BY city_name;

SELECT c.city_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
GROUP BY c.city_name;

SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Department d ON s.department_id = d.department_id
GROUP BY d.department_name
ORDER BY student_count DESC;

SELECT * FROM Students
WHERE age > (SELECT AVG(age) FROM Students);

SELECT s.student_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
JOIN Department d ON s.department_id = d.department_id
WHERE c.city_name = 'Lahore' OR d.department_name = 'Computer Science';

SELECT c.city_name, d.department_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
JOIN Department d ON s.department_id = d.department_id
GROUP BY c.city_name, d.department_name;

SELECT s2.student_name
FROM Students s1
JOIN Students s2 ON s1.city_id = s2.city_id
WHERE s1.student_name = 'Fatima Khan' AND s1.student_id != s2.student_id;

SELECT s2.student_name
FROM Students s1
JOIN Students s2 ON s1.department_id = s2.department_id
WHERE s1.student_name = 'Bilal Sheikh' AND s1.student_id != s2.student_id;

SELECT c.city_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
GROUP BY c.city_name
ORDER BY COUNT(s.student_id) DESC
LIMIT 1;

SELECT d.department_name
FROM Students s
JOIN Department d ON s.department_id = d.department_id
GROUP BY d.department_name
ORDER BY COUNT(s.student_id) DESC
LIMIT 1;

SELECT s.student_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
WHERE c.city_name = 'Peshawar';

SELECT c.city_name, d.department_name, COUNT(s.student_id) AS student_count
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
JOIN Department d ON s.department_id = d.department_id
GROUP BY c.city_name, d.department_name;

SELECT s.student_name
FROM Students s
JOIN Department d ON s.department_id = d.department_id
WHERE s.age > 21 AND d.department_name = 'Electrical Engineering';

SELECT s.student_name
FROM Students s
JOIN Department d ON s.department_id = d.department_id
WHERE s.age > 21 AND d.department_name = 'Electrical Engineering';

SELECT s.student_name, s.age, c.city_name, d.department_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
JOIN Department d ON s.department_id = d.department_id
WHERE s.age BETWEEN 20 AND 23;

SELECT c.city_name, AVG(s.age) AS average_age
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
GROUP BY c.city_name;

SELECT COUNT(*) AS student_count
FROM Students s
JOIN Department d ON s.department_id = d.department_id
WHERE d.department_name = 'Civil Engineering';

SELECT s.student_name, s.age, d.department_name
FROM Students s
JOIN Department d ON s.department_id = d.department_id
ORDER BY d.department_name, s.age;

SELECT s.student_name
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
JOIN Department d ON s.department_id = d.department_id
WHERE c.city_name = 'Rawalpindi' AND d.department_name = 'Mechanical Engineering';

SELECT s.student_name
FROM Students s
JOIN Department d ON s.department_id = d.department_id
WHERE d.department_name != 'Biotechnology';

SELECT d.department_name, s.student_name, MIN(s.age) AS youngest_age
FROM Students s
JOIN Department d ON s.department_id = d.department_id
GROUP BY d.department_name, s.student_name
ORDER BY youngest_age;

-- The End of Quries

