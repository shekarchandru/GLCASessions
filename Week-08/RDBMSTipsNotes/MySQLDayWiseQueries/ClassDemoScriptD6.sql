use coforgedb;
select * from Customers;
select * from Orders;
select * from Products;

select * from Customers where exists (select * from Orders where OrderQuantity >= 15);

select * from Products where exists (select * from Products where ProdCategory = 'Electronics');

select * from Products where exists (select * from Orders where OrderValue > (select avg(OrderValue) from Orders));
#-------------------------------------------------PROCEDURE-------------------------------------------------------------------------------
delimiter $$
use `coforgedb` $$
create procedure `CoProc1`()
begin
select * from Customers;
select * from Orders;
select * from Products;
end $$

call CoProc1();
call CoProc1;
# Dropping a Procedure
drop procedure CoProc1;
#------------------------------------------------------------------------------
delimiter $$
use `coforgedb` $$
create procedure `CoProc2`()
begin
declare num1 , num2 , total int;
set num1 = 100;
set num2 = 200;
set total = num1 + num2;
select total as 'The Total Value';
end $$

call CoProc2;
#--------------------------------------IF ELSE CONSTRUCT------------------------------------------

delimiter $$
use `coforgedb` $$
create procedure `CoProc3`()
begin
declare num1,num2,total int;
declare resultStr varchar(20);
set num1 = 300;
set num2 = 200;
set total = num1 + num2;
if total >= 300 then set resultStr = 'Eligible For Sale';
else
set resultStr = 'Sorry,Not Eligible';
end if;
select total as 'The Total';
select resultStr as 'The Eligibility Status';
end $$

call CoProc3;
#-----------------------------------------------------------Procedure taking Input Arguments------------------------------------------
# public void add(int a,int b)
delimiter $$
use `coforgedb` $$
create procedure `CoProc`(in num1 int,in num2 int)
begin
declare total int;
declare resultStr varchar(20);
set total = num1 + num2;
if total >= 100 then set resultStr = 'Good';
else
set resultStr = 'Sorry, Not Acceptable';
end if;
select resultStr as 'ResultStatus';
select total as 'TotalValue';
end $$

call CoProc(50,45);
call CoProc(50,145);
#-----------------------------------------------------------Procedure taking Input Arguments and Giving out Output arguments------------------------------------------
delimiter $$
use `coforgedb` $$
create procedure `CoProc5`(in score1 int,in score2 int,out total int,out resultStr varchar(50))
begin
set total = score1 + score2 ;
if total >= 50 and total < 60 then set resultStr = 'Good Passed...';
elseif total >= 60 and total < 70 then set resultStr ='VGood FirstClass...';
elseif total >= 70 and total <=100 then set resultStr='Excellent Distinct';
else
set resultStr = 'Sorry, Try Again';
end if;
select total;
select resultStr;
end $$

call CoProc5(30,25,@tot,@resStr);
call CoProc5(40,25,@tot,@resStr);
call CoProc5(40,45,@tot,@resStr);
/* */
#------------------------------------------------ Calling Procedure to Access Tables with input args----------------------
delimiter $$
use `coforgedb` $$
create procedure `CoProc6`(in custId varchar(20))
begin
select * from Customers where CustomerId = custId;
end $$

select * from Customers;

call CoProc6('C002');
call CoProc6('C004');
call CoProc6('C010');

#------------------------------------------------ Calling Procedure to Access Tables with In put and output args----------------------
select * from Products;
#----------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
use `coforgedb` $$
create procedure `CoProc7`(in prodId varchar(20),out price int)
begin
set price = (select PricePerUnit from Products where ProductId = prodId);
select price as 'The Price of the Product is ';
end $$


call CoProc7('P007', @pPrice);
select @pPrice as 'The Price of P007 is ';
#----------------------
/* CRUD or CURD operations
C-Create
U-Update
R-read
D-Delete
*/
#----------------------------------------------------Procedures to Perform CURd------------------------------------------
select * from Student;
#---------------------------------------
delimiter $$
use `coforgedb` $$
create procedure createStudentTableProc()
begin
create table Student
(
StudId varchar(20) primary key,
StudName varchar(30),
Score1 int,
Score2 int,
total int
);
end$$

