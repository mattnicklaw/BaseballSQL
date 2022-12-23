SELECT playerid, COUNT(playerid)
FROM awardsmanagers as A
WHERE awardid = 'TSN Manager of the Year'
AND lgid <> 'ML'
GROUP BY playerid
HAVING COUNT(playerid) >=2;
--Davey Johnson: 1997 Baltimore (AL), 2012 Washington (NL)
--Jim Leyland: 1988-1990-1992 Pittsburgh (NL), 2006 Detroit (AL)
--See below for logic (lol)

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'bochybr01';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'oatesjo01';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'johnsda02';
--yes

SELECT namefirst, namelast
FROM people
WHERE playerid = 'johnsda02';
--Davey Johnson

SELECT teamid
FROM managers
WHERE playerid = 'johnsda02';
AND yearid = 1997;
--BAL (AL)

SELECT teamid
FROM managers
WHERE playerid = 'johnsda02'
AND yearid = 2012;
--WAS (NL)

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'bakerdu01';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'maddojo99';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'larusto01';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'showabu99';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'gardero01';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'leylaji99';
--YES 1988, 1990, 1992 (NL), 2006(AL)

SELECT namefirst, namelast
FROM people
WHERE playerid = 'leylaji99';
--Jim Leyland

SELECT teamid
FROM managers
WHERE playerid = 'leylaji99'
AND yearid IN (1988, 1990, 1992);
--Pittsburgh

SELECT teamid
FROM managers
WHERE playerid = 'leylaji99'
AND yearid = '2006';
--Detroit

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'sciosmi01';
--no

SELECT lgid, playerid, yearid, awardid
FROM awardsmanagers
WHERE lgid <> 'ML'
AND awardid = 'TSN Manager of the Year'
AND playerid = 'coxbo01';
--no

WITH dual_league AS	(SELECT playerid, COUNT(DISTINCT awardid)
					FROM awardsmanagers
					WHERE lgid <> 'ML'
					 	AND awardid ='TSN Manager of the Year'
					GROUP BY playerid
					HAVING COUNT(DISTINCT lgid) >1)
SELECT DISTINCT
	namefirst, 
	namelast, 
	yearid,
	name
FROM awardsmanagers
	INNER JOIN people
	USING(playerid)
	INNER JOIN dual_league
	USING(playerid)
	INNER JOIN managers
	USING(playerid, yearid)
	INNER JOIN teams
	USING(teamid, yearid);