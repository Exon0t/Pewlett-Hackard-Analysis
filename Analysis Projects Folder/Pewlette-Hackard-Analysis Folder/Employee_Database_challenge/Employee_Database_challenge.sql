
--Deliverable 1 
--create retirement_titles
SELECT em.emp_no,
em.first_name,
em.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles
	ON (em.emp_no=titles.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--get last title of each emp
SELECT DISTINCT ON (emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

--count retiring by title
SELECT COUNT(rt.emp_no),
	rt.title
INTO retiring_titles
FROM unique_titles as rt
GROUP BY rt.title
ORDER BY count(rt.emp_no)DESC;




--DELIVERABLE 2 
SELECT DISTINCT ON (em.emp_no)
	em.emp_no,
	em.first_name,
	em.last_name, 
	em.birth_date,
	de.from_date,
	de.to_date,
	titles.title
FROM employees as em
	INNER JOIN dept_emp AS de
	on (em.emp_no = de.emp_no)
	INNER JOIN titles
	on (em.emp_no = titles.emp_no)
WHERE (de.to_date = '9999-01-01') and (birth_date between '1965-01-01' and '1965-12-31')
ORDER BY em.emp_no


