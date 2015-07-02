/* INSERT QUERY */

INSERT INTO WorkHours (
	EmployeeID,
	Date,
	Hours,
	Task,
	Comments
	)
VALUES (
	3,
	GETDATE(),
	4,
	'Repair something',
	'No comments'
	)


/* UPDATE QUERY */

UPDATE WorkHours
SET Comments = 'Finished'
WHERE Task = 'Repair something'


/* DELETE QUERY */

DELETE FROM WorkHours
WHERE Comments = 'Finished'