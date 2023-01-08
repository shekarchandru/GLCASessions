create database CTSDataMDU;

use CTSDataMDU;

create table Employee
(
employeeId varchar(20) primary key,
employeeName varchar(100),
employeeAddress varchar(150),
employeePhone varchar(20),
employeeSalary float,
employeeDOJ date
);
select * from Employee;
select * from Employee where employeeId = 'E002';
select max(employeeId) from Employee;
create table Sales
(
SalesId int primary key auto_increment,
SaleDate date,
SaleValue int
);

insert into Sales(SaleDate,SaleValue)
values('2020-01-01',10000),
('2020-02-17',12000),
('2020-03-15',15000),
('2020-01-01',17000);


select * from Sales;

insert into Employee
values ('E001','Kishore Kumar','RTNagar','9299929929',10000.0,'2022-01-01');

insert into Employee
values ('E002','Nanda Kumar','KRPuram','9296359929',12000.0,'2021-01-01');

insert into Employee
values 
('E003','Mohan Kumar','Koramangala','9277384929',11000.0,'2022-01-15'),
('E004','Madan Kumar','Vijayanagar','9276827369',12000.0,'2021-01-15'),
('E005','Suman Kumar','Koramangala','9345829929',10500.0,'2021-07-15'),
('E006','Keerthana','Jayanagar','9276825899',13000.0,'2021-08-13'),
('E007','Ranjani','Vijayanagar','9234529929',15000.0,'2022-07-20');

insert into Employee(employeeId,employeeName,employeeAddress)
values('E008','Kumar Gaurav','Koramangala');

select * from Employee;
select * from Employee where employeeName = 'Kishore Kumar';
select * from Employee where EmployeeName = 'Madan Kumar';
select * from Employee where EmployeeName like  'M%';
select * from Employee where employeeSalary >= 11000 and employeeAddress like '%nagar';
select * from Employee where employeeSalary >= 11000 or employeeAddress like '%nagar';
select * from Employee where employeeSalary between 10000 and 12000;
select * from Employee where employeeSalary  > 12000;

delete from Employee where employeeSalary = 13000 or employeeAddress = 'RTNagar';

update Employee 
set employeeSalary = employeeSalary+(0.1 * employeeSalary);
select * from Employee;
# DDL DML DCL DTL/TCL DQL
delete from Employee where employeeId = 'E007';
drop table Employee;
#Delete Deletes records one after the other
delete from Employee;
#Truncate : Deletes record in Bulk
truncate table Employee; 

select * from employee where employeesalary  <> 12000;
select * from employee where employeeAddress  in('Vijayanagar','Koramangala');
select * from employee where employeeAddress not in('Vijayanagar','Koramangala');
-- ---------------------------------------------DAY 02 --------------------------------------------------

select * from employee where employeesalary  <> 12000;
select * from employee where employeeAddress  in('Vijayanagar','Koramangala'); # OR
select * from employee where employeeAddress not in('Vijayanagar','Koramangala'); # OR

select employeeName as 'Employee Name ',employeeAddress as 'Employee Address'
from Employee;

select distinct employeeAddress from employee;

# Aggregate Functions : max min avg count

select max(employeeSalary) as 'Maximum Salary' from Employee;

select min(employeeSalary) as 'Minimum Salary' from Employee;

select 
avg(employeeSalary) as 'Average Salary',
max(employeeSalary) as 'Maximum Salary',
min(employeeSalary) as 'Minimum Salary' 
from Employee;

update employee
set employeeSalary = employeeSalary + (employeeSalary * 0.1);

select * from employee;

update employee
set employeeAddress='RTNagar',employeePhone='9828882882',employeeSalary=14000
where employeeId = 'E002';

#delete vs drop vs truncate

delete from Employee where employeeId = 'E007';

# truncate employee where EmployeeId = 'E007'; truncate does not allow where condition
# Truncate is used when bulk deletion is required 
# as it improves the performance

select * from Employee order by EmployeeName ;

select * from Employee order by EmployeeName desc;

select * from Employee order by EmployeeAddress asc;

