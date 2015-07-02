SELECT AVG(Salary) AS [Average Salary for Sales Department] FROM Employees AS e
	INNER JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
	WHERE d.Name = 'Sales'