-- 512. Game Play Analysis II

------------------------------------------ Question ------------------------------------------
-- Write a solution to report the device that is first logged in for each player


------------------------------------------ Intuition ------------------------------------------ 



------------------------------------------ Solution 1 -----------------------------------------
-- MIN( ) OVER (PARTITION BY …)
SELECT player_id, device_id
FROM 
(SELECT *,
        MIN(event_date) OVER (PARTITION BY player_id) AS first_login
FROM activity) t
WHERE event_date = first_login

------------------------------------------ Solution 2 -----------------------------------------
-- FIRST_VALUE( ) OVER (PARTITION BY … ORDER BY …)
SELECT DISTINCT player_id,
       FIRST_VALUE(device_id) OVER (PARTITION BY player_id ORDER BY event_date) AS device_id
FROM activity

------------------------------------------ BL Notes ------------------------------------------
-- FIRST_VALUE( ) is a window function that returns the value of the given expression 
-- from the first row of the window frame.