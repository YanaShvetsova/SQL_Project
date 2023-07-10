-- SELECT <columnName> FROM <tableName>;

SELECT * FROM employees;

-- SUGGESTED FORMAT --
SELECT * FROM JOBS;

select * from employees;

SeLeCt * FrOm eMploYEES;


SELECT * FROM regions;


SELECT manager_id FROM employees;


SELECT first_name, hire_date FROM employees;

-- Write a querty to retrieve all the information from the phone number, job id, and manager id from employees table

select phone_number, job_id, manager_id from employees;



SELECT * FROM employees
WHERE job_id = 'IT_PROG';









--1. FROM   -> First retrieves the table.
--2. WHERE  -> filters the rows in the table, or tables.
--3. SELECT -> selects the specific column from the table.



-- Write the query to get the department name column for department id = 50 from departments table.

select department_name, department_id from departments
WHERE department_id = 50;


SELECT * FROM EMPLOYEES
WHERE first_name = 'Neena'
AND last_name = 'King'
AND JOB_ID = 'AD_PRES';


-- Write a query and retrieve first_name with Bruce and David;

SELECT * FROM EMPLOYEES
WHERE first_name != 'David';

SELECT * FROM EMPLOYEES
WHERE salary in (17000, 9000, 3100, 2900);

SELECT * FROM EMPLOYEES
WHERE first_name in ('Neena', 'Alexander');


SELECT * FROM EMPLOYEES
WHERE salary <> 17000
or salary <> 9000
or salary <> 3100
or salary <> 2900;


--Write the query to get all columns from the employees' table if the department id is 50 and the job id is "ST_MAN"

SELECT * FROM employees
WHERE department_id = 50
AND job_id = 'ST_MAN';

--Write the query to get all columns from the employees' table if the department id is 50 or the job id is "ST_MAN"

SELECT * FROM employees
WHERE department_id = 50
OR job_id = 'ST_MAN';

--Write the query to get all columns from the employees' table if the department id is 70 or the salary is more than 5000

SELECT * FROM employees
WHERE department_id = 70
OR salary > 5000;


--Write the query to get all columns from the employees' table if the department id is 70 and the salary is more than 5000

SELECT * FROM employees
WHERE department_id = 70
AND salary > 5000;


--Write the query to find the employees who are not displayed in step 4.

SELECT * FROM employees
WHERE department_id <> 70
or salary <= 5000;

SELECT * FROM employees
WHERE NOT (department_id = 70 AND salary > 5000 );


SELECT * FROM employees
WHERE commission_pct IS NOT null;


SELECT * FROM employees
WHERE salary BETWEEN 7000 AND 10000;

SELECT * FROM employees
WHERE salary > 7000
AND salary < 10000;


SELECT * FROM employees
WHERE hire_date BETWEEN '01-JUL-96' AND '31-JUL-96';



--1. Write the query to get all columns from employees table if salary is between 1000 and 10000

SELECT * FROM employees
WHERE salary BETWEEN 1000 AND 10000;


--2. Write the query to get all columns from employees table if salary is between 6000 and 100000 and hire date is after June 7, 1997

SELECT * FROM employees
WHERE salary BETWEEN 6000 AND 10000
AND hire_date > '07-JUN-97';

SELECT * FROM  EMPLOYEES
WHERE (salary >= 6000 and salary <= 100000)
AND hire_date > '07-JUN-97';



select first_name || ' ' || last_name from employees;


select first_name from employees;



--1. Write the query to get last name and add them '@gmail.com' as columnName is 'gmailAccount' from employees table

SELECT last_name || '@gmail.com' as gmailAccount from employees;

--2. Write the query to get last name and add them '@gmail.com' as columnName is 'Gmail Account' from employees table.

SELECT concat(last_name, '@gmail.com') as "gmail account" from employees;

select * from employees
where salary > '5000'
order by hire_date desc

-- 1.	Write a query that returns those employees who have  commission less than their salary
select * from employees
where commission_pct < salary;

-- 2.	Write a query that returns all employees that have a salary greater than 2500 and also work in department_id 20
select * from employees
where salary > '2500'
and department_id ='20';

-- 3.	Write a query that returns all employees that are not AD_VP nor SA_REP and have a salary greater than or equal to 2000
select * from employees
where job_id not in ('AD_VP','SA_REP')
and salary >= '2000';

