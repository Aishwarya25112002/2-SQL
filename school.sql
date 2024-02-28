/*
Create a new database called "School" this database
should have two tables: teachers and students.
The students table should have columns for 
student_id, first_name,last_name, homeroom_number, 
phone,email, and graduation year.*/

CREATE TABLE students(
student_id serial PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number integer,
phone VARCHAR(255) NOT NULL UNIQUE,
email VARCHAR(50) UNIQUE,
graduation_year integer
);

/* 2)
The teachers table should have columns for 
teacher_id, first_name, last_name,
homeroom_number, department, email, and phone.*/

CREATE TABLE teachers(
teacher_id serial PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number integer,
department VARCHAR(50),
phone VARCHAR(255) UNIQUE,
email VARCHAR(50) UNIQUE
);

/*Once you've made the tables, insert a student 
named Rahul Galande (student_id=1) who has a phone 
number of 7775551234 and  have an email Rahul.galande@gmail.com. 
He graduates in 2023 and has 5 as a homeroom number.*/

INSERT INTO students(first_name, last_name, homeroom_number, phone)
VALUES ('Rahul', 'Galande', 5, '777-555-1234');
SELECT * FROM students;

/*Then insert a teacher names Chandrashekhar Gogte (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. His contact info is: Chandrashekhar.gogte@gamil.com and 
a phone number of 7775554321*/

INSERT INTO teachers (teacher_id, first_name, last_name, homeroom_number, department, email,phone)
VALUES (1, 'Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org','777-555-4321');

select * from teachers
