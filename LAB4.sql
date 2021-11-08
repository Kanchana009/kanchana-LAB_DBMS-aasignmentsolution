create schema e_commerce;
use e_commerce;

create table Supplier(SUPP_ID int primary key,SUPP_NAME varchar(50),SUPP_CITY varchar(50),SUPP_PHONE bigint);
create table Customer(CUS_ID int auto_increment primary key,CUS_NAME varchar(250),CUS_PHONE bigint,CUS_CITY varchar(50),CUS_GENDER varchar(1));
create table Category(CAT_ID int primary key,CAT_NAME varchar(250));
create table Product(PRO_ID int primary key,PRO_NAME varchar(50),PRO_DESC varchar(50),CAT_ID int,foreign key(CAT_ID)references Category(CAT_ID));
create table ProductDetails(PROD_ID int primary key,PRO_ID int,SUPP_ID int,PRICE int,foreign key(PRO_ID)references Product(PRO_ID),foreign key(SUPP_ID)references Supplier(SUPP_ID));
create table Orders(ORD_ID int primary key,ORD_AMOUNT int,ORD_DATE date,CUS_ID int,PROD_ID int,foreign key(CUS_ID)references Customer(CUS_ID),foreign key(PROD_ID)references ProductDetails(PROD_ID));
create table Rating(RAT_ID int primary key,CUS_ID int,SUPP_ID int,RAT_RATSTARS int,foreign key(CUS_ID)references Customer(CUS_ID),foreign key(SUPP_ID)references Supplier(SUPP_ID));

insert into Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(1,'Rajesh Retails','Delhi',1234567890);
insert into Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(2,'Appario Ltd.','Mumbai',2589631470);
insert into Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(3,'Knome products','Bangalore',9785462315);
insert into Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(4,'Bansal Retails','Kochi',8975463285);
insert into Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(5,'Mittal Ltd','Lucknow',7898456532);

insert into Customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values(1,'AAKASK','9999999999','DELHI','M');
insert into Customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values(2,'AMAN','9785463215','NOIDA','M');
insert into Customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values(3,'NEHA','9999999999','MUMBAI','F');
insert into Customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values(4,'AAKASK','9994562399','KOLKATA','F');
insert into Customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values(5,'PULKIT','7895999999','LUCKNOW','M');

insert into Category(CAT_ID,CAT_NAME)values(1,'BOOKS');
insert into Category(CAT_ID,CAT_NAME)values(2,'GAMES');
insert into Category(CAT_ID,CAT_NAME)values(3,'GROCERIES');
insert into Category(CAT_ID,CAT_NAME)values(4,'ELECTRONICS');
insert into Category(CAT_ID,CAT_NAME)values(5,'CLOTHES');

insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(1,'GTA V','DFJDJFDJFDJFDJFJF',2);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(2,'TSHIRT','DFDFJDFJDKFD',5);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(3,'ROG LAPTOP','DFNTTNTNTERND',4);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(4,'OATS','REURENTBTOTH',3);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)values(5,'HARRY POTTER','NBEMCTHTJTH',1);

insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(1,1,2,1500);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(2,3,5,30000);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(3,5,1,3000);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(4,2,3,2500);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)values(5,4,1,1000);

insert into Orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)values(20,1500,'2021-10-12',3,5);
insert into Orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)values(25,30500,'2021-09-16',5,2);
insert into Orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)values(26,2000,'2021-10-05',1,1);
insert into Orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)values(30,3500,'2021-08-16',4,3);
insert into Orders(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)values(50,2000,'2021-10-06',2,1);

insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(1,2,2,4);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(2,3,4,3);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(3,5,1,5);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(4,1,3,2);
insert into Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)values(5,4,5,4);


-- Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.

select * from customer c inner join `orders` o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000;
select cus_gender from customer c inner join `orders` o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000;
select COUNT(cus_gender) from (select cus_gender from customer c inner join `orders` o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000) as cg group by cus_gender;
select cg.cus_gender, COUNT(cus_gender) from (select cus_gender from customer c inner join `orders` o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000) as cg group by cus_gender;
select cus_gender,COUNT(cus_gender)  from customer c inner join `orders` o on o.CUS_ID=c.CUS_ID where o.ORD_AMOUNT>=3000 group by cus_gender;



