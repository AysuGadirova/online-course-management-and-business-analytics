-- 1. Müəllim cədvəli
CREATE TABLE teachers (
    teacher_id number PRIMARY key,
    full_name VARCHAR2(100) not null,
    specialization VARCHAR2(100),
    experience_year number,
    salary number,
    teacher_status VARCHAR2(20) CHECK (teacher_status IN ('ACTIVE', 'INACTIVE', 'ON_LEAVE'))
);


INSERT ALL 
INTO teachers(teacher_id, full_name,specialization,experience_year,salary,teacher_status) VALUES (1, 'Ali Mammadov', 'Oracle SQL', 5, 1800, 'ON_LEAVE')
INTO teachers(teacher_id, full_name,specialization,experience_year,salary,teacher_status) VALUES (2, 'Rəşad Qasımov', 'Python Data Science', 6, 2000, 'ACTIVE')
INTO teachers(teacher_id, full_name,specialization,experience_year,salary,teacher_status) VALUES (3, 'Günel Həsənova', 'Power BI Analytics', 4, 1500, 'INACTIVE')
INTO teachers(teacher_id, full_name,specialization,experience_year,salary,teacher_status) VALUES (4, 'Vüsal İsmayılov', 'Java Programming', 8, 2200, 'ACTIVE')
select * from dual;
select * from TEACHERS;



-- 2. Tələbə cədvəli
CREATE TABLE students (
    student_id number PRIMARY key,
    full_name VARCHAR2(100)not null,
    email VARCHAR2(100) UNIQUE,
    phone VARCHAR2(20),
    city VARCHAR2(50),
    student_status VARCHAR2(20) CHECK (student_status IN ('ACTIVE', 'INACTIVE', 'BLOCKED')),
    registration_date DATE DEFAULT SYSDATE
);

