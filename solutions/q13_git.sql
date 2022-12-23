WITH totals AS (SELECT DISTINCT (pi.playerid), pi.ipouts, pe.namefirst, pe.namelast, pe.throws
			    FROM pitching AS pi
	            INNER JOIN people AS pe
                USING (playerid)
                WHERE throws IS NOT NULL
                AND throws <> 'S' )

SELECT SUM(ipouts) AS sum_all, throws, ROUND(count(*) * 100/sum(count(*)) over (),3) AS percentage
FROM totals
GROUP BY throws;
--R(72%), L(28%)

SELECT a.awardid, p.namefirst, p.namelast, p.throws
FROM awardsplayers AS a
INNER JOIN people AS p
USING (playerid)
WHERE awardid = 'Cy Young Award'
ORDER BY throws; 
--112 total CY YOUNG winners: 75total R(67%), 37total L(33%)

SELECT DISTINCT(h.playerid), pe.namefirst, pe.namelast, pe.throws
FROM halloffame AS h
INNER JOIN people AS pe
USING (playerid)
INNER JOIN pitching AS pi
USING (playerid)
WHERE throws IS NOT NULL
ORDER BY throws;
--HOF: 488 total, 347 R(71%) 141 L(29%)