DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS address;


CREATE TABLE person (
	person_id	INT 		PRIMARY KEY,
	first_name	VARCHAR(10),
	last_name	VARCHAR(10)
);

CREATE TABLE address (
	address_id	INT 		PRIMARY KEY,
	person_id	INT,
	city		VARCHAR(20),
	state		VARCHAR(2)
);

INSERT INTO person VALUES(1, 'John', 'A'), (2, 'Tom', 'B');
INSERT INTO address VALUES(1, 1, 'New York City', 'NY');

-- Find people with address
SELECT  first_name, last_name, city, state
FROM    person LEFT OUTER JOIN address
ON      person.person_id = address.person_id;


DROP TABLE person;
DROP TABLE address;