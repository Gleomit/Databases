SELECT COUNT(*) AS [Employees without manager] FROM Employees
	WHERE ISNULL(ManagerID, -1) = -1