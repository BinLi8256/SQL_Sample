-- 197. Rising Temperature

------------------------------------------ Question ------------------------------------------
-- Write a solution to find all dates’ id with higher temperatures compared to its previous dates(yesterday).


------------------------------------------ Intuition ------------------------------------------ 
-- This needs a row comparison to compare the dates and temperature. The solution is a sep-join.

-- By doing a self-join on the weather table, we create a Cartesian product of the table with itself, 
-- creating pairs of days. We then use the DATEDIFF function to restrict the pairs to only include 
-- consecutive days. Lastly, we filter these pairs of consecutive days further to only include pairs 
-- where the temperature is higher on the second day.


------------------------------------------ Solution ------------------------------------------
SELECT w2.ID
FROM   weather w1, weather w2
WHERE DATEDIFF(w1.date, w2.date) = -1
     AND w1.temperature < w2.temperature


------------------------------------------ BL Notes ------------------------------------------
-- DATEDIFF( date1, date2) returns the number of days between date1 and date2. It is (date1 - date2).    