-- 4.	Write a query to retrieve the first names and last names of all employees along with their job IDs, and concatenate them into a job_id column
--      in the format: <first_name> <last_name> works as a <job_id>. Alias this column as "Full Info".

SELECT first_name, last_name, first_name || ' ' || last_name || ' works as a ' || job_id AS "Full Info" FROM employees;

SELECT first_name, last_name, concat(concat(concat(first_name, ' ' ), concat(last_name, ' works as a ')), job_id) as "Full Info" FROM employees;

-- 5.	Write a query prints first name column as salary, and prints every name in a cell as " Steven makes $24000 per month "

SELECT first_name || ' makes $' || salary || ' per month' as "monthly salary" from employees;

-- 6. -- 5.	Write a query prints first name column as salary, and prints every name in a cell as " Steven makes $24000 per year "

SELECT first_name || ' makes $' || (salary * 12)  || ' per year' as "yearly salary" from employees;

------------------------------------------------------
---------------- SINGLE ROW FUNCTIONS ----------------
------------------------------------------------------

SELECT UPPER('hello') from employees;

SELECT UPPER('hello') from dual;

select *  from dual;

SELECT INITCAP('hello my name is NAME') AS sentence from dual;

SELECT LOWER('THIS IS TECHGLOBAL B6') from dual;

-- Write a query to concats first_name and job id columns from the employees table
-- and returns them as a concat first_name in upper case and job_id in lower case

select concat (UPPER(first_name), LOWER(job_id)) from employees;

--1. Write the query to get all employees last names in upper case.
select UPPER(last_name) from employees;
--2. Write the query to get all employees emails in lower case.
select LOWER(email) from employees;
--3. Write the query to get all employees first name in upper case, last names in lower case and emails in only first letter upper case.
select UPPER(first_name), LOWER(last_name), INITCAP(email) 
from employees;
--4. Write a query to retrieve the first names and last names of all employees in uppercase, and their job titles in lowercase. Additionally, alias the columns as "First Name",
--"Last Name", and "Job Title" respectively.
select UPPER(first_name) as "First Name", UPPER(last_name) as "Last Name", LOWER(job_title)
from employees e
inner join jobs j on j.job_id = e.job_id
--5. Write a query and return each row in this format “steve IS THE NAME and their job is: MANAGER “
select CONCAT(CONCAT(CONCAT (first_name, ' '), 'IS THE NAME and their job is:'), UPPER(job_title)) 
from employees e
inner join jobs j on j.job_id = e.job_id
SELECT LENGTH('hello my name is name') AS length FROM dual;
SELECT LENGTH(first_name) as length from employees;
SELECT first_name, LENGTH(first_name) as length FROM employees
WHERE LENGTH(first_name) = 6;
SELECT SUBSTR('hello', 2) FROM employees;
SELECT SUBSTR('hello', 2, 2) FROM employees;
-- 'hello' 2  e
-- 'hello' 2, 2  el
-- 'hello' 2, 3  ell
SELECT SUBSTR('hello', 2, 3) FROM employees;
SELECT SUBSTR('Hello my name is', 10) FROM dual;
SELECT SUBSTR('Hello my name is', 10, 5) FROM dual;
SELECT LENGTH(SUBSTR('Hello my name is', 10, 5)) FROM dual;
select instr(LOWER(city), 'a') from locations;
-- 5.  Write the query to get all last names that starting from index number 2 and add 4 more character from employees.
select SUBSTR(last_name, 2, 5)
from employees;
-- 6.  Write the query to get all last names that starting from index number 4 from employees .
select SUBSTR(last_name, 4)
from employees;
-- 7.  Write the query to find the city includes ‘a’ character in locations.
select city from locations
where city like '%a%';
-- 8.  Write the query to return first name and last name combined as lower case with the space and
--     find the index number of ‘k’ from combined firstname and lastname from employees.
SELECT LOWER(first_name || ' ' || last_name) as "full_name", INSTR(LOWER(first_name || ' ' || last_name), 'k') as "index number" FROM employees;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------HOME WORK---------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--1.	Write a query to display the first name, last name, and hire date of all employees who were hired between January 1, 2000, and December 31, 2000, and whose last name begins with the letter 'S'.
select first_name, last_name, hire_date from employees
where hire_date between '01-JAN-00' and '31-DEC-00'
and last_name like 'S%';

