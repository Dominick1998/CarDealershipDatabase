/* Car Dealership Database MySQL,
Dominick Ferro, Database Concepts
Follows ER diagram with the exception of added Service_Ticket */

create database CarDealership;
use CarDealership;

alter table Service_Ticket
add column ST_id INT(9) unsigned not null,
add constraint foreign key (ST_id)
references ST(id);

alter table Vehicle_details
add column V_id INT(9) unsigned not null,
add constraint foreign key (V_id)
references V(id);

create table Dealer(
contact_No int primary key,
Name varchar(100),
Dealer_description varchar(500),
Location text,
Contact varchar(20));

/* Car dealership records */
insert into Dealer values (1,'Toyota','respectable service','Arkansas','9123045678');
insert into Dealer values (2,'Audi','respectable service','Mississippi','3078945612');
insert into Dealer values (3,'Lexus','respectable service','Kansas','5612307894');
insert into Dealer values (4,'Ford','respectable service','Nevada','678912345');
insert into Dealer values (5,'Chevy','respectable service','New York','8912304567');

/* Choose record */
select * from Dealer;

create table Customers(
c_ID int primary key,
C_Name varchar(50),
Gender int,
Email varchar(20),
Location int,
Occupation int,
Date_of_birth int);

insert into customers values (1,'John Wilson','Male','Email','Address','Occupation','DOB');
insert into customers values (2,'Jane Linker','Female','Email','Address','Occupation','DOB');
insert into customers values (3,'Jimmy bland','Male','Email','Address','Occupation','DOB');
insert into customers values (4,'Jorge Klein','Male','Email','Address','Occupation','DOB');
insert into customers values (5,'Jack Monroe','Male','Email','Address','Occupation','DOB');

/* Choose records */
select * from customers;

create table Employee(
S_ID int primary key,
Name varchar(50),
Location varchar(500),
Date_of_birth int,
Employee_ID int,
Address int,
Occupation int,
Employee_No int,
foreign key (contact_No) references cardealership(contact_No));

/* Employee records */
insert into Employee values (1,'Jim Hanson','Arkansas','DOB','Employee ID','Address','Sales Manager',1);
insert into Employee values (2,'Lily Dawn','Mississippi','DOB','Employee ID','Address','Finance Manager',2);
insert into Employee values (3,'Jack Lee','Kansas','DOB','Employee ID','Address','Customer Service Rep',3);
insert into Employee values (4,'John Smith','Nevada','DOB','Employee ID','Address','Lot Manager',4);
insert into Employee values (5,'Peter Jordan','New York','DOB','Employee ID','Address','Service Technicians',5);

/* Choose records */
select * from Employee;

create table Supplier(
Supplier_Number int primary key,
Make varchar(20),
Model varchar(50),
S_Id int,
C_ID int,
SuppliedDate date,
foreign key (C_ID) references customers(C_ID),
foreign key (S_ID) references employee(s_ID));

/* Car records */
insert into Supplier values (1,'Toyota','Corolla',1,1,'2021/02/18');
insert into Supplier values (2,'Audi','R8',2,2,'2021/03/12');
insert into Supplier values (3,'Lexus','RX',3,3,'2021/04/02');
insert into Supplier values (4,'Ford','F150',4,4,'2021/01/24');
insert into Supplier values (5,'Chevy','Traverse',1,1,'2021/05/24');

/* Choose records */
select * from Supplier;

create table Vehicle_details(
V_ID int primary key,
Inspection_Date date,
Price decimal(8,2),
Supplier_Number int,
S_Id int,
C_ID int,
Make varchar(20),
Model varchar(50),
foreign key (C_ID) references customers(C_ID),
foreign key (S_ID) references employee(s_ID));

/* Vehicle_details records */
insert into Vehicle_details values (1,'2021/02/18',30000,1,1,1,'Toyota','Corolla');
insert into Vehicle_details values (2,'2021/03/12',80000,2,1,1,'Audi','R8');
insert into Vehicle_details values (3,'2021/04/02',50000,1,1,1,'Lexus','RX');
insert into Vehicle_details values (4,'2021/01/24',45000,1,1,2,'Ford','F150');
insert into Vehicle_details values (5,'2021/05/24',40000,1,1,5,'Chevy','Traverse');

/* Choose records */
select * from Vehicle_details;

create table Parts(
P_ID int primary key,
P_Name varchar(20),
Price decimal(6,2));

/* Records */
insert into parts values (1,'Battery',250);
insert into parts values (2,'Radiator',500);
insert into parts values (3,'Transmission',800);
insert into parts values (4,'Alternator',540);
insert into parts values (5,'Brakes',320);

/* Choose records */
select * from parts;

create table Warehouse(
P_Id int,
Warehouse_Number int,
W_Location varchar(20),
foreign key (P_ID) references Parts(P_ID),
foreign key (Supplier_Number) references Supplier(Supplier_Number));

/* Car parts records */
insert into Warehouse values (1,1,'Arkansas');
insert into Warehouse values (1,2,'Mississippi');
insert into Warehouse values (2,3,'Kansas');
insert into Warehouse values (3,4,'Nevada');
insert into Warehouse values (5,5,'New York');

/* Choose records */
select * from Warehouse;

create table Service_Ticket(
ST_ID int primary key,
Date date,
Car_Serial_No int,
C_ID int,
foreign key (Car_Serial_No) references cardealership(Car_Serial_No),
foreign key (C_ID) references customers(C_ID));

/* Choose records */
insert into Service_Ticket values (1,'2021/02/18',1,1);
insert into Service_Ticket values (2,'2021/03/12',2,1);
insert into Service_Ticket values (3,'2021/04/02',3,2);
insert into Service_Ticket values (4,'2021/01/24',4,2);
insert into Service_Ticket values (5,'2021/05/24',5,1);

/* Choose records */
select * from Service_Ticket;

/* Query 1 */
select employee.s_id,name,address from employee,vehicle_details
where employee.s_id=vehicle_details.s_id and price>30000;

/* Query 2 */
select c_name from customers,supplier
where customers.c_id=supplier.c_id and supplieddate='2021/02/18';

/* Query 3 */
select make,model from customers,supplier
where customers.c_id=supplier.c_id and c_name='John Wilson';

/* Query 4 */
delete from service_ticket where c_id=1;
select * from service_ticket;