call createStudentTableProc();

select * from NewStudent;
#----------------------------------------------------Procedures to Perform Insert------------------------------------------
delimiter $$
use `coforgedb` $$
create procedure insertStudentTableProc(in sId varchar(20),in sName varchar(30),in sco1 int,in sco2 int)
begin
declare tot int ;
set tot = sco1 + sco2;
insert into NewStudent
values(sId,sName,sco1,sco2,tot);
select * from NewStudent where StudId = sId;
end $$

call insertStudentTableProc('S005','Harish',75,85);
call insertStudentTableProc('S002','Kishore',70,84);
call insertStudentTableProc('S003','Kiran',78,81);
call insertStudentTableProc('S004','Srujan',72,83);

#----------------------------------------------------Procedures to Perform Delete------------------------------------------

delimiter $$
use `coforgedb` $$
create procedure insertStudentRecord(in sId varchar(20))
begin
delete from NewStudent where StudId = sId;
select 'Record Deleted for';
select sId;
end $$

select * from NewStudent;
call deleteStudentRecord('S004');

#----------------------------------------------------Procedures to Perform Update------------------------------------------

delimiter $$
use `coforgedb` $$
create procedure updateStudentScore1(in stId varchar(20), in sco1 int)
begin
update NewStudent
set score1 = sco1 where StudId = stId;
select 'Updated Record for';
select stId;
select * from NewStudent where StudId = stId;
end $$

call updateStudentScore1('S002',80);

#----------------------------------------------------Procedures Calling Another Procedure------------------------------------------

delimiter $$
use `coforgedb` $$
create procedure findSum(in sco1 int,in sco2 int,out total int)
begin
set total = sco1 + sco2;
end $$

delimiter $$
use `coforgedb` $$
create procedure findProduct(in sco1 int,in sco2 int,out product int)
begin
set product = (sco1 * sco2);
end $$

delimiter $$
use `coforgedb` $$
create procedure calculatorNew(in var1 int,in var2 int,out result1 int,out result2 int)
begin
declare res1 ,res2 int;
call findSum(var1,var2,@res1);
select 'The Sum is ';
set result1 = @res1;
select result1;

call findProduct(var1,var2,@res2);
select 'The Product is ';
set result2 = @res2;
select result2;
end $$

call calculatorNew(100,20,@r1,@r2);
select 'Sum is ';
select @r1 as 'Total';
select 'Product is';
select @r2 as 'Product';
#----------------------------------------Transaction---------------------------------------------------------
select * from students;
create table Students
(
Sid varchar(20) primary key,
SName varchar(30),
SAddress varchar(30)
)
create table StudentScores
(
scoreId varchar(20) primary key,
Sid varchar(20),
Score1 int,
Score2 int,
constraint cstudfkey foreign key (Sid) references Students(Sid)
)

Start Transaction;

insert into Students values('S004','Harshitha','RTNagar');
insert into Students values('S005','Keerthana','RRNagar');
insert into Students values('S006','Maheshwari','RJNagar');
savepoint  sp1 ;
insert into StudentScores values('SC04','S004',85,87);
insert into StudentScores values('SC05','S005',75,82);
rollback to sp1; 
insert into StudentScores values('SC06','S006',87,84);

Commit;

#-------------------------------------------------------------------Save Point-----------------------------------------
Start Transaction;

/*
Statements for the follwoing
Employees Update for Dept : Engineering ; allrecords salary increased by 10%

*/
savepoint sp1;
/*
Statements for the follwoing
Employees Update for Dept : TestingDivison ; allrecords salary increased by 8%
*/
savepoint sp2;
/*
Statements for the follwoing
Employees Update for Dept : Accounts   ; allrecords salary increased by 5%
*/

/*
check the average salary 
if > x;


*/
rollback to sp2
Commit;
























































