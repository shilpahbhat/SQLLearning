/* cast - convert one type to another*/
/*Often a CAST is implicit - for example if you concatenate a string with a number the number will be automatically changed to a string*/
/*  CAST(expression AS datatype(length)) */
/* length -- Optional. The length of the resulting data type (for char, varchar, nchar, nvarchar, binary and varbinary) */
select cast(25.65 as decimal) 			-- results in 26
select cast(25.65 as decimal(8,1)) 		-- results in 25.7
select cast(25.65 as decimal(8,2)) 		-- results in 25.65
select cast(25.65 as decimal(8,3)) 		-- results in 25.650
select cast(25.65 as int)    		    -- results in 25
SELECT CAST(25.65 AS float)  		    -- results in 25.649999999999999
SELECT CAST(25.65 AS varchar) 			-- results in 25.65
SELECT CAST('2017-08-25' AS datetime);  -- gives both date and time parts of datetime
SELECT CAST('2017-08-25' AS date);      -- gives only date part of datetime

/*Concatenate strings -  CONCAT(s1, s2 ...)  */
SELECT CONCAT(region,name)
  FROM bbc
  
/* aggregate functions */
/*SUM, COUNT, MAX and AVG are "aggregates",An aggregate function takes many values and delivers just one value*/
/*These functions are even more useful when used with the GROUP BY clause*/
/*SELECT may contain duplicate rows. We can remove these duplicates using the DISTINCT key word*/

/*The total population and GDP of Europe.*/
SELECT SUM(population), SUM(gdp)
  FROM bbc
  WHERE region = 'Europe'
  
/*how many regions?*/
SELECT DISTINCT count(region) FROM bbc

/*MAX finds the highest values in a column or part of a column*/
/*With a GROUP BY region statement each region shows up just once.
 The MAX column gives the "largest" name in the region in the context of strings this is the last name alphabetically.*/
SELECT region, MAX(name)
  FROM bbc
 GROUP BY region
 
/*similarly there is MIN*/

/*AVG gives the average (the mean) of a whole column or a group of rows for a single column of values.*/
SELECT region, AVG(population)
  FROM bbc
 GROUP BY region
 
 /*COUNT(column_name) finds the number of non-null values in a column. COUNT(*) also counts the null values.*/
 /*hence its better to use a column with non-null values*/
 SELECT region, COUNT(name)
  FROM bbc
 GROUP BY region
 
 /*EXTRACT allows you to retrieve components of a date.
You can extract also YEAR, MONTH, DAY, HOUR, MINUTE, SECOND.*/
/*EXTRACT(YEAR FROM d)    EXTRACT(MONTH FROM d)
  EXTRACT(DAY FROM d)     EXTRACT(HOUR FROM d)
  EXTRACT(MINUTE FROM d)  EXTRACT(SECOND FROM d)*/
  SELECT whn
      ,EXTRACT(YEAR FROM td)  AS yr
      ,EXTRACT(HOUR FROM td) AS hr
  FROM eclipse
  
  /*d + i returns the date i days after the date d.*/
  SELECT whn, whn+7 
  FROM eclipse						-- the result of whn+7 for example is 20110111
  
  /*LENGTH(s) returns the number of characters in string s.*/
  SELECT LENGTH(name), name
  FROM bbc
