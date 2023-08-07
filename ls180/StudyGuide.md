# SQL
### **Types of JOINs**
* **INNER JOIN** - The join table will contain rows from both tables where the join condition (based on the ON clause) was met. This is the default type of join used when the keyword JOIN is used on its own.
* **LEFT OUTER JOIN** - The join table will contain all rows and data from the left table. On rows where the join condition wasnt met, the data from the right table will be given null values.
* **RIGHT OUTER JOIN** - Same as left outer join but backwards. The join table contains all rows and data from the right table. On rows where the join condition wasnt met, the data from the left table will be given null values.
* **FULL OUTER JOIN** - Contains all rows from both the left and right tables. On rows where the join condition wasnt met, data from the other table will be given null values.
* **CROSS JOIN** Contains each row from the left table joined with every row in the right table. Does not need a join condition.

### **Sublanguages**

* **Data Definition Language (DDL)** - Related to the creation/alteration of database structure (schema). Statements include keywords CREATE/ALTER/DROP.
* **Data Manipulation Language (DML)** - Related to the the retrieval/modification of stored data. Statements include keywords SELECT/INSERT/UPDATE/DELETE.
* **Data Control Language (DCL)** - Related to controlling user access and rights within a database/table. Statements include keywords GRANT/REVOKE.

### **SQL Statements**

```sql
-----Create Table-----
CREATE TABLE 'table_name'(
  'col1_name' 'col1_type' 'col1_constraints',
  'col2_name' 'col2_type' 'col2_constraints',

  'constraints'
);

-----Rename/Drop Table-----
ALTER TABLE 'table_name'
  RENAME TO 'new_name'
  DROP TABLE 'table_name';

-----Add/Rename/Dop Column-----
ALTER TABLE 'table_name'
  ADD COLUMN 'name' 'type' 'constraints'
  RENAME COLUMN 'column_name' TO 'new_name'
  DROP COLUMN 'col_name';

-----Alter Column type-----
ALTER TABLE 'table_name'
  ALTER COLUMN 'column_name' TYPE 'type';

-----Adding/Dropping UNIQUE constraint-----
ALTER TABLE 'table_name'
  ADD UNIQUE ('col_name') --Without a name (auto generated)
  ADD CONSTRAINT 'constraint_name' UNIQUE ('col_name') --With a name
  DROP CONSTRAINT 'constraint_name'


  ADD CONSTRAINT 'constraint_name' UNIQUE ('col1', 'col2'); --Adds UNIQUE on a group of columns, the combination of the values in those columns needs to be unique in the table. OR...
  ADD UNIQUE ('col1', 'col2')


-----Adding/Dropping NOT NULL, DEFAULT constraints-----
ALTER TABLE 'table_name'
  ALTER COLUMN 'column_name'
  SET NOT NULL / DROP NOT NULL
  SET DEFAULT 'value' / DROP DEFAULT;

-----Adding CHECK constraint-----
CREATE TABLE 'table_name'( --When creating a table
  'col1_name' 'col1_type' CONSTRAINT 'con_name' CHECK('condition') --With constraint name
  'col2_name' 'col2_type' CHECK('condition') --Without constraint name

  CHECK('condition') --Can also be added after column definitions.
);

ALTER TABLE 'table_name' --When adding to existing table
  ADD CONSTRAINT 'constraint_name' CHECK('condition') --OR
  ADD CHECK('condition') --Without constraint name

-----Adding PRIMARY key-----
CREATE TABLE 'table_name'( --When creating table
  id serial PRIMARY KEY
);

ALTER TABLE 'table_name' --To existing table
  ADD PRIMARY KEY ('col_name');

-----Adding FOREIGN key-----
CREATE TABLE 'table_name'( --On table creation
  'col_name' 'col_type' REFERENCES 'table_name'('table_column') ON DELETE 'action' --ON DELETE determines what happens when the primary key is deleted/updated in the parent table.

  FOREIGN KEY ('col_name') --Can also be added after column definitions
    REFERENCES 'table_name'('table_column') ON DELETE CASCADE

  --Prepend the above with:
  CONSTRAINT 'constraint_name' --If you want to name the constraint.
);

ALTER TABLE 'table_name' --To existing table
  ADD CONSTRAINT 'constraint_name' FOREIGN KEY ('col_name') --With constraint name
  REFERENCES 'table_name'('table_column') ON DELETE 'action'

  ADD FOREIGN KEY ('col_name') --Without constraint name (will be auto generated).
  REFERENCES 'table_name'('table_column');

-----Inserting Data-----
INSERT INTO 'table_name' ('col1_name', 'col2_name')
  VALUES ('col1_data', 'col2_data');

-----Updating Data-----
UPDATE 'table_name'
  SET 'col_name' = 'value'
  WHERE 'condition'; --Not using a where clause will update ALL rows in the column.

-----Deleting Data-----
DELETE FROM 'table_name'
  WHERE 'condition' --Not using a where clause will delete ALL rows from the table.
```

### **ORDER BY / GROUP BY / WHERE / HAVING**

