--Find all players in the database who played at Vanderbilt University. 
--Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
--Sort this list in descending order by the total salary earned. 
--Which Vanderbilt player earned the most money in the majors?

WITH vandy as (SELECT DISTINCT(s.yearid), schools.schoolname, p.namefirst, p.namelast, s.salary
				FROM schools
				INNER JOIN collegeplaying AS cp
				USING (schoolid)
				INNER JOIN people AS p
				USING (playerid)
				INNER JOIN salaries AS s
				USING (playerid)
				WHERE schoolname = 'Vanderbilt University')

SELECT SUM(salary) AS total_salary, namefirst, namelast, schoolname
FROM vandy
group by namefirst, namelast, schoolname
order by total_salary DESC;
--q3 complete