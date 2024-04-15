--Banking System 
--Tasks 1: Database Design: 



create database HMBank

--customer table 

create table customer(customer_id int primary key,first_name varchar(50),last_name varchar(50),date_of_birth date,email varchar(100),phone varchar(50),address varchar(100))
insert into customer(customer_id,first_name,last_name,date_of_birth,email,phone,address)
values(1,'Jackson','Daniel','2002-08-13','qwrr@gmail.com','8908457890','St-1 racheil'),
(2,'Narmadha','Sri','2003-06-12','sri@gmail.com','9976607923','St-23 mijil'),
(3,'Kumaresan','DanielParamasivam','2003-04-15','kumar@gmail.com','8903557890','jiyuevfg st-8'),
(4,'Lingistar','K','2003-10-28','star@gmail.com','9646700863','St-1 huwcvgfsl'),
(5,'Nimi','Chenthamarai','2002-07-22','nimis@gmail.com','8675420890','Hitsfbe st-98'),
(6,'Haadya','Balan','2002-10-28','haadya@gmail.com','8908457890','eil ert st-92'),
(7,'Hridya','Balan','2002-10-28','hridya@gmail.com','8908457890','hu gheil'),
(8,'Mekala','Sekar','2002-04-16','meg@gmail.com','9875432081','frheniagb st-2'),
(9,'Menaka','Hari','2003-03-16','menu@gmail.com','8908457890','St-1 racheil'),
(10,'Mythili','Selvaragavan','2002-08-13','yiwbs@gmail.com','8908457890','St-1 racheil');


--accounts table

create table accounts(account_id int primary key identity(101,1),customer_id int references customer(customer_id),account_type varchar(50),balance float)
insert into accounts(customer_id,account_type,balance)
values(1,'savings',1500.00),
(3,'savings',2908.60),
(4,'current',2579.00),
(6,'zero balance',200000.00),
(2,'savings',15000.94),
(2,'current',35529.97),
(5,'savings',34560.00),
(8,'current',7500.00),
(10,'zero balance',11500.00),
(3,'current',154500.00),
(3,'zero balance',15400.00),
(3,'zero balance',45320.00);



--transaction table

create table transactions(transaction_id int primary key identity(1,1),account_id int references accounts(account_id),transaction_type varchar(50),amount float,transaction_date date)
insert into transactions(account_id,transaction_type,amount,transaction_date)
values(101,'deposit',400.00,'2024-03-17'),
(108,'withdrawl',4000.00,'2023-03-17'),
(109,'transfer',2400.00,'2024-03-09'),
(104,'transfer',400.00,'2024-03-09'),
(102,'transfer',3000.00,'2023-09-17'),
(105,'withdrawl',400.00,'2024-01-17'),
(106,'deposit',200.00,'2024-02-14'),
(102,'deposit',400.00,'2023-09-17'),
(107,'transfer',2000.00,'2024-03-17'),
(103,'withdrawl',400.00,'2023-09-17'),
(105,'deposit',8000.00,'2023-09-17');


--Task 2
 
 select * from accounts
 select * from customer
select * from transactions


--1. Write a SQL query to retrieve the name, account type and email of all customers.   

select c.first_name,c.last_name, a.account_type , c.email from customer c inner join accounts a on c.customer_id=a.customer_id

--2. Write a SQL query to list all transaction corresponding customer

declare @customerid int
set @customerid=5

select c.first_name,c.last_name,t.transaction_type,t.transaction_date from customer c 
inner join accounts a on c.customer_id=a.customer_id 
inner join transactions  t on a.account_id=t.account_id where c.customer_id=@customerid

--3. Write a SQL query to increase the balance of a specific account by a certain amount. 

declare @input_accountid int
set @input_accountid =101

update accounts set balance=balance+500.00 where account_id=@input_accountid

--4. Write a SQL query to Combine first and last names of customers as a full_name. 

select concat(first_name,' ',last_name) as customer_name from customer 

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings. 
 
 insert into accounts(customer_id,account_type,balance)
 values(3,'savings',0)

 delete from accounts where account_type='savings' and balance=0

 --6. Write a SQL query to Find customers living in a specific city. 

 alter table customer add city varchar(50)

 update customer set city ='Karur' where customer_id in(1,4,8,6,10)
 update customer set city ='Trichy' where customer_id in (2,5,7)
 update customer set city='Dharapuram' where customer_id in (3,9)

declare @input_city varchar(50)
set @input_city='Dharapuram'
 select * from customer where city=@input_city

--7. Write a SQL query to Get the account balance for a specific account. 

declare @input_account_id int
set @input_account_id=105
select balance from accounts where account_id= @input_account_id 

--8. Write a SQL query to List all current accounts with a balance greater than $1,000.

select * from accounts where balance>1000

--9. Write a SQL query to Retrieve all transactions for a specific account. 

declare @accountid int
set @accountid=105

select * from transactions where account_id=@accountid

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.

declare @interest_rate int
set @interest_rate= 500

select account_id,balance*(@interest_rate/100) as Interest from accounts where account_type='savings'

--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.

declare @balance float
set @balance=10000.00

select * from accounts where balance<@balance

--12. Write a SQL query to Find customers not living in a specific city. 

declare @city varchar(50)
set @city='Trichy'

select * from customer where city <>@city


