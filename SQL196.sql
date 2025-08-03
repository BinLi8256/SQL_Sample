-- 196. Delete Duplicate Emails

------------------------------------------ Question ------------------------------------------
-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id. 
-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

------------------------------------------ Intuition ------------------------------------------ 
-- We need to find which email is duplicated and delete them with larger IDs. We can make the IDs 
-- in two columns and delete the larger ones.

-- We can use self join and then delete the larger IDs. Remember, we delete the whole table to 
-- keep the original columns, ID and email.


------------------------------------------ Solution ------------------------------------------
DELETE P1
FROM person p1, person p2
WHERE p1.email = p2.email
     AND p1.ID > p2.ID


------------------------------------------ BL Notes ------------------------------------------