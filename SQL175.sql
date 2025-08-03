-- 175. Combine Two Tables

------------------------------ Question ----------------------------------- Write a solution to report the first name, last name, city, and state of each person in the Person  table. If the address of a personId is not present in the Address table, report null instead.


 ----------------------------- Intuition -------------------------------- Since the PersonId in the table Address is the foreign key of table Person, we can join the two tables to get the address information of a person. Considering there might be no address information for every person, we should use OUTER JOIN instead of the default INNER JOIN.

 ------------------------------ Solution --------------------------------
 SELECT first name, last name, city, state
 FROM person p
 LEFT JOIN address a
             ON p.PersonID. = a.PersonID


 ------------------------------ BL Notes -------------------------------- Primary key is a special column in a database table that uniquely identified each row/record with that table                                                                                                    (1) Unique values                                                     (2) No NULL values                                                   (3) Only one per table.                                                                                                                   Foreign Key is a column that is used to link to the primary key in another table. Every value in the foreign key column must correspond to an existing value in the primary key column.                                                                                               Left Join is also known as LEFT OUTER JOIN. It is used to combine rows from two tables based on a related column between them.                                                                                     (1) it returns all records from the “left” table                      (2) it returns the matching records from the “right” table           (3) if there is no match in the right table for a given row in the left table, the result will still include the row from the left table, but the columns from the right table will contain NULL values.
 