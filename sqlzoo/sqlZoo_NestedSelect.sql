/*https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial*/
/*List each country name where the population is larger than that of 'Russia'.*/
SELECT name
FROM world
WHERE population > (
		SELECT population
		FROM world
		WHERE name = 'Russia'
		)

/*Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/
SELECT name
FROM world
WHERE continent = 'Europe'
	AND gdp / population > (
		SELECT gdp / population
		FROM world
		WHERE name = 'United Kingdom'
		)

/*List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.*/
SELECT name
	,continent
FROM world
WHERE continent = (
		SELECT continent
		FROM world
		WHERE name = 'Argentina'
		)
	OR continent = (
		SELECT continent
		FROM world
		WHERE name = 'Australia'
		)
ORDER BY name

/*brackets around nested select are mandatory*/
/*Which country has a population that is more than Canada but less than Poland? Show the name and the population.*/
SELECT name
	,population
FROM world
WHERE population > (
		SELECT population
		FROM world
		WHERE name = 'Canada'
		)
	AND population < (
		SELECT population
		FROM world
		WHERE name = 'Poland'
		)

/* concat() */
SELECT name
	,CONCAT (
		ROUND(100 * population / (
				SELECT population
				FROM world
				WHERE name = 'Germany'
				), 0)
		,'%'
		)
FROM world
WHERE continent = 'Europe'

/*ALL() returns a list -- a comparison operator can work with a list*/
/*find the largest country in the world,*/
SELECT name
FROM world
WHERE population >= ALL (
		SELECT population
		FROM world
		WHERE population > 0
		)

/*alternatively, use max function*/
SELECT name
FROM world
WHERE population = (
		SELECT max(population)
		FROM world
		)

/*to check numeric value for null, check for > 0*/
/*Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)*/
SELECT name
FROM world
WHERE gdp > ALL (
		SELECT gdp
		FROM world
		WHERE gdp > 0
			AND continent = 'Europe'
		)

/*We can refer to values in the outer SELECT within the inner SELECT. We can name the tables so that we can tell the difference between the inner and outer versions.*/
/*Largest in each continent*/
/*Find the largest country (by area) in each continent, show the continent, the name and the area:*/
/*correlated sub-query)*/
SELECT continent
	,name
	,area
FROM world x
WHERE area >= ALL (
		SELECT area
		FROM world y
		WHERE x.continent = y.continent
			AND area > 0
		)

/*List each continent and the name of the country that comes first alphabetically.*/
/*you can order two strings by comparing them*/
SELECT continent
	,name
FROM world x
WHERE name <= ALL (
		SELECT name
		FROM world y
		WHERE x.continent = y.continent
		)

/*Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents*/
SELECT name
	,continent
	,population
FROM world x
WHERE 25000000 >= ALL (
		SELECT population
		FROM world y
		WHERE x.continent = y.continent
		)

/*Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.*/
/*this is similar to looping each outer select result with the inner select list items, so you need to skip the item itself in the list*/
SELECT name
	,continent
FROM world x
WHERE population / 3 > ALL (
		SELECT population
		FROM world y
		WHERE x.continent = y.continent
			AND x.name != y.name
		)

/*countries with a greater GDP than any country in Africa */
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')