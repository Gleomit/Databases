USE SoftUni;

DECLARE @FirstEmployeesCursor AS CURSOR;

DECLARE @FirstEmployeeID INT
DECLARE @FirstEmployeeFirstName NVARCHAR(70)
DECLARE @FirstEmployeeLastName NVARCHAR(70)
DECLARE @FirstEmployeeTownName NVARCHAR(70)

SET @FirstEmployeesCursor = CURSOR FOR
SELECT e.EmployeeID, e.FirstName, e.LastName, t.Name FROM Employees AS e
INNER JOIN Addresses AS a ON a.AddressID = e.AddressID
INNER JOIN Towns AS t ON t.TownID = a.TownID

OPEN @FirstEmployeesCursor

FETCH NEXT FROM @FirstEmployeesCursor INTO @FirstEmployeeID, @FirstEmployeeFirstName, 
											   @FirstEmployeeLastName,
											   @FirstEmployeeTownName

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @SecondEmployeesCursor AS CURSOR;

	DECLARE @SecondEmployeeID INT
	DECLARE @SecondEmployeeFirstName NVARCHAR(70)
	DECLARE @SecondEmployeeLastName NVARCHAR(70)
	DECLARE @SecondEmployeeTownName NVARCHAR(70)

	SET @SecondEmployeesCursor = CURSOR FOR
	SELECT e.EmployeeID, e.FirstName, e.LastName, t.Name FROM Employees AS e
	INNER JOIN Addresses AS a ON a.AddressID = e.AddressID
	INNER JOIN Towns AS t ON t.TownID = a.TownID

	OPEN @SecondEmployeesCursor

	FETCH NEXT FROM @SecondEmployeesCursor INTO @SecondEmployeeID, @SecondEmployeeFirstName, 
												@SecondEmployeeLastName,
												@SecondEmployeeTownName
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		IF @FirstEmployeeID != @SecondEmployeeID AND @FirstEmployeeTownName = @SecondEmployeeTownName
		BEGIN
			PRINT @FirstEmployeeFirstName + ' ' +  @FirstEmployeeLastName
			 + ' - ' + @FirstEmployeeTownName + ' - ' + @SecondEmployeeFirstName + ' ' +  @SecondEmployeeLastName
		END

		FETCH NEXT FROM @SecondEmployeesCursor INTO @SecondEmployeeID, @SecondEmployeeFirstName, 
												@SecondEmployeeLastName,
												@SecondEmployeeTownName
	END

	CLOSE @SecondEmployeesCursor

	DEALLOCATE @SecondEmployeesCursor

	FETCH NEXT FROM @FirstEmployeesCursor INTO @FirstEmployeeID, @FirstEmployeeFirstName, 
											   @FirstEmployeeLastName,
											   @FirstEmployeeTownName
END

CLOSE @FirstEmployeesCursor

DEALLOCATE @FirstEmployeesCursor