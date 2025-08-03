-- 183. Customers Who Never Order

------------------------------------------ Question ------------------------------------------
-- Write a solution to find all customers who never order anything.


------------------------------------------ Intuition ------------------------------------------ 
-- Find out the customer IDs that are not in the order table. It can be done through NOT IN clause or by a LEFT JOIN.


------------------------------------------ Solution 1 ------------------------------------------
-- NOT IN
SELECT *
FROM customers c
WHERE c.ID NOT IN (SELECT customerid FROM orders)


------------------------------------------ Solution 2 ------------------------------------------
-- LEFT JOIN
SELECT *
FROM customers c
LEFT JOIN orders o
            ON c.ID = o.customerid
WHERE o.customerid IS NULL


