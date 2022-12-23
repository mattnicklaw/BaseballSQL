--2. Find the name and height of the shortest player in the database. 
--How many games did he play in? 
--What is the name of the team for which he played?

SELECT p.namefirst, p.namelast, p.height, a.g_all, t.name 
FROM people AS p
INNER JOIN appearances AS a
USING (playerid)
INNER JOIN teams AS t
USING (teamid)
ORDER BY p.height
LIMIT 1;

SELECT DISTINCT g_all, namefirst, namelast, height
FROM people INNER JOIN appearances USING (playerid)
INNER JOIN teams USING (teamid)
WHERE height = (SELECT MIN(height) FROM people);

SELECT *
FROM people
WHERE height = (SELECT MIN(height) FROM people);

SELECT MIN(height) FROM people;