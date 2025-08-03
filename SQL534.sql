-- 534. Game Play Analysis III

------------------------------------------ Question ------------------------------------------
-- Write a solution to report for each player and date, how many games played so far by the player. 
-- That is, the total number of games played by the player until that data.

------------------------------------------ Intuition ------------------------------------------ 
-- If you ever hear running or rolling anything (e.r. running sum, running count or total, 
-- rolling average, etc) in the context of retrieving data with SQL, then use of a window function 
-- will almost always be relevant.

-- Since we are asked to keep a running total of the number of games played so far for each 
-- player up until each date, we can use the SUM( ) window function over the games_played field 
-- to give us our desired result set.


------------------------------------------ Solution ------------------------------------------
SELECT player_id, event_date,
       SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM activity

------------------------------------------ BL Notes ------------------------------------------