INSERT ALL 
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date)VALUES (1, 'Namiq Ceferov', 'namiq@gmail.com', '0501112233', 'Baku', 'ACTIVE', TO_DATE('01.09.2025', 'DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date) VALUES (2, 'Aysel Mammadova', 'aysel@gmail.com', '0552223344', 'Baku', 'ACTIVE', TO_DATE('15.09.2025','DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date)VALUES (3,'Rashad Aliyev', 'rashad@gmail.com', '0703334455', 'Ganja', 'ACTIVE', TO_DATE('10.10.2025', 'DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date) VALUES (4, 'Leyla Huseynova','leyla@gmail.com', '0504445566', 'Sumqayit', 'ACTIVE', TO_DATE('01.11.2025','DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date)VALUES (5,'Elvin Qasimov', 'elvin@gmail.com', '0515556677', 'Baku', 'INACTIVE', TO_DATE('12.12.2025', 'DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date)VALUES (6, 'Nargiz Hasanova', 'nargiz@gmail.com','0776667788', 'Baku', 'ACTIVE', TO_DATE('05.01.2026', 'DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date)VALUES (7,'Murad Ismayilov', 'murad@gmail.com', '0557778899', 'Ganja', 'INACTIVE', TO_DATE('20.01.2026','DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date) VALUES (8,'Kanan Ibrahimov','kanan@gmail.com','0508889900', 'Sumqayit', 'ACTIVE', TO_DATE('01.02.2026', 'DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date) VALUES (9,'Fidan Ceferova', 'fidan@gmail.com','0709990011', 'Baku', 'BLOCKED', TO_DATE('14.02.2026','DD.MM.YYYY'))
  INTO STUDENTS (student_id, full_name, email, phone, city, STUDENT_STATUS, registration_date) VALUES (10,'Orkhan Ahmadov', 'orkhan@gmail.com','0511110022', 'Baku', 'ACTIVE', TO_DATE('01.03.2026', 'DD.MM.YYYY'))
SELECT * FROM dual;
select * from students;

--3. Kurs cədvəli
CREATE TABLE courses (
    course_id NUMBER PRIMARY KeY,
    course_name VARCHAR2(150) NOT NULL,
    category VARCHAR2(50),
    price NUMBER,
    duration_month NUMBER,
    level_name VARCHAR2(20) CHECK (level_name IN ('BEGINNER', 'INTERMEDIATE', 'ADVANCED')),
    course_status VARCHAR2(20) CHECK (course_status IN ('OPEN', 'CLOSED', 'ARCHIVED')),
    teacher_id NUMBER REFERENCES teachers(teacher_id)
);

INSERT ALL 
  INTO COURSES (course_id, course_name, category, price, duration_month, level_name, course_status, teacher_id) VALUES (1, 'Oracle SQL Beginner', 'Database', 300, 2, 'BEGINNER', 'OPEN', 1)
  INTO COURSES (course_id, course_name, category, price, duration_month, level_name, course_status, teacher_id) VALUES (2, 'Oracle SQL Advanced', 'Database', 500, 3, 'ADVANCED', 'OPEN', 1)
  INTO COURSES (course_id, course_name, category, price, duration_month, level_name, course_status, teacher_id) VALUES (3, 'Python for Data Science', 'Data Analytics', 450, 4, 'INTERMEDIATE', 'OPEN', 2)
  INTO COURSES (course_id, course_name, category, price, duration_month, level_name, course_status, teacher_id) VALUES (4, 'Power BI and Dashboarding', 'Data Analytics', 350, 2, 'BEGINNER', 'OPEN', 3)
  INTO COURSES (course_id, course_name, category, price, duration_month, level_name, course_status, teacher_id) VALUES (5, 'Java Web Programming', 'Web Development', 600, 5, 'INTERMEDIATE', 'CLOSED', 4)
  INTO COURSES (course_id, course_name, category, price, duration_month, level_name, course_status, teacher_id) VALUES (6, 'UI/UX Graphic Design', 'Design', 400, 3, 'BEGINNER', 'ARCHIVED', 3)
SELECT * FROM dual;
select * from COURSES;


-- 4. Kursa yazılanlar 
CREATE TABLE enrollments (
    enrollment_id number PRIMARY KEY,
    student_id NUMBER REFERENCES students(student_id),
    course_id NUMBER REFERENCES courses(course_id),
    enrollment_date DATE DEFAULT SYSDATE, 
    enrollment_status VARCHAR2(20) CHECK (enrollment_status in ('ACTIVE', 'COMPLETED', 'DROPPED'))
);


INSERT ALL 
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (1, 1, 1, TO_DATE('10.01.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (2, 1, 2, TO_DATE('15.01.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (3, 2, 1, TO_DATE('11.01.2026', 'DD.MM.YYYY'), 'COMPLETED')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (4, 2, 3, TO_DATE('01.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (5, 3, 2, TO_DATE('12.01.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (6, 3, 4, TO_DATE('05.02.2026', 'DD.MM.YYYY'), 'DROPPED')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (7, 4, 3, TO_DATE('02.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (8, 5, 1, TO_DATE('14.01.2026', 'DD.MM.YYYY'), 'DROPPED')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (9, 6, 4, TO_DATE('06.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (10, 6, 5, TO_DATE('10.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (11, 7, 2, TO_DATE('20.01.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (12, 8, 3, TO_DATE('03.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (13, 9, 1, TO_DATE('25.01.2026', 'DD.MM.YYYY'), 'COMPLETED')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (14, 9, 6, TO_DATE('15.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
  INTO ENROLLMENTS (enrollment_id, student_id, course_id, enrollment_date, enrollment_status) VALUES (15, 10, 4, TO_DATE('08.02.2026', 'DD.MM.YYYY'), 'ACTIVE')
SELECT * FROM dual;
select * from ENROLLMENTS;


-- 5. Dərs cədvəli
CREATE TABLE lessons (
    lesson_id NUMBER PRIMARY KEY,
    course_id NUMBER REFERENCES courses(course_id),
    lesson_title VARCHAR2(150) NOT NULL,
    lesson_date DATE, 
    duration_min NUMBER,
    lesson_status VARCHAR2(20) CHECK (lesson_status IN ('PLANNED', 'COMPLETED', 'CANCELLED'))
);


INSERT ALL 
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (1, 1, 'Introduction to SQL', TO_DATE('15.01.2026', 'DD.MM.YYYY'), 90, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (2, 1, 'SELECT and WHERE Clauses', TO_DATE('18.01.2026', 'DD.MM.YYYY'), 90, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (3, 1, 'Group By and Aggregations', TO_DATE('22.01.2026', 'DD.MM.YYYY'), 90, 'PLANNED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (4, 2, 'Subqueries and CTEs', TO_DATE('20.01.2026', 'DD.MM.YYYY'), 120, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (5, 2, 'PL/SQL Basics', TO_DATE('25.01.2026', 'DD.MM.YYYY'), 120, 'CANCELLED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (6, 3, 'Python Fundamentals', TO_DATE('05.02.2026', 'DD.MM.YYYY'), 90, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (7, 3, 'Pandas Dataframes', TO_DATE('10.02.2026', 'DD.MM.YYYY'), 90, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (8, 3, 'Data Visualization', TO_DATE('15.02.2026', 'DD.MM.YYYY'), 90, 'PLANNED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (9, 4, 'Power BI Interface', TO_DATE('08.02.2026', 'DD.MM.YYYY'), 60, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (10, 4, 'DAX Measures', TO_DATE('12.02.2026', 'DD.MM.YYYY'), 90, 'PLANNED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (11, 5, 'Java OOP Concepts', TO_DATE('12.02.2026', 'DD.MM.YYYY'), 120, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (12, 5, 'Spring Boot Intro', TO_DATE('18.02.2026', 'DD.MM.YYYY'), 120, 'CANCELLED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (13, 6, 'Figma Principles', TO_DATE('16.02.2026', 'DD.MM.YYYY'), 90, 'COMPLETED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (14, 6, 'Prototyping', TO_DATE('20.02.2026', 'DD.MM.YYYY'), 90, 'PLANNED')
  INTO LESSONS (lesson_id, course_id, lesson_title, lesson_date, duration_min, lesson_status) VALUES (15, 1, 'Joins and Union', TO_DATE('28.01.2026', 'DD.MM.YYYY'), 90, 'PLANNED')
SELECT * FROM dual;
select * from lessons;


-- 6.Tapşırıqlar cədvəli 
CREATE TABLE assignments (
    assignment_id NUMBER PRIMARY KEY,
    course_id NUMBER REFERENCES courses(course_id),
    title VARCHAR2(150) NOT NULL,
    max_score NUMBER DEFAULT 100,
    deadline DATE,
    assignment_status VARCHAR2(20) CHECK (assignment_status IN ('OPEN', 'CLOSED', 'CANCELLED'))
);



INSERT ALL 
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (1, 1, 'SQL SELECT Practice', 100, TO_DATE('20.01.2026', 'DD.MM.YYYY'), 'CLOSED')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (2, 1, 'Aggregations Task', 100, TO_DATE('30.01.2026', 'DD.MM.YYYY'), 'OPEN')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (3, 2, 'Subqueries Homework', 100, TO_DATE('28.01.2026', 'DD.MM.YYYY'), 'CLOSED')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (4, 2, 'PL/SQL Function', 100, TO_DATE('10.02.2026', 'DD.MM.YYYY'), 'OPEN')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (5, 3, 'Python Basics Quiz', 50, TO_DATE('12.02.2026', 'DD.MM.YYYY'), 'CLOSED')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (6, 3, 'Pandas Cleaning Project', 100, TO_DATE('22.02.2026', 'DD.MM.YYYY'), 'OPEN')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (7, 4, 'Dashboard Mockup', 100, TO_DATE('15.02.2026', 'DD.MM.YYYY'), 'CLOSED')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (8, 4, 'DAX Calculation Task', 100, TO_DATE('25.02.2026', 'DD.MM.YYYY'), 'OPEN')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (9, 5, 'Java OOP Building', 100, TO_DATE('20.02.2026', 'DD.MM.YYYY'), 'CANCELLED')
  INTO ASSIGNMENTS (assignment_id, course_id, title, max_score, deadline, assignment_status) VALUES (10, 6, 'UI Wireframe Test', 100, TO_DATE('24.02.2026', 'DD.MM.YYYY'), 'OPEN')
SELECT * FROM dual;
select * from ASSIGNMENTS;

-- 7. Nəticələr cədvəli 
CREATE TABLE submissions ( 
    submission_id NUMBER PRIMARY KEY,
    assignment_id NUMBER REFERENCES assignments(assignment_id),
    student_id NUMBER REFERENCES students(student_id),
    submitted_date DATE,
    score NUMBER CHECK (score BETWEEN 0 AND 100),
    submission_status VARCHAR2(20) CHECK (submission_status IN ('SUBMITTED', 'LATE', 'NOT_SUBMITTED', 'GRADED'))
);


INSERT ALL 
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (1, 1, 1, TO_DATE('19.01.2026', 'DD.MM.YYYY'), 95, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (2, 1, 2, TO_DATE('20.01.2026', 'DD.MM.YYYY'), 85, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (3, 1, 9, TO_DATE('21.01.2026', 'DD.MM.YYYY'), 70, 'LATE')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (4, 2, 1, TO_DATE('29.01.2026', 'DD.MM.YYYY'), 90, 'SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (5, 2, 5, NULL, 0, 'NOT_SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (6, 3, 1, TO_DATE('27.01.2026', 'DD.MM.YYYY'), 88, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (7, 3, 3, TO_DATE('28.01.2026', 'DD.MM.YYYY'), 100, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (8, 3, 7, TO_DATE('29.01.2026', 'DD.MM.YYYY'), 65, 'LATE')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (9, 4, 3, TO_DATE('09.02.2026', 'DD.MM.YYYY'), 0, 'SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (10, 5, 2, TO_DATE('11.02.2026', 'DD.MM.YYYY'), 48, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (11, 5, 4, TO_DATE('12.02.2026', 'DD.MM.YYYY'), 42, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (12, 5, 8, TO_DATE('13.02.2026', 'DD.MM.YYYY'), 35, 'LATE')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (13, 6, 2, NULL, 0, 'NOT_SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (14, 7, 6, TO_DATE('14.02.2026', 'DD.MM.YYYY'), 92, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (15, 7, 10, TO_DATE('15.02.2026', 'DD.MM.YYYY'), 80, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (16, 8, 6, TO_DATE('24.02.2026', 'DD.MM.YYYY'), 0, 'SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (17, 9, 6, NULL, 0, 'NOT_SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (18, 10, 9, TO_DATE('23.02.2026', 'DD.MM.YYYY'), 96, 'GRADED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (19, 10, 3, NULL, 0, 'NOT_SUBMITTED')
  INTO SUBMISSIONS (submission_id, assignment_id, student_id, submitted_date, score, submission_status) VALUES (20, 1, 5, TO_DATE('22.01.2026', 'DD.MM.YYYY'), 50, 'LATE')
SELECT * FROM dual;
select * from submissions;

-- 8. Ödənişlər cədvəli 
CREATE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    student_id NUMBER REFERENCES students(student_id),
    course_id NUMBER REFERENCES courses(course_id),
    amount NUMBER CHECK (amount > 0),
    payment_date DATE DEFAULT SYSDATE,
    payment_method VARCHAR2(20) CHECK (payment_method IN ('CASH', 'CARD', 'TRANSFER')),
    payment_status VARCHAR2(20) CHECK (payment_status IN ('PAID', 'PENDING', 'FAILED', 'REFUNDED'))
);


INSERT ALL 
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (1, 1, 1, 300, TO_DATE('10.01.2026', 'DD.MM.YYYY'), 'CARD', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (2, 1, 2, 500, TO_DATE('15.01.2026', 'DD.MM.YYYY'), 'TRANSFER', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (3, 2, 1, 300, TO_DATE('11.01.2026', 'DD.MM.YYYY'), 'CASH', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (4, 2, 3, 450, TO_DATE('01.02.2026', 'DD.MM.YYYY'), 'CARD', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (5, 3, 2, 500, TO_DATE('12.01.2026', 'DD.MM.YYYY'), 'TRANSFER', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (6, 3, 4, 350, TO_DATE('05.02.2026', 'DD.MM.YYYY'), 'CARD', 'REFUNDED')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (7, 4, 3, 450, TO_DATE('02.02.2026', 'DD.MM.YYYY'), 'CARD', 'PENDING')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (8, 5, 1, 300, TO_DATE('14.01.2026', 'DD.MM.YYYY'), 'CASH', 'FAILED')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (9, 6, 4, 350, TO_DATE('06.02.2026', 'DD.MM.YYYY'), 'CARD', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (10, 6, 5, 600, TO_DATE('10.02.2026', 'DD.MM.YYYY'), 'TRANSFER', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (11, 7, 2, 500, TO_DATE('20.01.2026', 'DD.MM.YYYY'), 'CARD', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (12, 8, 3, 450, TO_DATE('03.02.2026', 'DD.MM.YYYY'), 'CASH', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (13, 9, 1, 300, TO_DATE('25.01.2026', 'DD.MM.YYYY'), 'CARD', 'PAID')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (14, 9, 6, 400, TO_DATE('15.02.2026', 'DD.MM.YYYY'), 'CARD', 'PENDING')
  INTO PAYMENTS (payment_id, student_id, course_id, amount, payment_date, payment_method, payment_status) VALUES (15, 10, 4, 350, TO_DATE('08.02.2026', 'DD.MM.YYYY'), 'TRANSFER', 'PAID')
SELECT * FROM dual;
select * from PAYMENTS;


---------------- Sadə SELECT sorğuları----------------

-- 1. Bütün tələbələri göstərin. 
select STUDENT_ID, FULL_NAME from STUDENTS;

-- 2.Yalnız ACTIVE tələbələri göstərin
select full_name,student_status from STUDENTS where STUDENT_STATUS = 'ACTIVE';

-- 3.	Bakı şəhərindən olan tələbələri göstərin. 
select full_name, CITY from students where city = 'Baku';

-- 4.	Qiyməti 300-dən böyük olan kursları göstərin. 
select course_name,price from COURSES where price > 300;

-- 5.	OPEN statuslu kursları göstərin
select course_name, course_status from COURSES where course_status = 'OPEN';


------------ JOIN sorğuları---------------

-- 6.	Hər kursun müəllimini göstərin. 
select c.course_name, t.full_name as teacher_name from COURSES c
JOIN TEACHERS t on t.teacher_id = c.teacher_id;

-- 7.	Hansı tələbə hansı kursa yazılıb? 
SELECT s.full_name AS student_name, c.course_name FROM ENROLLMENTS e
JOIN STUDENTS s on e.student_id = s.student_id
JOIN COURSES c on e.course_id = c.course_id;

-- 8.	Hər tələbənin etdiyi ödənişləri göstərin
select s.full_name as student_name,p. amount from STUDENTS s
join PAYMENTS p on s.student_id = p.student_id;

-- 9.	Hər kursun dərslərini göstərin
select l.lesson_title, c.course_name from LESSONS l 
join COURSES c on l.course_id = c.course_id;

-- 10.	Tələbələrin tapşırıq nəticələrini göstərin
select s.full_name as student_name,a.title, sb.score from students s 
join submissions sb  on s.student_id = sb.student_id
join ASSIGNMENTS a on a.assignment_id = sb.assignment_id;


-----------------GROUP BY sorğuları---------------------

-- 11.	Hər kurs üzrə tələbə sayı. 
select course_name,count(STUDENT_ID) as student_total  from ENROLLMENTS e
join courses c on e.course_id = c.course_id
group by course_name;

-- 12.	Hər müəllim üzrə kurs sayı
select full_name as teacher_name, count(course_id)from TEACHERS t
join COURSES c on t.teacher_id = c.teacher_id
GROUP by full_name;

-- 13.	Hər kurs üzrə ümumi gəlir. 
select course_name, sum(amount)as revenue from COURSES c 
join PAYMENTS p on c.course_id = p.course_id
WHERE p.payment_status = 'PAID'
GROUP by course_name;

-- 14.	Hər şəhər üzrə tələbə sayı. 
select city, count(student_id) student_total from students 
GROUP by CITY;

-- 15.	Hər ödəniş üsulu üzrə ümumi gəlir. 
SELECT payment_method, sum(amount) from PAYMENTS 
group by payment_method;

-------------------Analitik sorğular----------------------------

-- 16.	Ən çox gəlir gətirən kursu tapın. 
select course_name, sum(amount) as total_money from COURSES c
join PAYMENTS p on p.course_id = c.course_id
GROUP by course_name
order by total_money desc
fetch first 1 row only;

-- 17.	Ən çox tələbəsi olan kursu tapın
select course_name, count(student_id) as total_student from ENROLLMENTS e
join COURSES c on e.course_id = c.course_id
GROUP by course_name
order by total_student desc
fetch first 1 row only;

-- 18.	Ortalama balı 80-dən yuxarı olan tələbələri tapın
select full_name as student_name,avg(score) as balls from STUDENTS s
join submissions sb on sb.student_id = s.student_id
group by full_name
having avg(score) > 80 order by student_name desc;

-- 19.	Hər kurs üzrə tamamlanma faizini hesablayın. 
select course_name, COUNT(e.student_id) AS total_students,
ROUND(COUNT(CASE WHEN e.enrollment_status = 'COMPLETED' THEN 1 END) * 100.0 / COUNT(e.student_id),2) from COURSES c
join ENROLLMENTS e on c.course_id = e.course_id
Group by c.course_id, c.course_name;

-- 20.	Tələbələri orta bala görə sıralayın
select full_name as student_name, ROUND(avg(score),2) from STUDENTS s
join SUBMISSIONS sb on sb.student_id = s.student_id
GROUP by full_name
order by ROUND(avg(score),2) desc;


------------------- 5 ƏSAS HESABAT SORĞUSU------------------

-- 1. Maliyyə Hesabatı: Müəllimlərin kurslardan gətirdiyi ümumi gəlir və xalis mənfəət
select t.full_name AS teacher_name, COUNT(DISTINCT c.course_id) as total_courses, NVL(SUM(p.amount), 0) AS total_revenue, t.salary as teacher_salary,(NVL(SUM(p.amount), 0) - t.salary) AS net
from teachers t
LEFT JOIN courses c ON t.teacher_id = c.teacher_id
LEFT JOIN payments p ON c.course_id = p.course_id AND p.payment_status = 'PAID'
GROUP BY t.teacher_id, t.full_name, t.salary;

-- 2. Akadimik Performans Hesabatı: Tələbələrin kurslar üzrə aktivliyi və ortalama balları
select s.full_name AS student_name,COUNT(DISTINCT e.course_id) AS enrolled_courses,COUNT(sub.submission_id) AS total_submissions, NVL(ROUND(AVG(sub.score), 2), 0) AS avg_score,CASE 
WHEN AVG(sub.score) >= 85 THEN 'EXCELLENT'
WHEN AVG(sub.score) >= 70 THEN 'GOOD'
ELSE 'NEEDS_IMPROVEMENT'
END AS academic_rating
from students s
JOIN enrollments e On s.student_id = e.student_id
LEFT JOIN submissions sub ON s.student_id = sub.student_id
group BY s.student_id, s.full_name;

-- 3. Kurs Konversiya Hesabatı: Ödənilmiş gəlir vs. İmtina (Refund) nisbəti
SELECT c.course_name,COUNT(p.payment_id) AS total_transactions,SUM(CASE WHEN p.payment_status = 'PAID' THEN p.amount ELSE 0 END) AS successful_revenue,SUM(CASE WHEN p.payment_status = 'REFUNDED' THEN p.amount ELSE 0 END) AS refunded_amount,ROUND(SUM(CASE WHEN p.payment_status = 'REFUNDED' THEN 1 ELSE 0 END) * 100.0 / COUNT(p.payment_id), 2) AS refund_rate_pct
FROM courses c
LEFT JOIN payments p on c.course_id = p.course_id
GROUP by c.course_id, c.course_name;

-- 4. Şəhərlər Üzrə Tələbə və Gəlir Paylanması Hesabatı
SELECT s.city,COUNT(DISTINCT s.student_id) AS total_students,SUM(CASE WHEN p.payment_status = 'PAID' THEN p.amount ELSE 0 END) AS total_city_revenue
from students s
LEFT JOIN payments p ON s.student_id = p.student_id
GROUP BY s.city
order BY total_city_revenue DESC;

-- 5. Dərs İcra Hesabatı: Ləğv olunmuş və Tamamlanmış dərslərin faizi
select c.course_name, COUNT(l.lesson_id) AS total_lessons,coUNT(CASE WHEN l.lesson_status = 'COMPLETED' THEN 1 END) AS completed_lessons,COUNT(CASE WHEN l.lesson_status = 'CANCELLED' THEN 1 END) AS cancelled_lessons,ROUND(COUNT(CASE WHEN l.lesson_status = 'COMPLETED' THEN 1 END) * 100.0 / COUNT(l.lesson_id), 1) AS completion_rate
from courses c
join lessons l ON c.course_id = l.course_id
GROUP by c.course_id, c.course_name;