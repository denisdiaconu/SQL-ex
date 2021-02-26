 -- Basics - 1
SELECT  population
FROM world
WHERE name = 'Germany' -- Basics - 2 
SELECT  name
       ,population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark'); -- Basics - 3 

SELECT  name
       ,area
FROM world
WHERE area BETWEEN 200000 AND 250000 
-- FROM world - 1
SELECT  name
       ,continent
       ,population
FROM world 
-- FROM world - 2
SELECT  name
FROM world
WHERE population > 200000000 
-- FROM world - 3
SELECT  name
       ,gdp/population
FROM world
WHERE population >= 200000000; 
-- FROM world - 4
SELECT  name
       ,population/1000000
FROM world
WHERE continent = 'South America' 
-- FROM world - 5
SELECT  name
       ,population
FROM world
WHERE name IN ('France', 'Germany', 'Italy') 
-- FROM world - 6
SELECT  name
FROM world
WHERE name like '%united%' 
-- FROM world - 7
SELECT  name
       ,population
       ,area
FROM world
WHERE area > 3000000 or population >250000000 
-- FROM world - 8
SELECT  name
       ,population
       ,area
FROM world
WHERE (population > 250000000 AND area < 3000000) or (population < 250000000 AND area > 3000000) 
-- FROM world - 9
SELECT  name
       ,round(population / 1000000,2)
       ,round(gdp / 1000000000,2)
FROM world
WHERE continent = 'south america' 
-- FROM world - 10
SELECT  name
       ,round(gdp / population,-3)
FROM world
WHERE gdp > 1000000000000 
-- FROM world - 11
SELECT  name
       ,capital
FROM world
WHERE len(name) = len(capital) 
-- FROM world - 12
SELECT  name
       ,capital
FROM world
WHERE left(name,1) = left(capital,1) 
AND (name <> capital) 
-- FROM world - 13
SELECT  name
FROM world
WHERE name LIKE '%a%' 
AND name LIKE '%e%' 
AND name LIKE '%i%' 
AND name LIKE '%o%' 
AND name LIKE '%u%' 
AND name NOT LIKE '% %' -- nobel - 1 
SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE yr = 1950 -- nobel - 2 
SELECT  winner
FROM nobel
WHERE yr = 1962 
AND subject = 'literature' -- nobel - 3 
SELECT  yr
       ,subject
FROM nobel
WHERE winner = 'albert einstein' -- nobel - 4 
SELECT  winner
FROM nobel
WHERE yr >= 2000 
AND subject = 'peace' -- nobel - 5 
SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE yr >= 1980 
AND yr <= 1989 
AND subject = 'literature' -- nobel - 6 
SELECT  *
FROM nobel
WHERE winner = 'theodore roosevelt' or winner = 'woodrow wilson' or winner = 'jimmy carter' or winner = 'barack obama' -- nobel - 7 
SELECT  winner
FROM nobel
WHERE winner like 'john%' -- nobel - 8 
SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE (subject = 'physics' AND yr = 1980) or (subject = 'chemistry' AND yr = 1984) -- nobel - 9 
SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE yr = 1980 
AND (subject <> 'chemistry' AND subject <> 'medicine') -- nobel - 10 
SELECT  yr
       ,subject
       ,winner
FROM nobel
WHERE (yr < 1910 AND subject = 'medicine') or (yr >= 2004 AND subject = 'literature') -- nobel - 11 
SELECT  *
FROM nobel
WHERE winner = 'peter grünberg' -- nobel - 12 
SELECT  *
FROM nobel
WHERE winner = 'eugene o''neill' -- nobel - 13 
SELECT  winner
       ,yr
       ,subject
FROM nobel
WHERE winner like 'sir%'
ORDER BY yr desc, winner 
-- SELECT  - 1
SELECT  name
FROM world
WHERE population > ( 
SELECT  population
FROM world
WHERE name='Russia') 
-- SELECT  - 2
SELECT  name
FROM world
WHERE continent = 'europe' 
AND gdp/population > ( 
SELECT  gdp/population
FROM world
WHERE name ='united kingdom' ) 
-- SELECT  - 3
SELECT  name
       ,continent
FROM world
WHERE continent IN ( SELECT continent FROM world WHERE name IN ('argentina','australia'))
ORDER BY name 
-- SELECT  - 4
SELECT  name
       ,population
FROM world
WHERE population > ( 
SELECT  population
FROM world
WHERE name = 'canada') AND population < ( 
SELECT  population
FROM world
WHERE name = 'poland') 
-- SELECT  - 5
SELECT  name
       ,CONCAT(ROUND(100*population/(
SELECT  population
FROM world
WHERE name = 'germany'),0), '%') 
FROM world
WHERE continent = 'europe' 
-- SELECT  - 6
SELECT  name
FROM world
WHERE gdp > ALL( 
SELECT  gdp
FROM world
WHERE gdp>0 
AND continent = 'europe') 
-- SELECT  - 7
SELECT  continent
       ,name
       ,area
