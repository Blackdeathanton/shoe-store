SELECT COUNT(Orders.OrderID) AS "Count of Orders by Speedy Express"
FROM Orders 
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
WHERE Shippers.ShipperName="Speedy Express"

   ----------------------------------
--|Count of Orders by Speedy Express |
   ----------------------------------
--|               54                 |
   ----------------------------------


SELECT LastName AS "Last Name"
FROM (SELECT MAX(OrderCount), LastName 
      FROM (SELECT COUNT(Orders.OrderID) AS OrderCount, Employees.LastName
            FROM Orders
            JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
            GROUP BY Employees.EmployeeID))

   ----------------------------------
--|             Last Name             |
   ----------------------------------
--|               Peacock            |
   ----------------------------------

SELECT ProductName as "Product Name"
FROM (SELECT MAX(Quantity), ProductName 
      FROM (SELECT SUM(Quantity) as Quantity, Products.ProductName
            FROM Orders
            JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
            JOIN Products ON OrderDetails.ProductID = Products.ProductID
            WHERE CustomerID IN (SELECT CustomerID 
                                 FROM Customers
                                 WHERE Country='Germany')
            GROUP BY Products.ProductID))

   ----------------------------------
--|           Product Name           |
   ----------------------------------
--|         Boston Crab Meat         |
   ----------------------------------