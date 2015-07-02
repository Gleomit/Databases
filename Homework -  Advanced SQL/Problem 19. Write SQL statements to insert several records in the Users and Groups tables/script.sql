DECLARE @UsersCount INT = 6
DECLARE @GroupsCount INT = 3

DECLARE @CurrentUserCounter INT = @UsersCount
DECLARE @CurrentGroupCounter INT = @GroupsCount

WHILE @CurrentGroupCounter > 0
BEGIN
	INSERT INTO Groups(Name)
	VALUES (
		'Group' + CONVERT(varchar, @GroupsCount - @CurrentGroupCounter)
	)

	SET @CurrentGroupCounter = @CurrentGroupCounter - 1
END

WHILE @CurrentUserCounter > 0
BEGIN
	INSERT INTO Users(
		Username,
		Password,
		FullName,
		LastLogin,
		GroupID
	)
	VALUES (
		'User' + CONVERT(varchar, @UsersCount - @CurrentUserCounter),
		'passwordForUser' + CONVERT(varchar, @UsersCount - @CurrentUserCounter),
		'UserFullName' + CONVERT(varchar, @UsersCount - @CurrentUserCounter),
		(SELECT DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 3650) * -1, GETDATE())),
		(SELECT FLOOR(RAND() * (@GroupsCount - 1) + 1))
	)

	SET @CurrentUserCounter = @CurrentUserCounter - 1
END