select employeeAddress,employeeSalary from employee order by employeeAddress;
# + - * / %
select employeeSalary as 'Employee Salary', 
employeeSalary + (employeeSalary * 0.1) as 'Incremented Salary By 10%',
employeeSalary + (employeeSalary * 0.2) as 'Incremented Salary By 20%'
from Employee;
/*

select * from employees;
select concat('hello','world','New world');
select concat(employeeName,space(5),employeeMail) as 'Name & eMail' from employees;
select * from suppliers;

select insert("Internet",4,3,'mission');
select field('three','two','three','two','four','four');

select field('abc','bcd','def','ghi','abc','ghi','abc');

select instr('Internet','net');

select reverse('hello');

select insert("Internet",4,3,'net');

select left('world over',4);

select right('world over',4);


select trim('      first     ');
select ltrim('      first     ');
select rtrim('      first     ');
select '    first     ';

select substring('hello world',3,6);
select strcmp('w','h');

select strcmp('h','w');
select strcmp('w','w');



select ascii('w');
select ascii('h');


select ascii('h');
select ascii('harish');

select upper('hello');

select lower('HELLO');
select * from employees;

select upper(employeeName) as 'Employee Name' , upper(employeeAddress) as 'Employee Address' from employees;
select upper(sFirstname) from supplier;
select replace('hello world','o','p');
---------------------MATH FUNCTIONS-----------------------------
select ceil(2.3456);
select ceil(2.00001);
select ceil(2.99999);

select floor(2.3456);
select floor(2.00001);
select floor(2.99999);
select log10(100);
select mod(245,10);

select 245 mod 10;

select radians(90);
select round(degrees(1.57),0);

select round(sin(1.57),0);
select pow(2,3);
select sqrt(144);
--------------------------------DATE FUNCTIONS-----------------------
select datediff('2020-2-23 23:59:59','2018-2-23 23:59:59');
select curdate();
select curtime();
select now();
select * from employees;
select employeeName,datediff(curdate(),employeeDOJ) as 'No Of Days Since Joined',
round(datediff(curdate(),employeeDOJ)/30,0) as 'No Of Months Since Joined',
datediff(curdate(),employeeDOJ)/365 as 'No Of Years Since Joined'  from employees
where datediff(curdate(),employeeDOJ)/365 >= 2 ;

select date_add(curdate(),interval 2 year);

select date_add(curdate(),interval 4 QUARTER);

select employeeName,employeeDOJ as 'Actual DOJ',date_add(employeeDOJ, interval 4 year) as '4 Years Added to DOJ'
from employees;

select date_sub(curdate(),interval 25 day);
*/

select concat(employeeName,' ',employeeAddress) as 'Name And Address' from Employee;

select concat('Hello',' ','World') ;
select insert("Internet",4,3,'mission');
select trim('      first     ');

select ltrim('       mission');
select '    mission';
select rtrim('mission     ');

select ltrim(employeeName),ltrim(employeeAddress) from Employee;

select substring('hello world',3,6);
select * from employee;
select substring(employeeName,1,1),employeeAddress from employee;

select strcmp('w','w');

select strcmp('hello','hello');

select strcmp('internet','intermission');

select left('world over',4);

select right('world over',4);

select left(employeeName,5) from employee;
select right(employeeName,5) from employee;

select upper('hello');
select lower('hello');
select lower(employeeName) from employee;
select upper(employeeName) from employee;
select reverse('hello');

select ascii('harish');

select field('abc','bcd','def','ghi','abc','ghi','abc');

select field('bcd','bcd','def','ghi','abc','ghi','abc');

select replace('hello world','o','p');

select instr('Internet','net');
#----------------------------MATH FUNCTIONS------------------
select ceil(2.3456);
select ceil(2.00001);
select ceil(2.99999);

select floor(2.3456);
select floor(2.00001);
select floor(2.99999);
select log10(100);
select mod(245,10);

select 245 mod 10;

select radians(90);
select round(degrees(1.57),0);
select sin(1.57);
select round(sin(1.57),0);
select pow(2,3);
select sqrt(144);

select curdate();
select now();
#------------------------Date Functions
select datediff('2020-2-23 23:59:59','2018-2-23 23:59:59');

select employeeName,round(datediff(curdate(),employeeDOJ)/365,3) as 'Years SinceJoined' from employee;
/* DAY */
select date_add(curdate(),interval 2 year);

select date_add(curdate(),interval 2 QUARTER);

select date_sub(curdate(),interval 5 quarter);
#-----------------------------GROUP BY
--
/*
MovieID MovieName MovieCategory MovieCollections
M001    HAHK	  Drama			1000000
M002    3KG       Drama			2000000
M003     JSKK	  Comedy        2899999
M004     JSKk	   Tragedy		2450000
# ------------summarization
Category MaxCollecion  TotalCOllections MinCollections
Drama 
Comedy
*/
select * from employee;
select max(employeeSalary) from employee;
select count(employeeSalary) from employee;
select count(employeeName) from employee;
select count(*) from employee;
insert into Employee(employeeId,employeeName,employeeAddress,employeePhone)
values('E008','Surendran','Malleswaram','9929929929');

create table Movies
(
movieId varchar(20) primary key,
movieName varchar(50),
movieCategory varchar(20),
collections int
);

