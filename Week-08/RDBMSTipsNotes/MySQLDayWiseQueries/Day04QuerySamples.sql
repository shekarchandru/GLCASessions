use  coforgedb;

create table Department
(
DeptId varchar(20) primary key,
DeptName varchar(40),
DeptHead varchar(30),
DeptStrength int
);

create table Employee1
(EmployeeId varchar(20) primary key,
EmployeeName varchar(20),
EmployeeAddress varchar(30),
DeptId varchar(20));
select * from Employee1;

select * from Department;

create table Salary1
(
SalaryId varchar(20) primary key,
EmployeeId varchar(20) , # foreign key
GrossSalaty int,
NettSalary int,
constraint cfkey3 foreign key (EmployeeId) references Employee1(EmployeeId)
);
# Employee Salary Department
# EmployeeId Primary table : Employee1 - Sub Table:Salary1
# DepartmentID Primary table : Department - Sub Table: Employee1
select * from Employee1;
select * from salary1;
insert into Salary1
values
('S5','E10',1000,900);
use coforgedb;
select * from Employee1;

alter table Salary1
drop foreign key cfkey3;
#
select * from salary1;

alter table salary1
add constraint chk2 check(GrossSalaty between 1000 and 5000);

select * from salary1;

insert into Salary1
values('S6','E1',1500,4200);


#----------------------------------------------------------------------------
create table Vendor
(
vendorId varchar(10),
vendorName varchar(20),
vendorPhone varchar(30)
);

insert into Vendor
values('V1','Harsha','9293993933');

select * from Vendor;

insert into Vendor(vendorId,vendorName)
values('V3','Kumar');

alter table Vendor
alter vendorPhone set default  'NoPhone';

alter table Vendor
alter vendorPhone drop default;

#------------------------------------------------------------
create table Suppliers
(
SupplierId varchar(20) primary key,
SupplierName varchar(30),
SupplierEMail varchar(30),
SupplierPhone varchar(20) unique,
constraint cunique unique (SupplierEmail)
);
insert into Suppliers
values
( 'S002','Harish','harish@gmail.com','9864579393');

insert into Suppliers
values
( 'S004','Kumar','kir@gmail.com','9864736493');

select * from Suppliers;

alter table Suppliers
drop index cunique;
#--------------------------------
select * from employee;
select * from salary1;

select * from salary1 where NettSalary between 1000 and 2000;
select * from salary1 where NettSalary not between 1000 and 2000;
select * from Employee;
select * from Employee where EmployeeCity in ('Bangalore','Chennai');
select * from Employee where EmployeeCity not in ('Bangalore','Chennai');

select * from salary1 where GrossSalaty >= 3000;

select * from employee where EmployeeName like 'K%';

select * from Employee where EmployeeCity = 'Bangalore' and EmployeeName like 'K%';

select employeeId,employeeName, employeePhone from Employee;
select employeeId as 'Employee Id' , employeeName as 'EmployeeName',employeePhone as 'Employee Phone' from Employee;

select * from salary1;

select  (GrossSalaty - (0.1 * GrossSalaty)) as '10% Deduction In Gross' from salary1;

select  (GrossSalaty - (0.1 * GrossSalaty)) as '10% Deduction In Gross' from salary1 where GrossSalaty > 2000 ;

#------------------------------------------------------Functions-----------------------------------------
create table Supplier
(SupplierId varchar(20), sFirstName varchar(20),sLastName varchar(30));

insert into Supplier
values
('S001','Kishore','Gupta'),
('S002','Rakesh','Verma'),
('S003','Dheena','Choudhary'),
('S004','Manohar','Mehta');

select * from Supplier;





select concat('hello','world','new');

select concat(sFirstName,sLastName) as 'Supplier FullName' from Supplier;

select insert("Internet",4,3,'mission');

select instr('Internet','net');

select field('three','two','three','two','four','four');

select reverse('hello');

select ltrim('      hello');

select substring('hello world',3,6);

select replace('hello world','o','p');

select left('world over',4);

select right('world over',4);

select space(5);

select * from employee;

select concat(empname,space(3),empaddress) from employee;

select concat(sFirstName,space(3),sLastName) as 'Supplier FullName' from Supplier;
#------------------------------------Date Functions-------------------------------------------
select datediff('2020-2-23 23:59:59','2018-2-23 23:59:59');
select * from employee;

select datediff('2022-05-04 23:59:59','2020-05-02 23:59:59');

select employeeName, datediff(curdate(),doj) as 'TotalDays Since DOJ' from employee;

select curdate();
select curtime();
select now();
select datediff(curdate(),empDOJ) as 'NoOfDays Since Joined'  from empl1;

select date_add(curdate(),interval 2 year);
select date_add(curdate(),interval 2 day);

select date_sub(curdate(),interval 25 day);
/*

    MICROSECOND
    SECOND
    MINUTE
    HOUR
    DAY
    WEEK
    MONTH
    QUARTER
    YEAR
    SECOND_MICROSECOND
    MINUTE_MICROSECOND
    MINUTE_SECOND
    HOUR_MICROSECOND
    HOUR_SECOND
    HOUR_MINUTE
    DAY_MICROSECOND
    DAY_SECOND
    DAY_MINUTE
    DAY_HOUR
    YEAR_MONTH*/

SELECT RPAD('hi',1,'?');

select strcmp('w','h');

select ascii('h');

select upper(sFirstname) from supplier;

select ceil(2.3456);
select floor(2.3456);
select log10(100);
select mod(245,10);

select 245 mod 10;
select radians(90);
select degrees(1.57);
select sin(1.57);
select pow(2,3);
select sqrt(144);

select sqrt(GrossSalaty) from salary1;
#-------------------------------------------------------
select * from Employee
order by EmployeeCity;

