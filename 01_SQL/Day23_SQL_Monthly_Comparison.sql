-- ============================================================
-- DA-90 | Day 23
-- Month-over-Month Analysis with LAG()
-- ============================================================
--
-- Objective:
-- Compare monthly transaction performance at the product level
-- using the LAG() window function.
--
-- Analysis:
--   1. Create monthly transaction totals
--   2. Use LAG() to retrieve the previous month's transactions
--   3. Calculate month-over-month transaction change
--   4. Calculate percentage change
--   5. Identify significant product declines
--   6. Aggregate flagged products at the category level
--   7. Evaluate category-level business impact
--
-- Business Rules:
--   Significant decline:
--       transaction_change <= -2
--       AND percentage_change <= -50%
--
-- ============================================================


-- ============================================================
-- 1. Monthly Transaction Summary
-- ============================================================

WITH monthly_transactions AS (

    SELECT
        p.product_id,
        p.product_name,
        p.category,
        DATE_TRUNC('month', s.sale_date)::date AS month,
        COUNT(*) AS transactions

    FROM products p

    JOIN sales s
        ON p.product_id = s.product_id

    WHERE s.sale_date >= '2026-05-01'
      AND s.sale_date < '2026-09-01'

    GROUP BY
        p.product_id,
        p.product_name,
        p.category,
        DATE_TRUNC('month', s.sale_date)
),


-- ============================================================
-- 2. Use LAG() to Get Previous Month
-- ============================================================

monthly_comparison AS (

    SELECT
        product_id,
        product_name,
        category,
        month,
        transactions,

        LAG(transactions) OVER (
            PARTITION BY product_id
            ORDER BY month
        ) AS previous_month_transactions

    FROM monthly_transactions
),


-- ============================================================
-- 3. Calculate Transaction Change
-- ============================================================

monthly_change AS (

    SELECT
        product_id,
        product_name,
        category,
        month,
        transactions,
        previous_month_transactions,

        transactions - previous_month_transactions
            AS transaction_change

    FROM monthly_comparison
),


-- ============================================================
-- 4. Calculate Percentage Change
-- ============================================================

monthly_percentage_change AS (

    SELECT
        product_id,
        product_name,
        category,
        month,
        transactions,
        previous_month_transactions,
        transaction_change,

        (
            transaction_change::numeric
            / NULLIF(previous_month_transactions, 0)
            * 100
        ) AS percentage_change

    FROM monthly_change
),


-- ============================================================
-- 5. Identify Significant August Declines
-- ============================================================

significant_declines AS (

    SELECT
        product_id,
        product_name,
        category,
        month,
        transactions AS august_transactions,
        previous_month_transactions AS july_transactions,
        transaction_change,
        percentage_change

    FROM monthly_percentage_change

    WHERE month = DATE '2026-08-01'
      AND transaction_change <= -2
      AND percentage_change <= -50
),


-- ============================================================
-- 6. Category-Level Impact
-- ============================================================

category_impact AS (

    SELECT
        category,

        COUNT(*) AS flagged_product_count,

        SUM(july_transactions)
            AS july_transactions,

        SUM(transaction_change)
            AS total_transaction_change

    FROM significant_declines

    GROUP BY category
)


-- ============================================================
-- 7. Final Category Analysis
-- ============================================================

SELECT
    category,
    flagged_product_count,
    july_transactions,
    total_transaction_change,

    (
        total_transaction_change::numeric
        / NULLIF(july_transactions, 0)
        * 100
    ) AS percentage_change

FROM category_impact

ORDER BY total_transaction_change ASC;


-- ============================================================
-- Expected Result
-- ============================================================
--
-- Accessories    | 4 | 14 | -12 | -85.71%
-- Computer       | 2 |  6 |  -6 | -100.00%
-- Office         | 2 |  7 |  -5 | -71.43%
-- Networking     | 1 |  5 |  -4 | -80.00%
--
-- Total flagged products: 9
--
-- ============================================================