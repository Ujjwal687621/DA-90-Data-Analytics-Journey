-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 06
-- Topic: Common Table Expressions (CTEs), Window Functions,
--        Business Reporting & SQL Assessment
-- Author: Ujjwal Poudel
-- =========================================================

/*
===========================================================

BUSINESS REQUIREMENT

Today's work focused on solving realistic business requests
using SQL. Instead of learning isolated syntax, each problem
required selecting the correct SQL techniques based on the
business requirement.

Concepts Practiced

✔ Common Table Expressions (CTEs)
✔ ROW_NUMBER()
✔ PARTITION BY
✔ CASE
✔ COALESCE()
✔ LEFT JOIN
✔ INNER JOIN
✔ GROUP BY
✔ HAVING
✔ COUNT()
✔ AVG()
✔ SUM()

===========================================================
*/

------------------------------------------------------------
-- Ticket #1
-- Countries with More Than One Completed Transaction
------------------------------------------------------------

SELECT
    c.country,
    COUNT(t.transaction_id) AS completed_transactions
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
   AND t.status = 'Completed'
GROUP BY
    c.country
HAVING COUNT(t.transaction_id) > 1
ORDER BY
    completed_transactions DESC;

------------------------------------------------------------
-- Ticket #2
-- Completed Transactions by Customer
------------------------------------------------------------

SELECT
    c.customer_name,
    c.country,
    COUNT(t.transaction_id) AS completed_transactions
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
   AND t.status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.country
ORDER BY
    completed_transactions DESC,
    c.customer_name ASC;

------------------------------------------------------------
-- Ticket #3
-- Customer Loyalty Report
------------------------------------------------------------

SELECT
    c.customer_name,
    c.country,
    COALESCE(SUM(t.amount),0) AS total_completed_spending,
    CASE
        WHEN COALESCE(SUM(t.amount),0) >= 300 THEN 'Platinum'
        WHEN COALESCE(SUM(t.amount),0) >= 100 THEN 'Gold'
        WHEN COALESCE(SUM(t.amount),0) > 0 THEN 'Silver'
        ELSE 'No Activity'
    END AS loyalty_tier
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
   AND t.status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.country
ORDER BY
    total_completed_spending DESC;

------------------------------------------------------------
-- Ticket #4
-- Second Highest Spending Customer by Country
------------------------------------------------------------

WITH customer_spending AS (

    SELECT
        c.country,
        c.customer_name,
        COALESCE(SUM(t.amount),0) AS total_completed_spending,
        ROW_NUMBER() OVER (
            PARTITION BY c.country
            ORDER BY COALESCE(SUM(t.amount),0) DESC
        ) AS ranking
    FROM customers AS c
    INNER JOIN transactions AS t
        ON c.customer_id = t.customer_id
       AND t.status = 'Completed'
    GROUP BY
        c.customer_id,
        c.country,
        c.customer_name

)

SELECT
    country,
    customer_name,
    total_completed_spending
FROM customer_spending
WHERE ranking = 2;

------------------------------------------------------------
-- Ticket #5
-- Country Spending Summary
------------------------------------------------------------

SELECT
    c.country,
    COALESCE(SUM(t.amount),0) AS total_completed_spending,
    COALESCE(AVG(t.amount),0) AS average_completed_transaction_amount,
    COUNT(t.transaction_id) AS number_of_completed_transactions
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
   AND t.status = 'Completed'
GROUP BY
    c.country
ORDER BY
    total_completed_spending DESC;

------------------------------------------------------------
-- Example CTE
-- Top Customer From Each Country
------------------------------------------------------------

WITH customer_spending AS (

    SELECT
        c.country,
        c.customer_name,
        COALESCE(SUM(t.amount),0) AS total_completed_spending,
        ROW_NUMBER() OVER (
            PARTITION BY c.country
            ORDER BY COALESCE(SUM(t.amount),0) DESC
        ) AS spending_rank
    FROM customers c
    LEFT JOIN transactions t
        ON c.customer_id = t.customer_id
       AND t.status = 'Completed'
    GROUP BY
        c.customer_id,
        c.country,
        c.customer_name

)

SELECT
    country,
    customer_name,
    total_completed_spending
FROM customer_spending
WHERE spending_rank = 1;

------------------------------------------------------------
-- Skills Practiced
------------------------------------------------------------

-- ✔ CTE (WITH)
-- ✔ ROW_NUMBER()
-- ✔ PARTITION BY
-- ✔ CASE
-- ✔ COALESCE()
-- ✔ COUNT()
-- ✔ AVG()
-- ✔ SUM()
-- ✔ LEFT JOIN
-- ✔ INNER JOIN
-- ✔ GROUP BY
-- ✔ HAVING
-- ✔ Business Reporting