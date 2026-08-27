/*
Day 20 – Demand Shift & Purchase Behavior Analysis
Project: DA-90 Data Analytics Journey

Objective:
Investigate the July → August transaction decline by:
- Testing the demand-shift hypothesis
- Comparing product and category transaction changes
- Measuring business-wide transaction decline
- Comparing units sold
- Analyzing average units per transaction
- Investigating product-level purchase behavior
*/


/* =========================================================
   1. Product-Level July → August Transaction Change
   ========================================================= */

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
    transaction_change DESC;


/* =========================================================
   2. Category-Level July → August Transaction Change
   ========================================================= */

WITH transaction_summary AS (

    SELECT 
        p.category,

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
        p.category
)

SELECT 
    category,
    july_transactions,
    august_transactions,
    august_transactions - july_transactions AS transaction_change

FROM transaction_summary

ORDER BY
    transaction_change DESC;


/* =========================================================
   3. Accessories Product-Level Analysis
   ========================================================= */

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

    WHERE
        p.category = 'Accessories'

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
    transaction_change DESC;


/* =========================================================
   4. Networking Product-Level Analysis
   ========================================================= */

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

    WHERE
        p.category = 'Networking'

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
    transaction_change DESC;


/* =========================================================
   5. Business-Wide July → August Transaction Change
   ========================================================= */

WITH transaction_summary AS (

    SELECT 

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

),

transaction_change_summary AS (

    SELECT 
        july_transactions,
        august_transactions,
        august_transactions - july_transactions AS transaction_change

    FROM transaction_summary
)

SELECT 
    july_transactions,
    august_transactions,
    transaction_change,

    COALESCE(
        transaction_change::numeric
        / NULLIF(july_transactions, 0) * 100,
        0
    ) AS change_percentage

FROM transaction_change_summary;


/* =========================================================
   6. Business-Wide July → August Unit Change
   ========================================================= */

WITH transaction_summary AS (

    SELECT 

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
                THEN s.quantity
                ELSE 0
            END
        ) AS august_units_sold

    FROM products p

    JOIN sales s
        ON p.product_id = s.product_id

)

SELECT
    july_units_sold,
    august_units_sold,

    COALESCE(
        (
            (august_units_sold - july_units_sold)::numeric
            / NULLIF(july_units_sold, 0)
        ) * 100,
        0
    ) AS unit_percentage_change

FROM transaction_summary;


/* =========================================================
   7. Product-Level Purchase Behavior
   ========================================================= */

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


/* =========================================================
   8. Change in Average Units per Transaction
   ========================================================= */

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
    ) AS average_august_units_per_transaction,

    (
        COALESCE(
            august_units_sold::numeric
            / NULLIF(august_transactions, 0),
            0
        )
        -
        COALESCE(
            july_units_sold::numeric
            / NULLIF(july_transactions, 0),
            0
        )
    ) AS change_avg_units_per_transaction

FROM transaction_summary

ORDER BY
    change_avg_units_per_transaction DESC;


/* =========================================================
   DAY 20 KEY FINDINGS
   =========================================================

   Business-wide transactions:
       July    = 61
       August  = 36
       Change  = -25
       Percentage change = -40.98%

   Business-wide units:
       July    = 204
       August  = 125
       Percentage change = -38.73%

   Average units per transaction:
       July    = 3.34
       August  = 3.47
       Approximate change = +3.9%

   Category transaction changes:

       Accessories = -11
       Networking  = -7
       Computer    = -4
       Audio       = -2
       Office      = -1

   Accessories + Networking:
       -18 transactions

   18 / 25 = 72%

   Key conclusion:

   The July → August transaction decline appears broad-based
   rather than the result of a broad demand shift.

   All five categories experienced declining transaction activity.

   Although transaction activity declined by 41.0%, average units
   per transaction increased from 3.34 to 3.47.

   This indicates that the decline was primarily associated with
   fewer transactions rather than smaller purchase quantities.

   Product-level purchase behavior varied considerably.
*/