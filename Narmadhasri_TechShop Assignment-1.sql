--Assignment 1: TechShop, an electronic gadgets shop 

--Task 1: Database Design: 

create database TechShop 

--customer table

create table customer(customerID int primary key,firstname varchar(20),lastname varchar(20),email varchar(50),phone  varchar(50),address varchar(100))
insert into customer(customerID,firstname,lastname,email,phone,address)
values (1,'Jack','Daniel','jack@google.com','7788334678','ABC-st1 '),
(2,'Krithik','Roshan','krithick@google.com','9988334678','wer-st9 '),
(3,'Narmadha','Sri','sri@google.com','7898334678','opi-st8 '),
(4,'Dinesh','Kumar','dinesh@google.com','8979334678','Aou-sh1 '),
(5,'Varun','Kumar','varun@google.com','79088334678','uioBC-st5 '),
(6,'Thanya','Daniel','thanya@google.com','7788334478','qwC-se0'),
(7,'Varun','Pande','varunpande@google.com','7788334678','pBC-st1 '),
(8,'Deepika','Sashthri','deepz@google.com','9088334678','uioBC-st '),
(9,'Rithika','Patukone','rithika@google.com','9758334678','dgf-st0 '),
(10,'Haadya','Balan','haadya@google.com','9888334678','qwrg-st1 '),
(11,'Hridya','Balan','hridya@google.com','6976334678','nhu-op0 '),
(12,'Nimi','Chenthamarai','nimis@google.com','6098334678','ooty0-st1 ');

--products table

create table products(productid int primary key, productname varchar(30),description varchar(50),price int)
insert into products(productid, productname,description,price)
values(1,'laptop','dell model-12',57000),
(2,'laptop','lenovo model-12',60000),
(3,'laptop','lenovo version-Z',65000),
(4,'Mobile','vivo y12',26000),
(5,'laptop','HP',55800),
(6,'Tablet','samsung',18000),
(7,'Mobile','apple i phone',157000),
(8,'Mobile','oneplus 4t',86000),
(9,'Speaker','pebble comet',5000),
(10,'Mobile','oppo v23',80000),
(11,'Speaker','noise band',7000);


--orders table

create table orders(orderid int primary key,customerID int references customer(customerID),orderdate date, totalamount int)
insert into orders(orderid,customerID,orderdate,totalamount)
values(101,4,'2024-04-01',80000),
(102,2,'2024-02-01',86000),
(103,5,'2024-04-06',18000),
(104,1,'2023-12-01',157000),
(105,7,'2024-02-12',36000),
(106,9,'2024-02-13',157000),
(107,10,'2024-04-19',120000),
(108,12,'2024-03-01',26000),
(109,3,'2024-03-13',57000),
(110,6,'2024-04-05',55800),
(111,8,'2024-04-15',130000),
(112,11,'2024-03-20',78000),
(114,1,'2024-02-19',26000),
(115,1,'2024-02-18',26000);

--orderdetails table

create table orderdetails(orderdetailid int primary key,orderid int references orders(orderid),productid int references products(productid),quantity int);
insert into orderdetails(orderdetailid,orderid,productid,quantity)
values(1,101,10,1),
(2,104,7,1),
(3,105,6,2),
(4,103,6,1),
(5,111,3,2),
(6,102,8,1),
(7,109,1,1),
(8,112,4,3),
(9,110,5,1),
(10,106,7,1),
(11,107,2,2),
(12,108,4,1),
(13,113,6,1),
(14,114,4,1),
(15,115,4,1);

--inventory table

create table inventory(inventoryid int primary key,productid int references products(productid),quantity_in_stock int ,last_stock_update date)
insert into inventory(inventoryid,productid,quantity_in_stock,last_stock_update)
values(1,1,10,'2023-06-01'),
(2,8,5,'2023-06-01'),
(3,2,9,'2023-06-01'),
(4,3,19,'2023-06-01'),
(5,2,20,'2023-06-01'),
(6,9,13,'2023-06-01'),
(7,7,2,'2023-06-01'),
(8,5,5,'2023-06-01'),
(9,10,30,'2023-06-01'),
(10,6,40,'2023-06-01');