insert into movies
values
('M001','HAHK','Drama',1000000),
('M002','K3G','Drama',1200000),
('M003','HSGF','Drama',1300000),
('M004','KAJH','Comedy',1400000),
('M005','ARTY','Tragedy',1500000),
('M006','AHJK','SciFi',1600000),
('M007','KAJO','SCiFi',1400000),
('M008','AREW','Tragedy',1350000),
('M009','AKJL','Comedy',1700000),
('M010','AOIY','SCiFi',1800000),
('M011','AFSG','Tragedy',1750000),
('M012','KAJH','Comedy',1900000);

select * from Movies;
select movieCategory,
max(collections) as 'Maximum Collections',
min(collections) as 'Minimum Collections',
avg(collections) as 'Average Collections'
from Movies
group by movieCategory;

select movieCategory,
max(collections) as 'Maximum Collections',
min(collections) as 'Minimum Collections',
avg(collections) as 'Average Collections'
from Movies
group by movieCategory having max(collections) > 1300000;

#-----------------------------
create table Department
(
deptID varchar(20),
deptName varchar(40),
deptHead varchar(100),
constraint cpk01 primary key(deptId)
);
select * from Department;
insert into Department
values
('D002','Design','Rajesh');

create Table Supplier
(
supplierId varchar(20),
supplierName varchar(30),
supplierAddress varchar(100)
);
select * from Supplier;
insert into Supplier
values
('S003','STSuppliers','STNagar');
/*('S001','KRSuppliers','KRNagar'),
('S001','SVSuppliers','SVNagar');*/

update Supplier
set SupplierId = 'S003' where supplierAddress='SVNagar';

select * from supplier;

alter table Supplier
add constraint pkcst1 primary key(SupplierId);
#Dropping Primary Key
alter table Supplier
drop primary key;
select * from Supplier;

insert into Supplier
values('S003','KMSuppliers','Koramangala');


create table Customers
(
customerId varchar(20) primary key,
customerName varchar(50),
customerAddress varchar(100),
customerPhone varchar(20)
);
select * from Customers;

insert into Customers
values
('C004','Rajesh','Malleswaram','8939939939'),
('C005','Rakesh','Koramangala','8747939939');
create table Orders
(
orderId  varchar(20) primary key,
orderDate date,
orderQty int,
productId varchar(20),
orderValue int,
customerId varchar(20),
constraint cfk1 foreign key(customerId) references Customers(customerId)
);

select * from Orders;
select * from Products;

alter table Orders
add Constraint cfk2 foreign key(productId) references Products(productId);
/* Check / Unique /Default*/
create table Products
(
productID varchar(20) primary key,
productName varchar(50),
productCategory varchar(30),
productDescription varchar(30),
pricePerUnit int
);
insert into Products
values
('P002','Refrigerator','Electronics','HouseHold Goods',40000),
('P003','WashingMachine','HomeAppliance','HouseHold Goods',30000),
('P004','LapTop','Electronics','Educational',40000);
select * from Products;

insert into Customers
values
('C001','Suman','RTNagar','9389939933'),
('C002','Suresh','RKNagar','9389934533'),
('C003','Kiran','RSNagar','9389387933');
select * from Orders;
insert into Orders
values('O002','2020-05-23',20,'P001',200000,'C002'),
('O003','2020-06-23',10,'P002',400000,'C003'),
('O004','2020-04-23',15,'P003',300000,'C001'),
('O005','2020-06-23',10,'P001',400000,'C002'),
('O006','2020-07-23',5,'P002',300000,'C003'),
('O007','2020-08-23',15,'P003',400000,'C001'),
('O008','2020-09-23',20,'P001',400000,'C002'),
('O009','2020-10-23',25,'P003',300000,'C003');
# Primary Key implements ENTITY Integriy
# Foreign Key  implements REFERENTIAL Integrity
select * from CUstomers;
select * from Orders;
select * from Products;
-- ---------------------------------------------------DAY 03 JOINS------------------------------------
-- --------------------------------------INNER JOINS
select c.customerId,c.customerName,c.customerAddress,o.OrderId,o.OrderDate,o.orderQty,o.orderValue
from customers c join Orders o
on c.CustomerId = o.customerId;

select 
c.customerId,c.customerName,c.customerAddress,
o.OrderId,o.OrderDate,o.orderQty,o.orderValue,
p.productId,p.productName,p.productCategory,p.pricePerUnit
from 
customers c 
join 
Orders o on c.CustomerId = o.customerId
join Products p
on o.productId = p.productId;


# Inner JOin using Inner Keyword
select * from Customers inner join Orders
on
Customers.customerId = Orders.customerId;

