use sqlassignment;
DROP TABLE IF EXISTS employee2;
CREATE TABLE employee2 (
    id varchar(5),
    salary varchar(5)
);
INSERT INTO employee2
VALUES (1,100);
INSERT INTO employee2
VALUES (2,200);
INSERT INTO employee2
VALUES (3,300);
SELECT * FROM
(
    (SELECT Salary 
    FROM Employee2 
    ORDER BY Salary DESC LIMIT 1, 1)
    UNION ALL
    SELECT NULL
) as new
LIMIT 1;
