
-- @block 
SHOW DATABASES;

-- @block
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(32),
    major VARCHAR(32)
);

-- @block 
DESCRIBE student;

-- @block 
ALTER TABLE student ADD gpa DECIMAL;

-- @block 
ALTER TABLE student DROP COLUMN gpa;

-- @block 
DROP TABLE student;

-- @block 
INSERT INTO student VALUES(
    1, 'Tom', 'Medical'
);

-- @block 
INSERT INTO student VALUES(
    2, 'Kate', 'Economy'
);

-- @block 
INSERT INTO student(id, name) VALUES(3, 'Ben');

-- @block 
SELECT * FROM student;

-- @block 
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(32) UNIQUE,
    major VARCHAR(32) DEFAULT 'undecided'
);

-- @block 
INSERT INTO student(name, email, major) VALUES('Tom', 'tom@email.com', 'Medical');

-- @block 
INSERT INTO student(name, email, major) VALUES('Kate', 'kate@email.com', 'Economy');

-- @block 
INSERT INTO student(name, email, major) VALUES('Ben', 'ben@email.com', 'Computer Science');

-- @block 
INSERT INTO student(name, email) VALUES('Sara', 'sara@email.com');

-- @block 
UPDATE student
SET major = 'Architecture'
WHERE id = 4;

-- @block 
INSERT INTO student(name, email, major) VALUES('Ray', 'ray@email.com', 'Biology');

-- @block 
UPDATE student
SET major = 'Biomedical Studies'
WHERE major = 'Medical' OR major = 'Biology';

-- @block 
UPDATE student
SET name = 'Tim', email = 'tim@email.com'
WHERE id = 1; 

-- @block 
UPDATE student
SET major = 'undecided';

-- @block 
DELETE FROM student
WHERE id = 5;