--2.	Write a query to display the first name, last name, and job title of all employees who work in the Sales or Accounting departments.
select first_name, last_name, job_id from employees
where job_id like 'SA%' OR job_id like 'AC%';

--3.	Write a query to display the first name, last name, and salary of all employees who earn more than $10,000 and less than $20,000.
select first_name, last_name, salary from employees
where salary between '10001' and '19999';

--4.	Write a query to display the first name, last name, and hire date of all employees who do not have a manager.
select first_name, last_name, hire_date from employees
where manager_id is null;

--5.	Write a query to display the first name, last name, and job title of all employees who are either Sales Representatives or Sales Managers.
select first_name, last_name, job_id from employees
where job_id in ('SA_REP', 'SA_MAN');

--6.	Write a query to display the first name, last name, and hire date of all employees who were not hired in the year 2000.
select first_name, last_name, hire_date from employees
where hire_date not like '%00';

--7.	Write a query to display the first name and last name of all employees, concatenated as "First Last".
select concat(concat (first_name, ' '), last_name) as "First Last" 
from employees;

--8.	Write a query to display the first name, last name, and salary of all employees, sorted by salary in descending order.
select first_name, last_name, salary from employees
order by salary desc;

--9.	Write a query to display the first name, last name, and job title of all employees whose job title contains the word "Manager".
select first_name, last_name, job_id from employees
where job_id like '%MAN' OR job_id like '%MGR';

--10.	Write a query to display the first name, last name, and salary of all employees whose salary is not null.
select first_name, last_name, salary from employees
where salary is not null;

--11.	Write a query to display the first name, last name, and job title of all employees, with the first name and last name in uppercase letters and the job title in lowercase letters.
select UPPER(first_name), UPPER(last_name), LOWER(job_id) 
from employees;

--12.	Write a query to display the first name, last name, and job title of all employees, with the first letter of each word in the job title capitalized.
select INITCAP(first_name), INITCAP(last_name), INITCAP(job_id) 
from employees;

--13.	Write a query to display the first name, last name, and length of the job title of all employees.
select first_name, last_name,length(job_id)
from employees;

--14.	Write a query to display the first name, last name, and a concatenated string of the first name, last name, and job title of all employees.
select first_name, last_name,(first_name || ' ' || last_name || ' '  || job_id )
from employees;

--15.	Write a query to display the first name, last name, and the first three characters of the job title of all employees.
select first_name, last_name, SUBSTR(job_id, 1, 3) 
from employees;

--16.	Write a query to display the first name, last name, and the position of the first occurrence of the letter "a" in the job title of all employees.
select first_name, last_name, instr (job_id, 'a')
from employees;

--17.	Write a query to display the first name, last name, and salary of all employees, with the salary rounded to the nearest thousand dollars.
select first_name, last_name, ROUND(salary, -3)
from employees;

--18.	Write a query to display the first name, last name, and salary of all employees, with the salary truncated to the nearest thousand dollars.
select first_name, last_name, TRUNC(salary, -3)
from employees;

--19.	Write a query to display the first name, last name, and the length of the first name of all employees.
select first_name, last_name, length(first_name)
from employees;

--20.	Write a query to display the first name, last name, and a concatenated string of the first name, a comma, and the last name of all employees.
select first_name, last_name, concat(concat(first_name, ', '), last_name)
from employees;

--21.	Write a query to display the first name, last name, and the first three characters of the first name of all employees.
select first_name, last_name, SUBSTR(first_name, 1, 3)
from employees;

--22.	Write a query to display the first name, last name, and the position of the first occurrence of the letter "e" in the first name of all employees.
select first_name, last_name, instr (first_name, 'e')
from employees;

--23.	Write a query to display the first name, last name, and the length of the last name of all employees.
select first_name, last_name, length(last_name)
from employees;

--24.	Write a query to display the first name, last name, and the first three characters of the last name of all employees.
select first_name, last_name, SUBSTR(last_name, 1, 3)
from employees;

