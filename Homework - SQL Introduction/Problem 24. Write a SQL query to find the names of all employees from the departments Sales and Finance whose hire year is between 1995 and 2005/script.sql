SELECT FirstName, MiddleName, LastName FROM Employees AS e
	INNER JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
	WHERE d.Name = 'Sales' OR d.Name = 'Finance' 
	AND e.HireDate BETWEEN 1995 AND 2005