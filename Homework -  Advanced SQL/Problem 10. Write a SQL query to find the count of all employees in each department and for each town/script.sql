SELECT t.Name, d.Name, COUNT(e.EmployeeID) AS [Employees count] FROM Addresses AS a
	INNER JOIN Towns AS t on t.TownID = a.TownID
	INNER JOIN Employees AS e ON e.AddressID = a.AddressID
	INNER JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
	GROUP BY t.Name, d.Name