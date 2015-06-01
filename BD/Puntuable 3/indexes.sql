/*
Indexes are special lookup tables that the database search engine can use to speed up data retrieval. Simply put, an index is a pointer to data in a table. An index in a database is very similar to an index in the back of a book.

For example, if you want to reference all pages in a book that discuss a certain topic, you first refer to the index, which lists all topics alphabetically and are then referred to one or more specific page numbers.

An index helps speed up SELECT queries and WHERE clauses, but it slows down data input, with UPDATE and INSERT statements. Indexes can be created or dropped with no effect on the data.

Creating an index involves the CREATE INDEX statement, which allows you to name the index, to specify the table and which column or columns to index, and to indicate whether the index is in ascending or descending order.

Indexes can also be unique, similar to the UNIQUE constraint, in that the index prevents duplicate entries in the column or combination of columns on which there's an index.
*/

-- This is the file to create COMPANY table and to populate it with 7 records.
-- Just copy and past them on sqlite> prompt.
DROP TABLE COMPANY;
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Paul', 32, 'California', 20000.00 );

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Allen', 25, 'Texas', 15000.00 );

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'Teddy', 23, 'Norway', 20000.00 );

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Mark', 25, 'Rich-Mond ', 65000.00 );

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'David', 27, 'Texas', 85000.00 );

INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Kim', 22, 'South-Hall', 45000.00 );

INSERT INTO COMPANY VALUES (7, 'James', 24, 'Houston', 10000.00 );

CREATE INDEX salary_index ON COMPANY (salary);

/* comprovacio indexos sobre taules 
.indices COMPANY
salary_index
sqlite_autoindex_COMPANY_1
*/

/* comprovacio indexos en BD
sqlite> SELECT * FROM sqlite_master WHERE type = 'index';
*/

/* eliminacio indexos */
DROP INDEX salary_index;
/*
When should indexes be avoided?

Although indexes are intended to enhance a database's performance, there are times when they should be avoided. The following guidelines indicate when the use of an index should be reconsidered:

    Indexes should not be used on small tables.

    Tables that have frequent, large batch update or insert operations.

    Indexes should not be used on columns that contain a high number of NULL values.

    Columns that are frequently manipulated should not be indexed.
*/

/* indexs compostos */
CREATE INDEX index_name
on table_name (column1, column2);

/* implicit indexes
Indexes are automatically created for primary key constraints and unique constraints.
*/

/* UNIQUE indexes */
CREATE UNIQUE INDEX customer_unique_idx
  ON customers (file_number);
/* This example would create a unique index on the file_number field so that this field must always contains a unique value with no duplicates. This is a great way to enforce integrity within your database if you require unique values in columns that are not part of your primary key. */

/* Partial index */
CREATE INDEX customer_idx
  ON customers (last_name)
  WHERE last_name IS NOT NULL;
/* Because we have included a WHERE clause, a partial index is created on only those created where the last_name is not NULL. Records where the last_name is a NULL value will not be included in the index */

