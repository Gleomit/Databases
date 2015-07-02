SELECT d.Name AS Department, e.JobTitle, AVG(e.Salary) AS [Average Salary] FROM Employees AS e
INNER JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
GROUP BY e.JobTitle, e.DepartmentID, d.Name
ORDER BY e.JobTitle