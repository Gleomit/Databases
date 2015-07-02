CREATE TABLE WorkHours(
	Id INT NOT NULL IDENTITY,
	EmployeeID INT NOT NULL,
	Date DATETIME NOT NULL,
	Hours FLOAT NOT NULL,
	Task NVARCHAR(512) NOT NULL,
	Comments NVARCHAR(512) NOT NULL,
	CONSTRAINT pk_WorkHoursID PRIMARY KEY (Id),
	CONSTRAINT fk_EmployeeWorkHours FOREIGN KEY (EmployeeID)
	REFERENCES Employees(EmployeeID)
)