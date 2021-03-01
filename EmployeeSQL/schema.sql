-- Drop Tables
DROP TABLE IF EXISTS "departments" CASCADE;
DROP TABLE IF EXISTS "dept_emp" CASCADE;
DROP TABLE IF EXISTS "dept_manager" CASCADE;
DROP TABLE IF EXISTS "employees" CASCADE;
DROP TABLE IF EXISTS "salaries" CASCADE;
DROP TABLE IF EXISTS "titles" CASCADE;

-- Create Tables
CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) NOT NULL,
    "dept_name" VARCHAR(64) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5) NOT NULL,
    "title" VARCHAR(64) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(5) NOT NULL,
    "birth_date" VARCHAR(10) NOT NULL,
    "first_name" VARCHAR(64) NOT NULL,
    "last_name" VARCHAR(64) NOT NULL,
    "sex" VARCHAR(8) NOT NULL,
    "hire_date" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id") REFERENCES "titles" ("title_id")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);