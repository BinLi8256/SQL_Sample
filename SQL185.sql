-- 185. Department Top Three Salaries

------------------------------------------ Question ------------------------------------------
-- A company’s executives are interested in seeing who earns the most money in each of the company’s department. 
-- A high earner in a department is an employee who has a salary in the top three unique salaries that department.

-- Write a solution to find the employees who are high earners in each of the departments.



------------------------------------------ Intuition ------------------------------------------ 
-- Similar to last problem. We need to find out the top 3 salaries in each department. 
-- We sort the salaries in descending order, ranked employees based on their salaries within the department, 
-- and selected only the first 3 employees for the final output.

-- Since the definition of a high earner is the employee who has a salary in the top three unique 
-- salaries for the department, we can use the function DENSE_RANK( ) to avoid the scenario that employees 
-- from the same department make the same amount of salary.



------------------------------------------ Solution ------------------------------------------
SELECT Department, Employee, Salary
FROM(
 	- -  step 1
	SELECT e.name AS Employee,
	   	e.salary AS Salary,
	   	d.name AS Department,
              	DENSE_RANK( ) OVER (PARTITION BY departmentID ORDER BY salary DESC) AS sa_rank
	FROM employee e
	LEFT JOIN department d
		ON e.departmentID = d.ID ) t
WHERE sa_rank <= 3



------------------------------------------ BL Notes ------------------------------------------