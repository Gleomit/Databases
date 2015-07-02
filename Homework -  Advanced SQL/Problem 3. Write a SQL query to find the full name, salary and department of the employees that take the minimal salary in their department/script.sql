SELECT e.FirstName, e.Salary, d.Name AS Department FROM Employees AS e
	INNER JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
	WHERE e.Salary = (SELECT MIN(Salary) FROM Employees
		WHERE DepartmentID = d.DepartmentID) 