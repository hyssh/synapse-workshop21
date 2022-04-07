SELECT c.CustomerID, c.FirstName, c.LastName, c.CompanyName, c.SalesPerson, c.emailAddress, c.Phone, ca.AddressType, a.AddressLine1, a.AddressLine2, a.City, a.StateProvince, a.CountryRegion, a.PostalCode
FROM SalesLT_Customer as c 
JOIN SalesLT_CustomerAddress as ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT_Address as a ON ca.AddressID = a.AddressID