SELECT d.Name AS Department, e.JobTitle, e.FirstName, MIN(e.Salary) AS [Min Salary] FROM Employees AS e
INNER JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID, e.JobTitle, d.Name, e.FirstName
ORDER BY e.DepartmentID