###JOINS
-- The term Relational Database refers to the fact that tables within it relate to one another.
-- In this lesson we will learn how to leverage SQL to link tables together.
-- We are going to learn how to write what are known as joints  
-- Quiz - Try pulling standard_qty, gloss_qty, and poster_qty from the 
-- orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, 
       orders.poster_qty,  accounts.website, 
       accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
-- Primary Key
-- The primary key is a single column that must exist in each table of a database.
--  Again, these rules are true for most major databases, but some databases may not enforce these rules.
--NOTE
-- Notice our SQL query has the two tables we would like to join - one in the FROM and the other in the JOIN. 
-- Then in the ON, we will ALWAYs have the PK equal to the FK:
-- The way we join any two tables is in this way: linking the PK and FK (generally in an ON statement).
-- The actual ordering of which table name goes first in this statement doesn't matter so much. So, we
--  could also write ON region.id = sales_reps.region_id
###JOIN More than Two Tables
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id
