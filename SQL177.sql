-- 177. Nth Highest Salary

------------------------------------------ Question  ------------------------------------------
-- Write a solution to find the nth highest distinct salary from the Employee table. 
-- If there are less than n distinct salaries, return null.


------------------------------------------ Intuition ------------------------------------------ 
-- This task requires to find the nth highest salary from the employee table. 
-- If there is no nth highest salary, the query should return null. 
-- This implies that we have to order the salary column in descending order and pick the nth entry. 

--Note that in SQL, the order of execution for the clauses in a query is generally as follows:
-- (1) FROM clause: this specifies the tables from which data will be retrieved
-- (2) WHERE clause: this filters the rows based on a specified condition
-- (3) GROUP BY clause: this groups rows based on a specified column or expression
-- (4) HAVING clause: this filters the grouped rows based on a condition
-- (5) SELECT clause: this selects the columns or expressions that will be returned in the result set
-- (6) ORDER BY clause: this sorts the result set based on a specified column or expression
-- (7) LIMIT/OFFSET clause: this limits the number of rows returned in the result set

------------------------------------------ Solution ------------------------------------------ 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
	SET M = N-1;
RETURN (
	SELECT DISTINCT salary
	FROM employee
	ORDER BY salary DESC
	LIMIT M, 1
);
END

------------------------------------------ BL Notes ------------------------------------------ 
CREATE FUNCTION function_name (para1 INT, para2 INT)
RETURNS INT
AS
BEGIN
	DECLARE para3
	SELECT para3 = para1 + para2*percent
	FROM table1
	
	RETURN para3
END;