--Task 3: Aggregate functions, Having, Order By, GroupBy and Joins:

 select * from accounts
 select * from customer
select * from transactions


--1. Write a SQL query to Find the average account balance for all customers.  

select avg(a.balance) as avg_balance from customer c inner join accounts a on c.customer_id=a.customer_id

--2. Write a SQL query to Retrieve the top 10 highest account balances.  

select top 10 balance from accounts order by balance desc

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.

declare @date date
set @date='2023-09-17'

select sum(amount) as total_deposit from transactions where transaction_date=@date and transaction_type='deposit'

--4. Write a SQL query to Find the Oldest and Newest Customers

select top 1 concat(first_name,' ',last_name) as New_customer, date_of_birth from customer order by date_of_birth desc

select top 1 concat(first_name,' ',last_name) as old_customer, date_of_birth  from customer order by date_of_birth 


--5. Write a SQL query to Retrieve transaction details along with the account type. 

select t.account_id,a.account_type,t.transaction_type,t.amount,t.transaction_date from transactions t
inner join accounts a on t.account_id=a.account_id order by account_id

--6. Write a SQL query to Get a list of customers along with their account details.

select  c.first_name,c.last_name,a.account_type,a.balance from customer c 
inner join accounts a on c.customer_id=a.customer_id

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account. 

declare @input_acc_id int
set @input_acc_id=102

select c.first_name,c.last_name,t.transaction_type,t.amount,t.transaction_date from customer c
inner join accounts a on a.customer_id=c.customer_id
inner join transactions t on t.account_id =a.account_id where a.account_id=@input_acc_id

--8. Write a SQL query to Identify customers who have more than one account.

select c.first_name,c.last_name ,count(a.customer_id) as Total_accounts from customer c 
inner join accounts a on a.customer_id=c.customer_id group by a.customer_id,c.first_name,c.last_name 
having count(a.customer_id)>1

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals. 

select sum(amount)-(select sum(amount) from transactions where transaction_type='withdrawl') as Difference
from transactions where transaction_type='deposit'

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period. 

declare @start_date date
declare @end_date date

set @start_date='2024-01-01'
set @end_date='2024-04-01'

select a.account_id,avg(balance) as average_balance
from accounts a inner join transactions t on a.account_id=t.account_id  
where t.transaction_date between @start_date and @end_date group by a.account_id;



--11. Calculate the total balance for each account type.

select a.account_type,sum(a.balance) as total_balance from accounts a group by a.account_type

--12. Identify accounts with the highest number of transactions order by descending order.

select account_id,count(transaction_id) from transactions group by account_id 

--13. List customers with high aggregate account balances, along with their account types. 

select account_type,sum(balance) as Balance  from accounts group by account_type order by Balance desc


--14. Identify and list duplicate transactions based on transaction amount, date, and account.

select account_id,amount,transaction_date, count(*) as duplicate_count from transactions 
group by  account_id,amount,transaction_date having count(*) >1


-- Task 4: Subquery and its type: 

 select * from accounts
 select * from customer
select * from transactions

--1. Retrieve the customer(s) with the highest account balance.

select top 1 c.first_name, c.last_name,a.balance from customer c 
inner join accounts a on a.customer_id=c.customer_id order by balance desc

--2. Calculate the average account balance for customers who have more than one account. 


select C.customer_id, Avg(A.Balance) AS AvgBalance FROM Customer C INNER JOIN Accounts A on C.customer_id=A.customer_id
where C.customer_id IN (SELECT customer_id From Accounts  GROUP By customer_id HAVING Count(account_id)>1) GROUP By C.customer_id

<!--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

select A.account_id, A.customer_id, A.account_type, A.Balance
from Accounts A inner join Transactions T on A.account_id = T.account_id
inner join (select avg(Amount) as Avg_Amount from Transactions) 
avg on T.Amount > avg.Avg_Amount


<!--4. Identify customers who have no recorded transactions.



<!--5. Calculate the total balance of accounts with no recorded transactions.

select concat(C.First_Name, C.Last_Name) as CustomerName, sum(A.Balance) as Balance from Customer C 
left join Accounts A on C.Customer_ID=A.Customer_ID
left join Transactions T on A.Account_ID=T.Account_ID group by concat(C.First_Name, C.Last_Name)having count(T.Transaction_ID)=0

<!--6. Retrieve transactions for accounts with the lowest balance

select T.* from Transactions T inner join Accounts A on T.Account_ID=A.Account_ID
Order By A.Balance

<!--7. Identify customers who have accounts of multiple types.

select C.First_Name,C.Last_Name from Customer C 
Left Join Accounts A on C.Customer_ID=A.Customer_ID group by C.First_Name, C.Last_Name
having count(A.Account_ID)>1 

<!--8. Calculate the percentage of each account type out of the total number of accounts.

select Account_Type, count(*) AS CountOfAccountType, (count(*) * 100 / (select count(*) FROM Accounts)) AS Percentage
from Accounts group by account_type

<!--9. Retrieve all transactions for a customer with a given customer_id.

select T.* from Transactions T left join Accounts A on T.Account_ID=A.account_id
left join  Customer C on A.Customer_ID=C.Customer_ID where C.Customer_ID=4

<!--10. Calculate the total balance for each account type, including a subquery within the SELECT clause

select account_type, sum(Balance) as TotalBalance from Accounts
where account_id IN (select account_id from Accounts) group by Account_Type

