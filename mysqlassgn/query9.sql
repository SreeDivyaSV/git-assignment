use sqlassignment;
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Chargebacks;

CREATE TABLE Transactions (
    id int,
	country varchar(10),
	state enum("approved", "declined"),
	amount int,
	trans_date date
);
CREATE TABLE Chargebacks (
    trans_id int,
	trans_date date
);
INSERT INTO Transactions
VALUES (101,"US","approved",1000,'2019-05-18');
INSERT INTO Transactions
VALUES (102,"US","declined",2000,'2019-05-19');
INSERT INTO Transactions
VALUES (103,"US","approved",3000,'2019-06-10');
INSERT INTO Transactions
VALUES (104,"US","declined",4000,'2019-06-13');
INSERT INTO Transactions
VALUES (105,"US","approved",5000,'2019-06-15');

INSERT INTO Chargebacks
VALUES (102,'2019-05-29');
INSERT INTO Chargebacks
VALUES (101,'2019-06-30');
INSERT INTO Chargebacks
VALUES (105,'2019-09-18');

select month, country, sum(if(state = 'approved', 1, 0)) as approved_count,
    sum(if(state = 'approved', amount, 0)) as approved_amount,
    sum(if(state = 'chargeback', 1, 0)) as chargeback_count,
    sum(if(state = 'chargeback', amount, 0)) as chargeback_amount
    from ((
        select date_format(trans_date, '%Y-%m') as month, country, amount, 'approved' as state
            from Transactions 
            where state = 'approved'
    ) union all (
        select date_format(Chargebacks.trans_date, '%Y-%m') as month, country, amount, 'chargeback' as state
            from Transactions inner join Chargebacks on Transactions.id = Chargebacks.trans_id
    )) t
    group by t.month, t.country;