FROM world x
WHERE area >= ALL ( 
SELECT  area
FROM world y
WHERE y.continent=x.continent 
AND area>0) 
-- SELECT  - 8
SELECT  continent
       ,name
FROM world x
WHERE name <= all ( 
SELECT  name
FROM world y
WHERE y.continent=x.continent) 
-- SELECT  - 9
SELECT  name
       ,continent
       ,population
FROM world x
WHERE 25000000 > all( 
SELECT  population
FROM world y
WHERE x.continent = y.continent 
AND y.population > 0) 
-- SELECT  - 10
SELECT  name
       ,continent
FROM world x
WHERE population > all( 
SELECT  population*3
FROM world y
WHERE x.continent = y.continent 
AND population > 0 
AND y.name != x.name) -- SUM AND COUNT - 1 
SELECT  SUM(population)
FROM world -- SUM AND COUNT - 2
SELECT  distinct continent
FROM world -- SUM AND COUNT - 3
SELECT  SUM(gdp)
FROM world
WHERE continent = 'africa' -- SUM 
AND COUNT - 4 
SELECT  COUNT(area)
FROM world
WHERE area > 1000000 -- SUM 
AND COUNT - 5 
SELECT  SUM(population)
FROM world
WHERE name IN ('estonia', 'latvia', 'lithuania') -- SUM 
AND COUNT - 6 
SELECT  continent
       ,COUNT(name)
FROM world
GROUP BY  continent -- SUM AND COUNT - 7
SELECT  continent
       ,COUNT(name)
FROM world
WHERE population > 10000000 
GROUP BY  continent -- SUM AND COUNT - 8
SELECT  continent
FROM world
GROUP BY  continent
HAVING SUM(population) > 100000000 
-- JOIN - 1
SELECT  matchid
       ,player
FROM goal
WHERE teamid = 'ger' 
-- JOIN - 2
SELECT  id
       ,stadium
       ,team1
       ,team2
FROM game
WHERE id = 1012 
-- JOIN - 3
SELECT  player
       ,teamid
       ,stadium
       ,mdate
FROM game
JOIN goal
ON (id=matchid)
WHERE teamid = 'ger' 
-- JOIN - 4
SELECT  team1
       ,team2
       ,player
FROM game
JOIN goal
ON (id=matchid AND player like ('mario%')) 
-- JOIN - 5
SELECT  player
       ,teamid
       ,coach
       ,gtime
FROM goal
JOIN eteam on
(teamid=id
)
WHERE gtime<=10 
-- JOIN - 6
SELECT  mdate
       ,teamname
FROM game
JOIN eteam
ON (team1=eteam.id)
WHERE coach like 'fernando%' 
-- JOIN - 7
SELECT  player
FROM game
JOIN goal
ON (id = matchid)
WHERE stadium like '%warsaw' 
-- JOIN - 8
SELECT  distinct player
FROM game
JOIN goal
ON matchid = id
WHERE (team1='GER'or team2='ger') 
AND teamid != 'ger' 
-- JOIN - 9
SELECT  teamname
       ,COUNT(player)
FROM eteam
JOIN goal
ON id=teamid
GROUP BY  teamname 
-- JOIN - 10
SELECT  stadium
       ,COUNT(player)
FROM game
JOIN goal
ON id = matchid
GROUP BY  stadium 
-- JOIN - 11
SELECT  matchid
       ,mdate
       ,COUNT(player)
FROM game
JOIN goal
ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL') 
GROUP BY  matchid
         ,mdate 
-- JOIN - 12
SELECT  matchid
       ,mdate
       ,COUNT(player)
FROM goal
JOIN game
ON id = matchid
WHERE (team1 = 'ger' or team2 = 'ger') 
AND teamid = 'ger' 
GROUP BY  matchid
         ,mdate 
-- JOIN - 13
SELECT  DISTINCT mdate
       ,team1
       ,SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1
       ,team2
       ,SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal
ON game.id = goal.matchid
GROUP BY  id
         ,mdate
         ,team1
         ,team2 -- MORE
JOIN - 1
SELECT  id
       ,title
FROM movie
WHERE yr=1962 -- MORE 
JOIN - 2
SELECT  yr
FROM movie
WHERE title = 'citizen kane' -- MORE 
JOIN - 3
SELECT  id
       ,title
       ,yr
FROM movie
WHERE title like 'star trek%'
ORDER BY yr -- MORE 
JOIN - 4
SELECT  id
FROM actor
WHERE name = 'glenn close' -- MORE 
JOIN - 5
SELECT  id
FROM movie
WHERE title = 'casablanca' -- MORE 
JOIN - 6
SELECT  name
FROM actor, casting
WHERE id=actorid 
AND movieid = 27 -- MORE 
JOIN - 7
SELECT  name
FROM actor, casting
WHERE id=actorid 
AND movieid = ( 
SELECT  id
FROM movie
WHERE title = 'alien') -- MORE 
JOIN - 8
SELECT  title
FROM movie
JOIN casting
ON (id=movieid AND actorid = (
SELECT  id
FROM actor
WHERE name = 'harrison ford')) -- MORE 
JOIN - 9
SELECT  title
FROM movie
JOIN casting
ON (id=movieid AND actorid = (
SELECT  id
FROM actor
WHERE name = 'harrison ford' 
AND ord != 1)) -- MORE 
JOIN - 10
SELECT  title
       ,name
