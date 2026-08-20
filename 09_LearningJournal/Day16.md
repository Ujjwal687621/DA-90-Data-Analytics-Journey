# Day 16 – Inventory & Sales Analysis

## Objective

Today I moved from data generation into business-focused SQL analysis.

The goal was to combine sales and inventory information to identify products with strong sales activity but relatively low inventory coverage.

The main focus was on turning raw data into actionable business insights.

---

# Analysis 1 – Products by Sales Volume

## Business Question

> Which products are selling the most?

### Tables Used

- products
- sales

### Grain

One row represents one product.

### Metric

Total units sold:

    SUM(s.quantity)

### SQL Concepts

- LEFT JOIN
- SUM()
- GROUP BY
- ORDER BY
- COALESCE()

The analysis showed that the top five products by units sold were:

1. Mesh Wi-Fi System – 73 units
2. Wireless Mouse – 68 units
3. Mouse Pad – 66 units
4. Ethernet Adapter – 51 units
5. Wireless Earbuds – 42 units

### Key Insight

Mesh Wi-Fi System was the highest-volume product with 73 units sold.

---

# Analysis 2 – Revenue by Product

## Business Question

> Which products generated the most revenue?

Revenue was calculated as:

    Unit Price × Quantity

and aggregated by product:

    SUM(unit_price * quantity)

### Top Revenue Products

1. Mesh Wi-Fi System – $34,456.73
2. Ethernet Adapter – $24,833.94
3. Wi-Fi Extender – $20,782.00
4. Desktop Computer – $18,036.72
5. Workstation – $17,970.25

### Key Insight

Sales volume and revenue rankings were not identical.

For example:

- Wireless Mouse ranked #2 by units sold but did not rank in the top five by revenue.
- Desktop Computer ranked #4 by revenue despite selling only 13 units.

The Desktop Computer had a unit price of $1,387.44, which was the highest product price in the dataset.

This demonstrated that:

> Revenue is influenced by both sales volume and unit price.

---

# Analysis 3 – Revenue per Unit

A revenue-per-unit metric was calculated using:

    Total Revenue / Total Units Sold

To prevent division-by-zero errors, `NULLIF()` was used:

    total_revenue / NULLIF(total_units_sold, 0)

### Important SQL Concepts

#### NULLIF()

    NULLIF(value, 0)

returns NULL when the value equals zero.

This prevents a division-by-zero error.

#### COALESCE()

    COALESCE(value, 0)

can then be used when a NULL result should be replaced with zero.

### Important Dataset Observation

Because each product has a fixed unit price in the current dataset:

    Total Revenue / Total Units Sold

essentially equals:

    Unit Price

Therefore, revenue-per-unit did not provide a new business insight in this dataset.

This was an important analytical lesson:

> A metric should not be considered useful simply because it can be calculated. Its usefulness depends on the business question and the structure of the data.

---

# Analysis 4 – Combining Inventory and Sales

## Business Question

> Which products have high sales activity but relatively low inventory?

This required combining:

- products
- inventory
- sales

### Important Problem: Row Multiplication

Joining raw inventory and sales tables directly can multiply rows.

For example:

    3 inventory records
    ×
    10 sales records
    =
    30 joined rows

This can cause aggregate values such as SUM() to become inflated.

### Solution

Aggregate each dataset separately before joining them.

The analysis used two CTEs:

    inventory_summary

and:

    sales_summary

---

# Inventory Summary CTE

The inventory data was aggregated to product level.

Result:

    product_id
    product_name
    total_stock

The calculation was:

    SUM(stock_quantity)

The resulting grain became:

> One row per product.

---

# Sales Summary CTE

Sales data was also aggregated to product level.

Result:

    product_id
    product_name
    total_units_sold

The calculation was:

    SUM(quantity)

Again, the grain became:

> One row per product.

---

# Combining the CTEs

The two summaries were joined using:

    product_id

The final dataset contained:

    product_id
    product_name
    total_stock
    total_units_sold

