# Databases

A **database** can be described as a structured set of data.

Spreadsheets can be used as a way to store data, often with identifying
column names. Most spreadsheets use more than one worksheet to organize data,
with each one storing data in a unique column. These different worksheets can
be thought of as tables within a database (with the spreadsheet being the
database). Tables contain rows and columns with each row containing all the
data about one individual and each column containing a particular type of data
about that individual.

Basically rows represent a set of related data (such as info about an individual),
and columns represent a particular attribute of that data.

A **relational database** is a database that is organized based on the relational
model which describes the relationships between a set of **relations** (
individual data entries) that determines
how the stored data can be interacted with. This allows us to describe data
in more detail which will reduce duplicated data.

**Relational database management system (RDBMS)** is an application that is used
to manage relational databases by allowing commands to be issued by a user to
interact with the database. Examples of RDBMSs include PostgreSQL and MySQL which
use the SQL language.

Note: some database software isnt based on the relational model (ex: MongoDB)
and use a document-oriented model to store data. These are often referred
to using the term 'NoSQL'.

# Structured Query Language (SQL)

**SQL** is the language used to communicate with relational databases. It is
different than other languages in the sense that it is *declarative* meaning
you write **SQL statements** (SQL commands) that describe what needs to be done instead of how to do it. **SQL query** is a way to search for data in a database.

Client-server is an architecture design for interacting with databases where a request or declaration is made and a response is received. This seems similar to the HTTP
response cycle.

Client applications are used to interact with PostgreSQL by issuing
CLI commands. Some client applications are wrapped around SQL commands.
Example: `createdb` is a wrapper around SQL command `CREATE DATABASE`. `psql`
is a client application, an interactive PostgreSQL console that allows you to
write queries in SQL syntax to a PostgreSQL database. psql is like a REPL. Only
SQL syntax needs to end with `;`.

SQL statements always end with a semi-colon. Statements can be written over multiple
lines. `SELECT` statement retreives data from a database.

**SQL Sub-languages**

There are 3 separate sub languages that handle a specific aspect of database
interaction.

* **DDL:Data Definition Language** defines the tables and columns that make up the
  structure of the database. (schema)
* **DML:Data Manipulation Language** retreives or modifies stored data. SELECT
  queries are part of this sub language.
* **DCL:Data Control Language** determines who/how users can interact with the database. "security settings" (parts of the schema).

**Data vs Schema**

Schema describes the structure of the database. The structure is made up of things
like the names of tables, columns, and rows, Data types/constraints of columns, etc.

Data is the content of a database. It is the values within specific rows and columns
in a database.

Schema without data would be nothing more than empty tables, and data without schema
would be an unstructured mess of data with no organization.

When Data and Schema are combined, we get structured data that we can interact with
in various ways.

The syntax for interacting with schema (such as creating, updating, or deleting) is
different than the syntax used for interacting with data. This goes back to the
three SQL sub-languages. DDL is used for schema and DML is used for data.

# Useful commands

Steps to starting PSQL and creating a database:
* `sudo service postgresql status` - checks database status
* `sudo service postgresql start` - start running a database
* `sudo service postgresql stop` - stop running a database
* `sudo -u postgres psql` - opens the psql shell
* `psql -d "name"` - opens psql shell and connects to the specified database
* `createdb "name"` - creates a database (SQL syntax - CREATE DATABASE "name";)
* `dropdb "name"` - deletes a database (SQL syntax - DROP DATABASE "name";)
  Note: disconnect from a database before deleting it.
  Note: createdb and dropdb are wrapper functions for the SQL syntax in parentheses.
* `CREATE TABLE "name"();` - creates a table(sometimes called a relation)
  Note: in between the () are the names of the columns, separated by commas.
  (generally written on separate lines).

```
CREATE TABLE table_name (
    column_1_name column_1_data_type [constraints, ...],
    column_2_name column_2_data_type [constraints, ...],
    .
    .
    .
    constraints
);
```
Column names and data types are required, constraints are optional. Contraints
can be defined at the column OR table level.


Useful psql console commands (aka meta-commands):
* `\q` - exits the psql console
* `\l or \list` - lists all databases
* `\c "name" or \connect "name"` - changes to a different database (can also take arguments like username, host, port, etc. These can be omitted if connecting to local database)
* `\dt` - views database tables
* `\d "name"` - views the table specified by name

# **Data types**

Data type determines what kind of data is allowed to be in a certain column of
a table (relation). Some common data types:
* serial - data type used to create identifier columns, they are integers and auto
  incrementing.
* char(N) - information stored in this column can be strings up to N chars in length.
  If the string length is less than N, the rest of the string length will be filled with spaces.
* varchar(N) - same as char(N) but if the string length is less than N, the remaining
  length isnt used.
* boolean - can only contain "true" or "false" (often displayed as t or f).
* integer/INT - a whole number (positive or negative)
* decimal(precision,scale) - takes two arguments. Precision is the total number of    digits on both sides of the decimal. The scale is the number of digits in the
fractional part of the number (to the right of the decimal).
* timestamp - simple data and time in YYYY-MM-DD HH:MM:SS format.
* date - date in YYYY-MM-DD format.

