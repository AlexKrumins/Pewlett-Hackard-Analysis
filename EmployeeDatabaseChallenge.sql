--PART 1
-- DELIVERABLE 1: Number of Retiring Employees by Title
-- Follow the instructions below to complete Deliverable 1.


-- SELECT * FROM employees;
-- SELECT * FROM titles;
-- DROP TABLE retirement_titles;
SELECT 	e.emp_no,
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
		e.first_name,
		e.last_name,
-- Retrieve the title, from_date, and to_date columns from the Titles table.
		t.title,
		t.from_date,
		t.to_date
-- Create a new table using the INTO clause.
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
-- Join both tables on the primary key.
ON (e.emp_no = t.emp_no)
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (e.to_date = '9999-01-01')
ORDER BY emp_no ASC;
-- Before you export your table, confirm that it looks like the image provided in the documentation.
SELECT * FROM retirement_titles;
-- Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


-- Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- These columns will be in the new table that will hold the most recent title of each employee.
-- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.


-- DROP TABLE unique_titles;
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;
SELECT * from unique_titles;

-- DROP TABLE retiring_titles;
SELECT COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;
SELECT * from retiring_titles;

--DELIVERABLE 2
SELECT * FROM dept_emp;

SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;