-- Basics - 1

SELECT population FROM world
  WHERE name = 'Germany'

-- Basics - 2

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Basics - 3

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- From world - 1

SELECT name, continent, population FROM world

-- From world - 2

SELECT name
  FROM world
 WHERE population > 200000000

-- From world - 3

SELECT name, gdp/population
  FROM world
 WHERE population >= 200000000;

-- From world - 4

SELECT name, population/1000000
  FROM world
 WHERE continent = 'South America'

-- From world - 5

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- From world - 6

SELECT name
FROM world
WHERE name like '%united%'

-- From world - 7

SELECT name, population, area
FROM world
Where area > 3000000 or population >250000000

-- From world - 8

SELECT name, population, area
FROM world
Where (population > 250000000 and area < 3000000) or (population < 250000000 and area > 3000000)

-- From world - 9

select name, round(population / 1000000, 2), round(gdp / 1000000000, 2)
  from world
where continent = 'south america'


-- From world - 10

select name, round(gdp / population, -3)
  from world
where gdp > 1000000000000

-- From world - 11

SELECT name, capital
FROM world
WHERE len(name) = len(capital)

-- From world - 12

SELECT name, capital
FROM world
WHERE left(name,1) = left(capital,1) and (name <> capital)

-- From world - 13

SELECT name
   FROM world
where name like '%a%' and name like '%e%' and name like '%i%' and name like '%o%' and name like '%u%' and name not like '% %'