--Task 2 : Select, Where, Between, AND, LIKE: 

select * from customer
select * from orders
select *  from products
select * from orderdetails
select * from inventory

/*1. Write an SQL query to retrieve the names and emails of all customers.*/ 

select CONCAT(firstname,' ',lastname) as customer_name,email as email_id from customer

/*2. Write an SQL query to list all orders with their order dates and corresponding customer names*/

select o.orderid,o.orderdate,concat(c.firstname,' ',c.lastname) as customer_name from orders o inner join customer c on o.customerID=c.customerID

/*3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.*/

declare @input_customer_firstname varchar(50)
declare @input_customer_lastname varchar(50)
declare @input_email varchar(100)
declare @input_address varchar (300)
declare @input_phone varchar(50)

set @input_customer_firstname='Kiruthika'
set @input_customer_lastname='Murugesan'
set @input_email='kiruthika@google.com'
set @input_address='hyut st-98'
set @input_phone='9067345679'

insert into customer(customerID,firstname,lastname,email,phone,address)
values(13,@input_customer_firstname,@input_customer_lastname,@input_email,@input_phone,@input_address)

/*4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.*/

update products set price=price+(price*(10/100))

/*5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter. */

declare @input_order_id int
set @input_order_id = 112

delete from OrderDetails
where orderid = @input_order_id;

delete from Orders
where orderid = @input_order_id;

/*6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information. */

insert into orders(orderid,customerID,orderdate,totalamount) values(113,2,'2024-04-08',18000)

/*7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information. */

declare @input_customerid int
declare @new_email varchar(100)
declare @new_phone varchar(50)

set @input_customerid=8
set @new_email='deepika@gmail.com'
set @new_phone='97845640273'

update  customer set email=@new_email,phone=@new_phone where customerID=@input_customerid

/*8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table*/

update orders set totalamount=(select sum(od.quantity*p.price)
from orderdetails od inner join products p on od.productid=p.productid where od.orderid=orders.orderid)

/*9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter. */

declare @input_customer_id INT
set @input_customer_id = 12 

delete od from OrderDetails od
inner join  Orders o on od.orderid = o.orderid
where o.customerID = @input_customer_id;

delete from Orders
where customerID = @input_customer_id;

/*10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details*/

insert into products(productid,productname,description,price)
values(11,'Speaker','noise band',7000)

/*11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status. */

alter table orders
add order_status varchar (50)

update orders set order_status='Pending'
where orderdate between '2024-03-01' and '2024-07-19'

update orders set order_status='Shipped'
where orderdate between '2022-03-01' and '2024-03-01'

declare @orderid int
declare @status varchar(50)

set @status='Delivered'
set @orderid=101

update orders set order_status=@status
where orderid=@orderid

/*12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.*/

select count(*) as total_no_of_orders from orders o inner join customer c on c.customerID=o.customerID GROUP BY c.customerID



--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:  

select * from customer
select * from orders
select *  from products
select * from orderdetails
select * from inventory


/*1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order*/

select o.orderid,concat(c.firstname,' ',c.lastname) as customer_name,c.email,c.phone, o.orderdate,o.totalamount from orders o
inner join customer c on c.customerID=o.customerID

/*2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue. */

select distinct(p.productname), sum(od.quantity*p.price) as total_revenue from products p
inner join orderdetails od on p.productid=od.productid
group by p.productname,p.productid

/*3. Write an SQL query to list all customers who have made at least two purchase. Include their names and contact information*/

select c.firstname, c.phone,c.email from customer c
inner join orders o on c.customerID = o.customerID
inner join orderdetails od on o.orderid = od.orderid
where od.quantity>1


/*4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered. */

select top 1 p.productname, p.description, max(od.quantity) as total_quantity from products p
inner join orderdetails od on p.productid = od.productid
group by p.productname, p.description
order by total_quantity desc


/*5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.*/ 

alter table products 
add category varchar(100)

update products
set category='Electronic Gadget'
where productname in ('laptop','Mobile','Tablet','Speaker')

select distinct(productname),category from products

/*6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value. */

