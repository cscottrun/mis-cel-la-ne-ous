-- SELECT within SELECT Tutorial
-- 1
-- List each country name where the population is larger than that of 'Russia'.
SELECT name 
FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- -- 2
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > 
  (SELECT gdp/population 
  FROM world 
  WHERE name = 'United Kingdom')

-- -- 3
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name 
IN ('Argentina', 'Australia'))
ORDER BY name


-- -- 4
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population
FROM world
WHERE population > (SELECT population
FROM world
WHERE name = 'Canada')
AND population < (SELECT population
FROM world
WHERE name = 'Poland')


-- -- 5
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, CONCAT(
   ROUND(population * 100/  
       (SELECT population
        FROM world
        WHERE name = 'Germany')  ,0) ,'%')
FROM world
WHERE continent = 'Europe'

-- -- 6
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)


-- -- 7
-- Find the largest country (by area) in each continent, show the continent, the name and the area:


-- -- 8
-- List each continent and the name of the country that comes first alphabetically.


-- -- 9
-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.


-- -- 10
-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

