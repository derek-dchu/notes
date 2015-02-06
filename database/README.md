Normalization & Denormalization
-------------------------------
Normalization is to break the table into small tables to reduce data redundancy and inconsistence. (less store space with lower performance)

Denormalization is to join small tables into big table to increase performance.

* 1NF  
Deals with the 'shape' of a record type. Each row is unique, no repeating fields and each cell is atomic.

* 2NF  
Prevent the dependency between non-key and part of the key attributes (a table with only one key attribute is 2NF).
```
From
---------------------------------------------------
| PART | WAREHOUSE | QUANTITY | WAREHOUSE-ADDRESS |
====================-------------------------------

To
-------------------------------  --------------------------------- 
| PART | WAREHOUSE | QUANTITY |  | WAREHOUSE | WAREHOUSE-ADDRESS |
====================-----------  =============--------------------
```

* 3NF  
Prevent the transitive dependency between non-key attributes.
```
From
EMPLOYEE <=> DEPARTMENT <=> LOCATION
------------------------------------
| EMPLOYEE | DEPARTMENT | LOCATION |
============------------------------

To
-------------------------  -------------------------
| EMPLOYEE | DEPARTMENT |  | DEPARTMENT | LOCATION |
============-------------  ==============-----------
```

> The data depends on the key [1NF], the whole key [2NF] and nothing but the key [3NF]

* BCNF  
Prevent the dependency between key attributes

Key
---
* PK: Primary Key, can not be None.
* UK: Unique Key, can be None.
* CK: Candidate Key, Superset of keys. Each element of CK can be PK, we usually choose the one with less elements within it.

Diagram
-------
E-R diagram: Entity (Rectangle) - Role (Diamond)

BLOB
----
Binary Large Object, a collection of binary data stored as a single entity in DBMS.

CLOB
----
Character Large Object, a collection of character data in DBMS, specified character encoding and string-oriented operations.

SQL
---
DELETE vs TRUNCATE:
* DELETE (DML), TRUNCATE (DDL)
* DELETE can be rolled back, TRUNCATE can not
* DELETE can has conditions, TRUNCATE will delete the whole table