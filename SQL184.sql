-- 184. Department Highest Salary

------------------------------------------ Question ------------------------------------------
-- Write a solution to find employees who have the highest salary in each of the departments.


------------------------------------------ Intuition ------------------------------------------ 
-- We need to find the max salary in each department with the salary table. 
-- Then, join the department table to get the department name. 
-- It can be done using LEFT JOIN or Window Function.



------------------------------------------ Solution 1 ------------------------------------------
-- LEFT JOIN
SELECT d.name AS ‘Department’,
	   e.name AS ‘Employee’,
	   Salary
FROM employee e
LEFT JOIN department d
            ON e.departmentID = d.Id
WHERE (departmentID, salary) IN (
	  				- - step 1
					SELECT departmentID, MAX(salary) 
            				FROM employee 
            				GROUP BY departmentID)


------------------------------------------ Solution 2 ------------------------------------------
-- WINDOW FUNCTION
SELECT Department,
              Employee,
	  Salary
FROM(
  	 - - Step 1
	SELECT e.name AS Employee,
	   	   e.salary AS Salary,
	   	   d.name AS Department
              	   MAX(salary) OVER (PARTITION BY departmentID) AS depart_max
	FROM employee e
	LEFT JOIN department d
		ON e.departmentID = d.id) t
WHERE salary = t.depart_max


------------------------------------------ BL Notes ------------------------------------------
-- WHERE (var1, var2) represents a tuple or row value constructor. 
-- It allows you to group multiple column values together for comparison against other tuples. 
-- It allows for more efficient querying when you need to filter data based on combinations of 
-- column values rather than individual ones