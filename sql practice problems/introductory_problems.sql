/*skipped problems  1 to 15 due to simplicity*/

/*When was the first order?*/
select top 1 OrderDate as FirstOrder from Orders
order by OrderDate

/*for above instead of using order you can use MIN function*/
select MIN(OrderDate) as FirstOrder from Orders

/*Countries where there are customers*/
select DISTINCT Country from Customers

/*alternatively you can use the group by clause*/
select Country from Customers group by Country

/*Contact titles for customers*/
select ContactTitle, COUNT(ContactName) as TotalContactTitle from Customers
group by ContactTitle
order by TotalContactTitle DESC

/*Products with associated supplier names*/
select ProductID, ProductName, CompanyName from Products as p
join Suppliers as s on s.SupplierID = p.SupplierID
order by ProductID

/*Orders and the Shipper that was used*/
select OrderID, CAST(OrderDate as date) as OrderDate, CompanyName from Orders
join Shippers on Shippers.ShipperID = Orders.ShipVia
where OrderID < 10300