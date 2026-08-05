-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 04
-- Topic: SQL JOINs, LEFT JOIN, GROUP BY, HAVING & COALESCE
-- Author: Ujjwal Poudel
-- =========================================================

/*
Objective:
Learn how relational databases combine information from multiple
tables using JOINs to answer business questions.

Business Scenario:
The Analytics Department requested reports showing customer
transactions, spending behavior, and country-level summaries.
*/

------------------------------------------------------------
-- Insert Sample Transactions
------------------------------------------------------------

INSERT INTO transactions (
    transaction_id,
    customer_id,
    transaction_date,
    amount,
    transaction_type,
    payment_method,
    status,
    description
)
VALUES
(1001, 1, '2026-08-01', 45.99, 'Payment', 'Card', 'Completed', 'Coffee Shop'),
(1002, 1, '2026-08-02', 125.00, 'Payment', 'Card', 'Completed', 'Online Shopping'),
(1003, 2, '2026-08-01', 210.50, 'Payment', 'Bank Transfer', 'Completed', 'Electronics'),
(1004, 3, '2026-08-03', 18.75, 'Payment', 'Card', 'Completed', 'Lunch'),
(1005, 1, '2026-08-03', 75.00, 'Refund', 'Card', 'Completed', 'Returned Item'),
(1006, 4, '2026-08-02', 500.00, 'Payment', 'Bank Transfer', 'Completed', 'Laptop Purchase'),
(1007, 5, '2026-08-01', 9.99, 'Payment', 'Wallet', 'Completed', 'Music Subscription'),
(1008, 5, '2026-08-04', 15.49, 'Payment', 'Card', 'Pending', 'Food Delivery');

------------------------------------------------------------
-- View Transactions
------------------------------------------------------------

SELECT *
FROM transactions;

------------------------------------------------------------
-- INNER JOIN
-- Show customer name with each transaction
------------------------------------------------------------

SELECT
    c.customer_name,
    t.transaction_date,
    t.amount,
    t.description,
    t.status
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed';

------------------------------------------------------------
-- Total Spending by Customer
------------------------------------------------------------

SELECT
    c.customer_name,
    SUM(t.amount) AS total_amount_spent
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_amount_spent DESC;

------------------------------------------------------------
-- Total Spending by Country
------------------------------------------------------------

SELECT
    c.country,
    SUM(t.amount) AS transaction_total
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY c.country
ORDER BY transaction_total DESC;

------------------------------------------------------------
-- Countries Spending More Than $200
------------------------------------------------------------

SELECT
    c.country,
    SUM(t.amount) AS transaction_total
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY c.country
HAVING SUM(t.amount) > 200
ORDER BY transaction_total DESC;

------------------------------------------------------------
-- Transactions & Spending by Customer
------------------------------------------------------------

SELECT
    c.customer_name,
    COUNT(t.transaction_id) AS number_of_transactions,
    SUM(t.amount) AS total_spent
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC;

------------------------------------------------------------
-- Add New Customer (No Transactions)
------------------------------------------------------------

INSERT INTO customers (
    customer_id,
    customer_name,
    country,
    balance
)
VALUES
(6, 'Raj Sharma', 'Nepal', 0.00);

------------------------------------------------------------
-- LEFT JOIN
-- Include customers with no transactions
------------------------------------------------------------

SELECT
    c.customer_name,
    c.country,
    COUNT(t.transaction_id) AS transactions,
    COALESCE(SUM(t.amount),0) AS total_spent
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.country
ORDER BY total_spent DESC;

------------------------------------------------------------
-- Skills Practiced
------------------------------------------------------------

-- ✔ INNER JOIN
-- ✔ LEFT JOIN
-- ✔ GROUP BY
-- ✔ HAVING
-- ✔ COUNT()
-- ✔ SUM()
-- ✔ COALESCE()
-- ✔ ORDER BY
-- ✔ Relational Database Reporting