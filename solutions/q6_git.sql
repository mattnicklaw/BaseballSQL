--6. Find the player who had the most success stealing bases in 2016, 
--where __success__ is measured as the percentage of stolen base attempts which are successful. 
--(A stolen base attempt results either in a stolen base or being caught stealing.) 
--Consider only players who attempted _at least_ 20 stolen bases.
SELECT p.namefirst, 
	   p.namelast, 
	   b.yearid,
	   b.sb, b.cs,  
	   ROUND((b.sb)/NULLIF(b.sb+b.cs,0)::decimal,3) AS success,
	   (sb + cs) AS total_steals
FROM batting AS b
INNER JOIN people AS p
USING (playerid)
INNER JOIN appearances AS a
USING (playerid)
WHERE b.yearid = 2016
AND (sb +cs) >=20
ORDER BY success DESC
LIMIT 1;
--q6 complete

select playerid, namefirst, namelast
from people
where namelast LIKE '%Owings%'
LIMIT 1;
--owingch01

select sb, cs
from batting
WHERE yearid = 2016
AND playerid = 'owingch01';
--21-2 2016