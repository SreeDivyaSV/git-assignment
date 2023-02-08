use sqlassignment;
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    product_id int,
	new_price int,
	change_date date
);
INSERT INTO Products
VALUES (1,20,'2019-08-14');
INSERT INTO Products
VALUES (2,50,'2019-08-14');
INSERT INTO Products
VALUES (1,30,'2019-08-15');
INSERT INTO Products
VALUES (1,35,'2019-08-16');
INSERT INTO Products
VALUES (2,65,'2019-08-17');
INSERT INTO Products
VALUES (3,20,'2019-08-18');

select product_id, new_price as price from Products
        where (product_id, change_date) in (
            select product_id, max(change_date) from Products
                where change_date <= '2019-08-16'
                group by product_id
        )
    union
select distinct product_id, 10 as price from Products
		where product_id not in (
			select product_id from Products
				where change_date <= '2019-08-16'
		);