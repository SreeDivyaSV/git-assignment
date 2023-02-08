use sqlassignment;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Items;

CREATE TABLE Users (
    user_id int,
	join_date date,
	favorite_brand varchar(20)
);
CREATE TABLE Orders (
    order_id int,
	order_date date,
	item_id int,
	buyer_id int,
	seller_id int
);
CREATE TABLE Items (
	item_id int,
	item_brand varchar(10)
);

INSERT INTO Users
VALUES (1,'2018-01-01',"Lenovo");
INSERT INTO Users
VALUES (2,'2018-02-09',"Samsung");
INSERT INTO Users
VALUES (3,'2018-01-19',"LG");
INSERT INTO Users
VALUES (4,'2018-05-21',"HP");

INSERT INTO Orders
VALUES (1,'2019-08-01',4,1,2);
INSERT INTO Orders
VALUES (2,'2018-08-02',2,1,3);
INSERT INTO Orders
VALUES (3,'2019-08-03',3,2,3);
INSERT INTO Orders
VALUES (4,'2018-08-04',1,4,2);
INSERT INTO Orders
VALUES (5,'2018-08-04',1,3,4);
INSERT INTO Orders
VALUES (6,'2019-08-05',2,2,4);

INSERT INTO Items
VALUES (1,"Samsung");
INSERT INTO Items
VALUES (2,"Lenovo");
INSERT INTO Items
VALUES (3,"LG");
INSERT INTO Items
VALUES (4,"HP");

select user_id,join_date,ifnull(orders_in_2019,0) as orders_in_2019
from Users
left join (select buyer_id,count(buyer_id) as orders_in_2019 
	       from Orders where order_date between date('2019-01-01') and date('2019-12-31') 
		   group by buyer_id
) as a
on Users.user_id = a.buyer_id;