CREATE TABLE Users(
	Id INT IDENTITY,
	Username nvarchar(30) NOT NULL,
	Password nvarchar(30) NOT NULL,
	FullName nvarchar(100) NOT NULL,
	LastLogin DATETIME,
	PRIMARY KEY(Id),
	CONSTRAINT uc_Username UNIQUE (Username),
	CONSTRAINT check_UsersPassword CHECK (LEN(Password) >= 5)
)