use coforgedb;
select * from Customers;
select * from Orders;
#INNER JOINS
select * from  Customers inner join Orders 
on Customers.CustomerId = Orders.CustomerId;

select * from  Customers inner join Orders 
on Customers.CustomerId < Orders.CustomerId;

# LEFT OUTER JOIN
select CustomerName,CustomerAddress,OrderDate,OrderValue
from Customers left outer join Orders
on Customers.CustomerId = Orders.CustomerId;

# RIGHT OUTER JOIN
select CustomerName,CustomerAddress,OrderDate,OrderValue
from Customers right outer join Orders
on Customers.CustomerId = Orders.CustomerId;

#CROSS JOIN
select customers.*,Orders.* from
Customers cross join Orders;

# Natural Join
select * from  Customers natural join Orders ;

select * from Products;
#------------------------------------------------------------------------------
create table Customers1
(
CustomerId varchar(10) primary key,
CustomerName varchar(30),
CustomerAddress varchar(30)
);
insert into Customers1
values
('C0001','Kishore','RTNagar'),
('C0002','Kiran','RRNagar'),
('C0003','Kumar','IndiraNagar'),
('C0004','mahesh','JayaNagar');
create table Suppliers1
(
SupplierId varchar(20) primary key,
SupplierRegion varchar(30),
SupplierContact varchar(20)
);
insert into Suppliers1
values
('S0001','South','9828828882'),
('S0002','North','9825369882'),
('S0003','West','9825428882');

create table Products1
(
ProductId varchar(20) primary key,
ProductName varchar(20) ,
ProdCategory varchar(20),
SupplierId varchar(20),
constraint csupfkey foreign key (SupplierId) references Suppliers1(SupplierId)
);
insert into Products1
values
('P001','Television','Electronics','S0001'),
('P002','Refrigerator','HomeAppliance','S0001'),
('P003','AudioPlayer','Electronics','S0002'),
('P004','WashingMachine','HomeAppliance','S0003'),
('P005','VacuumCleaner','Electronics','S0001'),
('P006','MixerGrinder','HomeAppliance','S0002');

create table Orders1
(
OrderId varchar(20) primary key,
OrderDate date,
ProductId varchar(20),
Quantity int,
OrderValue float,
CustomerId varchar(20),
constraint cprodfkey foreign key (ProductId) references Products1(ProductId),
constraint ccustfkey foreign key (CustomerId) references Customers1(CustomerId)
);
insert into Orders1
values
('O001','2020-02-20','P001',10,50000,'C0001'),
('O002','2019-04-22','P002',20,150000,'C0001'),
('O003','2020-05-25','P001',15,175000,'C0002'),
('O004','2019-03-21','P003',12,70000,'C0003'),
('O005','2019-02-12','P004',11,60000,'C0004'),
('O006','2020-01-13','P004',5,25000,'C0001'),
('O007','2020-08-22','P005',9,80000,'C0002');

select * from Customers1;
select * from Products1;
select * from Suppliers1;
select * from Orders1;

#Joining 4 Tables

select Customers1.CustomerId,CustomerName,CustomerAddress,OrderDate,OrderValue,Quantity,ProductName,ProdCategory,SupplierRegion,SupplierContact
from Customers1 join Orders1
on Customers1.CustomerId = Orders1.CustomerId
join Products1
on Orders1.ProductId = Products1.ProductId
join Suppliers1
on Products1.SupplierId = Suppliers1.supplierId;




#INDEXING
create table Sports
(
SportId varchar(20) primary key,
SportName varchar(30)
);

insert into Sports
values
('S9','VolleyBall'),
('S8','Cricket'),
('S1','Tennis'),
('S5','Kabaddi'),
('S4','Golf'),
('S6','Chess'),
('S2','Carrom'),
('S3','BasketBall'),
('S7','Hockey');

select * from Sports;
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
select * from StudentInfo;


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

create index NameIdx
on StudentInfo(StudentName);

select * from StudentInfo;

select StudentName,StudentState from StudentInfo;

#Indexing for multiple fields more than one
create index NameStateIdx
on StudentInfo (Studentname,StudentState);
select Studentname,StudentState from StudentInfo;


select StudentName,StudentState,StudentCity from StudentInfo;

select StudentName from StudentInfo;
select StudentCity from StudentInfo;


create index cityIdx
on StudentInfo (StudentCity);

select StudentCity from StudentInfo;

insert into StudentInfo
values
('S017','Chandan', 'Karnataka' ,'Bangalore'),
('S018','Ganesh', 'Andhra' ,'Rajahmundry'),
('S019','Emanuel', 'Goa' ,'Panjim'),
('S020','Chandan', 'TamilNadu' ,'Coimbatore'),
('S021','Emanuel', 'Andhra' ,'Nellore'),
('S022','Ganesh', 'Karnataka' ,'Mysore');

#NO INDEX CREATE DFOR THIS COMBINATION - SO MAINTAINS ORIGINAL ORDER
select StudentName,StudentState,StudentCity from StudentInfo;

#Index exists for the combination below
select StudentName,StudentState from StudentInfo;

