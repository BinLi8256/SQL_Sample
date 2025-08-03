-- 178. Rank Scores

------------------------------------------ Question ------------------------------------------
-- Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:
-- (1) The scores should be ranked from the highest to the lowest
-- (2) If there is a tie between two scores, both should have the same ranking
-- (3) After a tie, the next ranking number should be the next consecutive integer value. In other words, 
--     there would be no holes between ranks.
-- Return the result table ordered by score in descending order.


------------------------------------------ Intuition ------------------------------------------
-- A window function performs an aggregate-like operation on a set of quay rows. However, 
-- where an aggregate operation groups query rows into a single result row, 
-- a window function produces a result for each query row.

-- DENSE_RANK( ) returns the rank of the current row within its partition, without gaps. 
-- Peers are considered ties and receive the same rank. This function assigns consecutive ranks to peer groups.


------------------------------------------ Solution ------------------------------------------
SELECT score,
 	   DENSE_RANK( ) OVER ( ORDER BY score DESC) AS “rank”
FROM scores


------------------------------------------ BL Notes ------------------------------------------
-- DENSE_RANK( ) syntax: DENSE_RANK( ) OVER (  [PARTITION BY col1, col2] ORDER BY col3 [ASC|DESC] )
-- (1) no gaps in ranking
-- (2) Ranking within partition (partition by is optional)
-- (3) ORDER BY is mandatory: an ORDER BY clause is essential within the OVER clause to determine the order in which rows are ranked within each partition or the entire result set
-- (4) how it differs from RANK( ) and ROW_NUMBER( )
      -- +  DENSE_RANK( ) assigns the same rank to rows with identical values and does not skips ranks for the subsequent rows
      -- + RANK( ) assigns the same rank to rows with identical value, but skips ranks for subsequent rows after a tie
	  -- + ROW_NUMBER( ) assigns a unique sequential number to each row, regardless of whether there are identical values 