-- Display all the orders along with the product name ordered by a customer having Customer_Id=2.
select * from `orders` where CUS_ID=2;
select * from `orders` o inner join product p on o.PROD_ID=p.PRO_ID where o.CUS_ID=2;
select o.ORD_ID,o.ORD_AMOUNT,o.ORD_DATE,o.CUS_ID,o.PROD_ID,p.PRO_NAME from `orders` o inner join product p on o.PROD_ID=p.PRO_ID where o.CUS_ID=2;
select o.ORD_ID,o.ORD_AMOUNT,o.ORD_DATE,o.CUS_ID,o.PROD_ID,p.PRO_NAME from `orders` o inner join product p on (o.PROD_ID=p.PRO_ID and o.CUS_ID=2);


-- Display the Supplier details who can supply more than one product.
select * from productdetails;
select SUPP_ID, count(PROD_ID) from productdetails GROUP by SUPP_ID;
select SUPP_ID, count(PROD_ID) as no_of_products from productdetails GROUP by SUPP_ID;
select SUPP_ID from (select SUPP_ID, count(PROD_ID) as no_of_products from productdetails GROUP by SUPP_ID) as pd where pd.no_of_products >=2;
select * from supplier where supp_id in (select supp_id from productdetails group by supp_id having count(supp_id)>1);
select s.* from supplier s join (select supp_id, count(supp_id) from productdetails group by supp_id having count(supp_id) > 1) as pd on pd.supp_id = s.supp_id;


-- Find the category of the product whose order amount is minimum.
select min(ORD_AMOUNT) from `orders`;
Select c.cat_name, c.cat_id from category c inner join (Select p.cat_id, opd.* from product p inner join (Select pd.pro_id, om.* from productdetails pd inner join (Select o.PROD_ID, min(o.ORD_AMOUNT) from `e_commerce`.orders o) as om on om.prod_id = pd.prod_id) as opd on opd.PRO_ID = p.pro_id) as popd on c.cat_id = popd.cat_id;
select * from category where cat_id in(select cat_id from product where pro_id in( select pro_id from productdetails P inner join `orders` O on O.prod_id=P.prod_id where O.ORD_AMOUNT=(select min(ORD_AMOUNT) from `orders`)));
select category.* from `orders` inner join productdetails on `orders`.prod_id=productdetails.prod_id inner join product on product.pro_id=productdetails.pro_id inner join category on category.cat_id=product.cat_id where `orders`.ORD_AMOUNT = (select min(ORD_AMOUNT) from `orders`);

-- Display the Id and Name of the Product ordered after “2021-10-05”.
select * from `orders` where ORD_DATE > '2021-10-05';
select b.pro_id,b.pro_name from product b inner join ( select a.PRO_ID from productdetails as a inner join `orders` as o on o.PROD_ID = a.PROD_ID where o.ORD_DATE > '2021-10-05') q on b.pro_id=q.pro_id;
select a.PRO_ID from productdetails as a inner join `orders` as o on o.PROD_ID = a.PROD_ID where o.ORD_DATE > '2021-10-05';
SELECT 
    p.PRO_ID, p.PRO_NAME
FROM
    `orders` o
        INNER JOIN
    `productdetails` prod ON o.prod_id = prod.prod_id
        INNER JOIN
    product p ON p.pro_id = prod.pro_id
WHERE
    o.ORD_DATE > '2021-10-05';
select product.PRO_ID, product.PRO_NAME from `orders` INNER JOIN productdetails on productdetails.PROD_ID = `orders`.PROD_ID inner join product on product.PRO_ID= productdetails.PRO_ID WHERE `orders`.ORD_DATE > '2021-10-05';


-- Print the top 3 supplier name and id and their rating on the basis of their rating along with the customer name who has given the rating.
select s.SUPP_ID, s.SUPP_NAME from supplier s inner join rating r on s.SUPP_ID = r.SUPP_ID;
select s.SUPP_ID, s.SUPP_NAME, r.RAT_RATSTARS from supplier s inner JOIN rating r on s.SUPP_ID = r.SUPP_ID order by r.RAT_RATSTARS desc limit 3;
select supplier.SUPP_ID, supplier.SUPP_NAME, customer.CUS_NAME, rating.RAT_RATSTARS from supplier inner JOIN rating on supplier.SUPP_ID=rating.SUPP_ID INNER JOIN customer on rating.CUS_ID = customer.CUS_ID order by rating.RAT_RATSTARS desc LIMIT 3;


-- Display customer name and gender whose names start or end with character 'A'.
select * from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';


-- Display the total order amount of the male customers.
select sum(ord_amount) from `orders` INNER join customer on `orders`.CUS_ID= customer.CUS_ID where customer.CUS_GENDER='M';


-- Display all the Customers left outer join with  the orders.
select * from customer left OUTER join `orders` on customer.CUS_ID = `orders`.CUS_ID;


-- Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
call supplierratings();

















