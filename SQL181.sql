-- 181. Employees Earning More Than Their Managers

------------------------------------------ Question ------------------------------------------
-- Write a solution to find the employees who earn more than their managers.


------------------------------------------ Intuition ------------------------------------------ 
-- As this table has the employee’s manager information, we need to select both managers’ and employees’ information. 
-- We need two pieces information, managers’ income and employees’ income, in one row in order to compare the values row-wise. 
-- A common way to do so is to create a Cartesian Product of the table or to use self join. Then we can filter on manager id and salary.


------------------------------------------ Solution 1 ------------------------------------------
-- self-join
SELECT e1.ID
FROM employee e1, employee e2
WHERE e1.managerID = e2.ID
     AND e1.salary > e2.salary
	 
------------------------------------------ Solution 2 ------------------------------------------
-- cross-join
SELECT e1.ID
FROM employee e1
CROSS JOIN employee e2
                ON e1.managerID = e2.ID AND e1.salary > e2.salary

	 
------------------------------------------ BL Notes ------------------------------------------
-- A Cartesian Join is CROSS JOIN which returns the Cartesian product of two tables, 
-- meaning each row from the first table is combined with every row from the second table. 
-- This type of join does not require any specific condition or matching column between the two tables.

-- SELF JOIN is similar to Cartesian Join. It is a join where a table is joined with itself. 
-- This type of join can be useful when we need to compare rows within the same table, 
-- such as when we want to join records from the same table based on some condition. 