* **ORDER BY** - Sorts in Ascending order by default. Use DESC to sort in descending order. Results can be ordered by more than one column. The second specified column further sorts rows that have the same values after the first column is sorted.
* **GROUP BY** - All columns being selected must be part of the GROUP BY clause, the result of an aggregate function, or the GROUP BY clause must be based on the primary key.
* **HAVING** - Used to filter aggregated data or data that has been grouped by GROUP BY. It does not apply to individual rows like WHERE does.

### **Subqueries**

A subquery is a nested SELECT query. Meaning the result of one SELECT query is used as a condition in another SELECT query.

Using `=` in a WHERE condition in a subquery statement only works if the subquery returns a single value.

```sql
--Example:
SELECT title FROM books WHERE author_id =
  (SELECT id FROM authors WHERE name = 'William Gibson'); --Returns a single id value.
```
**EXISTS** - checks if any rows at all are returned by the subquery. Returns True if one row is returned, otherwise False.
```sql
SELECT * FROM TABLE WHERE EXISTS (SELECT * FROM TABLE WHERE id = 1); --Outer select statement returns all rows from table if subquery is true.
```
**IN** - checks if a value is included IN the result of the subquery. Returns True if that value is found, otherwise False.
```sql
SELECT * FROM TABLE WHERE id IN (SELECT id FROM TABLE WHERE title = 'test');
--Outer select statement returns all rows from table if id is included in the results of the subquery.
```
**NOT IN** - The opposite of IN. The result of NOT IN is true if the value is NOT found in the subquery.


**ANY / SOME** used with an operator (`=`, `>`, `<`). The result of ANY/SOME is True if ANY result returns true when the expression left of the operator is evaluated against the result of the subquery.
```sql
SELECT name FROM authors WHERE id > ANY (SELECT length(name) FROM books);
```

**ALL** also used with an operator. The result of ALL is True if ALL the results return true when the expression left of the operator is evaluated against the result of the subquery.

# PostgreSQL

### **Sequences**

A Sequence is a relation that generates a series of numbers in a predetermined sequence. When the sequence is passed to the `nextval` function, the next number in the sequence is returned. Setting a column's default value to nextval('sequence') will generate the next number in the sequence every time a new row of data is added, making it ideal for use as a surrogate key. Note: Any time nextval is used, the next number in the sequence will be generated regardless of whether or not the value was stored in a row.

```sql
CREATE SEQUENCE 'sequence_name'
  INCREMENT BY 'value'
  STRART WITH 'value';

DROP SEQUENCE 'sequence_name';
```

### **Keys**
* **Primary Key** - Acts as a unique identifier for table rows. A primary key is equivalent to a column having NOT NULL and UNIQUE constraints. A table can only have one primary key (commonly defined as 'id').
* **Foreign Key** - Creates a relationship between two tables by using a foreign key in one table to reference the primary key in another. Values in a foreign key column must reference an existing value in the primary key column it references. Note: always use NOT NULL and ON DELETE CASCADE with foreign keys in join tables.
* **Natural Key** - An existing value that acts as a unique identifier for table rows. Natural keys do not make good unique identifiers because the fact that they are an existing value means that they are being used to store some other kind of data, which may be subject to duplication or change.
* **Surrogate Key** - This is a unique identifier for table rows that was created specifically for that purpose. An auto-incrementing integer is the preferred surrogate key because it guarantees that no two rows will have the same identifier. The surrogate key is commonly defined as "id".

# Database Diagrams

### **Schema Levels**
* **Conceptual** - Focuses on high level abstract thinking about data and relationships. Entity Relationship Diagrams (ERD) models entities and the relationships between them using crows foot notation. (1-1, 1-many, many-many).
* **Logical** - Somewhere between conceptual and physical, may contain a list of attributes and data types but not actually show how they will be implemented.
* **Physical** - Focuses on the actual  database implementation details of the conceptual model, including data types, attributes, and relationships.

### **Cardinality, Modality**

Cadinality is the number of objects on each side of a relationship and modality indicates if that relationship is required (1) or optional (0).

### **Relationships**
* **One-To-One** - Exists when one record in a table is associated with one record in another table. If the foreign key column in a table is also the primary key (or has a UNIQUE constraint), it can't reference the same value more than once from the table it's referencing.

  For example: Table 1 is a list of people with a primary key id column, and table 2 is a list of addresses with a foreign key column (with a unique constraint) that references the id column in table 1. This means that one address can only ever be associated with 1 person id from the first table.
* **One-To-Many** - Exists when one record in a table can be associated with multiple records in another table. If the foreign key column in one table doesn't have a UNIQUE constraint, it is able to reference the same primary key value multiple times from the table it references.

  Building on the previous example: Without the UNIQUE constraint on the foreign key column in the addresses table, multiple addresses can reference the same person id from the people table.

* **Many-To-Many** - Exists when two one-to-many relationships are linked together through the use of a third table known as a join table. The join table has 2 foreign keys that each reference the primary keys of the other two tables.