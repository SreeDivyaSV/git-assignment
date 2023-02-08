use sqlassignment;
DROP TABLE IF EXISTS Seat;
CREATE TABLE Seat (
    id int,
    student varchar(10)
);
INSERT INTO Seat
VALUES (1,"Abbot");
INSERT INTO Seat
VALUES (2,"Doris");
INSERT INTO Seat
VALUES (3,"Emerson");
INSERT INTO Seat
VALUES (4,"Green");
INSERT INTO Seat
VALUES (5,"Jeames");
SELECT
(CASE
    WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
    WHEN MOD(id, 2) != 0 AND counts = id THEN id
    ELSE id - 1
END) AS id,
student
FROM
Seat,
(SELECT
    COUNT(*) AS counts
FROM
    Seat) AS seat_counts
ORDER BY id ASC;