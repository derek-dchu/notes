DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
	id 		INT	PRIMARY KEY,
	salary	INT
);

INSERT INTO employee VALUES(1, 100), (2, 100), (3, 200), (4, 200), (5, 300);

-- Find the second highest salary. If there is no
-- second highest salary, return null.

-- Find the second highest salary and union all with null
SELECT	max(e1.salary) SecondHighestSalary
FROM	employee e1
WHERE	e1.salary <>
					(SELECT 	max(salary)
					FROM		employee)
UNION ALL
SELECT NULL
LIMIT 1;

DROP TABLE employee;