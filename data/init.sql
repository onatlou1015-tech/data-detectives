-- ============================================================
-- DATA DETECTIVES — School Database
-- For Grade 10 SQL Unit (7 Weeks)
-- Import via phpMyAdmin → Import → Choose File → Go
-- ============================================================

-- Create and select the database
CREATE DATABASE IF NOT EXISTS data_detectives
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE data_detectives;

-- ============================================================
-- TABLE 1: students
-- ============================================================
DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  grade INT NOT NULL,
  section VARCHAR(10) NOT NULL,
  age INT NOT NULL,
  gender VARCHAR(10) NOT NULL
);

INSERT INTO students (name, grade, section, age, gender) VALUES
('Juan Dela Cruz', 10, 'A', 15, 'M'),
('Maria Santos', 10, 'A', 16, 'F'),
('Pedro Reyes', 10, 'B', 15, 'M'),
('Ana Lopez', 10, 'B', 16, 'F'),
('Jose Ramos', 10, 'A', 15, 'M'),
('Liza Mendoza', 10, 'A', 15, 'F'),
('Carlos Garcia', 10, 'B', 16, 'M'),
('Sofia Torres', 10, 'C', 15, 'F'),
('Miguel Flores', 10, 'C', 15, 'M'),
('Isabella Cruz', 10, 'A', 16, 'F'),
('Rafael Bautista', 10, 'B', 15, 'M'),
('Camila Reyes', 10, 'C', 16, 'F'),
('Diego Aquino', 11, 'A', 16, 'M'),
('Samantha Lim', 11, 'A', 17, 'F'),
('Gabriel Tan', 11, 'B', 16, 'M'),
('Bianca Villanueva', 11, 'B', 17, 'F'),
('Nathan Ong', 11, 'C', 16, 'M'),
('Chloe Ramos', 11, 'C', 17, 'F'),
('Ethan Mercado', 11, 'A', 16, 'M'),
('Sophia dela Rosa', 11, 'B', 17, 'F'),
('Liam Castillo', 12, 'A', 17, 'M'),
('Ava Fernandez', 12, 'A', 18, 'F'),
('Noah Gutierrez', 12, 'B', 17, 'M'),
('Mia Domingo', 12, 'B', 18, 'F'),
('Lucas Navarro', 12, 'C', 17, 'M'),
('Emma Salazar', 12, 'C', 18, 'F'),
('Jacob Padilla', 12, 'A', 17, 'M'),
('Olivia Rivera', 12, 'B', 18, 'F'),
('William Aguilar', 10, 'A', 15, 'M'),
('Grace Morales', 10, 'B', 16, 'F'),
('Daniel Roxas', 10, 'C', 15, 'M'),
('Hannah Yap', 10, 'A', 16, 'F'),
('Matthew Sy', 11, 'A', 16, 'M'),
('Natalie Uy', 11, 'B', 17, 'F'),
('Joshua Co', 11, 'C', 16, 'M'),
('Kaitlyn Go', 12, 'A', 17, 'F'),
('Andrew Chua', 12, 'B', 18, 'M'),
('Stephanie Tan', 12, 'C', 17, 'F'),
('Benjamin Lee', 10, 'B', 15, 'M'),
('Victoria Lim', 10, 'C', 16, 'F');

-- ============================================================
-- TABLE 2: subjects
-- ============================================================
DROP TABLE IF EXISTS subjects;

CREATE TABLE subjects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  teacher VARCHAR(50) NOT NULL
);

INSERT INTO subjects (name, teacher) VALUES
('Mathematics', 'Mr. Cruz'),
('Science', 'Ms. Reyes'),
('English', 'Mrs. Santos'),
('Filipino', 'Mr. Bautista'),
('Social Studies', 'Ms. Garcia'),
('Computer', 'Mr. Tan'),
('PE', 'Coach Ramos'),
('Arts', 'Ms. Lopez');

-- ============================================================
-- TABLE 3: scores
-- ============================================================
DROP TABLE IF EXISTS scores;

CREATE TABLE scores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  score INT NOT NULL,
  exam_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

