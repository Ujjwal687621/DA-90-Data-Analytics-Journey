# Day 15 – Inventory Analytics: Building the Complete Dataset

## Objective

Today I continued working as a Junior Data Analyst on the Inventory Analytics project.

The main objective was to complete the database dataset so that it could support realistic SQL analysis.

The project now contains data for:

- Suppliers
- Products
- Inventory
- Sales

A secondary goal was to begin transitioning away from Python data generation and back toward SQL analysis.

---

## Database Status

The current database contains:

    Suppliers → 10 records
    Products  → 25 records
    Inventory → 51 records
    Sales     → 200 records

The inventory and sales data were generated using Python and validated before being loaded into PostgreSQL.

---

# Inventory Data

## Inventory Table Structure

The inventory table contains:

    inventory_id
    product_id
    warehouse
    stock_quantity

The grain of the table is:

> One row represents one product's inventory at one warehouse.

## Inventory Business Rules

Three warehouses were used:

- New York
- Chicago
- Dallas

Each product was assigned to between 1 and 3 warehouses.

This created realistic variation rather than placing every product in every warehouse.

The expected number of inventory records was therefore:

    Minimum = 25 products × 1 warehouse = 25
    Maximum = 25 products × 3 warehouses = 75

The generated dataset contained 51 inventory records.

Every product had at least one inventory record.

The inventory generator used category-specific stock ranges:

    Accessories → 50–300
    Computer    → 5–50
    Audio       → 20–150
    Office      → 10–100
    Networking  → 15–120

---

# Sales Data

## Sales Table Structure

The sales table contains:

    sale_id
    product_id
    sale_date
    quantity

The grain of the table is:

> One row represents one sale transaction for one product on one date.

## Sales Business Rules

The target was approximately 200 sales transactions.

The final dataset contains:

    200 sales records

Every product was guaranteed to have at least one sale.

The remaining sales transactions were assigned randomly to products to create realistic variation in sales activity.

Sales dates were generated across approximately the previous 90 days.

Category-specific sales quantities were used:

    Accessories → 1–10 units
    Computer    → 1–3 units
    Audio       → 1–6 units
    Office      → 1–5 units
    Networking  → 1–8 units

The final sales distribution varied by product, creating potential fast-moving and slow-moving products for future analysis.

---

# Data Validation

Before loading the sales data, the dataset was validated.

The validation confirmed:

- 200 sales records were generated.
- All 25 products had at least one sale.
- Sales activity varied across products.
- Sale dates were generated within the intended period.
- Sales quantities followed the category-specific rules.

The sales-count distribution ranged from 5 to 14 transactions per product.

---

# SQL Analysis

Today we moved back toward SQL analysis after completing the data-generation work.

## Inventory Overview

The first business requirement was:

> Management wants an inventory overview showing each product, its category, supplier, total stock across all warehouses, and the number of warehouses where it is currently stocked.

The analysis required:

- `products`
- `inventory`
- `JOIN`
- `COUNT()`
- `SUM()`
- `GROUP BY`

The final grain was:

> One row per product.

Example logic:

    Product
       ↓
    Multiple inventory records
       ↓
    GROUP BY product
       ↓
    Total stock
    Number of warehouses

---

# PostgreSQL Functional Dependency

An important SQL lesson came up during the query.

The query selected:

    p.supplier_id

without including it in the GROUP BY clause.

PostgreSQL accepted the query because `product_id` is the primary key of the products table.

Because:

    product_id → product_name
    product_id → category
    product_id → supplier_id

PostgreSQL can determine that these values are functionally dependent on the grouped primary key.

Although PostgreSQL allows this behavior, explicitly including the selected column in the GROUP BY can make the query easier to read and understand.

---

# Inventory Stock Classification

A second business requirement was created:

> Flag products based on total inventory.

The classification rules were:

    Total Stock < 50
        → Low Stock

    Total Stock 50–150
        → Normal Stock

    Total Stock > 150
        → High Stock

A `CASE` expression was used with the aggregated stock quantity.

Example structure:

    CASE
        WHEN SUM(stock_quantity) < 50
            THEN 'Low Stock'
        WHEN SUM(stock_quantity) <= 150
            THEN 'Normal Stock'
        ELSE 'High Stock'
    END

The final result remained:

> One row per product.

---

# CTE Practice

The next business question was:

> How many products are Low Stock, Normal Stock, and High Stock?

A Common Table Expression (CTE) was identified as the cleanest approach.

The process was:

    Products + Inventory
            ↓
    Aggregate by product
            ↓
    Calculate stock status
            ↓
    CTE
            ↓
    GROUP BY stock_status
            ↓
    COUNT products

The final distribution was:

    High Stock   → 12 products
    Normal Stock → 9 products
    Low Stock    → 4 products

Total:

    12 + 9 + 4 = 25 products

This confirmed that all products were classified.

---

# Python Learning Reflection

One important realization from today's work was that I do not yet fully understand every Python concept used in the data-generation script.

This is normal because the project introduced several concepts quickly, including:

- Variables
- Lists
- Tuples
- Dictionaries
- Loops
- Conditional statements
- Random functions
- `random.choice()`
- `random.randint()`
- `random.uniform()`
- `random.sample()`
- PostgreSQL connections
- Cursors
- Database inserts
- Data validation

The purpose of Python in this project is to support data generation and analytics rather than to become a Python developer.

SQL and data analysis remain the primary focus.

A future reinforcement session will revisit the existing Python script and explain the concepts line by line.

---

# Important Development Lesson

During the project, the Python script attempted to insert products that already existed in PostgreSQL.

This resulted in a duplicate primary-key error.

The issue demonstrated the difference between:

    Generating data

and:

    Loading data

The current workflow became:

    Generate
        ↓
    Validate
        ↓
    Load
        ↓
    Verify

This is an important data-quality and database workflow.

---

# Current Database Architecture

The project now follows this basic relationship:

    Suppliers
        ↓
    Products
        ↓
    Inventory

    Products
        ↓
    Sales

The database can now support analysis involving:

- Product inventory
- Warehouse distribution
- Supplier relationships
- Sales activity
- Stock levels
- Sales velocity
- Fast-moving products
- Slow-moving products

---

# Key Takeaways

1. Realistic datasets should follow business rules rather than simply contain random values.

2. Data should be validated before being loaded into the database.

3. Understanding the grain of a table is critical before writing SQL.

4. Aggregation changes the grain of the result.

5. `CASE` can be used to turn calculated metrics into business classifications.

6. CTEs can make multi-step analytical problems easier to structure.

7. SQL remains the primary skill for this Data Analyst journey.

8. Python is being used as a supporting skill for data generation and automation.

---

# Next Session

The database foundation is now complete.

The next focus should be SQL analysis using:

    Suppliers
        ↓
    Products
        ↓
    Inventory

and:

    Products
        ↓
    Sales

The first major analysis will connect inventory levels with sales activity to identify products that may be selling quickly relative to their available inventory.

The focus will shift increasingly toward:

> Business Question → Data → SQL → Analysis → Insight → Recommendation

**Status: Day 15 Complete**