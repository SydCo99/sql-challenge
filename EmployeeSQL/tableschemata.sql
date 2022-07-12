-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_number" varchar(10)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_number"
     )
);

CREATE TABLE "dept_emp" (
    "emp_number" int   NOT NULL,
    "dept_number" varchar(10)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_number" varchar(10)   NOT NULL,
    "emp_number" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_number" int   NOT NULL,
    "emp_title_id" varchar(20)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(10)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_number"
     )
);

CREATE TABLE "salaries" (
    "emp_number" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(20)   NOT NULL,
    "title" varchar(50)   NOT NULL,
	CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_number" FOREIGN KEY("emp_number")
REFERENCES "employees" ("emp_number");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_number" FOREIGN KEY("dept_number")
REFERENCES "departments" ("dept_number");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_number" FOREIGN KEY("dept_number")
REFERENCES "departments" ("dept_number");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_number" FOREIGN KEY("emp_number")
REFERENCES "employees" ("emp_number");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_number" FOREIGN KEY("emp_number")
REFERENCES "employees" ("emp_number");

