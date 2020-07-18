###Aggregations 
##Count
-- Counts , how many rows are in a particular column.
##Sum
Sum adds together all the values in a particular column.
###MIN AND MAX
-- Return the lowest and highest value of a particular column
###Average
-- Average , calculates the average pf all the values in a particular column.
###NULLS
-- Nulls means no data . It's different from a zero or space
-- When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.
###COUNT
-- Here is an example of finding all the rows in the accounts table.
SELECT COUNT(*)
FROM accounts;
-- But we could have just as easily chosen a column to drop into the aggregation function:
SELECT COUNT(accounts.id)
FROM accounts;
-- These two statements are equivalent, but this isn't always the case, which we will see in the next video.
-- Notice that COUNT does not consider rows that have NULL values. Therefore, this can be useful for quickly identifying which rows
--  have missing data. You will learn GROUP BY in an upcoming concept, and then each of these aggregators will become much more useful.
###Aggregation Reminder
-- An important thing to remember: aggregators only aggregate vertically - the values of a column. If you want to perform a calculation across rows, you would do this with 
-- simple arithmetic.
-- Find the total amount of poster_qty paper ordered in the orders table.

SELECT SUM(poster_qty) AS total_poster_sales
FROM orders;
-- Though the price/standard_qty paper varies from one order to the next. I would like this ratio across all of the sales made in the orders table.

-- Notice, this solution used both an aggregate and our mathematical operators

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;
###MIN AND MAX
-- Functionally, MIN and MAX are similar to COUNT in that they can be used on non-numerical columns. Depending on the column type, MIN will 
-- return the lowest number, earliest date, or non-numerical value as early in the alphabet as possible. As you might suspect, MAX does the
--  opposite—it returns the highest number, the latest date, or the non-numerical value closest alphabetically to “Z.”
###AVG
-- Similar to other software AVG returns the mean of the data - that is the sum of all of the values in the column divided by the 
-- number of values in a column. This aggregate function again ignores the NULL values in both the numerator and the denominator.
MEDIAN - Expert Tip
--One quick note that a median might be a more appropriate measure of center for this data, but finding the median happens to 
--be a pretty difficult thing to get using SQL alone — so difficult that finding a median is occasionally asked as an interview question.
When was the earliest order ever placed? You only need to
return the
date.
SELECT MIN(occurred_at)
FROM orders

-- Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1;
-- When did the most recent (latest) web_event occur?
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;
###GROUP BY
-- The key takeaways here:
-- GROUP BY can be used to aggregate data within subsets of the data. For example, grouping for different accounts, different regions, or different sales representatives.
-- Any column in the SELECT statement that is not within an aggregator must be in the GROUP BY clause.
-- The GROUP BY always goes between WHERE and ORDER BY.
-- ORDER BY works like SORT in spreadsheet software.0