**Keys and Contraints** are rules that determine what data VALUES are allowed
to be in certain columns. Defining keys and constraints falls under the database
schema and ensure the integrity and quality of data within the database.
Contraints can apply to columns, entire tables, or the entire schema.

Some constraints:
* UNIQUE - prevents duplicate values in the column.
* NOT NULL - prevents a column from being left empty.
* DEFAULT "value" - will have a default value of "value" if no data is added
  to the field.


CREATE TABLE orders (
  id serial,
  customer_name varchar(100) NOT NULL,
  burger varchar(50),
  side varchar(50),
  drink varchar(50),
  order_total decimal(4, 2) NOT NULL
);

# Altering tables

`ALTER TABLE` is part of Data Definition Language(DDL)

Basic format:
```
ALTER TABLE table_to_change
    stuff_to_change_goes_here
    additional_arguments
```
`RENAME` clause can be used to **rename a table** like this:
```
ALTER TABLE users
    RENAME TO all_users;
```
RENAME can also be used to **rename a column** like this:
```
ALTER TABLE all_users
    RENAME COLUMN username TO full_name;
```
`ALTER COLUMN` can be used to change something in a specific column like the data
type. For example:
```
ALTER TABLE all_users
    ALTER COLUMN full_name TYPE varchar(25);
```
Contraints are normally optional but can be added or removed. Syntax for adding
constraints can vary based on the type of constraint. Some are considered "table
constraints" and others (NOT NULL for example) are considered "column constraints".
CREATE TABLE lets you define column and table constraints, while commands like
ALTER TABLE only let you work with table contraints or NOT NULL.
Note: column constraints can be added when defining new columns in existing tables.
NOT NULL is always a column constraint and can be added to a table like this:
```
ALTER TABLE table_name
      ALTER COLUMN column_name
      SET NOT NULL;
```
Adding other constraints to an existing table must use this syntax:
```
ALTER TABLE table_name
      ADD [ CONSTRAINT constraint_name ]
      constraint_clause;
```
Contraints can also be removed using the syntax `DROP CONSTRAINT` like this:
```
ALTER TABLE table_name
      DROP CONSTRAINT constraint_name;
```
We can remove default value clause like this:
```
ALTER TABLE all_users
    ALTER COLUMN id
    DROP DEFAULT;
```
Columns can also be added later by using the `ADD COLUMN` clause in an ALTER TABLE
statement. For example:
```
ALTER TABLE all_users
      ADD COLUMN last_login timestamp
                 NOT NULL
                 DEFAULT NOW();
```
This is the same way we add columns when creating the table with the column name,
data type, followed by optional constraints.
Note: NOW() is a SQL function that provides the current date and time.

Columns can also be removed with `DROP COLUMN` clause in an ALTER TABLE statement.
Like this:
```
ALTER TABLE all_users
    DROP COLUMN enabled;
```
We can also delete tables from the database using `DROP TABLE` like this:
```
DROP TABLE all_users;
```
Note: actions like DROP COLUMN and DROP TABLE are irreversible.

# Data

The Data Manipulation Language (DML) is used to add, query, change, remove data, etc. This is accomplished through Data Manipulation Statements. There are four types of statements:
* `INSERT` - adds new data into a database table.
* `SELECT` - aka queries, retreive data from a database table.
* `UPDATE` - update existing data in a database table.
* `DELETE` - deletes existing data from a database table.

These are sometimes called CRUD (Create Read Update Delete) operations. CRUD apps can be used to describe apps whos main job is to perform these functions through an interface.

Example of an INSERT statement:
```
INSERT INTO table_name
            (column1_name, column2_name,...)
     VALUES (data_for_column1, data_for_column2, ...);

# One or more column names or values can be inserted.

# A value must be supplied when specifiying a column.
```
**Rows** (sometimes called tuples) contain the data for the various columns.

Multiple rows can be added at once like this:
```
INSERT INTO users (full_name)
           VALUES ('Jane Smith'), ('Harry Potter');
```
Using default values for a column ensures that if a value is not specified in a INSERT statement, the default value will be used.

If an INSERT statement specifies columns and values but a particular column is not specified, SQL will insert the value null into that column. The NOT NULL constraint prevents this from happening, a value must be entered.

**Check constraints** limit the type of data that can be in a column based on some condition set in the constraint. Every time new data is added to a table, the constraint is checked first to make sure the data conforms to it.

For example if we wanted to make sure an empty string couldnt be used as a value, we would add a check constraint like this:
```
ALTER TABLE users ADD CHECK (full_name <> '');

# Note: <> is the not equal operator in SQL.
```
Constraints can be added like this:
```
ALTER TABLE users ADD UNIQUE (column_name);

# UNIQUE being the constraint.
```
If you had a string that needed single quotes, you can use a second quote mark to escape the first. 'O'Leary' -> 'O''Leary'.