--25.	Write a query to display the first name, last name, and the position of the first occurrence of the letter "a" in the last name of all employees.
select first_name, last_name, instr(last_name, 'a')
from employees;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------GROUP ROW FUNCTIONS---------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT MAX(SALARY) FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES;

SELECT MAX(SALARY) AS max_sal from employees;

SELECT MIN(SALARY) AS min_sal from employees;

SELECT SUM(SALARY) AS sum_sal from employees;

SELECT AVG(SALARY) as avg_sal from employees;

SELECT COUNT(*) FROM EMPLOYEES;

SELECT COUNT(salary) FROM EMPLOYEES;

SELECT COUNT(commission_pct) AS count FROM employees;

SELECT commission_pct FROM employees;

SELECT SUM(SALARY) / COUNT(*) as computed_avg, avg(salary) as native_avg FROM EMPLOYEES;

SELECT SUM(salary) + AVG(salary) as computed from employees;

SELECT SUM(salary) AS sum, AVG(SALARY) AS avg, MAX(salary) AS max, MIN(salary) AS min, COUNT(*) FROM employees;

-- 1. Write the query to find the count of employees if the employee first name has more than 4 characters.
select count (*)
from employees
where length(first_name) > 4; 

-- 2. Find the total number of employees whose names start with the letter 'A'.
select count (*)
from employees
where first_name like 'A%';

-- 3. Count how many employees have a salary above 5000.
select count (*)
from employees
where salary > 5000;

-- 4. Count how many employees have a commission percentage.
select count (*)
from employees
where commission_pct is not null;

-- 5. As we consider that given salaries are monthly, Write the query to find the total salary yearly.
select sum(salary*12)
from employees;

-- 6. Find the total salary of all employees whose salary is between 3000 and 6000.
select sum(salary)
from employees
where salary between 3000 and 6000;

-- Write a query to find those department_id they have count more than 3
select count (*), department_id
from employees
group by department_id
having count (*) > 3;

-- 1. Find the total number of employees in each department and list only those departments with more than 5 employees.
select count (*), department_id
from employees
group by department_id
having count (*) > 5;

-- 2. Calculate the average salary for each job title, but only include job titles where the average salary is greater than 6000.
select AVG(salary), job_id
from employees
group by job_id
having AVG(salary) > 6000;

-- 3. Find the highest salary in each department and list only those departments where the highest salary is less than 10000.
select department_id, MAX(salary)
from employees
group by department_id
having MAX(salary) < 10000

-- 4. For each department, calculate the total salary paid. Only include deparrtments where the total salary is more than 50000, 
--    and order the result by total salary in descending order.
select department_id, sum(salary)
from employees
group by department_id
having sum(salary) > 50000
order by sum(salary) desc;

-- 5. Find the total number of employees for each job title and list only those job titles that have more than 3 employees.
select job_id, count (*)
from employees
group by job_id
having count(*) > 3;

-- 6. Calculate the sum of the salaries for each department and only display those where the sum is between 20000 and 50000.
select department_id, sum(salary)
from employees
group by department_id
having sum(salary) between 20000 and 50000;

--07/03/2023
-- 1. Write a querty to find the departments where the maximum salary is more than 12000.
select department_id, max(salary)
from employees
group by department_id
having max(salary) > 12000;

-- 2. Write a querty to find out which job titles have an average salary greater than 5000.
select job_id, avg(salary)
from employees
group by job_id
having avg(salary) > 5000;

-- 3. Count the number of employees in each department, but only list those departments with more than 5 employees.
select count (*), department_id 
from employees
group by department_id
having count (*) > 5;


-- 4. Find out which job titles have more than one employee.
select count(*), job_id 
from employees
group by job_id
having count(*) > 1;


-- 5. Calculate the average salary for each department and display those departments where the average salary is above 7000.
select department_id, avg(salary)
from employees
group by department_id
having avg(salary) > 7000;

-- 6. List departments where the lowest salary is more than 2500.
select department_id, min(salary)
from employees
group by department_id
having min(salary) > 2500;

-- 7. Find the total salary paid for each job title, but only list those where the total salary is less than 30000.
select sum(salary), job_id
from employees
group by job_id
having sum(salary) < 30000;

-- 8. Calculate the total salary budget per year by department, and list departments with a yearly budget over 500000 dollars.
select sum(salary*12), department_id
from employees 
group by department_id
having sum(salary*12) > 500000;

