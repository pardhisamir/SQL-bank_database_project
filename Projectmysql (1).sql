-- TOPIC ::::::: BANK DATABASE MANAGEMENT::::::::::

create database Bank;
use bank;

# creating table
#creating table customers
CREATE TABLE customer
   (
       cust_id VARCHAR(6) primary key,
       first_name VARCHAR(30),
       middle_name VARCHAR(30),
       last_tname VARCHAR(30),
       city VARCHAR(15),
       mobile_no VARCHAR(20),
       occupation VARCHAR(20),
       dob DATE
   );
   desc customer;
   drop table customer;
   
    #inserting record into customer
   insert into customer 
   values
('C00001','Samir','Ramdas','Paradhi','Badlapur','8765489076','Student','2001-07-30'),
('C00002','Lakshmipriya','Murlidharan','Thampi','Badlapur','8765489076','Student','2002-09-26'),
('C00003','Aarthi',null,'Pillai','Kalyan','8765489076','Service','1976-07-12'),
('C00004','Pandu',null,'Pandav','Badlapur','8765489076','Service','2002-07-07'),
('C00005','Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06'),
('C00006','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16'),
('C00007','Rahul',null,'Rastogi','Kalyan','9765178901','Student','1981-09-26'),
('C00008','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03'),
('C00009','Naveen','Chandra','Aedekar','Mumbai','8976523190','Service','1976-09-19'),
('C00010','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06'),
('C00011','Amit','Kumar','Borkar','Mumbai','9875189761','Student','1981-09-06'),
('C00012','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03'),
('C00013','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22'),
('C00014','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12'),
('C00015','Nikhil','Prakash','Taur','Karjat','8545489145','Service','1976-09-12'),
('C00016','Jyoti',null,'Pandey','Badlapur','854789652','Service','2002-05-20'),
('C00017','Ritu',null,'Sharma','Kalyan','7854156985','Service','2002-12-06'),
('C00018','Vinit','Dattaram','Thombare','Kalyan','4215896548','Student','2002-09-28'),
('C00019','Raman',null,'Nair','Chennai','845785425','Service','1976-07-22'),
('C00020','Divya',null,'Sharma','Chennai','8765489458','Service','1999-07-12');
delete  from customer;



   #creating table branch
   CREATE TABLE branch
   (
    branch_id VARCHAR(6) PRIMARY KEY,
    branch_name VARCHAR(30),
    branch_city VARCHAR(30)
   );
   drop table branch;
   
   #inserting records into branch
insert into branch 
 VALUES('B00001','Asaf ali road','Delhi'),
('B00002','Kalyan main branch','Kalyan'),
('B00003','Katrap ','Badlapur'),
('B00004','Jasola','Delhi'),
('B00005','Mahim','Mumbai'),
('B00006','Vile parle','Mumbai'),
('B00007','Mandvi','Mumbai'),
('B00008','Jadavpur','Kolkata'),
('B00009','Kodambakkam','Chennai');



   #creating table account
   CREATE TABLE account
   (
      accnumber VARCHAR(6) PRIMARY KEY,
      custid  VARCHAR(6) ,
      bid VARCHAR(6),
      opening_balance INT(50),
      aod DATE,
      close_date date,
      balence float(10,2),
      atype VARCHAR(10),
      astatus VARCHAR(10),
       FOREIGN KEY(custid) REFERENCES customer(cust_id),
       FOREIGN KEY(bid) REFERENCES branch(branch_id) 
    );
    desc account;
    drop table account;
    
    #nserting records into the account table:
