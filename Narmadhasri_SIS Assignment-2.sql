--Student Information System (SIS) 

--Task 1. Database Design:

create database SISDB

--Students table

create table students(student_id int primary key,first_name varchar(50),last_name varchar(50),date_of_birth date,email varchar(100),phone varchar(20))
insert into students(student_id,first_name,last_name,date_of_birth,email,phone)
values(1,'Narmadha','Sri','2003-06-12','sri@gmail.com','9976607923'),
(2,'Haadya ','Balan','2003-08-28','haadya@gmail.com','909075427'),
(3,'Hridya','Balan','2003-08-28','hridya@gmail.com','909075427'),
(4,'Lingistar','K','2002-08-22','star@gmail.com','909075427'),
(5,'Kumaresan','Paramasivam','2002-04-15','kumaresan@gmail.com','909075427'),
(6,'Nimi','Chenthamarai','2002-07-28','nimisnimi@gmail.com','909075427'),
(7,'Mekala','Sekar','2003-04-16','mekala@gmail.com','909075427'),
(8,'Menaka','Hari','2002-03-16','menu@gmail.com','909075427'),
(9,'Hema','Murugananthprabhu','2003-06-01','hema@gmail.com','909075427'),
(10,'Mohanaprabha','Mani','2003-04-14','mona@gmail.com','909075427'),
(11,'Vinay','Karthick','2002-12-24','vinay2gmail.com','909075427'),
(12,'Elamathi ','Palanisamy','2003-06-04','ela@gmail.vom','909075427');



--Courses table

create table courses(course_id int primary key,course_name varchar(100),credits int,teacher_id int references teacher(teacher_id))
insert into courses(course_id,course_name,credits,teacher_id)
values(101,'C programming',8,1),
(102,'Java Programming',10,5),
(103,'Python',10,6),
(104,'Data Structures',9,5),
(105,'C# Programming',8,2),
(106,'Discrete Mathematics ',5,7),
(107,'Algebra',6,7),
(108,'Number Theory',6,3),
(109,'Probability',7,9),
(110,'Statistics',7,9),
(111,'Ethics in Engineering',5,8),
(112,'DBMS',9,10);


--Enrollments table

create table enrollments(enrollment_id int primary key,student_id int references students(student_id),course_id int references courses(course_id),enrollment_date date)
insert into enrollments(enrollment_id,student_id,course_id,enrollment_date)
values(1,3,101,'2024-03-01')
(2,1,101,'2024-03-02'),
(3,2,103,'2024-04-01'),
(4,8,108,'2024-01-12'),
(5,4,103,'2024-04-01'),
(6,9,108,'2023-12-28'),
(7,5,103,'2024-01-01'),
(8,6,109,'2024-01-25'),
(9,7,102,'2024-01-11'),
(10,6,106,'2024-01-25'),
(11,7,111,'2024-04-04'),
(12,4,104,'2024-04-01'),
(13,5,101,'2024-04-09');



--Teacher table

create table teacher(teacher_id int primary key,t_firstname varchar (50),t_lastname varchar(50),t_email varchar(100))
insert into teacher(teacher_id,t_firstname,t_lastname,t_email)
values(1,'Teena','Charlie','teena@gmail.com'),
(2,'Sharmila','Chinnadurai','sharmi@gmail.com'),
(3,'Yash','Anand','anand@gmail.com'),
(4,'Varun','kumar','varun@gmail.com'),
(5,'dinesh','Kumar','dinesh@gmail.com'),
(6,'Nandhini','Ravi','nandhi@gmail.com'),
(7,'Mythili','Mani','mythz@gmail.com'),
(8,'Thilak','Karthick','thilak@gmail.com'),
(9,'Reena','Singh','reena@gmail.com'),
(10,'Keeran','T','keeran@gmail.com');


--Payments table

create table payments(payment_id int primary key,student_id int references students(student_id),amount int, payment_date date)
insert into payments(payment_id,student_id,amount,payment_date)
values(1,10,2000,'2024-02-12'),
(2,2,1700,'2024-02-12'),
(3,8,1700,'2024-02-12'),
(4,1,2000,'2024-02-12'),
(5,3,5000,'2024-02-12'),
(6,5,1000,'2024-02-12'),
(7,4,800,'2024-02-12'),
(8,6,900,'2024-02-12'),
(9,9,1700,'2024-02-12'),
(10,7,2000,'2024-02-12'),
(11,1,2000,'2024-02-12');


--Tasks 2: Select, Where, Between, AND, LIKE: 


select * from students
select * from courses
select * from enrollments
select * from payments
select * from teacher 

/*--1. Write an SQL query to insert a new student into the "Students" table with the following details  a. First Name: John b. Last Name: Doe c. Date of Birth: 1995-08-15 d. Email: john.doe@example.com e. Phone Number: 1234567890 */

insert into students(student_id,first_name,last_name,date_of_birth,email,phone) values(12,'John','Doe','1995-08-15','john.doe@example.com','1234567890')


/*2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date. */

