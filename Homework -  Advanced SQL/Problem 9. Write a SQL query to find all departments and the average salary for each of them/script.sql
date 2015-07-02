SELECT d.Name, AVG(e.Salary) AS [Average Salary] FROM Departments AS d
	INNER JOIN Employees AS e ON e.DepartmentID = d.DepartmentID
	GROUP BY e.DepartmentID, d.Name
	ORDER BY d.Name