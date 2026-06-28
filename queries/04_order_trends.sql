-- ============================================
-- ORDER TRENDS ANALYSIS
-- Objective: Analyze order patterns over time
-- ============================================
USE northwind;
-- 1. Total orders by year
SELECT YEAR(OrderDate) AS OrderYear, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY OrderYear
ORDER BY OrderYear;


-- 2. Total orders by month
SELECT MONTH(OrderDate) AS OrderMonth, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY OrderMonth
ORDER BY OrderMonth;


-- 3. Monthly revenue analysis
SELECT MONTH(o.OrderDate) AS OrderMonth, 
	ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS MonthlyRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY OrderMonth
ORDER BY MonthlyRevenue DESC;