We can remove a constraint like this:
```
ALTER TABLE 'table name'
  ALTER COLUMN 'column name' DROP 'constraint';
```
Or:
```
ALTER TABLE 'table name'
  DROP CONSTRAINT 'constraint name';
```
Note: a value of NULL can be inserted into a column if that column has a DEFAULT value constraint. NULL values in boolean
columns should be avoided because it creates 3 possible value states (true, false, NULL). This is sometimes called the Three State Boolean or Three Valued-logic problem.

# Select Query Syntax

```
SELECT column_name, ...
  FROM table_name
  WHERE condition;

# Multiple columns can be selected or * can be used for ALL columns.
```
In the above example, **identifiers** are are the column/table names, which identify specific tables or columns. The **keywords** are SELECT, FROM, WHERE and command postgreSQL to do something specific. SQL is not case sensitive so SELECT is the same as select, which means its best to avoid having columns with the same names as reserved keywords. If you have to, you can double quote identifiers like this so that postgreSQL wont think its a keyword:
SELECT "select".

**ORDER BY** clause displays the results of a query in a particular order. For example:
```
SELECT column_name, ...
       FROM table_name
       WHERE condition
       ORDER BY column_name;

# Note: ASC or DESC can be added after ORDER BY column name to sort ascending or descending. If ommitted, order will be ASC by default.
```
Adding additional expressions in the ORDER BY clause can further order the results. For example:
```
SELECT full_name, enabled FROM users
ORDER BY enabled DESC, id DESC;
```
Here we are selecting rows in the full_name and enabled columns from the users table and ordering them by their enabled status (descending), rows that have the same enabled status are then sorted by their id value (descending).

# Operators

Operators are typically used as part of a WHERE clause expression. Here are some common operator types:
* Comparison - used to compare two values (often numerical, but not always) examples would be less than `<`,greater than `>`, equal to `=`, not equal to `<>`.
Example:
```
SELECT * FROM 'table_name' WHERE 'column_name' < 2;
```
* Logical - `AND`, `OR`, `NOT`. AND and OR let you combine multiple conditions in one expression.
Example:
```
SELECT * FROM 'table_name' WHERE 'column_name' = 'hello' OR id = 2;
```
* String Matching - Lets us search for sub-sets of data from within a column. For example if we had rows within a name column of John Smith and Jane Smith, we could use string matching to search for names including 'Smith'. For example:
```
SELECT * FROM users WHERE name LIKE '%Smith';

% is a wildcard character and in this case means any number of characters followed by Smith.

% could come after Smith too like %Smith% this would mean any number of characters before OR after.
```
LIKE is case sensitive, use ILIKE for case-insensitive selection.

Note: when making comparisons for NULL, we wouldnt use the normal syntax WHERE column_name = NULL, we would use the special syntax `WHERE column_name IS NULL` or `WHERE column_name IS NOT NULL`.

# LIMIT and OFFSET

Pagination is when portions of data are displayed as separate pages, it is built on the LIMIT and OFFSET clauses of SELECT.

We can use LIMIT like this to only return 1 result:
```
SELECT * FROM users LIMIT 1;

# This would return the first user in the users table.
```
If we wanted to skip the first user but still have a LIMIT of 1 we would need an OFFSET clause which will skip however many specified rows. For example:
```
SELECT * FROM users LIMIT 1 OFFSET 2;

# This would skip the first 2 rows and return the 3rd.
```
**Distinct** is a qualifier used to deal with duplication. We can use it as part of a SELECT query to only return distinct (unique) values like this:
```
SELECT DISTINCT full_name FROM users;

# Duplicate full_name values wont be returned.
```
It could be used together with an SQL function (in this case count) like this:
```
SELECT count(DISTINCT full_name) FROM users;
```
# Functions

Functions are sets of commands that perform operations on fields or data. These operations can include data transformation. Here are some common types of functions:
* **String** - Perform operations on values of the String data type. For example: `SELECT length(full_name) FROM users;` (length being the function).
* **Date/Time** - Perform operations on values of the Date/Time data type. Most take time or timestamp inputs. For example: date_part is a function that returns a specific part of a timestamp: `SELECT full_name, date_part('year', last_login) FROM users;` Another example is the age function which is passed a timestamp as an argument and returns the time elapsed from the argument to the current time: `SELECT full_name, age(last_login) FROM users;`.
* **Aggregate** - Perform aggregation (produces a single value from a group of values). For example: the count function `SELECT count(id) FROM users;`. sum, min, max, avg are some others.

Instead of something like `SELECT count(id) FROM users WHERE enabled = true;` we can use the **GROUP BY** clause to count the values of true and false like this: `SELECT enabled, count(id) FROM USERS GROUP BY enabled`. If a column is selected (like "enabled"), it must be part of the GROUP BY clause. (unless its part of an aggretate function like count(id)).

# Updating data

An UPDATE statement can be written like this:
```
UPDATE table_name
SET column_name = value, ...
WHERE expression;

# The WHERE clause is optional (all rows will be updated if omitted).
```

# Deleting data

DELETE statement removes entire rows from a table. It can be done like this:
```
DELETE FROM table_name WHERE expression;

# If the WHERE clause is omitted, ALL rows will be deleted.
```
DELETE can only delete one or more entire rows, while UPDATE can update one or more rows within one or more columns.

# Table relationships