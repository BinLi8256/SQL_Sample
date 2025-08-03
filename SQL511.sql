-- 511. Game Play Analysis I

------------------------------------------ Question ------------------------------------------
-- Write a solution to find the first login date for each player


------------------------------------------ Intuition ------------------------------------------ 



------------------------------------------ Solution ------------------------------------------
SELECT player_id,
              MIN(event_date) AS first_login
FROM activity
GROUP BY player_id

------------------------------------------ BL Notes ------------------------------------------