INSERT INTO scores (student_id, subject_id, score, exam_date) VALUES
(1, 1, 88, '2024-09-15'), (1, 2, 92, '2024-09-16'), (1, 3, 85, '2024-09-17'),
(2, 1, 95, '2024-09-15'), (2, 2, 89, '2024-09-16'), (2, 3, 91, '2024-09-17'),
(3, 1, 78, '2024-09-15'), (3, 2, 82, '2024-09-16'), (3, 3, 75, '2024-09-17'),
(4, 1, 90, '2024-09-15'), (4, 2, 94, '2024-09-16'), (4, 3, 88, '2024-09-17'),
(5, 1, 85, '2024-09-15'), (5, 2, 87, '2024-09-16'), (5, 3, 82, '2024-09-17'),
(6, 1, 92, '2024-09-15'), (6, 2, 90, '2024-09-16'), (6, 3, 89, '2024-09-17'),
(7, 1, 70, '2024-09-15'), (7, 2, 75, '2024-09-16'), (7, 3, 72, '2024-09-17'),
(8, 1, 88, '2024-09-15'), (8, 2, 85, '2024-09-16'), (8, 3, 90, '2024-09-17'),
(9, 1, 80, '2024-09-15'), (9, 2, 78, '2024-09-16'), (9, 3, 83, '2024-09-17'),
(10, 1, 96, '2024-09-15'), (10, 2, 98, '2024-09-16'), (10, 3, 94, '2024-09-17'),
(11, 1, 84, '2024-09-15'), (11, 2, 86, '2024-09-16'), (11, 3, 81, '2024-09-17'),
(12, 1, 91, '2024-09-15'), (12, 2, 93, '2024-09-16'), (12, 3, 88, '2024-09-17'),
(13, 1, 87, '2024-09-15'), (13, 2, 84, '2024-09-16'), (13, 3, 90, '2024-09-17'),
(14, 1, 93, '2024-09-15'), (14, 2, 95, '2024-09-16'), (14, 3, 92, '2024-09-17'),
(15, 1, 76, '2024-09-15'), (15, 2, 79, '2024-09-16'), (15, 3, 74, '2024-09-17'),
(16, 1, 89, '2024-09-15'), (16, 2, 91, '2024-09-16'), (16, 3, 87, '2024-09-17'),
(17, 1, 82, '2024-09-15'), (17, 2, 85, '2024-09-16'), (17, 3, 80, '2024-09-17'),
(18, 1, 94, '2024-09-15'), (18, 2, 96, '2024-09-16'), (18, 3, 93, '2024-09-17'),
(19, 1, 81, '2024-09-15'), (19, 2, 83, '2024-09-16'), (19, 3, 78, '2024-09-17'),
(20, 1, 90, '2024-09-15'), (20, 2, 92, '2024-09-16'), (20, 3, 89, '2024-09-17'),
(21, 1, 85, '2024-09-15'), (21, 2, 88, '2024-09-16'), (21, 3, 84, '2024-09-17'),
(22, 1, 92, '2024-09-15'), (22, 2, 94, '2024-09-16'), (22, 3, 91, '2024-09-17'),
(23, 1, 79, '2024-09-15'), (23, 2, 81, '2024-09-16'), (23, 3, 76, '2024-09-17'),
(24, 1, 88, '2024-09-15'), (24, 2, 90, '2024-09-16'), (24, 3, 86, '2024-09-17'),
(25, 1, 94, '2024-09-15'), (25, 2, 96, '2024-09-16'), (25, 3, 92, '2024-09-17'),
(26, 1, 77, '2024-09-15'), (26, 2, 80, '2024-09-16'), (26, 3, 75, '2024-09-17'),
(27, 1, 91, '2024-09-15'), (27, 2, 93, '2024-09-16'), (27, 3, 88, '2024-09-17'),
(28, 1, 86, '2024-09-15'), (28, 2, 89, '2024-09-16'), (28, 3, 84, '2024-09-17'),
(29, 1, 83, '2024-09-15'), (29, 2, 85, '2024-09-16'), (29, 3, 82, '2024-09-17'),
(30, 1, 90, '2024-09-15'), (30, 2, 92, '2024-09-16'), (30, 3, 87, '2024-09-17'),
(31, 1, 88, '2024-09-15'), (31, 2, 90, '2024-09-16'), (31, 3, 85, '2024-09-17'),
(32, 1, 95, '2024-09-15'), (32, 2, 97, '2024-09-16'), (32, 3, 93, '2024-09-17'),
(33, 1, 80, '2024-09-15'), (33, 2, 82, '2024-09-16'), (33, 3, 78, '2024-09-17'),
(34, 1, 92, '2024-09-15'), (34, 2, 94, '2024-09-16'), (34, 3, 90, '2024-09-17'),
(35, 1, 84, '2024-09-15'), (35, 2, 86, '2024-09-16'), (35, 3, 82, '2024-09-17'),
(36, 1, 89, '2024-09-15'), (36, 2, 91, '2024-09-16'), (36, 3, 87, '2024-09-17'),
(37, 1, 76, '2024-09-15'), (37, 2, 79, '2024-09-16'), (37, 3, 74, '2024-09-17'),
(38, 1, 93, '2024-09-15'), (38, 2, 95, '2024-09-16'), (38, 3, 91, '2024-09-17'),
(39, 1, 87, '2024-09-15'), (39, 2, 89, '2024-09-16'), (39, 3, 85, '2024-09-17'),
(40, 1, 90, '2024-09-15'), (40, 2, 92, '2024-09-16'), (40, 3, 88, '2024-09-17');

