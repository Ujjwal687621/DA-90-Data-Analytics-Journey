-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 07
-- Topic: Introduction to Subqueries
-- Author: Ujjwal Poudel
-- =========================================================

/*
===========================================================

BUSINESS REQUIREMENT

Today's objective was to introduce subqueries and understand
how SQL can execute one query inside another to answer more
complex business questions.

Concepts Practiced

✔ Scalar Subqueries
✔ List Subqueries
✔ WHERE vs HAVING review
✔ Reading nested SQL
✔ Business reasoning before coding

===========================================================
*/

------------------------------------------------------------
-- Example 1
-- Transactions Greater Than Average Transaction Amount
------------------------------------------------------------

SELECT
    transaction_id,
    customer_id,
    amount,
    transaction_date,
    description
FROM transactions
WHERE amount >
(
    SELECT AVG(amount)
    FROM transactions
);

------------------------------------------------------------
-- Example 2
-- Customers With Pending Transactions
------------------------------------------------------------

SELECT
    customer_name,
    country
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM transactions
    WHERE status = 'Pending'
);

------------------------------------------------------------
-- Example 3
-- Customers With No Completed Transactions
------------------------------------------------------------

SELECT
    customer_name,
    country
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM transactions
    WHERE status = 'Completed'
);

------------------------------------------------------------
-- Concepts Learned
------------------------------------------------------------

-- Scalar Subquery
-- Returns a single value.
--
-- Example:
-- SELECT AVG(amount)
-- FROM transactions;

------------------------------------------------------------

-- List Subquery
-- Returns multiple rows.
--
-- Example:
-- SELECT customer_id
-- FROM transactions
-- WHERE status = 'Completed';

------------------------------------------------------------

-- Difference

-- Scalar Subquery
-- Used with:
-- >
-- <
-- =
-- >=
-- <=

------------------------------------------------------------

-- List Subquery
-- Used with:
-- IN
-- NOT IN

------------------------------------------------------------

-- Review

-- WHERE filters rows.

-- HAVING filters groups.

-- If no GROUP BY or aggregate filtering is required,
-- WHERE should normally be used.

------------------------------------------------------------

-- Tomorrow

-- Average Customer Spending

-- This requires:
-- 1. Calculate each customer's total spending.
-- 2. Calculate the average of those totals.
-- 3. Return customers above that average.