SELECT COUNT(*) AS [Employees with manager] FROM Employees
	WHERE ISNULL(ManagerID, -1) != -1