-- 9. Find the average salary of each department and list those departments whose average salary is not equal to the minimum salary of that department.
select avg(salary), min(salary), department_id
from employees
group by department_id
having avg(salary) <> min(salary);

-- 10. Find the job titles where the difference between the maximum and minimum salary is greater than 4000.
select max(salary), min(salary), job_id
from employees
group by job_id
having (max(salary) - min(salary)) > 4000;

-- 11. Query to get manager_id and lowest paid employees for each manager and make sure that manager is not null and lowest salary is higher than 6000 and then order by lowest salaries descending
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by min(salary) desc;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------SUBQUERIES---------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM departments;

SELECT * FROM departments
WHERE department_id = 30;

SELECT * FROM departments
WHERE department_id = (SELECT department_id FROM departments WHERE department_id = 30);

SELECT * FROM departments
WHERE department_id < (SELECT department_id FROM departments WHERE department_id = 30);

SELECT * FROM departments
WHERE department_id < (SELECT department_id FROM departments WHERE department_id = 30)
AND department_name = 'Marketing';



SELECT * from DEPARTMENTS
WHERE department_id < 30
and department_name = 'Marketing';



SELECT * FROM ( SELECT * FROM departments);

SELECT * FROM ( SELECT * FROM employees);




SELECT * FROM departments;

-- Write a query and print those employees where their department_id are equal to 'Administration'

SELECT * FROM employees
WHERE department_id = 10;

SELECT * FROM employees
WHERE department_id = ( SELECT department_id FROM departments WHERE department_name = 'Administration');

-- NOTE: So, Administration information is not in the employees table,
-- we are kinda joining these 2 tables using this department_id because we know that
-- department_id is also in departments_table

SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments);

SELECT * FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_id in(10,20));

SELECT * FROM employees
WHERE department_id IN (SELECT department_id, location_id, department_name FROM departments WHERE department_id in(10,20));




SELECT job_id, first_name, ( SELECT job_id FROM employees) FROM employees;

SELECT job_id, first_name, ( SELECT job_id FROM employees WHERE first_name = 'Ellen') FROM employees;

-- 1. Write a query to get employees first_name and salary who makes more than employee who has employee_id 121 and then order by salary ascending.

SELECT first_name, salary FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE employee_id = 121);

-- 2. Write a query to get employees first_name, department_id who works in same department with employee who has employee_id 150.

SELECT first_name, department_id FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE employee_id = 150);

-- 3. Write a query to find second largest salary.

SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees));

-- 4. Write a query to get name of employees who is making second largest salary.

SELECT salary, first_name FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees));

-- 5. Write a query to get number of postal code under same countries from locations table.

SELECT * FROM locations;

SELECT country_id, count(postal_code) FROM locations
GROUP BY country_id;

-- 6. Write a query to get number of postal code under same countries from locations table if their count is more than 1.

SELECT country_id, COUNT(postal_code) FROM locations
GROUP BY country_id
HAVING COUNT(postal_code) > 2;

-- 7. Write a query to get all employees who is making more than average salary and order by salary.

SELECT first_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary;

-- 8. Write a query to get all cities which have same state with Toronto from locations table.

SELECT * FROM locations;

SELECT city FROM locations
WHERE state_province = ( SELECT state_province FROM locations WHERE state_province = 'Ontario');

SELECT city FROM locations
WHERE state_province = ( SELECT state_province FROM locations WHERE city = 'Toronto');

-- 9. Write a query to find the employee who is making second lowest salary.

SELECT salary, first_name FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees));

-- 1. Find all employees who earn more than the average salary.
select first_name, salary 
from employees
where salary > (select avg(salary)from employees);

-- 2. Find the employee names who have the highest salary.
select first_name, last_name, salary
from employees
where salary = (select max(salary) from employees);

-- 3. Find the names of departments that have more than 5 employees.
select department_id
from employees
where (select count(*) from employees group by department_id) > 5;

