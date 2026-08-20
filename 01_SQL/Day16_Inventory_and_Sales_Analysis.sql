/*
===========================================================
Day 16 – Inventory & Sales Analysis
Project: DA-90 Data Analytics Journey
===========================================================

Objective:
Use SQL to analyze product sales, revenue, inventory,
stock coverage, and potential inventory risk.

Tables:
    products
    inventory
    sales

Key concepts:
    JOIN
    LEFT JOIN
    SUM()
    GROUP BY
    ORDER BY
    COALESCE()
    NULLIF()
    ROUND()
    ::numeric
    CASE
    CTEs
===========================================================
*/


/*
-----------------------------------------------------------
1. TOP PRODUCTS BY UNITS SOLD
-----------------------------------------------------------

Business Question:
Which products are selling the most?

Grain:
One row per product.

Metric:
Total units sold.
-----------------------------------------------------------
*/

SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(s.quantity), 0) AS total_units_sold
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    total_units_sold DESC;


/*
-----------------------------------------------------------
2. TOP PRODUCTS BY REVENUE
-----------------------------------------------------------

Business Question:
Which products generated the most revenue?

Revenue:
Unit Price × Quantity
-----------------------------------------------------------
*/

SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(p.unit_price * s.quantity), 0) AS total_revenue
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    total_revenue DESC;


/*
-----------------------------------------------------------
3. SALES VOLUME + REVENUE + REVENUE PER UNIT
-----------------------------------------------------------

Purpose:
Compare sales volume with financial performance.

Revenue per unit:
Total Revenue / Total Units Sold

NULLIF() prevents division by zero.
-----------------------------------------------------------
*/

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price,

    COALESCE(SUM(s.quantity), 0)
        AS total_units_sold,

    COALESCE(SUM(p.unit_price * s.quantity), 0)
        AS total_revenue,

    SUM(p.unit_price * s.quantity)
        / NULLIF(SUM(s.quantity), 0)
        AS revenue_per_unit

FROM products p

LEFT JOIN sales s
    ON p.product_id = s.product_id

GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price

ORDER BY
    total_revenue DESC;


/*
-----------------------------------------------------------
4. INVENTORY SUMMARY
-----------------------------------------------------------

Business Question:
How much inventory does each product have?

Grain:
One row per product.

Why aggregate first?

Inventory contains multiple records per product because
products can exist in multiple warehouses.
-----------------------------------------------------------
*/

WITH inventory_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(i.stock_quantity), 0)
            AS total_stock

    FROM products p

    LEFT JOIN inventory i
        ON p.product_id = i.product_id

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT *
FROM inventory_summary;


/*
-----------------------------------------------------------
5. SALES SUMMARY
-----------------------------------------------------------

Business Question:
How many units has each product sold?

Grain:
One row per product.
-----------------------------------------------------------
*/

WITH sales_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(s.quantity), 0)
            AS total_units_sold

    FROM products p

    LEFT JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT *
FROM sales_summary;


/*
-----------------------------------------------------------
6. INVENTORY + SALES SUMMARY
-----------------------------------------------------------

Important Concept:
Aggregate inventory and sales separately before joining.

Why?

If raw inventory and raw sales are joined directly,
multiple inventory rows can combine with multiple sales
rows and inflate aggregate values.

Example:

    3 inventory rows
    ×
    10 sales rows
    =
    30 joined rows

Therefore:

    Inventory → aggregate by product
    Sales     → aggregate by product
    Then JOIN the summaries.
-----------------------------------------------------------
*/

WITH inventory_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(i.stock_quantity), 0)
            AS total_stock

    FROM products p

    LEFT JOIN inventory i
        ON p.product_id = i.product_id

    GROUP BY
        p.product_id,
        p.product_name

),

sales_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(s.quantity), 0)
            AS total_units_sold

    FROM products p

    LEFT JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    ss.product_id,
    ss.product_name,
    isum.total_stock,
    ss.total_units_sold

FROM inventory_summary isum

LEFT JOIN sales_summary ss
    ON isum.product_id = ss.product_id

ORDER BY
    total_units_sold DESC;


/*
-----------------------------------------------------------
7. STOCK COVERAGE
-----------------------------------------------------------

Business Question:
Which products have relatively low inventory compared
with their sales activity?

Formula:

    Stock Coverage =
    Total Stock / Total Units Sold

::numeric ensures decimal division.

NULLIF prevents division by zero.

ROUND(..., 2) displays two decimal places.
-----------------------------------------------------------
*/

