BEGIN TRANSACTION

ALTER TABLE Departments DROP CONSTRAINT FK_Departments_Employees
ALTER TABLE Departments ADD CONSTRAINT FK_Departments_Employees FOREIGN KEY (ManagerID) 
REFERENCES Employees(EmployeeID) ON DELETE CASCADE

DELETE e FROM Employees e
INNER JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'

ROLLBACK TRANSACTION