FROM movie
JOIN casting
ON (id=movieid)
JOIN actor
ON (actor.id = actorid)
WHERE ord=1 
AND yr = 1962 -- MORE 
JOIN - 11
SELECT  yr
       ,COUNT(title)
FROM movie
JOIN casting
ON movie.id=movieid
JOIN actor
ON actorid=actor.id
WHERE name='rock hudson' 
GROUP BY  yr
HAVING COUNT(title) > 2 -- MORE
JOIN - 12
SELECT  title
       ,name
FROM movie
JOIN casting x
ON movie.id = movieid
JOIN actor
ON actor.id =actorid
WHERE ord=1 
AND movieid IN ( SELECT movieid FROM casting y JOIN actor ON actor.id=actorid WHERE name='julie andrews') -- MORE 
JOIN - 13
SELECT  name
FROM actor
JOIN casting
ON (id=actorid AND (
SELECT  COUNT(ord)
FROM casting
WHERE actorid = actor.id 
AND ord=1)>=15) 
GROUP BY  name -- MORE
JOIN - 14
SELECT  title
       ,COUNT(actorid)
FROM movie
JOIN casting
ON movie.id = movieid
WHERE yr = 1978 
GROUP BY  title
ORDER BY COUNT(actorid) desc
         ,title -- MORE
JOIN - 15
SELECT  distinct name
FROM actor
JOIN casting
ON id=actorid
WHERE movieid IN ( SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='art garfunkel')) 
AND name != 'art garfunkel' -- NULL - 1 
SELECT  name
FROM teacher
WHERE dept is null -- NULL - 2 
SELECT  teacher.name
       ,dept.name
FROM teacher
INNER JOIN dept
ON (teacher.dept = dept.id) -- NULL - 3
SELECT  teacher.name
       ,dept.name
FROM teacher
LEFT JOIN dept
ON (teacher.dept=dept.id) -- NULL - 4
SELECT  teacher.name
       ,dept.name
FROM teacher
RIGHT JOIN dept
ON (teacher.dept=dept.id) -- NULL - 5
SELECT  name
       ,coalesce(mobile,'07986 444 2266')from teacher -- NULL - 6
SELECT  coalesce(teacher.name,'none')
       ,coalesce(dept.name,'none')
FROM teacher
LEFT JOIN dept
ON (teacher.dept=dept.id) -- NULL - 7
SELECT  COUNT(name)
       ,COUNT(mobile)
FROM teacher -- NULL - 8
SELECT  dept.name
       ,COUNT(teacher.dept)
FROM teacher
RIGHT JOIN dept
ON dept.id = teacher.dept
GROUP BY  dept.name -- NULL - 9
SELECT  name
       ,CASE WHEN dept IN (1,2) THEN 'Sci'  ELSE 'Art' END
FROM teacher -- NULL - 10
SELECT  name
       ,CASE WHEN dept IN (1,2) THEN 'Sci' 
             WHEN dept = 3 THEN 'Art'  ELSE 'None' END
FROM teacher -- self
JOIN - 1
SELECT  COUNT(name)
FROM stops -- self
JOIN - 2
SELECT  id
FROM stops
WHERE name = 'craiglockhart' -- self 
JOIN - 3
SELECT  id
       ,name
FROM stops
JOIN route
ON id = stop
WHERE num = '4' 
AND company = 'lrt'; -- self 
JOIN - 4
SELECT  company
       ,num
       ,COUNT(*)
FROM route
WHERE stop=149 OR stop=53 
GROUP BY  company
         ,num
HAVING COUNT(*) >1 -- self
JOIN - 5
SELECT  a.company
       ,a.num
       ,a.stop
       ,b.stop
FROM route a
JOIN route b
ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 
AND b.stop=149 -- self 
JOIN - 6
SELECT  a.company 
       ,a.num 
       ,stopa.name 
       ,stopb.name
FROM route a
JOIN route b
ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa
ON (a.stop=stopa.id)
JOIN stops stopb
ON (b.stop=stopb.id)
WHERE stopa.name='craiglockhart' 
AND stopb.name='london road' -- self 
JOIN - 7
SELECT  distinct a.company
       ,a.num
FROM route a
JOIN route b
ON (a.company =b.company AND a.num=b.num)
JOIN stops stopa
ON (a.stop=stopa.id)
JOIN stops stopb
ON (b.stop=stopb.id)
WHERE stopa.name='haymarket' 
AND stopb.name='leith' -- self 
JOIN - 8
SELECT  distinct a.company
       ,a.num
FROM route a
JOIN route b
ON (a.num=b.num AND a.company=b.company)
JOIN stops stopa
ON (a.stop=stopa.id)
JOIN stops stopb
ON (b.stop=stopb.id)
WHERE stopa.name = 'craiglockhart' 
AND stopb.name = 'tollcross' 