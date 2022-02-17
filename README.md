# Learn SQL with MySQL 🐬        

## Creating database and table 📊

### Create a new database       

```SQL
    CREATE DATABASE learn_sql;
```       

### Show all the databases that available in MySQL         

```SQL
    SHOW DATABASES;
```

### Some of data types in SQL for MySQL:      

- `INT` : Integer      
- `DECIMAL` : Decimal number      
- `VARCHAR` : Strings or text      
- `BLOB` : Binary Large Object, Stores large data     
- `DATE` : Use this format 'YYYY-MM-DD'    
- `TIMESTAMP` : Use this format 'YYYY-MM-DD HH:MM:SS'         

### Create a new table in the database      

| id | name | major |
| -- | ---- | ----- |
| 1 | Tom | Medical |
| 2 | Kate | Economy |
| 3 | Ben | Computer Science |

```SQL
    CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(32), -- 32 is the size,
    major VARCHAR(32)
);
```       

### Get a description of the table from MySQL      

```SQL
    DESCRIBE student;
```      

### Add a new column of a table      

| id | name | major | gpa |
| -- | ---- | ----- | --- |
| 1 | Tom | Medical | 3.67 |
| 2 | Kate | Economy | 2.90 |
| 3 | Ben | Computer Science | 3.22 |      

```SQL
    ALTER TABLE student ADD gpa DECIMAL(3, 2);
```       

### Remove a column from a table        

```SQL
    ALTER TABLE student DROP COLUMN gpa;
```

### Delete a table in the database     

```SQL
    DROP TABLE student;
```      

### Delete the entire database       

```SQL
    DROP DATABASE learn_sql;
```       

## Inserting data into table 📊      

| id | name | major |
| -- | ---- | ----- |
| 1 | Tom | Medical |
| 2 | Kate | Economy |
| 3 | Ben | NULL |        

### Insert a data with all attributes included     

```SQL
    INSERT INTO student VALUES(
        1, 'Tom', 'Medical'
    );
    INSERT INTO student VALUES(
        2, 'Kate', 'Economy'
    );
```      

### Insert a data with incomplete attribute

```SQL
    INSERT INTO student(id, name) VALUES(3, 'Ben');
```       

### Get all rows/data from the table
```SQL
    SELECT * FROM student;
```

## Constraints 📊       

| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Medical |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | undecided |       

### Some of common use cases constraints   

- `PRIMARY KEY` : Primary key of an entity that cannot be null and must be unique.
- `AUTO_INCREMENT` : SQL will auto increment the number (integer/`INT`) without provide in SQL statement.
- `NOT NULL` : The attribute cannot be null;
- `UNIQUE` : The attribute must be unique from other row/data.

```SQL
    CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(32) UNIQUE,
    major VARCHAR(32) DEFAULT 'undecided'
);

    INSERT INTO student(name, email, major) VALUES('Tom', 'tom@email.com', 'Medical');
    INSERT INTO student(name, email, major) VALUES('Kate', 'kate@email.com', 'Economy');
    INSERT INTO student(name, email, major) VALUES('Ben', 'ben@email.com', 'Computer Science');
    INSERT INTO student(name, email) VALUES('Sara', 'sara@email.com');
```       

## Update and Delete 📊       

### Updating data

Before      
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Medical |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | undecided |       

After    
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Medical |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture |       

```SQL
    UPDATE student
    SET major = 'Architecture'
    WHERE id = 4;
```           

`WHERE` clause can use comparison operation like :
- `=` : equals to 
- `<>` : not equals to 
- `>` : greater than 
- `<` : less than 
- `>=` : greater than or equals to 
- `<=` : less than or equals to 

Before      
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Medical |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture | 
| 5 | Ray | ray@email.com | Biology |      

After    
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Biomedical Studies |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture | 
| 5 | Ray | ray@email.com | Biomedical Studies |      

```SQL
    UPDATE student
    SET major = 'Biomedical Studies'
    WHERE major = 'Medical' OR major = 'Biology';
```      

Before      
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Biomedical Studies |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture | 
| 5 | Ray | ray@email.com | Biomedical Studies |      

After     
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tim | tim@email.com | Biomedical Studies |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture | 
| 5 | Ray | ray@email.com | Biomedical Studies |      

```SQL    
    UPDATE student
    SET name = 'Tim', email = 'tim@email.com'
    WHERE id = 1;
```        

`WHERE` clause is optional, so we can ignore it when we want to update entire column or attribute as stated below.

Before        
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tim | tim@email.com | Biomedical Studies |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture | 
| 5 | Ray | ray@email.com | Biomedical Studies |      

After      
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tim | tim@email.com | undecided |
| 2 | Kate | kate@email.com | undecided |
| 3 | Ben | ben@email.com | undecided | 
| 4 | Sara | sara@email.com | undecided | 
| 5 | Ray | ray@email.com | undecided |      

```SQL
    UPDATE student
    SET major = 'undecided';
```     

### Deleting data

This will delete all rows from the table       
```SQL
    DELETE FROM student;
```      

This will delete where the id = 5
```SQL
    DELETE FROM student
    WHERE id = 5;
```      

## Basic Queries 📊

The table     
| id | name | email | major |
| -- | ---- | ----- | ----- |
| 1 | Tom | tom@email.com | Medical |
| 2 | Kate | kate@email.com | Economy |
| 3 | Ben | ben@email.com | Computer Science | 
| 4 | Sara | sara@email.com | Architecture | 
| 5 | Ray | ray@email.com | Biology |     

### Include all columns

To get all information/columns of rows/data from student table    
```SQL
    SELECT * FROM student;
```      

### Include specific column

To get only name column from student database       
```SQL
    SELECT name FROM student;
```        

or      
```SQL
    SELECT student.name FROM student;
```

The output      
| name |
| ---- |
| Tom |
| Kate |
| Ben | 
| Sara | 
| Ray |       

To get name and major column for student table       
```SQL
    SELECT name, major FROM student;
```

or
```SQL
    SELECT student.name, student.major FROM student;
```     

### Order the data based on the column

To get name and major column for student table that ordered by name in ascending order     
```SQL
    SELECT student.name, student.major from student
    ORDER BY student.name;
```        

or
```SQL
    SELECT student.name, student.major from student
    ORDER BY student.name ASC;
```

To get name and major column for student table that ordered by name in descending order      
```SQL
    SELECT student.name, student.major from student
    ORDER BY student.name DESC;
```       

### Limit the incoming data

To get all information/columns of rows/data from student table, but want only two rows/data    
```SQL
    SELECT * FROM student
    LIMIT 2;
```      

### Use where condition

To get all columns of student table where id = 1      
```SQL
    SELECT * FROM student
    WHERE id = 1;
```      

To get all columns of student table where the major = Biology or major = Medical     
```SQL
    SELECT * FROM student
    WHERE major = 'Biology' OR major = 'Medical';
```       

### Make a complex query

```SQL
    SELECT name, email, major FROM student
    WHERE major <> 'Economy'
    ORDER BY name ASC
    LIMIT 2;
```       

The `IN` keyword will include all the values in the parenthesis     
```SQL
    SELECT * FROM student;
    WHERE name IN ('Kate', 'Sara', 'Ray');
```
