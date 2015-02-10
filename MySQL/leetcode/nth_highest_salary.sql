DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
	id 		INT	PRIMARY KEY,
	salary	INT
);

INSERT INTO employee VALUES(1, 100), (2, 100), (3, 200), (4, 200), (5, 300);

-- Find the nth highest salary. If there is no nth
-- highest salary, return null.

-- Find the second highest salary and union all with null.
DROP FUNCTION IF EXISTS getNthHightestSalary;

DELIMITER $$
CREATE FUNCTION getNthHightestSalary(N INT) RETURNS INT
BEGIN
	RETURN (	
		SELECT		e1.salary
		FROM		employee e1
		WHERE		N = (SELECT count(DISTINCT(e2.salary))
						FROM employee e2
						WHERE e2.salary >= e1.salary)
		UNION ALL
		SELECT NULL
		LIMIT 1
	);
END$$
DELIMITER ;

-- 300
SELECT getNthHightestSalary(1) NthHightestSalary;
-- 200
SELECT getNthHightestSalary(2) NthHightestSalary;
-- 100
SELECT getNthHightestSalary(3) NthHightestSalary;
-- null
SELECT getNthHightestSalary(4) NthHightestSalary;
