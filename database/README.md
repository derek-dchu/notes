## Normalization & Denormalization
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


## Key
* PK: Primary Key, can not be None.
* UK: Unique Key, can be None.
* CK: Candidate Key, Superset of keys. Each element of CK can be PK, we usually choose the one with less elements within it.


## Diagram
E-R diagram: Entity (Rectangle) - Role (Diamond)


## BLOB
Binary Large Object, a collection of binary data stored as a single entity in DBMS.


## CLOB
Character Large Object, a collection of character data in DBMS, specified character encoding and string-oriented operations.


## SQL
DELETE vs TRUNCATE:
* DELETE (DML), TRUNCATE (DDL)
* DELETE can be rolled back, TRUNCATE can not
* DELETE can has conditions, TRUNCATE will delete the whole table


## JOINs
* Without constraint, join with non-key field:  

| number of result | A join B | A left outer join B | A right outer join B | full outer join |  
|------------------|----------|---------------------|----------------------|-----------------|  
| max | m * n | m + n - 1<br>(B all match) | m + n - 1<br>(A has all match) | m + n - 1 |  
| min | 0 | m<br>(B has no match) | n<br>(A has no match) | m + n -1 |  

* A has PK, B is FK of A (right outer join is inner join), join using B.FK:  

| number of result | A join B | A left outer join B | A right outer join B | full outer join |  
|------------------|----------|---------------------|----------------------|-----------------|  
| max | n | m + n - 1 | n | m + n - 1 |  
| min | n | m + n - 1 | n | m + n - 1 |  

* PL/SQL vs T-SQL  

|                  | PL/SQL                                                   | T-SQL                                                  |  
|------------------|----------------------------------------------------------|--------------------------------------------------------|  
| Left outer join  | SELECT * <br>FROM emp e, dept d <br>WHERE e.deptno = d.deptno(+) | SELECT * <br>FROM emp e, dept d <br>WHERE e.deptno *= d.deptno |  
| Right outer join | SELECT * <br>FROM emp e, dept d <br>WHERE e.deptno(+) = d.deptno | SELECT * <br>FROM emp e, dept d <br>WHERE e.deptno =* d.deptno |  

* note: full outer join can be obtained by union the result of left outer join and the result of right outer join, but only keep one copy of records that exists in the both results.

```sql
SELECT 	*
FROM    a LEFT OUTER JOIN b
ON      a.field = b.field
UNION ALL
SELECT  *
FROM 	a RIGHT OUTER JOIN b
ON 		a.field = b.field
WHERE   a.id IS NULL;
```


## Multiple-row comparison operators
IN, ANY, ALL

* x > ANY list <=> x > min(list)
* x > ALL list <=> x > max(list)
* x < ANY list <=> x < max(list)
* x < ALL list <=> x < min(list)
* x IN list <=> x = ANY list


## Many-to-many <=> one-to-many or many-to-one
enable/disable unique constraint to one of two foreign keys in junction table.


## UNION vs UNION ALL
### UNION
Combine the result-set of two of more SELECT statements. Each SELECT statement must have the same number of columns with similar data types. UNION selects only DISTINCT values.

### UNION ALL
Same as UNION, but it allows duplicate values.