# Inner JOin using Inner Keyword
select * from Customers inner join Orders
on
Customers.customerId = Orders.customerId
where orderValue >= 300000;

# Though Not logical could be helpful in SELF JOIN
select * from Customers inner join Orders
on
Customers.customerId < Orders.customerId;

#-- --------------------------------Natural Join
select * from Customers natural join Orders;

#----------------------LEFT OUTER JOIN--------------

select customers.customerId , customerName,customerAddress,orderId,orderDate,orderQty,orderValue
from customers left outer join orders
on customers.customerId = orders.customerId;

#----------------------RIGHT OUTER JOIN--------------
select customers.customerId , customerName,customerAddress,orderId,orderDate,orderQty,orderValue
from customers right outer join orders
on customers.customerId = orders.customerId;

#----------------------CROSS JOIN - CARTESIAN PRODUCT--------------

select customers.*,orders.*
from customers cross join orders;

# --------------------------FULL JOIN-------------
select * from customers full join orders;
-- ---------------------------------------SELF JOIN--------------------------
create table authors
(
authorId varchar(20) primary key,
authorName varchar(100),
authorCity varchar(100)
);

insert into Authors
values
('A001','Shakespeare','London'),
('A002','Wordsworth','London'),
('A003','Kuvempu','Mysore'),
('A004','PuThiNa','Mysore'),
('A005','Akilan','Chennai'),
('A006','Jayakanthan','Chennai'),
('A007','Tagore','Kolkata'),
('A008','Rajarathnam','Bangalore');

select * from Authors;

select a.authorId,a.authorName,a.authorCity,b.authorId,b.authorName,b.authorCity
from Authors a join Authors b
on a.authorCity = b.authorCity
and
a.authorId < b.authorId;

select a.authorId,a.authorName,a.authorCity,b.authorId,b.authorName,b.authorCity
from Authors a join Authors b
on a.authorCity = b.authorCity
and
a.authorId > b.authorId;

-- ---------------------------------------------------VIEWS REVISITED----------------------------------------------------
create table Customers
(
customerId varchar(20) primary key,
customerName varchar(50),
customerAddress varchar(100),
customerPhone varchar(20)
);
select * from Customers;

insert into Customers
values
('C004','Rajesh','Malleswaram','8939939939'),
('C005','Rakesh','Koramangala','8747939939');
create table Orders
(
orderId  varchar(20) primary key,
orderDate date,
orderQty int,
productId varchar(20),
orderValue int,
customerId varchar(20),
constraint cfk1 foreign key(customerId) references Customers(customerId)
);

select * from Orders;
select * from Products;

alter table Orders
add Constraint cfk2 foreign key(productId) references Products(productId);
/*

create table Products1
(
productID varchar(20) primary key,
productName varchar(50),
productCategory varchar(30),
productDescription varchar(30),
supplierId varchar(20),
pricePerUnit int
);
create table Suppliers
(
supplierId varchar(20) primary key,
supplierName varchar(50),
supplierPhone varchar(40),
supplierAddress varchar(100),
supplierCategory varchar(50),
supplyValue int,
constraint chckCst1 check (supplierCategory in ('Electricals','Electronics','HomeAppliances','Furniture','BooksnToys')),
constraint chckCst2 check(supplyValue between 100000 and 5000000),
constraint chckCst3 check(supplierAddress like 'C%')
);

select * from Suppliers;


insert into Suppliers
values
('S004','Suryakanth','9534352992','Chennai','Furniture',5500000);


alter table Suppliers
drop check chckCst2;
/*
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000)
*/
#Domain Integrity 
#User Defined Integrity

create table Student
(
studentId varchar(20) primary key,
studentName varchar(50),
studentPhone varchar(30) default 'No Phone',
studentPermAddress varchar(100),
studentTempAddress varchar(100),
studentEmail varchar(100),
constraint emaiUniqCst unique(studenteMail)
);

insert into Student
values('S009','Kiran','8744543939','Shivajinagar','manju@gmail.com','Shivajinagar');
select * from Student;

select * from Student;

#Dropping default
alter table Student
alter studentTempAddress set default 'Same AS Permanent Address';

alter table student
alter studentTempAddress drop default;

#ADDING NEW COLUMN TO AN EXISTING TABLE
alter table Student
add column studentTempAddress varchar(100);

#SETTING DEFAULT CONSTRAINT
alter table student
alter studentTempAddress set default 'Same AS Permanent Address';

select * from STudent;

# DROPPING COLUMNS
alter table student
drop column studentTempAddress; 

select * from Student;

#Dropping Unique Constraint
alter table Student
drop index emaiUniqCst;

describe Department;
select * from Department;

