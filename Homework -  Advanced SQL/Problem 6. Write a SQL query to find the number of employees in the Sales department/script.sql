SELECT COUNT(*) AS [Sales Employees Count] FROM Employees AS e
	INNER JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
	WHERE d.Name = 'Sales'