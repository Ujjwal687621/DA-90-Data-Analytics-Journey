-- ============================================================
-- DA-90 | Day 22
-- Category Impact Analysis
-- ============================================================
--
-- Objective:
-- Compare July vs. August transaction performance at the
-- product level, identify significantly declining products,
-- and evaluate the impact at the category level.
--
-- Business Rules for Flagging:
--   1. Transaction change <= -2
--   2. Percentage change <= -50%
--
-- Key Metrics:
--   - July transactions
--   - August transactions
--   - Transaction change
--   - Percentage change
--   - Flagged product count by category
--   - Total transaction decline by category
--   - July transaction baseline for flagged products
--   - Category-level percentage decline
-- ============================================================


-- ============================================================
-- 1. Product-Level Transaction Summary
-- ============================================================

WITH transaction_summary AS (

    SELECT
        p.product_name,
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
        p.product_name,
        p.category
),


-- ============================================================
-- 2. Calculate Transaction Change
-- ============================================================

transaction_change_summary AS (

    SELECT
        product_name,
        category,
        july_transactions,
        august_transactions,

        august_transactions - july_transactions
            AS transaction_change

    FROM transaction_summary
),


-- ============================================================
-- 3. Calculate Percentage Change
-- ============================================================

percentage_change_summary AS (

    SELECT
        product_name,
        category,
        july_transactions,
        august_transactions,
        transaction_change,

        (
            transaction_change::numeric
            / NULLIF(july_transactions, 0)
            * 100
        ) AS change_percentage

    FROM transaction_change_summary
),


-- ============================================================
-- 4. Identify Flagged Products
-- ============================================================
--
-- A product is flagged when:
--   - It lost at least 2 transactions
--   - Its percentage decline was at least 50%
-- ============================================================

flagged_products_summary AS (

    SELECT
        product_name,
        category,
        july_transactions,
        august_transactions,
        transaction_change,
        change_percentage

    FROM percentage_change_summary

    WHERE transaction_change <= -2
      AND change_percentage <= -50
),


-- ============================================================
-- 5. Category-Level Impact
-- ============================================================

category_impact_summary AS (

    SELECT
        category,

        COUNT(*) AS flagged_product_count,

        SUM(july_transactions)
            AS flagged_july_transactions,

        SUM(transaction_change)
            AS total_transaction_change

    FROM flagged_products_summary

    GROUP BY category
)


-- ============================================================
-- 6. Final Category Analysis
-- ============================================================

SELECT
    category,
    flagged_product_count,
    flagged_july_transactions,
    total_transaction_change,

    (
        total_transaction_change::numeric
        / NULLIF(flagged_july_transactions, 0)
        * 100
    ) AS percentage_change

FROM category_impact_summary

ORDER BY total_transaction_change ASC;

