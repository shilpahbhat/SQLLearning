/*https://sqlzoo.net/wiki/SELECT_basics*/
SELECT population
FROM world
WHERE name = 'germany'

/* where ... in .... */
SELECT name
	,population
FROM world
WHERE name IN (
		'Sweden'
		,'Norway'
		,'Denmark'
		);

/* where ... between ...*/
/* between inclusive of boundary conditions*/
SELECT name
	,area
FROM world
WHERE area BETWEEN 200000
		AND 250000

/* where ... like...*/
SELECT name
	,population
FROM world
WHERE name LIKE 'al%'

SELECT name
	,population
FROM world
WHERE name LIKE '%a'
	OR name LIKE '%l'

/* length() */
SELECT name
	,population
FROM world
WHERE length(name) = 5
	AND continent = 'Europe'

/*inline column calculation */
/*get population density */
SELECT name
	,population / area
FROM world
WHERE name IN (
		'China'
		,'Nigeria'
		,'France'
		,'Australia'
		)

/* exclusive or  - either but not both*/
SELECT name
	,population
	,area
FROM world
WHERE area > 3000000 xor population > 250000000

/* round() */
SELECT name
	,ROUND(population / 1000000, 2)
	,ROUND(gdp / 1000000000, 2)
FROM world
WHERE continent = 'South America'

/* round to nearest thousand i.e. 54700 becomes 55000*/
/*round(value, -3)*/
SELECT name
	,ROUND(gdp / population, - 3)
FROM world
WHERE gdp >= 1000000000000

/* LEFT(value, 1) - isolate first character in string*/
/*find records where first letter of name and capital match*/
SELECT name
	,capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
	AND name != capital

/*not like to find words excluding a char/substring*/
/* find records with all vowels in its name but should not be two words*/
SELECT name
FROM world
WHERE name LIKE '%a%'
	AND name LIKE '%e%'
	AND name LIKE '%i%'
	AND name LIKE '%o%'
	AND name LIKE '%u%'
	AND name NOT LIKE '% %'

/*escaping single quote in string by using extra ' */
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

/*order by */
/*default is ascending*/
/*order by two colums, one of them descending - latest year first*/
SELECT winner
	,yr
	,subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC
	,winner

/* order by condition*/
/*order chemistry and physics last*/
/*conditional expression results in values 1 or 0, hence 0 and 1 are ordered in first preference*/
SELECT winner
	,subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN (
		'Physics'
		,'Chemistry'
		)
	,subject
	,winner

/*above doesnt work in oracle, and hence is not completely sql so use complicated case expression*/
/*case when... then...end*/
SELECT winner
	,subject
FROM nobel
WHERE yr = 1984
ORDER BY CASE 
		WHEN subject IN (
				'Physics'
				,'Chemistry'
				)
			THEN 1
		ELSE 0
		END
	,subject
	,winner

/*count() */
/*find number of records*/
SELECT COUNT(subject)
FROM nobel
WHERE subject = 'Chemistry'
	AND BETWEEN 1950
		AND 1960