-- 182. Duplicate Emails

------------------------------------------ Question ------------------------------------------
-- Write a solution to report all the duplicate emails. Note that it is guaranteed that the email field is not NULL.


------------------------------------------ Intuition ------------------------------------------ 
-- We need to count the exists of each email. We can use GROUP BY or HAVING


------------------------------------------ Solution 1 ------------------------------------------
-- GROUP BY
SELECT email
FROM 
	(SELECT email, COUNT(email) AS cnt FROM person GROUP BY email)
WHERE cnt > 1

------------------------------------------ Solution 2 ------------------------------------------
-- HAVING
SELECT email
FROM person
GROUP BY email
HAVING COUNT(email) > 1


------------------------------------------ BL Notes ------------------------------------------
-- Difference between WHERE and HAVING
----------------------------------------------------------------------------------------------
--                WHERE                                     HAVING
----------------------------------------------------------------------------------------------
-- filters rows before aggregation           |   filters groups after aggregation
-- implements in row operations              |   implements in column operation
-- cannot contain aggregate function         |   can contain aggregate function
-- can be used with SELECT, UPDATE, DELETE   |   can only be used with SELECT
-----------------------------------------------------------------------------------------------
