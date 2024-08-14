-- 1
SELECT DishName, SUM(Quantity) AS TotalQuantity
FROM OrderedDish
GROUP BY DishName
ORDER BY TotalQuantity DESC
LIMIT 5;

-- 2
SELECT DAYNAME(SaleDateTime) AS SaleDay, AVG(Amount) AS TotalSales
FROM Receipt
GROUP BY SaleDay
ORDER BY SaleDay;

-- 3
SELECT i.IngredientName, SUM(iu.Quantity) AS TotalUsed
FROM IngredientsUsed iu
JOIN Ingredient i ON iu.IngredientID = i.IngredientID
GROUP BY i.IngredientName
ORDER BY TotalUsed DESC;

-- 4
 WITH StaffSales AS (
    SELECT s.StaffID, s.Name AS StaffName, s.Department, 
           SUM(r.Amount) AS TotalSales
    FROM Receipt r
    JOIN RestaurantOrder o ON r.OrderID = o.OrderID
    JOIN Staff s ON o.StaffID = s.StaffID
    GROUP BY s.StaffID
),
DepartmentSales AS (
SELECT Department, SUM(TotalSales) AS DepartmentTotalSales
    FROM StaffSales
    GROUP BY Department
)
SELECT ss.staffID, ss.StaffName, ss.Department, ss.TotalSales, ds.DepartmentTotalSales,
(ss.TotalSales / ds.DepartmentTotalSales) * 100 AS SalesPercentage
FROM StaffSales ss
JOIN DepartmentSales ds ON ss.Department = ds.Department
ORDER BY SalesPercentage DESC;


-- 5
SELECT HOUR(o.OrderDateTime) AS OrderHour, 
       d.DishName, 
       SUM(od.Quantity) AS TotalQuantity
FROM OrderedDish od
JOIN `RestaurantOrder` o ON od.OrderID = o.OrderID
JOIN Dish d ON od.DishName = d.DishName
GROUP BY OrderHour, d.DishName
HAVING OrderHour >= 10 AND OrderHour <= 22
ORDER BY OrderHour, TotalQuantity DESC;  

-- 6
SELECT C.CustomerID, C.Name AS CustomerName,
       MAX(O.OrderDatetime) AS LastOrderDate
FROM Customer C
LEFT JOIN RestaurantOrder O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
HAVING MAX(O.OrderDatetime) < CURDATE() - INTERVAL 7 DAY
ORDER BY LastOrderDate;

-- 7
SELECT c.CustomerID, c.Name,
       CASE 
           WHEN TotalSpent > 500 AND TotalOrders > 10 THEN 'High Value Frequent'
           WHEN TotalSpent > 500 THEN 'High Value'
           WHEN TotalOrders > 10 THEN 'Frequent'
           ELSE 'Occasional'
       END AS CustomerSegment
FROM Customer c JOIN (
    SELECT CustomerID, 
           SUM(r.Amount) AS TotalSpent, 
           COUNT(o.OrderID) AS TotalOrders
    FROM Receipt r
    JOIN RestaurantOrder o ON r.OrderID = o.OrderID
    GROUP BY CustomerID
) AS CustomerSummary ON c.CustomerID = CustomerSummary.CustomerID;

-- 8
SELECT s.StaffID, 
       s.Name AS StaffName, 
       COUNT(o.OrderID) AS OrdersHandled,
       DENSE_RANK() OVER (ORDER BY COUNT(o.OrderID) DESC) AS StaffRank
FROM RestaurantOrder o
JOIN Staff s ON o.StaffID = s.StaffID
GROUP BY s.StaffID, s.Name
ORDER BY OrdersHandled DESC;