create index StudNameStateCityIdx
on StudentInfo(StudentName,StudentState,StudentCity);

#Index is available for the following  Combination
select StudentName,StudentState,StudentCity from StudentInfo;

select StudentCity from StudentInfo;

alter table StudentInfo
drop index StudNameStateCityIdx;

#--------------------------VIEWS---------------------------------

create view StudentInfoView
as
select * from StudentInfo;

select * from StudentInfoView;

create view StudentNameCityView
as
select StudentName,StudentCity from StudentInfo;

select * from StudentNameCityView;

delete from StudentNameCityView where StudentId = 'S023';



# alter View vs Update View
Update  StudentInfoView
set StudentState = 'Karnataka' where StudentId = 'S002';

select * from StudentInfo where StudentId = 'S002';

alter view StudentNameCityView
as
select StudentId,StudentName,StudentCity from StudentInfo;

select * from StudentNameCityView;
#==

create view CustomerSupplierView
as
select Customers1.CustomerId,CustomerName,CustomerAddress,OrderDate,OrderValue,Quantity,ProductName,ProdCategory,SupplierRegion,SupplierContact
from Customers1 join Orders1
on Customers1.CustomerId = Orders1.CustomerId
join Products1
on Orders1.ProductId = Products1.ProductId
join Suppliers1
on Products1.SupplierId = Suppliers1.supplierId;

select * from CustomerSupplierView;

#Alter View 
alter view CustomerSupplierView
as
select CustomerName,CustomerAddress,OrderDate,OrderValue
from Customers left outer join Orders
on Customers.CustomerId = Orders.CustomerId;

select * from CustomerSupplierView;

/*
create table StudentFeePyt
(
FeePytId varchar(20) primary key,
StudentId varchar(20),
Semester varchar(20),
Amount float,
constraint pytCkey foreign key (StudentId) references StudentInfo(StudentId)
);
*/
#-------------------------------Views for multiple Underlying tables-----------------
create view StudentPytView
as
select StudentInfo.StudentId,StudentName,StudentState,StudentCity,StudentFeePyt.FeePytId,Semester,Amount
from StudentInfo join StudentFeePyt
on 
StudentInfo.StudentId = StudentFeePyt.StudentId;

select * from StudentPytView;

#Updating the Underlying First Table of the Joined Tables, through a View
update StudentPytView
set StudentState = 'TamilNadu' , StudentCity='Chennai' where StudentId = 'S003';

#Updating the Underlying Second Table of the Joined Tables, through a View
update StudentPytView
set Semester='Sem2' , Amount =  20000 where FeePytId = 'F003'; 

#Trying to Update both the Underlying tables simultaneously
#Prohibits one from modifying multiple underlying tables simultaneously, one can modify one underlying table at a time
update StudentPytView
set StudentState = 'Karnataka' , StudentCity='Bangalore' ,Semester='Sem3' , Amount =  25000 where StudentId = 'S003';


select * from StudentInfo;
select * from StudentFeePyt;
select * from StudentPytView;

select * from StudentInfo;
insert into StudentPytView(StudentId,StudentName,StudentState,StudentCity)
values('S023','Rajesh','Karnataka','Mangalore');

insert into StudentPytView(FeePytId,Semester,Amount)
values('F008','Sem3',15000);

update StudentFeePyt set StudentId = 'S023'
where FeePytId = 'F008';

# Deleting records Through View ; 
# Avoid this because you have data joined from multiple tables
#Deletion through view affecting multiple tables hsould be avoided
delete from StudentPytView where StudentId = 'S023';

#Deletion of Views if it affects only one table it can be done As long as Foreign Key Relationship is not affected

# Dropping a View
drop view StudentPytView;
#-------------------------------------------SUB QUERIES-----------------------------------------

select * from Movies;
#Fetch Movies where Colections are greater than any of the Colections which are greater than the average colections.
select * from Movies where Collections < any (select collections from Movies where collections > (select avg(collections) from movies));

select * from Movies where Collections < all  (select collections from Movies where collections > (select avg(collections) from movies));

select * from Movies where MovieCategory in ( select MovieCategory where collections > (select min(Collections) from movies));

select * from Movies where MovieCategory in ( select MovieCategory from movies where collections > (select min(Collections) from movies));

select MovieName,Collections from Movies where Moviecategory in 
(select MovieCategory where collections not in ( select collections from Movies where collections > (select avg(collections) from movies) ) );

select * from Products1;
select * from Orders1;
select * from Customers1;
select * from Suppliers1;

# View  Supplier Details for those products for which the orders are placed ordervalue > 100000

# View all suppliers for those Products for which OrderValue > 100000
select * from Suppliers1 where SupplierId in 
(select SupplierId from Suppliers1 where SupplierId in 
(select SupplierId from Products1 where ProductId in 
(select ProductId from Orders where OrderValue > 100000)));

# View all Customers who have placed Orders for the products with an OrderValue > average ordervalue
select * from Customers1 where CustomerId in (Select CustomerId from Orders1 where OrderValue > (select avg(OrderValue) from Orders1));

select * from Products1;
# Internal Queries
select avg(collections) from movies;
select collections from movies where collections > 811538;















































