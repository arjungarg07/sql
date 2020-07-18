###LIMITS
-- Try using LIMIT yourself below by writing a query that displays all the data in the occurred_at,
--  account_id, and channel columns of the web_events table, and limits the output to only the first 15 rows.
SELECT occurred_at,account_id,channel 
FROM web_events 
LIMIT 15;
###ORDER BY
-- The ORDER BY statement always comes in a query after the SELECT and FROM statements, but before the LIMIT statement.
-- Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;
-- Remember DESC can be added after the column in your ORDER BY statement to sort in descending order, as the default is to sort in ascending order.
-- Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;
--  we can ORDER BY more than one column at a time. When you provide a list of columns in an ORDER BY command, the sorting occurs 
--  using the leftmost column in your list first, then the next column from the left, and so on. We still have the ability to flip
-- the way we order using DESC.
SELECT id , account_id , total_amt_usd
FROM orders
ORDER BY account_id,total_amt_usd DESC;
###WHERE
-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT *
FROM orders
WHERE gloss_amt_usd>=1000
LIMIT 10 ;
###WHERE with non-numeric data
-- The WHERE statement can also be used with non-numeric data. We can use the = and != operators here. You need to be sure to use single quotes
--  (just be careful if you have quotes in the original text) with the text data, not double quotes.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';
###Arithmetic Operators
####Derived Columns
-- Creating a new column that is a combination of existing columns is known as a derived column (or "calculated" or "computed" column).Usually you 
-- want to give a name, or "alias," to your new column using the AS keyword.
SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;
-- Here we divide the standard paper dollar amount by the total order amount to find the standard paper percent for the order, and use the AS keyword 
-- to name this new column "std_percent." You can run this query on the next page if you'd like, to see the output.
###LIKE
-- The LIKE operator is extremely useful for working with text. You will use LIKE within a WHERE clause. The LIKE operator is frequently used with %. 
-- The % tells us that we might want any number of characters leading up to a particular set of characters or following a certain set of characters, 
-- as we saw with the google syntax above.
-- select All companies whose names end with 's'.
SELECT * 
FROM accounts
WHERE name LIKE '%s';
###IN 
-- The in function will allow you to filter data based on several possilble values.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');
###NOT
-- Provides the inverse results for IN,LIKE,AND similar operations.
-- The NOT operator is an extremely useful operator for working with the previous two operators we introduced: IN and LIKE. By specifying NOT LIKE 
-- or NOT IN, we can grab all of the rows that do not meet a particular criteria.
-- Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');
-- All the companies whose names do not start with 'C'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';
###AND and BETWEEN 
-- The AND operator is used within a WHERE statement to consider more than one logical clause at a time.
-- WHERE column >= 6 AND column <= 10 
-- we can instead write, equivalently:
-- WHERE column BETWEEN 6 AND 10
-- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;
-- Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';
###OR
-- Similar to the AND operator, the OR operator can combine multiple statements. Each time you link a 
-- new statement with an OR, you will need to specify the column you are interested in looking at.
-- OR can be combined with other operators for using parentheses
-- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;
--  Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');