-- 4. Find the first name and last name of employees whose manager has a manager.
select first_name, last_name
from employees
where manager_id > (select 

-- 5. Find all departments where the total salary is above the company's average total salary by department.


-- 6. List employees who have the same job title as any employee in department 90, but are not themselves in department 90.


-- 7. Find the department ID which has the most number of employees.


-- 8. List all employees who have the same manager as the employee with the lowest salary.


-- 9. Find all employees whose salary is greater than the salary of all employees in department 10.

--========================================--
--================= JOINS ================--
--========================================--


SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM employees, departments
WHERE employees.department_id = departments.department_id
AND department_name = 'Marketing';

SELECT * FROM employees JOIN departments
ON employees.department_id = departments.department_id;

SELECT * FROM employees e JOIN departments d
ON e.department_id = d.department_id;


-- 1. Write the query to the print country name, country id, and region name for each country.

SELECT * FROM countries;

SELECT * FROM regions;

SELECT c.country_name, c.country_id, r.region_name FROM countries c JOIN regions r
ON c.region_id = r.region_id;

--2. Write the query to print the last name, email, and  job title for each employee.

SELECT * FROM EMPLOYEES;

SELECT * FROM JOBS;

SELECT e.last_name, e.email, j.job_title FROM employees e JOIN jobs j
ON e.job_id = j.job_id;



SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;


SELECT * FROM employees;

SELECT * FROM job_history;

SELECT * FROM employees e RIGHT JOIN job_history j
ON e.employee_id = j.employee_id;

SELECT * FROM employees e FULL OUTER JOIN job_history j
ON e.employee_id = j.employee_id;

SELECT * FROM employees e INNER JOIN job_history j
ON e.employee_id = j.employee_id;

SELECT e.first_name, j.start_date, j.end_date, e.hire_date
FROM employees e JOIN job_history j
ON e.employee_id = j.employee_id;


SELECT * FROM employees;

select e.first_name as employee, m.first_name as manager
from employees e join employees m
on e.manager_id = m.employee_id;


-- Write a query to print country name, country id and region name for each country


-- Write a query to print last name email and jon title for each employee




--1. Write a query to get count of employees for each manager and order by count of employees.

SELECT m.manager_id, COUNT(*) FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IS NOT NULL
GROUP BY m.manager_id
ORDER BY COUNT(*);

--2. Find the employees with the salary more than their managers salary (Interview question)

SELECT e.first_name, e.salary, m.salary AS manager_salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

--========================================--
--================= SQL Project ================--
--========================================--
--1.	Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary. 
select employee_id, first_name, last_name --, salary
from employees
where salary > (select avg(salary) from employees);

--2.	Write a query to display the employee name (first name and last name), employee id, and salary of all employees who report to Payam. 
select first_name, last_name, employee_id, salary --, manager_id 
from employees
where manager_id = (select manager_id from employees where first_name = 'Payam');

--3.	Write a query to display the department number, name (first name and last name), job_id and department name for all employees in the Finance department.
select e.department_id, first_name, last_name, job_id, department_name
from employees e
inner join departments d on e.department_id = d.department_id
where department_name = 'Finance';

--4.	Write a query to display all the information of the employees whose salary is within the range of the smallest salary and 2500.
select * 
from employees
where salary between (select min(salary)from employees) and 2500;

--5.	Write a SQL query to find the first name, last name, department, city, and state province for each employee.
select first_name, last_name, department_name, city, state_province
from employees e
inner join departments d on d.department_id = e.department_id
inner join locations l on l.location_id = d.location_id;

--6.Write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department number, and department name.
select first_name, last_name, e.department_id, department_name
from employees e 
inner join departments d on d.department_id = e.department_id
where e.department_id in (80, 40);

--7.Write a query to display the employee name (first name and last name) and hire date for all employees in the same department as Clara. Exclude Clara.
select first_name, last_name, hire_date --, department_id
from employees
where department_id = (select department_id from employees where first_name = 'Clara')
and first_name <> 'Clara';

--8.Write a query to display the employee number, name (first name and last name), and salary for all employees who earn more than the average salary and who work in a department with any employee with a J in their name.
select employee_id, first_name, last_name, salary
from employees
where salary > (select avg(salary) from employees)
and department_id in (select department_id from employees where first_name like 'J%');

--9.Write a SQL query to find those employees whose first name contains the letter ‘z’. Return first name, last name, department, city, and state province.
select first_name, last_name, department_name, city, state_province
from employees e
inner join departments d on d.department_id = e.department_id
inner join locations l on l.location_id = d.location_id
where first_name like '%z%';

--10.Write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.
select first_name, last_name, e.department_id, department_name
from employees e
right join departments d on d.department_id = e.department_id

--11.Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN.
select employee_id, first_name, last_name, job_title --, salary
from employees e
inner join jobs j on j.job_id = e.job_id
where e.salary < (select salary from employees where job_id = 'MK_MAN');

--12.Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any salary of those employees whose job title is PU_MAN. Exclude job title PU_MAN.
select employee_id, first_name, last_name, job_title --, salary
from employees e
inner join jobs j on j.job_id = e.job_id
where e.salary > (select salary from employees where job_id = 'PU_MAN')
and e.job_id <> 'PU_MAN';

--13.Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any average salary of any department.
select employee_id,(first_name || ' ' || last_name) AS name, job_title --, salary
from employees e
inner join jobs j on j.job_id = e.job_id
where e.salary > (SELECT max(avg(salary)) from employees group by department_id);

--14.Write a query to display the department id and the total salary for those departments which contains at least one employee.
select department_id, sum(salary) 
from employees
group by department_id
having count (*) > 0;

--15.Write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
select first_name, last_name, salary
from employees
where salary < (select salary from employees where employee_id = 182);

--16.Write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
select e.first_name as employee_name, m.first_name as manager_name
from employees e 
join employees m
on e.manager_id = m.employee_id;

--17.Write a SQL query to display the department name, city, and state province for each department.
select department_name, city, state_province
from departments d 
inner join locations l on l.location_id = d.location_id

--18.Write a query to identify all the employees who earn more than the average and who work in any of the IT departments.
select (first_name || ' ' || last_name) AS name, department_name, salary
from employees e
inner join departments d on d.department_id = e.department_id
where salary > (select avg(salary) from employees)
and department_name like '%IT%';

--19.Write a SQL query to find out which employees have or do not have a department. Return first name, last name, department ID, department name.
select first_name, last_name, e.department_id, department_name
from employees e
left join departments d ON e.department_id = d.department_id;

--20.Write a SQL query to find the employees and their managers. Those managers do not work under any manager also appear in the list. Return the first name of the employee and manager.
select e.first_name AS employee_name, m.first_name AS manager_name
from employees e
left join employees m on e.manager_id = m.employee_id

--21.Write a query to display the name (first name and last name) for those employees who gets more salary than the employee whose ID is 163.
select (first_name || ' ' || last_name) AS name --, salary
from employees 
where salary > (select salary from employees where employee_id = 163);

--22.Write a query to display the name (first name and last name), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 169.
select (first_name || ' ' || last_name) AS name, salary, e.department_id, job_id --, city
from employees e
inner join departments d on d.department_id = e.department_id
inner join locations l on l.location_id = d.location_id
where city = (select city from locations l inner join departments d on d.location_id = l.location_id inner join employees e on e.department_id = d.department_id where e.employee_id = 169);

--23.Write a SQL query to find the employees who work in the same department as the employee with the last name Taylor. Return first name, last name and department ID.
select first_name, last_name, department_id
from employees
where department_id in (select department_id from employees where last_name = 'Taylor');

--24.Write a SQL query to find the department name and the full name (first and last name) of the manager.
select department_name, (first_name || ' ' || last_name) as full_name
from departments d
inner join employees e on d.manager_id = e.employee_id

--25.Write a SQL query to find the employees who earn $12000 or more. Return employee ID, starting date, end date, job ID and department ID.
select e.employee_id, start_date, end_date, e.job_id, e.department_id, salary
from employees e
inner join job_history jh on jh.employee_id = e.employee_id
where salary >= 12000

--26.Write a query to display the name (first name and last name), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.
select (first_name || ' ' || last_name) as name, salary, department_id
from employees
where salary = (select min(min(salary))from employees group by department_id);

--27.Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121, respectively.
select * 
from employees
where salary = 3000
and manager_id = 121

--28.Display the employee name (first name and last name), employee id, and job title for all employees whose department location is Toronto.
select (first_name || ' ' || last_name) as name, employee_id, job_title --, city
from employees e
inner join jobs j on j.job_id = e.job_id
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
where city = 'Toronto'

--29.Write a query to display the employee name( first name and last name ) and department for all employees for any existence of those employees whose salary is more than 3700.
select (first_name || ' ' || last_name) as name, department_name --, salary
from employees e
inner join departments d on d.department_id = e.department_id
where salary > 3700;

--30.Write a query to determine who earns more than employee with the last name 'Russell'.
select (first_name || ' ' || last_name) as name --, salary
from employees
where salary > (select max(salary) from employees where last_name = 'Russell')

--31.Write a query to display the names of employees who don't have a manager.
select (first_name || ' ' || last_name) as name
from employees
where manager_id is null;

--32.Write a query to display the names of the departments and the number of employees in each department.
select department_name, count (*)
from employees e
inner join departments d on d.department_id = e.department_id
group by department_name

--33.Write a query to display the last name of employees and the city where they are located.
select last_name, city 
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id;

--34.Write a query to display the job titles and the average salary of employees for each job title.
select job_title, avg(salary)
from employees e
inner join jobs j on j.job_id = e.job_id
group by job_title;

--35.Write a query to display the employee's name, department name, and the city of the department.
select first_name, department_name, city
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id;

--36.Write a query to display the names of employees who do not have a department assigned to them.
select first_name, last_name
from employees
where department_id is null;

--37.Write a query to display the names of all departments and the number of employees in them, even if there are no employees in the department.
select department_name, count(e.employee_id)
from departments d
left join employees e on d.department_id = e.department_id
group by department_name

--38.Write a query to display the names of employees and the department names, but only include employees whose salary is above 10,000.
select first_name, last_name, department_name
from employees e
inner join departments d on e.department_id = d.department_id
where salary > 10000;

--39.Write a query to display department names and the average salary within each department, but only for departments with an average salary above 7000.
select d.department_name, avg(salary)
from departments d
inner join employees e on e.department_id = d.department_id
group by d.department_name
having avg(salary) > 7000;

--40.Write a query to display the names of employees who work in the 'IT' department.
select first_name, last_name --, department_name
from employees e 
inner join departments d on e.department_id = d.department_id
where department_name = 'IT';

--41.Write a query which is looking for the names of all employees whose salary is greater than 50% of their department’s total salary bill.
select first_name, last_name 
from employees e 
where salary > (select (SUM(salary))*0.5 from employees e1 where e.department_id = e1.department_id);

--42.Write a query to get the details of employees who are managers.
select * 
from employees e
inner join employees m on m.manager_id = e.employee_id;

--43.Write a query in SQL to display the department code and name for all departments which located in the city London.
select department_id, department_name --, city
from departments d
inner join locations l on d.location_id = l.location_id
where city = 'London'

--44.Write a query in SQL to display the first and last name, salary, and department ID for all those employees who earn more than the average salary and arrange the list in descending order on salary.
select first_name, last_name, salary, department_id
from employees
where salary > (select avg(salary) from employees)
order by salary desc;

--45.Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn more than the maximum salary of a department which ID is 40.
select first_name, last_name, salary, department_id
from employees
where salary > (select max(salary) from employees where department_id = 40);

--46.Write a query in SQL to display the department name and Id for all departments where they located, that Id is equal to the Id for the location where department number 30 is located.
select department_name, department_id --, location_id
from departments 
where location_id = (select location_id from departments where department_id = 30);

--47.Write a query in SQL to display the details of departments managed by Susan.
select *
from departments
where manager_id = (select employee_id from employees where first_name = 'Susan');

--48.Write a query to display the department names and the location cities. Only include departments that are located in a country with the country_id 'US'.
select department_name, city --, c.country_id
from departments d
inner join locations l on d.location_id = l.location_id
inner join countries c on c.country_id = l.country_id
where c.country_id = 'US';

--49.Write a query to display the first name and last name of employees along with the name of the department they work in. Only include employees whose last name starts with the letter 'S'.
select first_name, last_name, department_name
from employees e
inner join departments d ON e.department_id = d.department_id
where e.last_name like 'S%';

--50.Write a query to display the department names and the number of employees in each department. Only include departments with more than 2 employees, and order the result by the number of employees in descending order.
select department_name, count(*)
from employees e 
inner join departments d on e.department_id = d.department_id
group by department_name
having count(*) > 2
order by count(*) desc
