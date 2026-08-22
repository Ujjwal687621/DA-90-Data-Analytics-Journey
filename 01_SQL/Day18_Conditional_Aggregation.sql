/*
Day 18 – Conditional Aggregation & Period Comparison
Project: DA-90 Data Analytics Journey

Objective:
Compare July and August transaction activity by product.
*/


-- 1. July transactions by product

SELECT 
    p.product_name,
    COUNT(s.sale_id) AS total_transactions
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
WHERE 
    s.sale_date >= '2026-07-01'
    AND s.sale_date < '2026-08-01'
GROUP BY
    p.product_name
ORDER BY 
    total_transactions DESC;


-- 2. Conditional aggregation for July transactions

SELECT 
    p.product_name,

    SUM(
        CASE
            WHEN s.sale_date >= '2026-07-01'
             AND s.sale_date < '2026-08-01'
            THEN 1
            ELSE 0
        END
    ) AS july_transactions

FROM products p

JOIN sales s
    ON p.product_id = s.product_id

GROUP BY
    p.product_name;


-- 3. Compare July and August transactions

SELECT 
    p.product_name,

    SUM(
        CASE
            WHEN s.sale_date >= '2026-07-01'
             AND s.sale_date < '2026-08-01'
            THEN 1
            ELSE 0
        END
    ) AS july_transactions,

    SUM(
        CASE
            WHEN s.sale_date >= '2026-08-01'
             AND s.sale_date < '2026-09-01'
            THEN 1
            ELSE 0
        END
    ) AS august_transactions

FROM products p

JOIN sales s
    ON p.product_id = s.product_id

GROUP BY
    p.product_name;


-- 4. Calculate July → August transaction change

WITH transaction_summary AS (

    SELECT 
        p.product_name,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-07-01'
                 AND s.sale_date < '2026-08-01'
                THEN 1
                ELSE 0
            END
        ) AS july_transactions,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS august_transactions

    FROM products p

    JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name
)

SELECT
    product_name,
    july_transactions,
    august_transactions,
    august_transactions - july_transactions AS transaction_change

FROM transaction_summary

ORDER BY
    transaction_change ASC;


-- 5. Classify products by transaction change

WITH transaction_summary AS (

    SELECT 
        p.product_name,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-07-01'
                 AND s.sale_date < '2026-08-01'
                THEN 1
                ELSE 0
            END
        ) AS july_transactions,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS august_transactions

    FROM products p

    JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name
)

SELECT
    product_name,
    july_transactions,
    august_transactions,

    august_transactions - july_transactions
        AS transaction_change,

    CASE
        WHEN august_transactions - july_transactions < 0
            THEN 'Declined'

        WHEN august_transactions - july_transactions = 0
            THEN 'No Change'

        ELSE 'Increased'

    END AS transaction_status

FROM transaction_summary

ORDER BY
    transaction_change ASC;


-- 6. Total transaction change among declining products

WITH transaction_summary AS (

    SELECT 
        p.product_name,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-07-01'
                 AND s.sale_date < '2026-08-01'
                THEN 1
                ELSE 0
            END
        ) AS july_transactions,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS august_transactions

    FROM products p

    JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name

),

total_transaction_status AS (

    SELECT
        product_name,
        july_transactions,
        august_transactions,

        august_transactions - july_transactions
            AS transaction_change,

        CASE
            WHEN august_transactions - july_transactions < 0
                THEN 'Declined'

            WHEN august_transactions - july_transactions = 0
                THEN 'No Change'

            ELSE 'Increased'

        END AS transaction_status

    FROM transaction_summary
)

SELECT
    SUM(transaction_change) AS total_transaction_change

FROM total_transaction_status

WHERE
    transaction_status = 'Declined';