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
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
-- Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT * FROM retirement_titles;

-----
DROP TABLE unique_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

--deliverable 1 part 3, getting count of each title in desc order

SELECT COUNT(ut.emp_no),ut.title
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

--DELIVERABLE 2
SELECT * FROM dept_emp;

SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
--DISTINCT ON(emp_no)
--INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;