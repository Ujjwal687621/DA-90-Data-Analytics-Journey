-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 05
-- Topic: Business Reporting, CASE, Window Functions & SQL Challenges
-- Author: Ujjwal Poudel
-- =========================================================
/*
 ===========================================================
 
 BUSINESS REQUIREMENT
 
 The Analytics Department received multiple requests from
 Marketing, Finance, Fraud Operations, and Executive Leadership.
 
 Today's objective was to independently solve business
 problems using SQL while reinforcing previous concepts.
 
 Skills Practiced:
 - CASE
 - COALESCE
 - LEFT JOIN
 - INNER JOIN
 - HAVING
 - AVG()
 - COUNT()
 - SUM()
 - ROW_NUMBER()
 - Business Reporting
 
 ===========================================================
 */
------------------------------------------------------------
-- Customer Loyalty Categories
------------------------------------------------------------
SELECT c.customer_name,
    COALESCE(SUM(t.amount), 0) AS total_spent,
    CASE
        WHEN COALESCE(SUM(t.amount), 0) >= 500 THEN 'High Value'
        WHEN COALESCE(SUM(t.amount), 0) >= 100 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_category
FROM customers AS c
    LEFT JOIN transactions AS t ON c.customer_id = t.customer_id
    AND t.status = 'Completed'
GROUP BY c.customer_id,
    c.customer_name
ORDER BY total_spent DESC;
------------------------------------------------------------
-- Customer Spending by Country
------------------------------------------------------------
SELECT c.country,
    c.customer_name,
    COALESCE(SUM(t.amount), 0) AS total_spent
FROM customers AS c
    LEFT JOIN transactions AS t ON c.customer_id = t.customer_id
    AND t.status = 'Completed'
GROUP BY c.customer_id,
    c.country,
    c.customer_name
ORDER BY total_spent DESC;
------------------------------------------------------------
-- Window Function
------------------------------------------------------------
SELECT c.country,
    c.customer_name,
    COALESCE(SUM(t.amount), 0) AS total_spent,
    ROW_NUMBER() OVER (
        PARTITION BY c.country
        ORDER BY COALESCE(SUM(t.amount), 0) DESC
    ) AS spending_rank
FROM customers AS c
    LEFT JOIN transactions AS t ON c.customer_id = t.customer_id
    AND t.status = 'Completed'
GROUP BY c.customer_id,
    c.country,
    c.customer_name
ORDER BY total_spent DESC;
------------------------------------------------------------
-- Ticket #1
-- Customers with No Completed Transactions
------------------------------------------------------------
SELECT c.customer_name,
    c.country
FROM customers AS c
    LEFT JOIN transactions AS t ON c.customer_id = t.customer_id
    AND t.status = 'Completed'
GROUP BY c.customer_id,
    c.customer_name,
    c.country
HAVING COUNT(t.transaction_id) = 0;
------------------------------------------------------------
-- Ticket #2
-- Average Completed Transaction by Country
------------------------------------------------------------
SELECT c.country,
    COALESCE(AVG(t.amount), 0) AS average_transaction_amount
FROM customers AS c
    LEFT JOIN transactions AS t ON c.customer_id = t.customer_id
    AND t.status = 'Completed'
GROUP BY c.country
ORDER BY average_transaction_amount DESC;
------------------------------------------------------------
-- Ticket #3
-- Completed Transactions by Payment Method
------------------------------------------------------------
SELECT payment_method,
    COUNT(transaction_id) AS number_of_completed_transactions
FROM transactions
WHERE status = 'Completed'
GROUP BY payment_method
ORDER BY number_of_completed_transactions DESC;
------------------------------------------------------------
-- Ticket #4
-- Customers Spending More Than $200
------------------------------------------------------------
SELECT c.customer_name,
    c.country,
    COALESCE(SUM(t.amount), 0) AS total_spending
FROM customers AS c
    LEFT JOIN transactions AS t ON c.customer_id = t.customer_id
    AND t.status = 'Completed'
GROUP BY c.customer_id,
    c.customer_name,
    c.country
HAVING COALESCE(SUM(t.amount), 0) > 200
ORDER BY total_spending DESC;
------------------------------------------------------------
-- Ticket #5
-- Pending Transactions
------------------------------------------------------------
SELECT c.customer_name,
    c.country,
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.payment_method,
    t.description
FROM customers AS c
    INNER JOIN transactions AS t ON c.customer_id = t.customer_id
WHERE t.status = 'Pending'
ORDER BY t.transaction_date DESC;
------------------------------------------------------------
-- Skills Practiced
------------------------------------------------------------
-- ✔ CASE
-- ✔ COALESCE
-- ✔ LEFT JOIN
-- ✔ INNER JOIN
-- ✔ ROW_NUMBER()
-- ✔ PARTITION BY
-- ✔ COUNT()
-- ✔ AVG()
-- ✔ SUM()
-- ✔ HAVING
-- ✔ Business Reporting