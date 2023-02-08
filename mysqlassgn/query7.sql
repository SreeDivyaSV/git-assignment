use sqlassignment;
DROP TABLE IF EXISTS Traffic;

CREATE TABLE Traffic (
    user_id int,
	activity enum('login', 'logout', 'jobs', 'groups', 'homepage'),
	activity_date date
);

INSERT INTO Traffic
VALUES (1,"login",'2019-05-01');
INSERT INTO Traffic
VALUES (1,"homepage",'2019-05-01');
INSERT INTO Traffic
VALUES (1,"logout",'2019-05-01');
INSERT INTO Traffic
VALUES (2,"login",'2019-06-21');
INSERT INTO Traffic
VALUES (2,"logout",'2019-06-21');
INSERT INTO Traffic
VALUES (3,"login",'2019-01-01');
INSERT INTO Traffic
VALUES (3,"jobs",'2019-01-01');
INSERT INTO Traffic
VALUES (3,"logout",'2019-01-01');
INSERT INTO Traffic
VALUES (4,"login",'2019-06-21');
INSERT INTO Traffic
VALUES (4,"groups",'2019-06-21');
INSERT INTO Traffic
VALUES (4,"logout",'2019-06-21');
INSERT INTO Traffic
VALUES (5,"login",'2019-03-01');
INSERT INTO Traffic
VALUES (5,"logout",'2019-03-01');
INSERT INTO Traffic
VALUES (5,"login",'2019-06-21');
INSERT INTO Traffic
VALUES (5,"logout",'2019-06-21');

select mindate as login_date, count(user_id) as user_count
from (select user_id, min(activity_date) as mindate
        from Traffic 
        where activity = 'login'
        group by user_id) as a 
where datediff('2019-06-30', mindate) <= 90
group by mindate