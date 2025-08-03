-- 176. Second Highest Salary

------------------------------------------ Question  ------------------------------------------
-- Write a solution to find the second highest distinct salary from the Employee table. 
-- If there is no second highest salary, return null.


------------------------------------------ Intuition ------------------------------------------
-- Sort the distinct salary in descend order and then utilize the LIMIT clause to get the second highest salary


------------------------------------------ Solution 1 ------------------------------------------
SELECT (
	      SELECT DISTINCT salary
	      FROM employee
	      ORDER BY salary DESC
	      LIMIT 1 
	      OFFSET 1) AS SecondHighestSalary;

-- Notes: if we don’t use the temp table embedded with the subquery, the solution will be judged as wrong 
--        if there is no such second highest salary since there might be only one record in this table.


------------------------------------------ Solution 2 ------------------------------------------
SELECT MAX(salary) AS SecondHighestSalary
FROM employee
WHERE salary != (SELECT MAX(salary) FROM employee)


------------------------------------------ BL Notes ------------------------------------------
-- WHERE clause is used to filter records based on specific conditions, allowing you to retrieve, update, 
-- or delete only the data that meets certain criteria. The following can be used in a WHERE clause: 
-- (1) column name 
-- (2)comparison operators (=, !=, >, <, etc.) 
-- (3) logical operators (AND, OR, NOT) 
-- (4) special operators (BETWEEN… AND…, LIKE, IN, IS NULL/IS NOT NULL) 
-- (5) arithmetic expressions (+, -, *, /) 
-- (6) Subqueries (subqueries are queries nested within the WHERE (or HAVING or FROM) clause of another query. 


-- LIMIT clause is used to restrict the number of rows and retrieves the first n rows. L
-- IMIT m, 1 takes the next 1 row starting from the Mth row (indexed from 0). 

-- OFFSET clause would skip the first n rows.
