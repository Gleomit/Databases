*/ RIGHT OUTER JOIN */
SELECT * FROM Employees AS e
	RIGHT OUTER JOIN Employees AS m ON e.ManagerID = m.EmployeeID

*/ LEFT OUTER JOIN */
SELECT * FROM Employees AS e
	LEFT OUTER JOIN Employees AS m ON m.EmployeeID = e.ManagerID