WITH inventory_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(i.stock_quantity), 0)
            AS total_stock

    FROM products p

    LEFT JOIN inventory i
        ON p.product_id = i.product_id

    GROUP BY
        p.product_id,
        p.product_name

),

sales_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(s.quantity), 0)
            AS total_units_sold

    FROM products p

    LEFT JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    ss.product_id,
    ss.product_name,
    isum.total_stock,
    ss.total_units_sold,

    ROUND(
        isum.total_stock::numeric
        / NULLIF(ss.total_units_sold, 0),
        2
    ) AS stock_coverage

FROM inventory_summary isum

LEFT JOIN sales_summary ss
    ON isum.product_id = ss.product_id

ORDER BY
    stock_coverage ASC;


/*
-----------------------------------------------------------
8. STOCK STATUS CLASSIFICATION
-----------------------------------------------------------

Business Rules:

    Coverage < 2
        → Critical

    Coverage 2–5
        → Monitor

    Coverage > 5
        → Healthy
-----------------------------------------------------------
*/

WITH inventory_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(i.stock_quantity), 0)
            AS total_stock

    FROM products p

    LEFT JOIN inventory i
        ON p.product_id = i.product_id

    GROUP BY
        p.product_id,
        p.product_name

),

sales_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(s.quantity), 0)
            AS total_units_sold

    FROM products p

    LEFT JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    ss.product_id,
    ss.product_name,
    isum.total_stock,
    ss.total_units_sold,

    ROUND(
        isum.total_stock::numeric
        / NULLIF(ss.total_units_sold, 0),
        2
    ) AS stock_coverage,

    CASE

        WHEN
            isum.total_stock::numeric
            / NULLIF(ss.total_units_sold, 0) < 2
            THEN 'Critical'

        WHEN
            isum.total_stock::numeric
            / NULLIF(ss.total_units_sold, 0) <= 5
            THEN 'Monitor'

        ELSE 'Healthy'

    END AS stock_status

FROM inventory_summary isum

LEFT JOIN sales_summary ss
    ON isum.product_id = ss.product_id

ORDER BY
    stock_coverage ASC;


/*
-----------------------------------------------------------
9. HIGH-DEMAND + CRITICAL INVENTORY
-----------------------------------------------------------

Business Definition:

High Demand:
    total_units_sold > 40

Critical Inventory:
    stock_coverage < 2

Purpose:
Identify products that have strong sales activity while
also having relatively limited inventory.
-----------------------------------------------------------
*/

WITH inventory_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(i.stock_quantity), 0)
            AS total_stock

    FROM products p

    LEFT JOIN inventory i
        ON p.product_id = i.product_id

    GROUP BY
        p.product_id,
        p.product_name

),

sales_summary AS (

    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(s.quantity), 0)
            AS total_units_sold

    FROM products p

    LEFT JOIN sales s
        ON p.product_id = s.product_id

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    ss.product_id,
    ss.product_name,
    isum.total_stock,
    ss.total_units_sold,

    ROUND(
        isum.total_stock::numeric
        / NULLIF(ss.total_units_sold, 0),
        2
    ) AS stock_coverage,

    CASE

        WHEN
            isum.total_stock::numeric
            / NULLIF(ss.total_units_sold, 0) < 2
            THEN 'Critical'

        WHEN
            isum.total_stock::numeric
            / NULLIF(ss.total_units_sold, 0) <= 5
            THEN 'Monitor'

        ELSE 'Healthy'

    END AS stock_status

FROM inventory_summary isum

LEFT JOIN sales_summary ss
    ON isum.product_id = ss.product_id

WHERE
    ss.total_units_sold > 40

    AND
    ROUND(
        isum.total_stock::numeric
        / NULLIF(ss.total_units_sold, 0),
        2
    ) < 2

ORDER BY
    stock_coverage ASC;


/*
===========================================================
DAY 16 BUSINESS FINDING
===========================================================

High-demand + critical-inventory product:

    Mesh Wi-Fi System
    Total Stock:       113
    Units Sold:         73
    Stock Coverage:   1.55
    Status:          Critical

Recommendation:

Mesh Wi-Fi System has very high sales volume and critical
stock coverage of 1.55. Based on these indicators, it
should be prioritized for inventory review and potential
replenishment.

Note:
The dataset does not include supplier lead times, pending
purchase orders, reorder points, seasonality, or demand
forecasts. Therefore, the analysis identifies a product
for review rather than proving that a stockout will occur.

===========================================================
*/