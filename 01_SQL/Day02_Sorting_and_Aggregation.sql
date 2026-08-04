-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 02
-- Topic: Sorting, Filtering & Aggregation
-- Author: Ujjwal Poudel
-- =========================================================

------------------------------------------------------------
-- Show all customers
------------------------------------------------------------

SELECT *
FROM customers;

------------------------------------------------------------
-- Show customers ordered by highest balance
------------------------------------------------------------

SELECT *
FROM customers
ORDER BY balance DESC;

------------------------------------------------------------
-- Show customers ordered alphabetically
------------------------------------------------------------

SELECT *
FROM customers
ORDER BY customer_name;

------------------------------------------------------------
-- Show top 3 customers by balance
------------------------------------------------------------

SELECT *
FROM customers
ORDER BY balance DESC
LIMIT 3;

------------------------------------------------------------
-- Show unique countries
------------------------------------------------------------

SELECT DISTINCT country
FROM customers;

------------------------------------------------------------
-- Count all customers
------------------------------------------------------------

SELECT COUNT(*) AS total_customers
FROM customers;

------------------------------------------------------------
-- Count USA customers
------------------------------------------------------------

SELECT COUNT(*) AS usa_customers
FROM customers
WHERE country = 'USA';

------------------------------------------------------------
-- Count customers by country
------------------------------------------------------------

SELECT
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country;

------------------------------------------------------------
-- Average balance by country
------------------------------------------------------------

SELECT
    country,
    AVG(balance) AS average_balance
FROM customers
GROUP BY country;

------------------------------------------------------------
-- Average balance by country (Highest First)
------------------------------------------------------------

SELECT
    country,
    AVG(balance) AS average_balance
FROM customers
GROUP BY country
ORDER BY average_balance DESC;

------------------------------------------------------------
-- Top 2 USA Customers by Balance
------------------------------------------------------------

SELECT *
FROM customers
WHERE country = 'USA'
ORDER BY balance DESC
LIMIT 2;

-- =========================================================
-- Skills Practiced
-- =========================================================

-- ✔ ORDER BY
-- ✔ LIMIT
-- ✔ DISTINCT
-- ✔ COUNT()
-- ✔ GROUP BY
-- ✔ AVG()
-- ✔ AS