-- ============================================================
-- TABLE 4: attendance
-- ============================================================
DROP TABLE IF EXISTS attendance;

CREATE TABLE attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  date DATE NOT NULL,
  status VARCHAR(10) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO attendance (student_id, date, status) VALUES
(1, '2024-09-16', 'Present'), (2, '2024-09-16', 'Present'),
(3, '2024-09-16', 'Absent'), (4, '2024-09-16', 'Present'),
(5, '2024-09-16', 'Late'), (6, '2024-09-16', 'Present'),
(7, '2024-09-16', 'Present'), (8, '2024-09-16', 'Absent'),
(9, '2024-09-16', 'Present'), (10, '2024-09-16', 'Present'),
(11, '2024-09-16', 'Present'), (12, '2024-09-16', 'Late'),
(13, '2024-09-16', 'Present'), (14, '2024-09-16', 'Present'),
(15, '2024-09-16', 'Absent'), (16, '2024-09-16', 'Present'),
(17, '2024-09-16', 'Present'), (18, '2024-09-16', 'Present'),
(19, '2024-09-16', 'Late'), (20, '2024-09-16', 'Present');

-- ============================================================
-- TABLE 5: canteen_items
-- ============================================================
DROP TABLE IF EXISTS canteen_items;

CREATE TABLE canteen_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price DECIMAL(6,2) NOT NULL,
  category VARCHAR(30) NOT NULL
);

INSERT INTO canteen_items (name, price, category) VALUES
('Rice Meal', 50.00, 'Main'),
('Sandwich', 25.00, 'Snack'),
('Pizza Slice', 30.00, 'Snack'),
('Juice', 15.00, 'Drink'),
('Water', 10.00, 'Drink'),
('Pancit', 35.00, 'Main'),
('Siopao', 20.00, 'Snack'),
('Softdrinks', 20.00, 'Drink'),
('Fries', 25.00, 'Snack'),
('Burger', 40.00, 'Main');

-- ============================================================
-- TABLE 6: canteen_sales
-- ============================================================
DROP TABLE IF EXISTS canteen_sales;

CREATE TABLE canteen_sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT NOT NULL,
  quantity INT NOT NULL,
  sale_date DATE NOT NULL,
  FOREIGN KEY (item_id) REFERENCES canteen_items(id)
);

INSERT INTO canteen_sales (item_id, quantity, sale_date) VALUES
(1, 45, '2024-09-16'), (2, 60, '2024-09-16'),
(3, 55, '2024-09-16'), (4, 80, '2024-09-16'),
(5, 90, '2024-09-16'), (6, 30, '2024-09-16'),
(7, 40, '2024-09-16'), (8, 70, '2024-09-16'),
(9, 50, '2024-09-16'), (10, 35, '2024-09-16'),
(1, 50, '2024-09-17'), (2, 55, '2024-09-17'),
(3, 60, '2024-09-17'), (4, 75, '2024-09-17'),
(5, 85, '2024-09-17'), (6, 28, '2024-09-17'),
(7, 45, '2024-09-17'), (8, 65, '2024-09-17'),
(9, 48, '2024-09-17'), (10, 40, '2024-09-17'),
(1, 48, '2024-09-18'), (2, 62, '2024-09-18'),
(3, 58, '2024-09-18'), (4, 82, '2024-09-18'),
(5, 88, '2024-09-18'), (6, 32, '2024-09-18'),
(7, 42, '2024-09-18'), (8, 68, '2024-09-18'),
(9, 52, '2024-09-18'), (10, 38, '2024-09-18'),
(1, 52, '2024-09-19'), (2, 58, '2024-09-19'),
(3, 62, '2024-09-19'), (4, 78, '2024-09-19'),
(5, 92, '2024-09-19'), (6, 35, '2024-09-19'),
(7, 48, '2024-09-19'), (8, 72, '2024-09-19'),
(9, 55, '2024-09-19'), (10, 42, '2024-09-19'),
(1, 47, '2024-09-20'), (2, 65, '2024-09-20'),
(3, 60, '2024-09-20'), (4, 85, '2024-09-20'),
(5, 95, '2024-09-20'), (6, 33, '2024-09-20'),
(7, 46, '2024-09-20'), (8, 75, '2024-09-20'),
(9, 50, '2024-09-20'), (10, 40, '2024-09-20');

-- ============================================================
-- VERIFY TABLES
-- ============================================================
SELECT 'students' AS table_name, COUNT(*) AS records FROM students
UNION ALL
SELECT 'subjects', COUNT(*) FROM subjects
UNION ALL
SELECT 'scores', COUNT(*) FROM scores
UNION ALL
SELECT 'attendance', COUNT(*) FROM attendance
UNION ALL
SELECT 'canteen_items', COUNT(*) FROM canteen_items
UNION ALL
SELECT 'canteen_sales', COUNT(*) FROM canteen_sales;