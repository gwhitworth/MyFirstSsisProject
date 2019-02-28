select top 3 
e.EmailAddress, p.FirstName, p.LastName, sp.SalesYTD 
from Sales.SalesPerson sp
inner join AdventureWorks2008R2.Person.EmailAddress e
	on e.BusinessEntityID = sp.BusinessEntityID 
inner join Person.Person p
	on p.BusinessEntityID = sp.BusinessEntityID
order by SalesYTD desc