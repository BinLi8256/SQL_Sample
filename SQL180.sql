-- 180. Consecutive Numbers


------------------------------------------ Question ------------------------------------------
-- Find all numbers that appear at least three times consecutively. Return the result table in any order.


------------------------------------------ Intuition ------------------------------------------
-- Consecutive appearing means the Id of the Num are next to each others. 
-- Since this problem asks for numbers appearing at least three times consecutively, 
-- we can use 3 aliases for this table Logs, and then check whether 3 consecutive numbers are all the same.

-- Then, we can select any Num column from three tables to get the target data. 
-- However, we need to add a keyword DISTINCT because it will display a duplicated number if one number appears more than 3 times consecutively.


------------------------------------------ Solution ------------------------------------------
SELECT *
FROM logs l1, logs l2, logs l3
WHERE l1.id = l2.id-1
     AND l2.id = l3.id-1
     AND l1.num = l2.num
     AND l2.num = l3.num
	


