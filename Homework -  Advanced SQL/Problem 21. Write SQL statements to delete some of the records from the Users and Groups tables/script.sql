DELETE u FROM Users u
INNER JOIN Groups ON Groups.id = u.GroupID
WHERE Name LIKE '%Changed%'

DELETE FROM Groups
WHERE Name LIKE '%Changed%'