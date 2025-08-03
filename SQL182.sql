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
/Users/bl/Desktop/Screenshot 2025-08-03 at 2.54.43 PM.png