select c.firstname, c.lastname, avg(o.totalamount) as average_order_value from customer c
inner join orders o on c.customerID = o.customerID
group by c.customerID, c.firstname, c.lastname;

/*7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue. */

select top 1 o.orderid,c.firstname,c.lastname,c.phone,c.email,c.address,sum(p.price*od.quantity) as total_revenue from orders o
inner join customer c on o.customerID=c.customerID
inner join orderdetails od on od.orderid=o.orderid
inner join products p on p.productid=od.productid
group by o.orderid,c.firstname,c.lastname,c.phone,c.email,c.address
order by sum(p.price*od.quantity) desc


/*8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered*/

select p.productname,p.description, count(od.orderid) as order_count from products p
inner join orderdetails od on p.productid = od.productid
group by p.productname,p.description;

/*9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.*/

declare @input_product_name varchar(50)
set @input_product_name='Mobile'

select c.firstname,c.lastname,p.productname,p.description,p.category
from customer c
inner join orders o on c.customerID=o.customerID
inner join orderdetails od on o.orderid=od.orderid
inner join products p on p.productid=od.productid
where p.productname=@input_product_name


/*10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters*/

declare @input_start_date date
declare @input_end_date date
set @input_start_date='2023-06-09'
set @input_end_date='2024-02-09'

select sum(p.price*od.quantity) as total_revenue from orders o
inner join customer c on o.customerID=c.customerID
inner join orderdetails od on od.orderid=o.orderid
inner join products p on p.productid=od.productid
where o.orderdate between @input_start_date and @input_end_date


--Task 4. Subquery and its type:

select * from customer
select * from orders
select *  from products
select * from orderdetails
select * from inventory

--1. Write an SQL query to find out which customers have not placed any orders. 

select c.customerID, c.firstname, c.lastname from customer c where c.customerID not in (select o.customerID from orders o )

--2. Write an SQL query to find the total number of products available for sale.  

select count(productid) as AvailableProducts from products where productid in (select productid from inventory where  quantity_in_stock>0)

--3. Write an SQL query to calculate the total revenue generated by TechShop.

select sum(o.totalamount * od.quantity) as TotalRevenue from orders o inner join  orderdetails od on o.orderid=od.orderid

/*4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter. */

declare @input_category varchar(50)
set @input_category='Electronic Gadget'

select avg(od.quantity) as Average_quantity from orderdetails od inner join 
(select p.productid from products p where p.category=@input_category) 
as new on new.productid=od.productid

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter. 

declare @input_customerid int
set @input_customerid=2

select c.firstname,c.lastname, sum(od.quantity*p.price) as total_revenue from customer c inner join orders o on o.customerID=c.customerID
inner join orderdetails od on od.orderid=o.orderid
inner join products p on p.productid=od.productid
where c.customerID=@input_customerid group by c.firstname,c.lastname

/*6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed. */

select top 1
c.firstname, c.lastname, count(o.orderid) as num_orders from customer c
inner join orders o on c.customerID = o.customerID
group by c.customerID, c.firstname, c.lastname order by num_orders desc

--7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.

select * from products where productid =
(select productid from orderdetails group by productid having sum(quantity)= 
(select top 1 sum(od.quantity) as total  from orderdetails od group by od.productid order by total desc))

/*8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending. */

select top 1 c.firstname, c.lastname,p.productname,p.description, sum(od.quantity * p.price) as total_spending from customer c
inner join orders o on c.customerID = o.customerID
inner join orderdetails od on o.orderid = od.orderid
inner join products p on od.productid = p.productid
where p.category = 'Electronic Gadget'
group by c.customerID, c.firstname, c.lastname,p.productname,p.description
order by total_spending desc

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

select avg(order_revenue) as average_order_value from ( 
select sum(od.quantity * p.price) as order_revenue
from orderdetails od
inner join products p on od.productid = p.productid
group by od.orderid) as order_revenues;
  
--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count. 

select c.firstname, c.lastname, count(o.orderid) as order_count from customer c
left join orders o on c.customerID = o.customerID
group by c.customerID, c.firstname, c.lastname;