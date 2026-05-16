-- ============================================
-- CUSTOMER ANALYSIS
-- Objective: Identify top customers by revenue,
-- order frequency, and geographic distribution
-- ============================================
USE northwind;
-- 1. Total revenue per customer
SELECT 
    c.CustomerID,
    c.CompanyName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalRevenue DESC;


-- 2. Top 10 customers by revenue
SELECT *
FROM (
    SELECT 
        c.CustomerID,
        c.CompanyName,
        ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue,
        RANK() OVER (ORDER BY SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) DESC) AS RevenueRank
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName
) ranked
WHERE RevenueRank <= 10;


-- 3. Customer distribution by country
SELECT 
    Country,
    COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY Country
ORDER BY NumberOfCustomers DESC;