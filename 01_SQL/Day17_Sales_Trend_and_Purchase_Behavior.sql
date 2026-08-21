/*
===========================================================
Day 17 – Sales Trend & Purchase Behavior Analysis
Project: DA-90 Data Analytics Journey
===========================================================

Objective:
Investigate the decline in sales after June.

Key questions:
    1. How did sales change by month?
    2. Which products contributed to the decline?
    3. Which categories contributed to the decline?
    4. Did the decline come from fewer transactions,
       smaller quantities per transaction, or both?

Key concepts:
    DATE_TRUNC()
    SUM()
    COUNT()
    NULLIF()
    LEFT JOIN
    GROUP BY
    ORDER BY
===========================================================
*/


/*
-----------------------------------------------------------
1. MONTHLY UNITS SOLD
-----------------------------------------------------------

Business Question:
How are sales performing over time?

Grain:
One row per month.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', sale_date) AS per_month,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY per_month
ORDER BY per_month;


/*
-----------------------------------------------------------
2. MONTHLY SALES BY PRODUCT
-----------------------------------------------------------

Business Question:
Which products contributed to monthly sales?

Grain:
One row per product per month.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', s.sale_date) AS per_month,
    s.product_id,
    SUM(s.quantity) AS total_units_sold
FROM sales s
GROUP BY
    per_month,
    s.product_id
ORDER BY
    per_month,
    total_units_sold DESC;


/*
-----------------------------------------------------------
3. MONTHLY SALES BY PRODUCT WITH DETAILS
-----------------------------------------------------------

Adds product name and category from products.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', s.sale_date) AS per_month,
    p.product_id,
    p.product_name,
    p.category,
    SUM(s.quantity) AS total_units_sold
FROM sales s
LEFT JOIN products p
    ON p.product_id = s.product_id
GROUP BY
    per_month,
    p.product_id,
    p.product_name,
    p.category
ORDER BY
    per_month,
    total_units_sold DESC;


/*
-----------------------------------------------------------
4. JUNE VS JULY TOTAL SALES
-----------------------------------------------------------

Used to quantify the overall June → July decline.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', sale_date) AS per_month,
    SUM(quantity) AS total_units_sold
FROM sales
WHERE DATE_TRUNC('month', sale_date) IN (
    '2026-06-01',
    '2026-07-01'
)
GROUP BY per_month
ORDER BY per_month;


/*
-----------------------------------------------------------
5. MONTHLY SALES BY CATEGORY
-----------------------------------------------------------

Business Question:
Which categories contributed most to the decline?

Grain:
One row per category per month.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', s.sale_date) AS per_month,
    p.category,
    SUM(s.quantity) AS total_units_sold
FROM sales s
LEFT JOIN products p
    ON p.product_id = s.product_id
GROUP BY
    per_month,
    p.category
ORDER BY
    per_month,
    total_units_sold DESC;


/*
-----------------------------------------------------------
6. MONTHLY TRANSACTION BEHAVIOR
-----------------------------------------------------------

Business Question:
Did the decline come from fewer transactions,
smaller purchases, or both?

Average Units per Sale:

    Total Units Sold / Total Transactions

NULLIF() protects against division by zero.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', sale_date) AS per_month,

    COUNT(sale_id) AS total_transactions,

    SUM(quantity) AS total_units_sold,

    SUM(quantity)
        / NULLIF(COUNT(sale_id), 0)
        AS average_units_per_sale

FROM sales

GROUP BY per_month

ORDER BY per_month;


/*
-----------------------------------------------------------
7. PRODUCT-LEVEL TRANSACTION ANALYSIS
-----------------------------------------------------------

Example:
Mouse Pad

This same query structure was used for:

    Mouse Pad
    Bluetooth Speaker
    Ethernet Adapter

The product name can be changed in the WHERE clause.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', s.sale_date) AS per_month,
    p.product_id,
    p.product_name,

    COUNT(s.sale_id) AS total_transactions,

    SUM(s.quantity) AS total_units_sold,

    SUM(s.quantity)
        / NULLIF(COUNT(s.sale_id), 0)
        AS average_units_per_sale

FROM sales s

LEFT JOIN products p
    ON p.product_id = s.product_id

WHERE
    p.product_name = 'Mouse Pad'

GROUP BY
    per_month,
    p.product_id,
    p.product_name

ORDER BY
    per_month;


/*
-----------------------------------------------------------
8. JULY → AUGUST TRANSACTION ACTIVITY
-----------------------------------------------------------

Used to investigate whether the decline continued
into August.

This query shows products with sales transactions
in July and August.

Important:
Products with zero transactions in a month do not appear.
A future conditional-aggregation approach will allow
both months to be placed side-by-side.
-----------------------------------------------------------
*/

SELECT
    DATE_TRUNC('month', s.sale_date) AS per_month,
    p.product_name,
    COUNT(s.sale_id) AS total_transactions,
    SUM(s.quantity) AS total_units_sold
FROM sales s
LEFT JOIN products p
    ON p.product_id = s.product_id
WHERE DATE_TRUNC('month', s.sale_date) IN (
    '2026-07-01',
    '2026-08-01'
)
GROUP BY
    per_month,
    p.product_name
ORDER BY
    per_month,
    total_transactions DESC;


/*
===========================================================
DAY 17 KEY FINDINGS
===========================================================

June → July:

    Units Sold:
        318 → 204
        -114 units
        -35.8%

    Transactions:
        77 → 61
        -16 transactions
        -20.8%

    Average Units/Sale:
        4 → 3

Category contribution:

    Accessories:  -37
    Audio:        -32
    Networking:   -31

Together:

    -100 units
    87.7% of total decline

Major product contributors:

    Mouse Pad:
        43 → 17 units

    Bluetooth Speaker:
        19 → 4 units

    Ethernet Adapter:
        20 → 5 units

Transaction contribution:

    Mouse Pad:
        -4 transactions

    Bluetooth Speaker:
        -4 transactions

    Ethernet Adapter:
        -3 transactions

    Combined:
        -11 of -16 transactions

    Contribution:
        68.75%

July → August:

    Units Sold:
        204 → 125

    Transactions:
        61 → 36

    Average Units/Sale:
        approximately 3 → 3

Interpretation:

The decline continued into August and was increasingly
associated with reduced transaction volume.

===========================================================
*/


/*
===========================================================
NEXT CONCEPT

Conditional Aggregation

Purpose:
Compare periods side-by-side within the same row.

Example target:

    Product
    July Transactions
    August Transactions
    Transaction Change

This will be introduced in Day 18.
===========================================================
*/