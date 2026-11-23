--1--
CREATE DATABASE university_db;
--2--
CREATE TABLE students (
    student_id  INT PRIMARY KEY ,
    full_name VARCHAR(60) NOT NULL,
    email VARCHAR(100) UNIQUE ,
    age INT ,
    registration_date  DATE DEFAULT (CURRENT_DATE),
    registration_time  TIME DEFAULT (CURRENT_TIME),
    created_at  DATETIME DEFAULT (CURRENT_TIMESTAMP),
    CONSTRAINT check_age CHECK (age >= 18)
);
--3--
INSERT INTO students (student_id, full_name, email, age, registration_date, registration_time, created_at)
VALUES
  (1, 'HOUSSEIN', 'HOUSSEIN@GMAIL.COM', 18, DEFAULT, DEFAULT, DEFAULT),
  (2, 'ALICE', 'ALICE@GMAIL.COM', 20, '2024-06-17', '09:30:00', '2024-06-17 09:30:00');

--4--
DROP DATABASE university_db;
--5--
CREATE DATABASE university_db;
--6--
CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);
--7--
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(60) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT ,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);
--8--
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(60)NOT NULL
);
--9--
CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE

);
--10--
CREATE TABLE health_records (
    record_id INT PRIMARY KEY,
    student_id  INT ,
    blood_group VARCHAR(60),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE 
)

--11--
INSERT INTO departments VALUES
(1, 'computer science'),
(2,'mathematics'),
(3,'physics');

INSERT INTO courses VALUES
(1,'database systems',4,1),
(2,'algorithms ',3,1),
(3,'calculus ',4,2),
(4,'quantum mechanics',5,3);

INSERT INTO students VALUES 
(1,'alice'),
(2,'bob'),
(3,'charlie'),
(4,'samy'),
(5,'eva');
INSERT INTO enrollments VALUES
(1,1,1),
(2,1,2),
(3,2,1),
(4,3,2),
(5,3,3),
(6,4,3),
(7,4,4);
INSERT INTO health_records VALUES
(1,1,'A+'),
(2,2,'B+'),
(3,3,'O-'),
(4,4,'AB+'),
(5,5,'A-');
--done--