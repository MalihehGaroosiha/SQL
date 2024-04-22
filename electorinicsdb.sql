--Retrieve all products with their corresponding category names and supplier names
SHOW DATABASES;
USE electronicsdb;
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
    
--Retrieve the names of all products with the same supplier as ’Alpha Smartphone’.
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

--Retrieve all products that are either in the ’Smartphones’ category (CategoryID 31) or supplied by SupplierID 50.
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

--Find the total quantity in stock for each product.
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
    
--Calculate the average stock quantity for each product category and list the categories with an average stock above 70.
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
    
--Which products in the ’Cameras’ category are supplied by at least one supplier?
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
    
--Find products with a total quantity in stock higher than the average stock quantity of all products in their respective category.
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