alter table Department
add constraint deptNameUniqCst unique(deptName);


/* Violates Unique Key Cosntraint 
insert into Department
values('D004','Maintenance','Suraj'); */

insert into Department
values('D004','Testing','Suraj');

insert into Department(deptId,deptHead)
values('D006','Sriram');
select * from Department;
alter table Department
add column deptStrength int;
select * from Department;
#-------------------dropping Constraints-------------------------------------
#Dropping Primary Key

alter table Supplier
drop primary key;

create table Dealer
(
dealerId varchar(20) primary key,
dealerName varchar(50),
dealerCommission int
);

create table Agency
(
agencyId varchar(20),
agencyName varchar(50),
dealerId varchar(20),
constraint cfkey10 foreign key(dealerId) references Dealer(dealerId)
);

insert into Dealer
values('D001','Suman Gupta',20);

select * from dealer;
select * from Agency;
insert into Agency
values('AG002','RPAgencies','D002');

#DROP FOREIGN KEY
alter table Agency
drop foreign key cfkey10;
/*mSSQL syntax
alter table Dealer
drop constraint cfkey10;  */
-- ---------------------------------------- INDEXING -----------------------


create table StudentInfo
(
StudentId varchar(20) primary key,
StudentName varchar(30),
StudentState varchar(30),
StudentCity varchar(30)
);
/*
Andhra Assam Goa Karnataka Kerala Madhyapradesh Maharashtra TamilNadu
Amarendra	 Bhupendra Chandan Christie David Dravid Faheem Farhan Ganesh Emanuel Yasmeen
Zeenat
*/
insert into StudentInfo
values
('S001','KiranKumar', 'Andhra' ,'Vijayawada'),
('S002','Amarendra', 'Andhra' ,'Vizag'),
('S003','Christie', 'Andhra' ,'Hyderabd'),
('S004','Chandan', 'Andhra' ,'Anantpur'),
('S005','Emanuel', 'Assam' ,'Gauhati'),
('S006','Ganesh', 'Karnataka' ,'Bangalore'),
('S007','Greeshma', 'Maharashtra' ,'Mumbai'),
('S008','Harsha', 'Assam' ,'Dispur'),
('S009','Yasmeen', 'Karnataka' ,'Mysore'),
('S010','Zeenat', 'Maharashtra' ,'Pune'),
('S011','Dhruva', 'Assam' ,'Cherrapunji'),
('S012','Dominic', 'Karnataka' ,'Mangalore'),
('S013','Catherine', 'TamilNadu' ,'Chennai'),
('S014','Amar', 'TamilNadu' ,'Coimbatore'),
('S015','Dharmesh', 'Goa' ,'Panaji'),
('S016','GuruKiran', 'TamilNadu' ,'Madurai');

create table StudentFeePyt
(
FeePytId varchar(20) primary key,
StudentId varchar(20),
Semester varchar(20),
Amount float,
constraint pytCkey foreign key (StudentId) references StudentInfo(StudentId)
);


insert into StudentFeePyt
values
('F001','S001','Sem1',10000),
('F002','S002','Sem1',12000),
('F003','S003','Sem1',13000),
('F004','S004','Sem2',14000),
('F005','S005','Sem2',15000),
('F006','S006','Sem2',16000),
('F007','S007','Sem3',17000);

select * from StudentInfo;
select * from studentFeePyt;

create index idxName
on StudentInfo(StudentName);

select StudentName from StudentInfo;

create index idxState
on StudentInfo(StudentState);

select studentState from StudentInfo;

select studentState,studentName 
from studentInfo;

create index idxNameState
on StudentInfo(studentState,studentName);
select studentState,studentName 
from studentInfo;

select studentName,studentState
from studentInfo;

create index idxNameState1
on StudentInfo(studentName,studentState);

select studentName,studentState
from studentInfo;
-- ---------------- DROPPING INDEX---------------
alter table StudentInfo
drop index idxNameState1;
-- -------------------------------------------VIEWS--------------------

-- ---------------------------------------------------VIEWS REVISITED----------------------------------------------------
create table Customers1
(
customerId varchar(20) primary key,
customerName varchar(50),
customerAddress varchar(100),
customerPhone varchar(20)
);
select * from Customers1;

insert into Customers1
values
('C001','Suman','RTNagar','9389939933'),
('C002','Suresh','RKNagar','9389934533'),
('C003','Kiran','RSNagar','9389387933');

insert into Customers1
values
('C004','Rajesh','Malleswaram','8939939939'),
('C005','Rakesh','Koramangala','8747939939');
create table Orders1
(
orderId  varchar(20) primary key,
orderDate date,
orderQty int,
productId varchar(20),
orderValue int,
customerId varchar(20),
constraint cfke2 foreign key(customerId) references Customers1(customerId)
);

