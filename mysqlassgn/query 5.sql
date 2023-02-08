use sqlassignment;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

CREATE TABLE Customer (
    customer_id int,
	product_key int
);
CREATE TABLE Product (
    product_key int
);
INSERT INTO Customer
VALUES (1,5);
INSERT INTO Customer
VALUES (2,6);
INSERT INTO Customer
VALUES (3,5);
INSERT INTO Customer
VALUES (3,6);
INSERT INTO Customer
VALUES (1,6);
INSERT INTO Product
VALUES (5);
INSERT INTO Product
VALUES (6);
select 
    customer_id
from Customer 
group by 
    customer_id
having count(distinct product_key) = (select count(*) from Product);