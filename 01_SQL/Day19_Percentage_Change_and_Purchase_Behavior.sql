/*
Day 19 – Percentage Change, Purchase Behavior & Inventory Investigation
Project: DA-90 Data Analytics Journey

Objective:
Continue investigating the July → August transaction decline.
*/


-- 1. Calculate July → August transaction percentage change

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

transaction_change_summary AS (

    SELECT 
        product_name,
        july_transactions,
        august_transactions,
        august_transactions - july_transactions AS transaction_change

    FROM transaction_summary
)

SELECT 
    product_name,
    july_transactions,
    august_transactions,
    transaction_change,

    COALESCE(
        transaction_change::numeric
        / NULLIF(july_transactions, 0) * 100,
        0
    ) AS change_percentage

FROM transaction_change_summary

ORDER BY
    change_percentage ASC;


-- 2. Wireless Mouse purchase behavior

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
                WHEN s.sale_date >= '2026-07-01'
                 AND s.sale_date < '2026-08-01'
                THEN s.quantity
                ELSE 0
            END
        ) AS july_units_sold,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS august_transactions,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN s.quantity
                ELSE 0
            END
        ) AS august_units_sold

    FROM products p

    JOIN sales s
        ON p.product_id = s.product_id

    WHERE
        p.product_name = 'Wireless Mouse'

    GROUP BY
        p.product_name
)

SELECT
    product_name,
    july_transactions,
    july_units_sold,
    august_transactions,
    august_units_sold,

    COALESCE(
        july_units_sold::numeric
        / NULLIF(july_transactions, 0),
        0
    ) AS average_july_units_per_transaction,

    COALESCE(
        august_units_sold::numeric
        / NULLIF(august_transactions, 0),
        0
    ) AS average_august_units_per_transaction

FROM transaction_summary;


-- 3. Wireless Mouse inventory by warehouse

SELECT 
    p.product_name,
    i.warehouse,
    i.stock_quantity

FROM products p

JOIN inventory i
    ON p.product_id = i.product_id

WHERE
    p.product_name = 'Wireless Mouse';