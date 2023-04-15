-- Create a table

CREATE TABLE "Employees" (
  "FullName"        TEXT,
  "Salary"          INT,
  "JobPosition"     TEXT,
  "PhoneExtension"  INT,
  "IsPartTime"      BOOLEAN
);

---------------------------------------------------------------------------------------------
-- Create a few employees

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Steven King', 17000, 'AD_VP', 4568, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Neena Kochhar', 17000, 'AD_VP', 4569, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lex De Haan', 9000, 'IT_PROG', 4501, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Alexander Hunold', 6000, 'IT_PROG', 4502, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Bruce Ernst', 4800, 'IT_PROG', 4503, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Valli Pataballa', 4800, 'IT_PROG', 4504, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', 4200, 'IT_PROG', 4505, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Ismael Sciarra', 12008, 'FI_MGR', 4506, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Luis Popp', 7800, 'FI_ACCOUNT', 4507, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Den Raphaely', 6900, 'FI_ACCOUNT', 4508, 'y');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Walter White', 300, 'COOK', NULL, 'n');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Jesse Pinkman', 300, 'COOK', NULL, 'n');

---------------------------------------------------------------------------------------------
-- Select all columns for all employees.

SELECT * FROM "Employees";

---------------------------------------------------------------------------------------------
-- Select only the full names and phone extensions for only full-time employees.
    
SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = 'n';

---------------------------------------------------------------------------------------------
-- Insert a new part-time employee, as a software developer, with a salary of 450. Make up values for the other columns.
    
INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") 
VALUES ('Jeremy Badger', 450, 'SW_DEV', 4600, 'y');

---------------------------------------------------------------------------------------------
-- Update all employees that are cooks to have a salary of 500.
    
UPDATE "Employees" SET "Salary" = 500 WHERE "JobPosition" = 'COOK';

---------------------------------------------------------------------------------------------
-- Delete all employees that have the full name of "Lazy Larry".

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

---------------------------------------------------------------------------------------------
-- Add a column to the table: ParkingSpot as textual information that can store up to 10 characters.

ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

---------------------------------------------------------------------------------------------
-- Recreate your database and tables and use NOT NULL for columns you feel are required.
DROP TABLE "Employees";
CREATE TABLE "Employees" (
  "FullName"        TEXT NOT NULL,
  "Salary"          INT,
  "JobPosition"     TEXT,
  "PhoneExtension"  INT,
  "IsPartTime"      BOOLEAN,
  "ParkingSpot"     VARCHAR(10)
);

-- And if I wanted it to have exactly what was there before I issued DROP TABLE, I would re-enter the commands.
-- But the below queries would also do it.

ALTER TABLE "Employees" ALTER COLUMN "FullName" SET NOT NULL;

---------------------------------------------------------------------------------------------
-- Add a primary key named Id to your table.

ALTER TABLE "Employees" ADD COLUMN id SERIAL PRIMARY KEY;

---------------------------------------------------------------------------------------------
-- Create a second table

CREATE TABLE "Departments" ( 
  "Name" TEXT,
  "BuildingNumber" INT
);

---------------------------------------------------------------------------------------------
-- Create a column on the Employees table named DepartmentId to relate to the Departments table. 
-- Make it a foreign key.

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("id");


CREATE TABLE "Books" (
  "Id"             SERIAL PRIMARY KEY
  "Title"          TEXT NOT NULL,
  "PrimaryAuthor"  TEXT,
  "YearPublished"  INT,
  "RatingId"       INTEGER REFERENCES "Ratings" ("Id"),
);

---------------------------------------------------------------------------------------------

select * FROM "Employees";
+------------------+--------+-------------+----------------+------------+-------------+----+--------------+
| FullName         | Salary | JobPosition | PhoneExtension | IsPartTime | ParkingSpot | id | DepartmentId |
|------------------+--------+-------------+----------------+------------+-------------+----+--------------|
| Walter White     | 500    | COOK        | <null>         | False      | <null>      | 11 | <null>       |
| Jesse Pinkman    | 500    | COOK        | <null>         | False      | <null>      | 12 | <null>       |
| Lex De Haan      | 9000   | IT_PROG     | 4501           | False      | <null>      | 3  | 2            |
| Alexander Hunold | 6000   | IT_PROG     | 4502           | False      | <null>      | 4  | 2            |
| Bruce Ernst      | 4800   | IT_PROG     | 4503           | False      | <null>      | 5  | 2            |
| Valli Pataballa  | 4800   | IT_PROG     | 4504           | False      | <null>      | 6  | 2            |
| Ismael Sciarra   | 12008  | FI_MGR      | 4506           | False      | <null>      | 7  | 3            |
| Luis Popp        | 7800   | FI_ACCOUNT  | 4507           | False      | <null>      | 8  | 3            |
| Den Raphaely     | 6900   | FI_ACCOUNT  | 4508           | True       | <null>      | 9  | 3            |
| Jeremy Badger    | 450    | SW_DEV      | 4600           | True       | <null>      | 10 | 2            |
| Steven King      | 17000  | AD_VP       | 4568           | False      | <null>      | 1  | 1            |
| Neena Kochhar    | 17000  | AD_VP       | 4569           | False      | <null>      | 2  | 1            |
+------------------+--------+-------------+----------------+------------+-------------+----+--------------+