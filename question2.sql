#q1
SHOW DATABASES;
USE electronicsdb;
SHOW TABLES FROM electronicsdb;
SHOW COLUMNS FROM productcategories;
SHOW COLUMNS FROM products;
SHOW COLUMNS FROM storeinventory;
SHOW COLUMNS FROM stores;
SHOW COLUMNS FROM suppliers;
SELECT *
FROM productcategories;
SELECT *
FROM  storeinventory;
SELECT ProductID from storeinventory;
select p.ProductID,p.ProductName, pc.CategoryName,S.SupplierName 
from 
  products AS p
join
   productcategories As pc on p.CategoryID=p.CategoryID
join
	suppliers AS s on p.SupplierID=s.SupplierID
    
#q2
SELECT
    p.ProductName, s.SupplierName
FROM
    products as p
JOIN
    suppliers as s ON p.SupplierID = s.SupplierID
WHERE
    s.SupplierName = (SELECT s.SupplierName
FROM products p
JOIN  suppliers s ON p.SupplierID = s.SupplierID
WHERE  p.ProductName = 'Alpha Smartphone');

#q3
SELECT
    p.ProductID,
    p.ProductName,
    p.Specifications,
    p.CategoryID,
    p.SupplierID
FROM
    products as p
WHERE
CategoryID = 31 OR SupplierID = 50 ; 

#q4
SELECT
    p.ProductID,
    p.ProductName,
    SUM(si.QuantityInStock) AS TotalQuantityInStock
FROM
    products p
JOIN
    storeinventory si ON p.ProductID = si.ProductID
GROUP BY
    p.ProductID, p.ProductName;
    
#q5
SELECT
    pc.CategoryID,
    pc.CategoryName,
    AVG(si.QuantityInStock) AS AverageStockQuantity
FROM
    productcategories pc
JOIN
    products p ON pc.CategoryID = p.CategoryID
JOIN
    storeinventory si ON p.ProductID = si.ProductID
GROUP BY
    pc.CategoryID, pc.CategoryName
HAVING
    AVG(si.QuantityInStock) > 70;
    
#q6
SELECT
    p.ProductID,
    p.ProductName,
    s.SupplierName,
    si.QuantityInStock,  pc.CategoryName 
FROM
    products p
JOIN
    productcategories pc ON p.CategoryID = pc.CategoryID
JOIN
    suppliers s ON p.SupplierID = s.SupplierID
JOIN
    storeinventory si ON p.ProductID = si.ProductID
WHERE
    pc.CategoryName = 'Cameras'
    AND s.SupplierID IS NOT NULL;
    
#q7
SELECT
    p.ProductID,
    p.ProductName,
    p.CategoryID,
    si.QuantityInStock,
    AVG(si.QuantityInStock) OVER (PARTITION BY p.CategoryID) AS AverageStockInCategory
FROM
    products as p
JOIN
    storeinventory as si ON p.ProductID = si.ProductID;
