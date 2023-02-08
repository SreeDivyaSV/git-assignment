use sqlassignment;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Matches;

CREATE TABLE Teams (
    team_id int,
	team_name varchar(15)
);
CREATE TABLE Matches (
    match_id int,
	host_team int,
	guest_team int,
	host_goals int,
	guest_goals int
);
INSERT INTO Teams
VALUES (10,"LeetcodeFC");
INSERT INTO Teams
VALUES (20,"NewYorkFC");
INSERT INTO Teams
VALUES (30,"AtlantaFC");
INSERT INTO Teams
VALUES (40,"ChicagoFC");
INSERT INTO Teams
VALUES (50,"TorontoFC");

INSERT INTO Matches
VALUES (1,10,20,3,0);
INSERT INTO Matches
VALUES (2,30,10,2,2);
INSERT INTO Matches
VALUES (3,10,50,5,1);
INSERT INTO Matches
VALUES (4,20,30,1,0);
INSERT INTO Matches
VALUES (5,50,30,1,0);

select team_id, team_name, num_points from (
    select Teams.team_id, Teams.team_name, sum(
        case
            when Teams.team_id = Matches.host_team then
                case
                    when Matches.host_goals > Matches.guest_goals then 3
                    when Matches.host_goals = Matches.guest_goals then 1
                    else 0
                end
            when Teams.team_id = Matches.guest_team then
                case
                    when Matches.host_goals < Matches.guest_goals then 3
                    when Matches.host_goals = Matches.guest_goals then 1
                    else 0
                end
            else 0
        end
    ) as num_points
        from Teams left join Matches
        on Teams.team_id = Matches.host_team or Teams.team_id = Matches.guest_team
        group by Teams.team_id
) r
order by r.num_points desc, r.team_id asc;