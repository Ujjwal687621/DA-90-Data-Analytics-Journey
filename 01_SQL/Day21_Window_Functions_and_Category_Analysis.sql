/*
============================================================
DA-90 DATA ANALYTICS JOURNEY
Day 21 - Window Functions & Category Analysis
============================================================

Focus:
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- AVG() OVER()
- Comparing products against category benchmarks
- Absolute variance
- Percentage variance
- Ranking within categories
- Multi-CTE analytical workflows

Business Context:
Analyze August transaction performance by product and category
to identify products that are underperforming relative to their
category average.

============================================================
*/


/*
------------------------------------------------------------
1. AUGUST TRANSACTION SUMMARY
------------------------------------------------------------

Business Question:
How many transactions did each product have in August?

We create a product-level summary first.
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
)

SELECT
    product_name,
    category,
    total_august_transactions

FROM august_transaction_summary;


/*
------------------------------------------------------------
2. RANKING PRODUCTS WITHIN EACH CATEGORY
------------------------------------------------------------

Business Question:
What are the top products within each category?

PARTITION BY category means the ranking starts over for
each category.
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
),

rank_summary AS (

    SELECT
        product_name,
        category,
        total_august_transactions,

        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY total_august_transactions DESC
        ) AS transaction_rank

    FROM august_transaction_summary
)

SELECT
    product_name,
    category,
    total_august_transactions,
    transaction_rank

FROM rank_summary

WHERE transaction_rank <= 2;


/*
------------------------------------------------------------
3. CATEGORY AVERAGE TRANSACTIONS
------------------------------------------------------------

Business Question:
How does each product's August transaction volume compare
with the average product performance in its category?

AVG() OVER(PARTITION BY category) calculates the average
within each category WITHOUT collapsing the individual
product rows.
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
),

category_comparison AS (

    SELECT
        product_name,
        category,
        total_august_transactions,

        AVG(total_august_transactions) OVER (
            PARTITION BY category
        ) AS category_average_transactions

    FROM august_transaction_summary
)

SELECT
    product_name,
    category,
    total_august_transactions,
    category_average_transactions

FROM category_comparison;


/*
------------------------------------------------------------
4. ABSOLUTE PERFORMANCE VS CATEGORY AVERAGE
------------------------------------------------------------

Formula:

Product Transactions - Category Average

Positive = Above category average
Negative = Below category average
Zero     = Exactly at category average
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
),

category_comparison AS (

    SELECT
        product_name,
        category,
        total_august_transactions,

        AVG(total_august_transactions) OVER (
            PARTITION BY category
        ) AS category_average_transactions

    FROM august_transaction_summary
)

SELECT
    product_name,
    category,
    total_august_transactions,
    category_average_transactions,

    total_august_transactions
        - category_average_transactions
        AS transaction_vs_category_avg

FROM category_comparison

ORDER BY transaction_vs_category_avg DESC;


/*
------------------------------------------------------------
5. IDENTIFY UNDERPERFORMING PRODUCTS
------------------------------------------------------------

Business Question:
Which products are performing below their category average?

ASC ordering puts the largest negative differences first.
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
),

category_comparison AS (

    SELECT
        product_name,
        category,
        total_august_transactions,

        AVG(total_august_transactions) OVER (
            PARTITION BY category
        ) AS category_average_transactions

    FROM august_transaction_summary
)

SELECT
    product_name,
    category,
    total_august_transactions,
    category_average_transactions,

    total_august_transactions
        - category_average_transactions
        AS transaction_vs_category_avg

FROM category_comparison

WHERE (
    total_august_transactions
        - category_average_transactions
) < 0

ORDER BY transaction_vs_category_avg ASC;


/*
------------------------------------------------------------
6. PERCENTAGE PERFORMANCE VS CATEGORY AVERAGE
------------------------------------------------------------

Formula:

(Product Transactions - Category Average)
------------------------------------------ × 100
          Category Average

NULLIF prevents division-by-zero errors.
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
),

category_comparison AS (

    SELECT
        product_name,
        category,
        total_august_transactions,

        AVG(total_august_transactions) OVER (
            PARTITION BY category
        ) AS category_average_transactions

    FROM august_transaction_summary
)

SELECT
    product_name,
    category,
    total_august_transactions,
    category_average_transactions,

    total_august_transactions
        - category_average_transactions
        AS transaction_vs_category_avg,

    (
        (
            total_august_transactions
            - category_average_transactions
        )
        / NULLIF(category_average_transactions, 0)
    ) * 100 AS percentage_vs_category_avg

FROM category_comparison

WHERE (
    total_august_transactions
        - category_average_transactions
) < 0

ORDER BY percentage_vs_category_avg ASC;


/*
------------------------------------------------------------
7. WORST-PERFORMING PRODUCT IN EACH CATEGORY
------------------------------------------------------------

Business Question:
For each category, which product has the worst percentage
performance relative to the category average?

DENSE_RANK() is used so tied worst performers receive the
same rank.

ASC means the most negative percentage receives rank 1.
*/

WITH august_transaction_summary AS (

    SELECT
        p.product_name,
        p.category,

        SUM(
            CASE
                WHEN s.sale_date >= '2026-08-01'
                 AND s.sale_date < '2026-09-01'
                THEN 1
                ELSE 0
            END
        ) AS total_august_transactions

    FROM products p

    INNER JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_name,
        p.category
),

category_comparison AS (

    SELECT
        product_name,
        category,
        total_august_transactions,

        AVG(total_august_transactions) OVER (
            PARTITION BY category
        ) AS category_average_transactions

    FROM august_transaction_summary
),

category_percentage AS (

    SELECT
        product_name,
        category,
        total_august_transactions,
        category_average_transactions,

        total_august_transactions
            - category_average_transactions
            AS transaction_vs_category_avg,

        (
            (
                total_august_transactions
                - category_average_transactions
            )
            / NULLIF(category_average_transactions, 0)
        ) * 100
            AS percentage_vs_category_avg

    FROM category_comparison
),

ranked_products AS (

    SELECT
        product_name,
        category,
        total_august_transactions,
        category_average_transactions,
        transaction_vs_category_avg,
        percentage_vs_category_avg,

        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY percentage_vs_category_avg ASC
        ) AS percentage_vs_category_avg_rank

    FROM category_percentage
)

SELECT
    product_name,
    category,
    total_august_transactions,
    category_average_transactions,
    transaction_vs_category_avg,
    percentage_vs_category_avg,
    percentage_vs_category_avg_rank

FROM ranked_products

WHERE percentage_vs_category_avg_rank = 1;


/*
============================================================
DAY 21 KEY TAKEAWAYS
============================================================

ROW_NUMBER()
- Gives every row a unique sequential number.
- Useful when we need exactly one position per row.

RANK()
- Tied values receive the same rank.
- Ranking gaps appear after ties.

DENSE_RANK()
- Tied values receive the same rank.
- No ranking gaps appear after ties.

PARTITION BY
- Performs a window calculation separately within each group.
- Does NOT collapse rows like GROUP BY.

AVG() OVER(PARTITION BY ...)
- Calculates a group-level average while keeping individual
  rows visible.

ABSOLUTE VARIANCE
- Product performance - category average.

PERCENTAGE VARIANCE
- (Product performance - category average)
  / category average × 100.

NULLIF()
- Protects calculations from division by zero.

CTEs
- Allow complex analysis to be broken into logical stages.

BUSINESS ANALYTICS PATTERN
- Aggregate
- Benchmark
- Compare
- Rank
- Filter
- Investigate

============================================================
*/