This allowed inventory and sales activity to be compared without inflating the aggregate values.

---

# Analysis 5 – Stock Coverage

A new business metric was created:

    Stock Coverage =
    Total Stock / Total Units Sold

This measures inventory relative to observed sales activity.

Example:

    100 units in stock
    20 units sold

    100 / 20 = 5

This represents approximately five units of inventory coverage relative to the observed sales activity.

### Division-by-Zero Protection

The calculation used:

    total_stock / NULLIF(total_units_sold, 0)

This prevents an error when a product has zero sales.

### Decimal Formatting

PostgreSQL integer division initially produced whole numbers.

To ensure decimal division:

    total_stock::numeric

was used.

Then:

    ROUND(..., 2)

was used to display two decimal places.

Example:

    ROUND(
        total_stock::numeric /
        NULLIF(total_units_sold, 0),
        2
    )

---

# Inventory Status Classification

Business thresholds were defined for stock coverage.

## Critical

    Stock Coverage < 2

## Monitor

    Stock Coverage 2–5

## Healthy

    Stock Coverage > 5

These thresholds are project-specific business assumptions rather than universal inventory standards.

A `CASE` expression was used to classify each product.

---

# Critical Products

The analysis identified three products with Critical stock coverage:

| Product           | Total Stock | Units Sold | Stock Coverage |
| ----------------- | ----------: | ---------: | -------------: |
| Wi-Fi Extender    |          36 |         40 |           0.90 |
| Mesh Wi-Fi System |         113 |         73 |           1.55 |
| Desk Lamp         |          31 |         22 |           1.41 |

---

# High-Demand + Critical Inventory

To identify products that were both high-demand and inventory constrained, the following criteria were applied:

    Total Units Sold > 40

AND:

    Stock Coverage < 2

The analysis returned:

| Product           | Total Stock | Units Sold | Stock Coverage | Status   |
| ----------------- | ----------: | ---------: | -------------: | -------- |
| Mesh Wi-Fi System |         113 |         73 |           1.55 | Critical |

### Business Insight

Mesh Wi-Fi System has very high sales volume and critical stock coverage of 1.55.

Based on these indicators, it should be prioritized for inventory review and potential replenishment.

The recommendation is intentionally cautious because the dataset does not contain information such as:

- Supplier lead time
- Reorder points
- Pending purchase orders
- Future demand forecasts
- Seasonality

Therefore, the analysis identifies a product for **inventory review**, rather than proving that a stockout will occur.

---

# Key SQL Concepts Learned

Today I practiced:

- LEFT JOIN
- INNER JOIN concepts
- SUM()
- GROUP BY
- ORDER BY
- COALESCE()
- NULLIF()
- ROUND()
- Numeric casting with `::numeric`
- CASE expressions
- Common Table Expressions (CTEs)
- Aggregating before joining
- Filtering analytical results
- Building business metrics

---

# Key Analytical Lessons

### 1. Volume and revenue are different

A product can sell many units without generating the most revenue.

A high-priced product can generate significant revenue with relatively few sales.

### 2. Aggregation before joining matters

Joining multiple one-to-many tables before aggregation can multiply rows and produce incorrect totals.

### 3. Metrics need business context

Stock coverage becomes more useful when combined with sales activity.

### 4. Thresholds are business assumptions

The Critical / Monitor / Healthy thresholds were defined specifically for this project.

### 5. SQL should answer business questions

The goal is not simply to write complex SQL.

The goal is:

    Business Question
          ↓
    Identify Data
          ↓
    SQL Analysis
          ↓
    KPI
          ↓
    Insight
          ↓
    Recommendation

---

# Day 16 Summary

Today the project moved from basic SQL aggregation toward practical business analysis.

The analysis connected:

    Sales
      +
    Inventory
      ↓
    Stock Coverage
      ↓
    Inventory Risk
      ↓
    Business Recommendation

The main finding was:

> Mesh Wi-Fi System has high sales activity and critical stock coverage, making it a priority for inventory review and potential replenishment.

**Status: Day 16 Complete**