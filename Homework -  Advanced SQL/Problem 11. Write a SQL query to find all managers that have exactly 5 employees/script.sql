SELECT m.FirstName, m.LastName FROM Employees AS m
	INNER JOIN Employees AS e ON e.ManagerID = m.EmployeeID
	GROUP BY m.FirstName, m.LastName
	HAVING COUNT(*) = 5