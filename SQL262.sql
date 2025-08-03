-- 262. Trips and Users

------------------------------------------ Question ------------------------------------------
-- The cancellation rate is computed by dividing the number of canceled (by client or driver) 
-- requests with unbanned users by the total number of requests with unbanned users on that day.

-- Write a solution to find the cancellation rate of requests with unbanned users 
-- (both client and driver must not be banned) each day between “2013-10-01” and “2013-10-03” 
-- with at least one trip. Round cancellation rate to two decimal points.


---------------------------------------- Intuition (BL) -------------------------------------- 
-- Step 1: filter out days and banned users
-- Step 2: count cancellations by day
-- Step 3: count total orders by day

------------------------------------------ Solution ------------------------------------------
SELECT request_at AS Day, 
-- step 2/step 3
       ROUND(SUM(status != ‘completed')/COUNT(*), 2) AS "Cancellation Rate"
FROM trips
-- step1
WHERE request_at IN ('2013-10-01', '2013-10-02', '2013-10-03')
  AND client_id NOT IN (SELECT users_id FROM users WHERE role = 'client' AND banned = 'Yes')
  AND driver_id NOT IN (SELECT users_id FROM users WHERE role = 'driver' AND banned = ‘Yes')
-- step 2 and step 3
GROUP BY request_at


------------------------------------------ BL Notes ------------------------------------------
-- SUM(conditions) can be used in calculation directly.