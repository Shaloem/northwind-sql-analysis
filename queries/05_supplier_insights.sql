-- ============================================
-- SUPPLIER INSIGHTS
-- Objective: Analyze supplier contribution
-- and product distribution
-- ============================================

-- 1. Number of products supplied by each supplier
SELECT s.SupplierID, s.CompanyName, COUNT(p.ProductID) AS NumberOfProducts
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY NumberOfProducts DESC;


-- 2. Total units sold by supplier
SELECT s.CompanyName, SUM(od.Quantity) AS TotalUnitsSold
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY s.CompanyName
ORDER BY TotalUnitsSold DESC;


-- 3. Supplier products and categories
SELECT s.CompanyName, c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY s.CompanyName, c.CategoryName
ORDER BY ProductCount DESC;