insert into enrollments(enrollment_id,student_id,course_id,enrollment_date) values(13,5,101,'2024-04-09')


--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address. 

update teacher set t_email='keeran@gmail.com' where teacher_id=10

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table.Select an enrollment record based on the student and course. 

delete from enrollments where student_id=12

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables. 

select * from courses update courses set teacher_id=9 where course_name='Probability'

/*6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity. */

begin transaction
delete from students where student_id=12
delete from enrollments where student_id=12
commit transaction


--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount

update payments set amount=1700 where amount=1500



--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins: 


select * from students
select * from courses
select * from enrollments
select * from payments
select * from teacher

/*1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID. */

select s.first_name,sum(p.amount) as total_amount from students s
inner join payments p on s.student_id=p.student_id group by s.first_name


/*2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table. */


select c.course_name,count(e.student_id) as total_students from courses c
inner join enrollments e on c.course_id=e.course_id
group by c.course_name order by total_students desc


/*3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and  the "Enrollments" table to identify students without enrollments. */

delete from enrollments where student_id=10

select * from students s
left join enrollments e on s.student_id = e.student_id
where e.student_id is null


/*4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in.Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.*/


select distinct(s.first_name), s.last_name ,c.course_name  from students s
inner join enrollments e on s.student_id=e.student_id
inner join courses c on c.course_id=e.course_id


--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table. 

select concat(t.t_firstname,' ',t.t_lastname) as Teacher_name, c.course_name from teacher t
left join courses c on t.teacher_id=c.teacher_id

/*6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables. */


declare @input_course varchar(50)
set @input_course='C programming'

select concat(s.first_name,' ',s.last_name) as Student_name, c.course_name, e.enrollment_date
from students s inner join enrollments e on s.student_id=e.student_id
inner join courses c on c.course_id=e.course_id where c.course_name=@input_course


--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records. 

select s.first_name,s.last_name from students s left join payments p on s.student_id = p.student_id
where p.student_id is null

/*8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records*/

select c.course_name from courses c left join enrollments e on c.course_id=e.course_id where e.course_id is null


--9.. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with  multiple enrollment records. 

select s.first_name from students s where s.student_id in(
select distinct e1.student_id from Enrollments e1
join Enrollments e2 on e1.student_id = e2.student_id
where e1.course_id <> e2.course_id)

/*10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.*/

select t.t_firstname,t.t_lastname from teacher t left join courses c on t.teacher_id=c.teacher_id  where c.teacher_id is null



--Task 4. Subquery and its type:


select * from students
select * from courses
select * from enrollments
select * from payments
select * from teacher

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this. 

<!--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount

SELECT first_name, last_name FROM students WHERE student_id=(SELECT student_id FROM payments Where amount=
(SELECT MAX(amount) FROM payments))

<!--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

SELECT course_name FROM Courses Where course_id IN (SELECT course_id FROM Enrollments GROUP BY course_id HAVING Count(student_id)=
(SELECT Top 1 COUNT(E.student_id) FROM Courses C LEFT JOIN Enrollments E on C.course_id=E.course_id
GROUP BY E.course_id order by COUNT(E.student_id) desc))

<!--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses

SELECT T.t_firstname, T.t_lastname, SUM(P.Amount) as TotalPayments FROM Teacher T INNER JOIN Courses C on T.teacher_id=C.teacher_id
INNER JOIN Enrollments E on C.course_id=E.course_id 
INNER JOIN Payments P on E.student_id=P.student_id
GROUP BY T.t_firstname, T.t_lastname

<!--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses

SELECT first_name,last_name FROM Students WHERE student_id IN (SELECT student_id FROM Enrollments Group BY student_id Having COUNT(student_id)=
(SELECT COUNT(course_id) FROM Courses))


<!--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments

SELECT T.t_firstname, T.t_lastname ,C.course_id FROM  Teacher T LEFT  JOIN Courses C on T.teacher_id=C.teacher_id
WHERE course_id is NULL

<!--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments

SELECT CONCAT(S.first_name  , S.last_name) AS StudentName ,SUM(P.Amount) AS Payment FROM Students S INNER JOIN Payments P on S.student_id=P.student_id Group BY CONCAT(S.first_name  , S.last_name)

<!--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.

SELECT first_name, last_name FROM Students WHERE student_id IN (SELECT S.student_id From Students S INNER JOIN Payments P on S.student_id=P.student_id GROUP BY S.student_id HAVING Count(payment_id)>1)

<!--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student

SELECT CONCAT(S.first_name  , S.last_name) AS StudentName ,SUM(P.Amount) AS Payment FROM Students S INNER JOIN Payments P on S.student_id=P.student_id Group BY CONCAT(S.first_name  , S.last_name)

<!--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

SELECT C.Course_Name, COUNT(E.student_id) AS EnrollmentCount FROM Courses C LEFT JOIN Enrollments E on C.course_id=E.course_id Group By C.course_name

<!--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average

SELECT Avg(P.Amount) As AvgPayment FROM  Payments P INNER JOIN Students S on P.student_id=S.student_id