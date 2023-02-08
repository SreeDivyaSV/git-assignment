use sqlassignment;
DROP TABLE IF EXISTS RequestAccepted;
CREATE TABLE RequestAccepted (
    requester_id int,
    accepter_id int,
    accept_date date
);
INSERT INTO RequestAccepted
VALUES (1,2,"2016/06/03");
INSERT INTO RequestAccepted
VALUES (1,3,"2016/06/08");
INSERT INTO RequestAccepted
VALUES (2,3,"2016/06/08");
INSERT INTO RequestAccepted
VALUES (3,4,"2016/06/09");
select id,num 
from(select id,count(*) as num from (select requester_id as id from RequestAccepted union all select accepter_id from RequestAccepted ) as table1 group by id) as table2
order by num desc limit 1;