insert into account values('A00001','C00001','B00001',1000,'2012-12-15',null,452500.00,'Saving','Active'),
('A00002','C00002','B00001',1000,'2012-06-12',null,521548.00,'Saving','Active'),
('A00003','C00003','B00002',1000,'2012-05-17',null,125300.00,'Saving','Active'),
('A00004','C00002','B00005',1000,'2013-01-27',null,5421548.00,'Saving','Active'),
('A00005','C00006','B00006',1000,'2012-12-17',null,1200.00,'Saving','Active'),
('A00006','C00007','B00007',1000,'2010-08-12',null,12154872.00,'Saving','Suspended'),
('A00007','C00007','B00001',1000,'2012-10-02',null,125489.00,'Saving','Active'),
('A00008','C00001','B00003',1000,'2009-11-09',null,12365.00,'Saving','Terminated'),
('A00009','C00003','B00007',1000,'2008-11-30',null,1452.00,'Saving','Terminated'),
('A00010','C00004','B00002',1000,'2013-03-01',null,145872.00,'Saving','Active');

    #creating table transaction detail
    CREATE TABLE trandetails
    (   
     t_id VARCHAR(6)  PRIMARY KEY,
     acnumber VARCHAR(6),
     dot DATE,
     medium_of_transaction VARCHAR(20),
     transaction_type VARCHAR(20),
     transaction_amount INT(10),    
	FOREIGN KEY(acnumber) REFERENCES account(accnumber)  
    );
    drop table trandetails;
    
    
    #inserting rcords into transactions
