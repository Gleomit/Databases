SELECT TOP 1 Name, eCount AS [Number of employees] 
FROM (SELECT t.Name, COUNT(e.EmployeeID) AS eCount FROM Employees AS e
INNER JOIN Addresses AS a ON e.AddressID = a.AddressID
INNER JOIN Towns AS t ON t.TownID = a.TownID
GROUP BY t.TownID, t.Name) temp
ORDER BY eCount DESC
