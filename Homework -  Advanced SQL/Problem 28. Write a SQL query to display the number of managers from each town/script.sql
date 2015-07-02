SELECT t.Name, COUNT(m.EmployeeID) 
FROM (SELECT EmployeeID, AddressID FROM Employees AS e
INNER JOIN (SELECT ManagerID FROM Employees GROUP BY ManagerID) AS temp ON temp.ManagerID = e.EmployeeID) m
INNER JOIN Addresses AS a ON m.AddressID = a.AddressID
INNER JOIN Towns AS t ON t.TownID = a.TownID
GROUP BY t.Name