INSERT INTO trandetails VALUES('T00001','A00001','2013-01-01','Cheque','Deposit',2000),
('T00002','A00001','2013-02-01','Cash','Withdrawal',1000),
('T00003','A00002','2013-01-01','Cash','Deposit',2000),
('T00004','A00002','2013-02-01','Cash','Deposit',3000),
('T00005','A00007','2013-01-11','Cash','Deposit',7000),
('T00006','A00007','2013-01-13','Cash','Deposit',9000),
('T00007','A00001','2013-03-13','Cash','Deposit',4000),
('T00008','A00001','2013-03-14','Cheque','Deposit',3000),
('T00009','A00001','2013-03-21','Cash','Withdrawal',9000),
('T00010','A00001','2013-03-22','Cash','Withdrawal',2000),
('T00011','A00002','2013-03-25','Cash','Withdrawal',7000),
('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);
    
    # creating tables for loan
 CREATE TABLE loan
   (
 
    custid VARCHAR(6) ,
    bid VARCHAR(6),
    a_number varchar(10),
    loan_amount INT(7),
    FOREIGN KEY(custid) REFERENCES  customer(cust_id),
    FOREIGN KEY(a_number) REFERENCES account(accnumber) ,
    FOREIGN KEY(bid) REFERENCES  branch(branch_id)
   );
    
   drop table loan;
  

#insert values into loan
INSERT INTO loan VALUES('C00001','B00001','A00001',100000),
('C00002','B00002','A00003',200000),
('C00009','B00008','A00005',400000),
('C00010','B00009','A00006',500000),
('C00001','B00003','A00007',600000),
('C00002','B00001','A00009',600000),
('C00004','B00005','A00010',200000);

select * from loan;

#Q1 - write a query to create a table customer with column names are cust_id,first_name,middle_name,last_name,city,mobile_no,occupation and dob with cust_id as primary key
Create table customer
   (
       cust_id varchar(6) primary key,
       first_name varchar(30),
       middle_name varchar(30),
       last_tname varchar(30),
       city varchar(15),
       mobile_no varchar(20),
       occupation varchar(20),
       dob date
   );

#Q2 - write a query to create table branch with feilds names are branch_id,branch_name,branch_city
Create table branch
   (
    branch_id varchar(6) primary key,
    branch_name varchar(30),
    branch_city varchar(30)
   );

#Q3 - write a query to create a table account with feilds accnumber,custid,bid,opening_balence,aod,close_date,balence,type and status with accnumber is a primary key and cust_id and bid is foreign key with refernse of cust_id and branch_id
Create table account (
     accnumber varchar(6) primary key,
      custid  varchar(6) ,
      bid varchar(6),
      opening_balance int(50),
      aod date,
      close_date date,
      balence float(10,2),
      atype varchar(10),
      astatus varchar(10),
       foreign key(custid) references customer(cust_id),
       foreign key(bid) references branch(branch_id) 
    );

#Q4 - write a query to change table name from customer to employee
rename table customer to employee;

#Q5 - write a query to change column name accnumber to account_number from acount table
alter table account change column accnumber account_number varchar(6);

#Q5 - write a query to add column name sr no in first position in customer table
alter table customer add sr_no int first;

#Q6 - write a query to delete first column sr_no from customer table
alter table customer drop column sr_no;

#Q7 - write a query to drop table customer
drop table customer;

#Q8 - write a command to insert values in customer table
 insert into customer values
   ('C00001','Samir','Ramdas','Paradhi','Badlapur','8765489076','Student','2001-07-30'),
   ('C00002','Lakshmipriya','Murlidharan','Thampi','Badlapur','8765489076','Student','2002-09-26');

#Q9 - write a query to truncate account table 
truncate table account;

#Q10 -  write a query to delete detabase bank
Drop database bank;

#Q11-Write a query to  Update the customer name of the city is mumbai where customer name is samir
update customer set city='Mumbai' where first_name='Samir';

#Q12-Write a query to Update the customer Occupation is service where name is lakshmipriya and city is badlapur
update customer set occupation='service' where cust_id='C00002';

#Q13-Write a query to update the customer phone no as 8600298826 where id is C00001
update customer set mobile_no=8600298826 where cust_id='C00001';

#Q14- write a query to update a branch name as 'Badlapur main branch' where city is Badlapur
update branch set branch_name='Badlapur main branch' where branch_city='Badlapur';

#Q15-write a query for delete a record from customer which id is C00014
delete from customer where cust_id='C00014';

#Q16-Write a query to delete those account whose status are terminated
delete from account where astatus='terminated';

#Q17-Write a query for update account status as active where account number is A00006
update account set astatus='Active' where accnumber='A00006';

#Q18-write a query for display all the details of customer
 select * from customer;
 
 #Q19- display customer full name and occupation of the customer of a bank
 select first_name, middle_name,last_name,occupation  from customer;

#Q20- display accnumber as customer account number and balence as customer bank balence from account table
select accnumber as 'customer account number',balence as 'customer bank balence' from account;

#Q21-write a query to display custid as customer id and a_number as customer account number and loan_amount as loan taken by customer from loan table
select custid as 'customer id',a_number as 'customer account number',loan_amount as 'loan taken by customer' from loan;

#Q22- display the list of a customers those who did transaction through cash in a bank 
select * from trandetails where medium_of_transaction='cash';

#Q23- write a query to show account details of a customer whose bank balence is above 500000
select * from account where balence>500000;

#Q24- display account details of a customer those whose account has terminated
select * from account where astatus='Terminated';

#Q25-display custid as customer id , a_number as account number and loan_amount as loan taken by customer of those whose loan amount are 400000 or greater
select custid as 'customer id',a_number as 'account number',loan_amount as 'loan taken by customer' from loan where loan_amount>=400000;

#Q26- display all the records of the accounts of customers whose bank balence is   lies within 120000 to 500000
select * from account where balence>=120000 and balence<=500000;

#Q27- display all the records of the accounts of customers whose bank balence is not  lies within 1200 to 500000
select * from account where balence not between 1200 and 500000;

#Q28- display all the Unique cities of a bank customers
select distinct city from customer;

#Q29- display all the records of all the columns of customers whose living in mumbai or delhi or chennai
select * from customer where city in('mumbai','dekhi','chennai');

#Q30- write a query to display all the unique cities of branches of a bank
select distinct branch_city from branch;

#Q31 - write a query to display all the records from customer whose name start with s
select * from customer where first_name like 's%';

#Q32 - write a query to display all the records from customer whose names either start with s or start with L 
select * from customer where first_name like 's%' or first_name like 'L%';

#Q33 - display first 9 records of customers from customer table
select * from customer limit 9;

#Q34- display account details of record 5 to 10 from account table
select * from account limit 4,10;

#Q35 - write a query to display account details whose bank balence between 1200 to 10000
select * from account where balence between 1200 and 20000; 

#Q336- display all the records of all the columns of account table in increasing order of bank balence
select * from account order by balence;

#Q37- display all the records of all the columns of account table in decreasing order of balence
select *  from account order by balence desc;

#Q38 - display the person who have higheist bank balence 
select * from account order by balence desc limit 1;

#Q339 - write a query to display only third higheist bank balence account details 
select * from account order by balence desc limit 2,1;

#Q40 - write a query to display only first 3 charchters from the first name of customers
select substr(first_name, 1,3)as 'first three latters of first name'from customer;

#Q41 - write a query to dispay full name of customer in sigle coulmn
select concat(first_name,' ',middle_name,' ',last_name) as 'full name of customer' from customer;

#Q42 - display the customer full name and its occupation in sigle column
select concat(first_name,' ',middle_name,' ',last_name,'--->',occupation) as 'full name and occupation' from customer;

#Q43 - display city and count of the customer who lived in same city
select city, count(first_name) from customer group by city;

#Q44 - isplay occupation and count of the customer who have same occupation
select occupation, count(first_name) from customer group by occupation;

#Q45 - display medium of transaction and count of the customer who made transaction with a same mode 
select medium_of_transaction,count(acnumber) from trandetails group by medium_of_transaction;

#Q46 - display the average bank balence of customers in a bank
select accnumber,round(avg(balence)) from account group by accnumber;

#Q47 - write a query to display  all transactions with transaction type 'Deposit'
select * from trandetails where transaction_type='Deposit';

#Q48 - write a query to Retrieve the total number of terminated accounts in each branch:
select b.branch_name, count(a.accnumber) AS terminated_accounts from Branch b left join Account a on b.branch_id = a.bid
where a.astatus = 'Terminated' group by b.branch_name;

#Q49 - write a query to Retrieve the customer who made the largest withdrawal
select c.first_name, c.last_name, MAX(t.transaction_amount) as largest_withdrawal from Customer c left join account a on c.cust_id = a.custid
left join Trandetails t on a.accnumber = t.acnumber where t.transaction_type = 'Withdrawal' group by c.first_name, c.last_name
order by largest_withdrawal desc limit 1;

#Q50 - write a query to display the branch with the highest total deposit amount:
select b.branch_name, sum(t.transaction_amount) AS total_deposit from Branch b left join account a on b.branch_id = a.bid
left join trandetails t on a.accnumber = t.acnumber where t.transaction_type = 'Deposit' group by b.branch_name order by total_deposit desc
limit 1;

#Q51 - write a query to Retrieve the total number of active accounts in each branch
select b.branch_name, count(a.accnumber) as active_accounts from Branch b left join account a on b.branch_id = a.bid
where a.astatus = 'Active' group by b.branch_name;

#Q52 - write a query to Retrieve the total number of transactions:
select count(*) as total_transactions from Trandetails;

#Q53 - display the average transaction amount:
select AVG(transaction_amount) AS avg_transaction_amount FROM Trandetails;

#Q54 - write a query to display the customers who made a withdrawal in March 2013:
select distinct c.first_name, c.last_name from Customer c join account a on c.cust_id = a.custid join Trandetails t on a.accnumber = t.acnumber
where t.transaction_type = 'Withdrawal' and extract(month from t.dot) = 3 and extract(year from t.dot) = 2013;

#Q55 - write a query to display all branch names in mumbai
select branch_name from Branch where branch_city = 'Mumbai';

#Q56 - write a query to Retrieve the customers who have never taken a loan
select c.first_name, c.last_name from Customer c left join Loan l on c.cust_id = l.custid where l.custid is null;

#Q57 - write a query to Find the customers who have taken loans with amounts greater than the average loan amount.
select first_name, last_name from Customer where cust_id 
in (select distinct l.custid from Loan l where l.loan_amount > ( select avg(loan_amount) from Loan));

#Q 58 - write a query to Retrieve the customers who have a mobile number that matches with any other customer's mobile number.
SELECT first_name, last_name
FROM Customer
WHERE mobile_no IN (
    SELECT mobile_no
    FROM Customer
    GROUP BY mobile_no
    HAVING COUNT(*) > 1
);

#Q59 - Find the total number of transactions involving 'Cash' as the medium of transaction.
select count(*) from Trandetails where medium_of_transaction = 'Cash';

#Q60 - write a query to Retrieve the customers who have taken loans from branches located in 'Mumbai.'
select first_name, last_name from Customer where cust_id in ( select distinct l.custid from Loan l join Branch b on l.bid = b.branch_id where b.branch_city = 'Mumbai');

#Q61 - display the customers who have 'Student' as their occupation and live in 'Delhi.'
select first_name, last_name from Customer where occupation = 'Student' and city = 'kalyan'; 

#Q62 - Find the total number of active accounts in the 'Badlapur main branch.'
select COUNT(*) from Account where bid = 'B00003' and astatus = 'Active';


