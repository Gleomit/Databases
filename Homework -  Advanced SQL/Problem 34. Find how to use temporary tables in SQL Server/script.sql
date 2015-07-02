CREATE TABLE #Temporary
(
	EmployeeID INT,
	ProjectID INT
)

INSERT INTO #Temporary(EmployeeID, ProjectID)
SELECT EmployeeID, ProjectID FROM EmployeesProjects

DROP TABLE EmployeesProjects

CREATE TABLE EmployeesProjects
(
	EmployeeID INT,
	ProjectID INT,
	CONSTRAINT FK_EmployeesProjects_Employees FOREIGN KEY(EmployeeID)
	REFERENCES Employees(EmployeeID),
	CONSTRAINT FK_EmployeesProjects_Projects FOREIGN KEY(ProjectID)
	REFERENCES Projects(ProjectID)
)

INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
SELECT EmployeeID, ProjectID FROM #Temporary

DROP TABLE #Temporary