SELECT * FROM Employees AS e
	INNER JOIN Employees AS m  ON e.ManagerID = m.EmployeeID
	INNER JOIN Addresses AS a ON e.AddressID = a.AddressID;