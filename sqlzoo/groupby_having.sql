/*functions such as SUM and COUNT are applied to groups of items sharing values.
 When you specify GROUP BY continent the result is that you get only one row for each different value of continent.
 All the other columns must be "aggregated" by one of SUM, COUNT */
 /*The HAVING clause allows use to filter the groups which are displayed.
 The WHERE clause filters rows before the aggregation, the HAVING clause filters after the aggregation.*/
 /*If a ORDER BY clause is included we can refer to columns by their position.*/
 
 /*For each continent show the number of countries:*/
 select continent, count(name) from world 
group by continent

/*For each relevant continent show the number of countries that has a population of at least 200000000.*/
/* where ... group by...*/
select continent, count(name) from world 
where population >= 200000000
group by continent

/*Show the total population of those continents with a total population of at least half a billion.*/
/*group by ... having..*/
select continent, sum(population) as s from world 
group by continent
having s >=500000000

/*List the continents that have a total population of at least 100 million.*/
select continent from world
group by continent
having sum(population) >= 100000000

/* group by with multiple columns*/
select Country, City ,count(CustomerID) as TotalCustomers from Customers
group by Country, City
order by TotalCustomers DESC