insert into Orders1
values
('O001','2020-04-23',20,'P001',200000,'C002'),
('O002','2020-05-23',20,'P001',200000,'C002'),
('O003','2020-06-23',10,'P002',400000,'C003'),
('O004','2020-04-23',15,'P003',300000,'C001'),
('O005','2020-06-23',10,'P001',400000,'C002'),
('O006','2020-07-23',5,'P002',300000,'C003'),
('O007','2020-08-23',15,'P003',400000,'C001'),
('O008','2020-09-23',20,'P001',400000,'C002'),
('O009','2020-10-23',25,'P003',300000,'C003');

select * from Orders1;
select * from Products1;




create table Products1
(
productID varchar(20) primary key,
productName varchar(50),
productCategory varchar(30),
productDescription varchar(30),
supplierId varchar(20),
pricePerUnit int
);
insert into Products1
values
('P001','Television','Electronics','HouseHold Goods','S001',30000),
('P002','Refrigerator','Electronics','HouseHold Goods','S002',40000),
('P003','WashingMachine','HomeAppliance','HouseHold Goods','S003',30000),
('P004','LapTop','Electronics','Educational','S004',40000);

alter table Orders1
add Constraint cfpk2 foreign key(productId) references Products1(productId);

alter table Products1
add Constraint cfspk1 foreign key(supplierId) references Suppliers1(supplierId);
create table Suppliers1
(
supplierId varchar(20) primary key,
supplierName varchar(50),
supplierPhone varchar(40),
supplierAddress varchar(100),
supplierCategory varchar(50),
supplyValue int
);
select * from customers1;
select * from Orders1;
select * from Products1;
select * from Suppliers1;


