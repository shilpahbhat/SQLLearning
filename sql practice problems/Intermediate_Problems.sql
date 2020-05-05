/*Categories, and the total products in each category*/
select CategoryName, COUNT(ProductName) as TotalProducts from Categories
join Products on Products.CategoryID = Categories.CategoryID
group by CategoryName
order by TotalProducts desc

/*21. Total customers per country/city*/
select Country, City ,count(CustomerID) as TotalCustomers from Customers
group by Country, City
order by TotalCustomers DESC

/*22. Products that need reordering*/
select ProductID, ProductName, UnitsInStock, ReorderLevel from Products
where UnitsInStock <  ReorderLevel
order by ProductID

/*23. Products that need reordering, continued*/
select ProductID, ProductName, UnitsInStock, ReorderLevel from Products
where UnitsInStock + UnitsOnOrder <=  ReorderLevel and Discontinued != 1
order by ProductID
