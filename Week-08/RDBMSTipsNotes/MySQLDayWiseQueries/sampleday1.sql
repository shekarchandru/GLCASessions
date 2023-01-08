create database coforgedb;
use coforgedb;
#-------------------------------------------------------
Create Table Employee
(
EmployeeId varchar(20)  ,
EmployeeName varchar(40),
EmployeeAddress varchar(40),
EmployeePhone varchar(20),
EmployeeCity varchar(30),
DOJ date
);
insert into Employee
values 
('E001','Harsha','RTNagar','9892992992','Bangalore','2020-05-25'),
('E002','Keerthana','JayaNagar','9875882992','Bangalore','2020-07-25'),
('E003','Rajesh','Koramangala','9892964772','Chennai','2020-06-25'),
('E004','Rakesh','Vijayanagar','9893467992','NewDelhi','2019-04-22'),
('E005','Sumesh','Malleswaram','9849122992','Mumbai','2019-03-21');

select * from Employee;

alter table Employee
add constraint pkCst primary key(EmployeeId);

insert into Employee
values 
('E001','Harsha','RTNagar','9892992992','Bangalore','2020-05-25');

create table EmployeeSalary
(
SalID varchar(20),
EmployeeId varchar(20),
Basic int,
HRA int,
CCA int,
Allowances int,
GrossSalary int,
NettSalary int,
constraint salIdPkey primary key(SalID),
constraint empIdfkey foreign key(EmployeeId) references Employee(EmployeeId)
);
create table EmployeeSalary1
(
SalID varchar(20),
EmployeeId varchar(20),
Basic int,
HRA int,
CCA int,
Allowances int,
GrossSalary int,
NettSalary int,
constraint salIdPkey1 primary key(SalID),
constraint empIdfkey1 foreign key(EmployeeId) references Employee(EmployeeId)
);

insert into EmployeeSalary1
values('S001','E001',1000,100,150,50,1200,1100),
('S002','E002',2000,200,150,50,2400,2300),
('S003','E003',3000,300,150,50,3500,3400),
('S004','E004',4000,400,150,50,4600,4500),
('S005','E005',5000,500,150,50,5700,5500);

insert into EmployeeSalary1
values('S006','E001',1500,100,150,50,1800,1700);

#delete drop truncate;

delete from EmployeeSalary where SalID='S006';
truncate table EmployeeSalary1;
select * from EmployeeSalary;
select * from EmployeeSalary1;
update EmployeeSalary
set Basic = 2500, GrossSalary = 2900 where SalID = 'S002';
drop table EmployeeSalary1;
#----------------------------

alter table EmployeeSalary1
drop  primary key  ;

alter table EmployeeSalary1
add constraint cstpk10 primary key (SalID);

delete from EmployeeSalary1
where SalID = 'S006';

select * from EmployeeSalary1;
#-------------------------------------CHECK CONSTRAINT-------------------------------------------------

Create Table EmployeeNew
(
EmployeeId varchar(20)  ,
EmployeeName varchar(40),
EmployeeAddress varchar(40),
EmployeePhone varchar(20) default 'No Phone',
EmployeeCity varchar(30),
DOJ date
);

alter table EmployeeNew
add constraint chkConstr1 check (EmployeeCity in ('Bangalore','Hyderabad','NewDelhi','Chennai','Mumbai') );

drop table EmployeeNew;
select * from EmployeeNew;

insert into EmployeeNew
values 
('E006','Sumesh','Malleswaram','9849122992','Mumbai','2019-03-21');

insert into EmployeeNew(EmployeeId,EmployeeName,EmployeeAddress,EmployeeCity,DOJ)
values 
('E008','Srujan','Malleswaram','Chennai','2019-03-21');

alter table  EmployeeNew 
add constraint d1 unique(EmployeePhone) ;

alter table EmployeeNew
alter EmployeePhone set  default  'NoPhone'

