insert into Suppliers1
values
('S001','Suryakanth','9534352992','Chennai','Furniture',5500000),
('S002','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S003','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S004','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000);


alter table Suppliers
drop check chckCst2;
/*
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000),
('S001','Naresh Gupta','9929992992','Chandigarh','Electricals',4500000)
*/


select 
c.CustomerId,c.customerName,c.customerAddress,
o.OrderId,o.OrderDate,o.orderQty,o.orderValue,
p.productName,p.productCategory,p.pricePerUnit,
s.supplierName,s.supplierCategory,s.supplierAddress
from 
Customers1 c join Orders1 o
on c.customerId = o.customerId
join Products1 p
on o.productId = p.productId
join Suppliers1 s
on p.supplierId = s.supplierId;

create view MyCustOrderProdSupplierDetailsView1
as
select 
c.CustomerId,c.customerName,c.customerAddress,
o.OrderId,o.OrderDate,o.orderQty,o.orderValue,
p.productName,p.productCategory,p.pricePerUnit,
s.supplierName,s.supplierCategory,s.supplierAddress
from 
Customers1 c join Orders1 o
on c.customerId = o.customerId
join Products1 p
on o.productId = p.productId
join Suppliers1 s
on p.supplierId = s.supplierId;

select * from MyCustOrderProdSupplierDetailsView1;

-- ---------
select * from StudentInfo;
select * from StudentFeePyt;

create view StudentInfoView
as
select StudentId,StudentName,StudentCity from StudentInfo;

select * from StudentInfoView;

update StudentInfoView
set StudentCity='Rajahmundry' where StudentId = 'S001';
use ctsdatamdu;
select * from StudentInfo;
select * from StudentInfoView;
select * from studentFeePyt;

update StudentInfoView
set StudentState='AndhraPradesh' where StudentId = 'S001';

insert into StudentInfoView
values('S017','Amaresh','Madurai');

-- ------------------------------------------Views Continued----------------------------
update StudentInfo
set StudentState = 'TamilNadu' where StudentId = 'S017';

delete from StudentInfoView where studentId = 'S017';
select * from StudentFeePyt;

delete from StudentInfoView where studentId = 'S004';
delete from StudentFeePyt where FeePytId = 'F004';
-- -------------------------------
select * from StudentInfoView;



create view StudentFeePytInfoView
as
select StudentInfo.StudentId,studentName,studentCity,FeePytId,Semester,Amount
from StudentInfo join StudentFeePyt
on StudentInfo.studentId = StudentFeePyt.studentId;

select * from StudentFeePytInfoView;
/* Inserting a View when more than one 
Underlying tables exist, insertion can take place for only one underlying table at a time*/
insert into StudentFeePytInfoView(StudentId,studentName,studentCity)
values('S018','Gaurav','Bangalore');

insert into StudentFeePytInfoView(FeePytId,Semester,Amount)
values('F008','Sem1',14000);

update StudentFeePyt
set StudentId = 'S018' where FeePytId='F008';

update StudentInfo
set StudentState = 'Karnataka' where studentId= 'S018';
select * from StudentInfo;
select * from studentFeePyt;
select * from StudentFeePytInfoView;
# Updation of more than one Underlying Table simultaneously is Prohibited
/*update StudentFeePytInfoView
set studentName='GauravGupta', Amount =15000
where StudentId = 'S018';*/

update StudentFeePytInfoView
set studentName='GauravGupta',studentCity='BangaloreUrban'
where StudentId = 'S018';

update StudentFeePytInfoView
set Semester = 'Sem2',Amount = 15000 where FeePytId = 'F008';

#Deletion of records thru view when more than one Underlying tables exists is Prohibited
/*delete from StudentFeePytInfoView
where StudentId = 'S018';*/
-- ----------------------------------------------SUBQUERIES--------------------------------------


select * from Movies;
#View all Movies Categories for those Movies whose Collections are greater than any of the 
#collections that are greater than avg(collections) of all movies
/*
select round(avg(collections),0) from Movies;
select MovieId,Collections from Movies where collections > 1491667;*/
#OR
#Fetch Movies where Collections are greater than any of the Collections, that are greater than the average collections
select movieId,movieCategory from Movies where collections > 
any(select collections from Movies where collections > (select avg(collections) from Movies));

/* >any means > least of the list of values supplied 

#2)Fetch Movies where Collections are greater than all of the Collections, 
#that are greater than the average collections [> all]

9 < all [10,20,30,40] avg 8
#mOdified Comparison operator  > >= < <= any
(select * from Movies where collections < all 
(select collections from Movies where collections >
(select avg(collections) from Movies)));

#3)
Fetch all movie details for those MovieCategories, 
whose colections are greater than, the least collection of the movies[in][addtl not in]

select * from Movies where movieCategory in 
(select movieCategory from movies where collections in
(select collections from movies where collections >
(select min(collections) from Movies)));

#4)Fetch all movie details for those MovieCategories, whose colections are greater than, 
#the avg collection of the movies[in][addtl not in]

(select * from Movies where MovieCategory in
(select MovieCategory from Movies where collections >
(select avg(collections) from Movies)))

#5)
Fetch all movies details whose collections are 
# not found in  those of Movies whose collections are greater than the average collections of the movies
#Using not
(select * from Movies where MovieCategory not in
(select MovieCategory from Movies where collections >
(select avg(collections) from Movies)))



#6)Fetch all suppliers of those Products for which the Orders are placed with an OrderValue > 100000

(select * from Suppliers1 where supplierId in 
(select supplierId from Products1 where productId in
(select ProductId from Orders1 where OrderValue in 
(select OrderValue from Orders1 where OrderValue > 200000))))

#7)Fetch all Customer details, who have placed Orders for 
# the Products with an OrderVAlue greater than average OrderValue

(select * from Customers1 where CustomerId in (
select CustomerId from Orders1 where orderValue >
(select avg(OrderValue) from Orders1)))
-- -----------------------------


#8)Fetch All suppliers for those products for which the 
#OrderValue has been more than the Average OrderValue

select * from Suppliers1 where supplierId in 
(select supplierId from Products1 where productId in
(select ProductId from Orders1 where OrderValue >
(select avg(orderValue) from Orders1)));

#9)Fetch ALl Products Details , for those Products for which the Orders have not been placed at all

select * from Products1 where ProductId not in
(select productId from Orders1)

#10)Fetch all customers who have not placed any Order at all

select * from Customers1 where CustomerId not in (select customerId from Orders1)

#11) If at all there exists Orders with OrderValue greater than the average OrderValue, then fetch all Product Details

select * from Products1 where exists
(select orderValue from Orders1 where orderValue >
(select avg(orderValue) from Orders1))


#11a) If at all there exists Orders with OrderValue greater than the average OrderValue, 
#then fetch all corresponding Product Details

select * from products1 where productId in
(select productId from Orders1 where orderValue in
((select orderValue from Orders1 where orderValue >
(select avg(orderValue) from Orders1))))

use ctsdatamdu;
select * from Customers1;
select * from Orders1;
select * from Products1;
select * from Suppliers1;
select avg(OrderValue) from Orders1;

#12   If at all there exists Orders with OrderQuantity that is greater than or equal to 15 then fetch the ProductDetails
select * from Products1 
where exists(
select orderValue from Orders1 where OrderQty  >= 15)

#13) If at all there exists Orders with OrderQuantity that is greater than or equal to 15, 
then Fetch the Product details for those orders

select * from Products1 where productId in
(select productId from Orders1 where OrderQty >= 15 )

#VS

select * from Products1
where exists
(select orderId from Orders1 where OrderQty  >= 15) //True or False

#14) If at all there exists Orders with OrderQuantity that is greater than or equal to 15 , 
#then fetch the Customer Details for those Orders

(select * from Customers1 where customerId in
(select CustomerId from Orders1 where orderQty >= 15))
VS
select * from Customers1
where exists
(select OrderQty from Orders1 where orderQty >= 15)

#15) If at all there exists Products whose category is Electronics , then fetch the Product details

select * from Products1
where exists
(select * from Products1 where ProductCategory = 'Electronics')

#16)   If at all there exists Products whose category is Electronics , 
#then fetch the Product details of Electronics Category

select * from Products1 where productCategory in
(select productCategory from Products1 where ProductCategory = 'Electronics')
-- -----------------
select * from movies;
insert into Movies
values('M013','HSGS','Drama',1850000);

create view catView2
as
select moviecategory,count(moviecategory) as 'catcount'
from movies group by movieCategory

select * from catView2;

select moviecategory from catView2 where 
catCount = (select max(catCount) from catView2);
-- --------------------------------------------------PROCEDURES-------------------------
delimiter $$
use ctsdatamdu $$
create procedure mduProc1()
begin
select 'Hello';
end $$

delimiter $$
use ctsdatamdu $$
create procedure mduProc2()
begin
select 'Hello' as 'My Greetings';
end $$

call mduProc1;
call mduProc2;
# int num1;

delimiter $$
use ctsdatamdu $$
create procedure mduProc3()
begin
	declare num1,num2,total int;
	set num1 = 100;
	set num2 = 200;
	set total = num1 + num2;
	select num1 as 'FirstNumber';
	select num2 as 'SecondNumber';
    select total as 'Sum of Numbers';
end $$

call mduProc3;

delimiter $$
use ctsdatamdu $$
create Procedure mduProc4(in score1 int,in score2 int)
begin
declare total int;
declare resultStr varchar(100);
set total = score1 + score2;
if total >= 100 and total < 120 then set resultStr = 'Good Passed';
	elseif total >= 120 and total < 140 then set resultStr = 'VGood Secured FirstClass' ;
	elseif total >= 140 and total <= 200 then set resultStr = 'Excellent Secured Distinction';
	else set resultStr = 'Sorry Try Again';
end if;
select score1 as 'Score1';
select score2 as 'Score2';
select total as 'TotalScore';
select resultStr as 'Result';
end $$;


drop procedure mduProc4;
call mduProc4(75,80);
call mduProc4(45,43);

delimiter $$
use ctsdatamdu $$
create Procedure mduProc5(in score1 int,in score2 int,out resultStr varchar(100) )
begin
declare total int;
set total = score1 + score2;
if total >= 100 and total < 120 then set resultStr = 'Good Passed';
	elseif total >= 120 and total < 140 then set resultStr = 'VGood Secured FirstClass' ;
	elseif total >= 140 and total <= 200 then set resultStr = 'Excellent Secured Distinction';
	else set resultStr = 'Sorry Try Again';
end if;
select score1 as 'Score1';
select score2 as 'Score2';
select total as 'TotalScore';
select resultStr as 'Result';
end $$;


call mduProc5(75,85,@result);
select @result as 'Final result';



delimiter $$
use ctsdatamdu $$
create Procedure fetchEmployees1()
begin
select * from Customers1;
end $$

call fetchEmployees1;


delimiter $$
use ctsdatamdu $$
create Procedure fetchEmployeeByIdMDU(in empId varchar(30))
begin
select * from Employee where employeeId = empId;
end $$

call fetchEmployeeByIdMDU('E004');
select * from Employee;

delimiter $$
use ctsdatamdu $$
create Procedure fetchEmployeeDetailsMDU(in empId varchar(30),out empAddress varchar(150), out empSalary float)
begin
set empAddress = (select employeeAddress from employee where employeeId = empId);
set empSalary = (select employeeSalary from employee where employeeId = empId);
select empId as 'EmployeeId';
select empAddress as 'EmployeeAddress';
select empSalary as 'EmployeeSalary';
end $$

select * from Employee;

call fetchEmployeeDetailsMDU('E006',@empAdd,@empSal);
select @empSal as 'Salary';
select @empAdd as 'Address';


# CASE CONSTRUCT
use ctsdatamdu;
select customerId,orderQty,
	case 
		 when orderQty between 5 and  10 then 'Good Order'
          when orderQty between 11 and  15 then 'Good Order'
         when orderQty between 16 and  20 then 'Good Order'
         else 'Not An Order' 
	end as 'OrderType'
    from Orders;