select * from Employee
order by DOJ desc;
#----------------max,min,avg average, count sum-------------------
select * from salary1;

select max(GrossSalaty) from salary1;
select avg(GrossSalaty) from salary1;
select min(GrossSalaty) from salary1;
select max(GrossSalaty) as 'Max Gross', min(GrossSalaty) as 'Min Gross' , avg(GrossSalaty) as 'Average Gross' from salary1;

select count(*) from Employee;
create table Movies
(
MovieId varchar(20) primary key,
MovieCategory varchar(30),
MovieName varchar(20),
Collections int);

drop table Movies;
insert into Movies
values
('M1','Comedy','HAHK',450000),
('M2','Tragedy','HSKK',550000),
('M3','Drama','JHGK',650000),
('M4','Comedy','STRA',750000),
('M5','Drama','LKAP',850000),
('M6','Comedy','WRTS',950000),
('M7','Drama','NJFMSD',350000),
('M8','Tragedy','SKJD',850000),
('M9','Comedy','KJHA',1250000),
('M10','Tragedy','SIYT',1150000),
('M11','Action','OUAY',750000),
('M12','Tragedy','LKAP',900000),
('M13','Action','SMNX',1100000);

select MovieCategory, avg(Collections) as 'Average Collections', 
max(Collections) as 'MaximumCollections', min(Collections) as 'MinimumCollections',
sum(Collections) as 'TotalCollections' from Movies group by Moviecategory;

select MovieCategory, avg(Collections) as 'Average Collections', 
max(Collections) as 'MaximumCollections', min(Collections) as 'MinimumCollections',
sum(Collections) as 'TotalCollections' from Movies group by Moviecategory
having max(collections) >= 1000000;


#====================
Create table Customers
(
CustomerId varchar(20) primary key,
CustomerName varchar(30) ,
CustomerAddress varchar(40),
CustomerPhone varchar(20)
);
insert into Customers
values
('C001','Harsha','RTNagar','9838292992'),
('C002','Harish','JayaNagar','9838253692'),
('C003','Kiran','IndiranaNagar','9836172992'),
('C004','Chethan','Koramangala','9838298192'),
('C005','Suman','Malleswaram','9838271882'),
('C006','Mahesh','RRNagar','9838287172');

create table Products
(
ProductId varchar(20) primary key,
ProductName varchar(20),
ProdCategory varchar(20),
PricePerUnit int
);
select * from Customers;
insert into Products
values
('P001','Television','Electronics',15000),
('P002','Refrigerator','Electronics',25000),
('P003','WashingMachine','Electronics',20000),
('P004','MixerGrinder','HomeAppliance',5000),
('P005','Microwave','HomeAppliance',7000),
('P006','Cooker','Utensil',1000),
('P007','BookShelf','Furniture',12000);

insert into Orders
values
('O001','2020-1-15','C001',100000,'P001',10),
('O002','2018-2-15','C001',100000,'P001',20),
('O003','2017-1-15','C001',120000,'P002',15),
('O004','2016-1-15','C002',10000,'P002',5),
('O005','2019-3-15','C002',150000,'P003',25),
('O006','2020-4-15','C003',200000,'P003',30),
('O007','2020-5-15','C003',100000,'P003',15),
('O008','2020-6-15','C001',100000,'P004',10),
('O009','2020-2-15','C004',120000,'P005',12),
('O010','2020-3-15','C001',130000,'P005',13);
create table Orders
(
OrderId varchar(20) primary key,
OrderDate date,
CustomerId varchar(20),
OrderValue float,
ProductId varchar(20),
OrderQuantity int,
constraint fkeyord1 foreign key (CustomerId) references Customers(CustomerId),
constraint fkeyprod1 foreign key (ProductId) references Products(ProductId)
)

select * from Customers;
select * from products;
select * from Orders;

select Customers.CustomerId, CustomerName,CustomerAddress,OrderDate,OrderValue,ProductName,ProdCategory
from Customers join Orders
on Customers.CustomerId = Orders.CustomerId
join products
on Orders.ProductId = Products.ProductId;
#--------------------------------------------------------------------------
create table Authors
(
AuthorId varchar(20) primary key,
AuthorName varchar(40),
AuthorCity varchar(40)
);
insert into Authors
values
A				B
('A001','Kuvempu','Mysore'),		('A001','Kuvempu','Mysore'),
('A002','Akilan','Chennai'),		('A002','Akilan','Chennai'),
('A003','Shakespeare','London'),	('A003','Shakespeare','London'),
('A004','Shelly','London'),		('A004','Shelly','London'),	
('A005','Hari','Allahabad'),		('A005','Hari','Allahabad'),	
('A006','AnaKru','Mysore'),		('A006','AnaKru','Mysore'),
('A007','Nisar','Bangalore'),		('A007','Nisar','Bangalore'),
('A008','Keats','London'),		('A008','Keats','London'),
('A009','Wordsworth','London');	('A009','Wordsworth','London');

select a.AuthorName,a.AuthorCity,b.AuthorName,b.AuthorCity
from Authors a join Authors b
on a.AuthorCity = b.AuthorCity
and
a.AuthorId < b.AuthorId;

































































#WRONG
#alter table Department
#add constraint cfkey1 foreign key (DeptId) references Employee1(DeptId);

alter table Employee1
add constraint cfkey2 foreign key (DeptId) references Department(DeptId);

#Primary Table for DeptId
insert  into Department
values
('D1','Engg','Gupta',250),
('D2','Maint','Choud',350),
('D3','Suppo','Mehta',450),
('D4','Acct','Verma',150);

insert into Employee1
values
('E5','LKO','Ngr','D7');







