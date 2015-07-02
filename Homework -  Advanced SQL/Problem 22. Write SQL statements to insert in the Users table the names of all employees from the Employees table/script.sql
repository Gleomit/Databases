INSERT INTO Users(
	Username,
	Password,
	FullName,
	LastLogin,
	GroupID
	)
SELECT (SUBSTRING(FirstName, 1, 1) + LOWER(LastName)),
  (SUBSTRING(FirstName, 1, 1) + LOWER(LastName)),
  (FirstName + LastName),
  NULL,
  (SELECT FLOOR(RAND() * ((SELECT COUNT(*) FROM Groups) - 1) + 1)) FROM Employees