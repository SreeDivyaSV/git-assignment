use sqlassignment;
DROP TABLE IF EXISTS employee1;
CREATE TABLE employee1 (
    id varchar(5),
    name varchar(10),
    department varchar(5),
    managerid varchar(5)
);
INSERT INTO employee1
VALUES (101,"John","A","None");
INSERT INTO employee1
VALUES (102,"Dan","A",101);
INSERT INTO employee1
VALUES (103,"James","A",101);
INSERT INTO employee1
VALUES (104,"Amy","A",101);
INSERT INTO employee1
VALUES (105,"Anne","A",101);
INSERT INTO employee1
VALUES (106,"Ron","B",101);

 select name from employee1,(select managerid,count(managerid) as c from employee1 group by managerid) as new where new.c>=5 and id=new.managerid;
