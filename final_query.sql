SELECT `sales`.`SalesID`,`sales`.`CustomerID`, `sales`.`ProductID`, `sales`.`quantity`, `sales`.`Discount`, `sales`.`SalesDate`, `cities`.`CityName`, `products`.`ProductName`, `products`.`Price`, `products`.`Class`, `products`.`Resistant`, `categories`.`CategoryName` 
FROM `lab1-449822.walmartsales.sales` sales
LEFT JOIN `lab1-449822.walmartsales.customers` customers on sales.CustomerID = customers.CustomerID
LEFT JOIN `lab1-449822.walmartsales.cities` cities on customers.CityID = cities.CityID
LEFT JOIN `lab1-449822.walmartsales.countries` countries on cities.CountryID = countries.CountryID
LEFT JOIN `lab1-449822.walmartsales.products` products on sales.ProductID = products.ProductID
LEFT JOIN `lab1-449822.walmartsales.categories` categories on products.CategoryID = categories.CategoryID
limit 10000;