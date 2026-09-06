# Changelog

## [Day 26] — Retail Revenue Analysis & Business Recommendations

### Added
- Added unit price to SalesTable using XLOOKUP.
- Added calculated revenue column to SalesTable.
- Created monthly revenue PivotTable.
- Created revenue-per-transaction analysis.
- Created revenue-per-unit analysis.
- Created category-level revenue analysis.
- Created product-level revenue drill-down.
- Created average unit-price analysis.
- Created product-mix analysis.
- Added business recommendations based on the analysis.

### Analysis
- July revenue: $57,237.81.
- August revenue: $42,551.47.
- Revenue declined by $14,686.34 (-25.66%).
- Transactions declined by 40.98%.
- Units sold declined by 38.73%.
- Units per transaction increased by 3.9%.
- Revenue per transaction increased by 25.97%.
- Revenue per unit increased by 21.32%.
- Computer and Networking accounted for approximately 90.44% of the net revenue decline.
- Mesh Wi-Fi System was the largest individual revenue loss at -$8,496.18.
- Desktop Computer was the second-largest individual revenue loss at -$6,937.20.
- Office revenue increased by 42.76%.
- Office Chair represented 18.4% of August unit sales.
- Major declining products examined maintained stable unit prices between July and August.

### Findings
- The revenue decline appears primarily associated with lower transaction volume and unit volume rather than price reductions.
- August showed a shift toward higher-value transactions and a different product mix.
- Networking and Computer categories require the highest-priority investigation.
- Additional customer, marketing, promotion, and historical inventory data would be required to establish the underlying cause of the transaction decline.

## [Day 25] — Retail Sales Root Cause Investigation

### Added
- Continued Ujjsha Retail Sales portfolio analysis in Excel.
- Added `InventoryTable` to the Project 1 workbook.
- Added inventory product-name lookup using XLOOKUP.
- Created inventory PivotTable by product and warehouse.
- Created transaction-volume analysis comparing July and August.
- Created category-level transaction analysis.
- Created product-level transaction analysis.
- Created July vs. August product-mix analysis.

### Analysis
- Identified a 40.98% decline in transaction volume from July to August.
- Identified a 38.73% decline in units sold.
- Found that units per transaction increased approximately 3.9%.
- Found that Accessories and Networking accounted for 72% of lost transactions.
- Identified major product-level transaction declines.
- Identified Office Chair as a major August product-mix shift, representing 18.4% of August units.
- Evaluated inventory availability as a potential explanation for the sales decline.

### Findings
- The sales decline appears primarily associated with fewer transactions rather than smaller transaction sizes.
- Current inventory levels do not support insufficient inventory as an obvious explanation.
- Historical inventory data is unavailable, so inventory shortages during July/August cannot be completely ruled out.
- August showed a significant shift in product mix rather than a universal decline across all products.
- The underlying cause of the transaction decline remains undetermined due to missing customer, pricing, promotion, marketing, and historical inventory data.

## [2026-09-02] — Day 24: Excel Sales Analysis

### Added
- Recovered and verified Project 1 retail datasets from PostgreSQL.
- Added CSV datasets to `08_Datasets/`.
- Loaded sales and product data into Excel.
- Created `SalesTable` and `ProductsTable`.
- Added product and category information using XLOOKUP.
- Created PivotTables for category and monthly sales analysis.
- Added July-to-August unit and percentage change analysis.
- Added product decline filtering and category drill-down analysis.

### Findings
- Total units sold: 742.
- July units: 204.
- August units: 125.
- July-to-August decline: 79 units.
- Accessories had the largest category decline: -53 units.
- Networking declined by 23 units.
- Computer declined by 10 units.
- Wireless Mouse was the largest individual product decline: -30 units.
- The five largest declining products accounted for approximately 89.9% of the overall July-to-August decline.

### Next
- Investigate potential root causes behind the major product declines, including inventory, pricing, supplier activity, and customer purchasing behavior.

## 2026-08-31 — Day 23

### Added

- Added Day 23 month-over-month transaction analysis.
- Added SQL window-function practice using LAG().
- Added previous-month transaction comparison by product.
- Added month-over-month transaction change calculation.
- Added percentage-change calculation using NULLIF().
- Added significant-decline filtering based on established business rules.
- Added category-level impact analysis.
- Added validation of Day 22 findings using a different SQL approach.
- Added Day 23 learning journal.

### Key Results

Identified 9 significant-decline products.

Category-level impact:

- Accessories: 4 flagged products, -12 transactions, -85.7%
- Computer: 2 flagged products, -6 transactions, -100%
- Office: 2 flagged products, -5 transactions, -71.4%
- Networking: 1 flagged product, -4 transactions, -80%

### Business Insight

Computer experienced the largest percentage decline at -100%.

Accessories experienced the largest absolute transaction decline at -12 transactions and had the highest number of flagged products.

Therefore, Accessories represents the most significant overall category-level impact.

### Learning

Practiced:

- LAG()
- PARTITION BY
- Window functions
- Month-over-month analysis
- Percentage change
- NULLIF()
- CTEs
- Business-oriented SQL analysis

## Day 22 – Category-Level Impact Analysis
**Date:** 2026-08-29

### Added
- Added `01_SQL/Day22_Category_Impact_Analysis.sql`
- Added `09_LearningJournal/Day22.md`

### Analysis
- Extended July vs. August transaction analysis from product level to category level.
- Identified 9 products meeting the decline criteria.
- Aggregated flagged products by category.
- Calculated flagged product counts.
- Calculated total transaction decline by category.
- Calculated July transaction baselines for flagged products.
- Calculated category-level percentage declines.

### Key Insight
- Accessories had the largest absolute transaction decline at 12 transactions.
- Computer had the largest relative decline at 100%.
- Demonstrated the importance of evaluating both absolute impact and percentage change when interpreting business performance.

### Concepts Practiced
- CTEs
- `SUM()`
- `COUNT()`
- `GROUP BY`
- Percentage change
- Absolute vs. relative impact
- Category-level aggregation
- Business interpretation

## Day 21 — Window Functions & Category-Level Analysis

### Added

- Day 21 learning journal
- Day 21 advanced SQL practice
- Window function exercises
- Category-level product performance analysis

### SQL Concepts Added

- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `PARTITION BY`
- Window-based `AVG()`
- Multiple CTEs
- Percentage comparison calculations
- Within-category ranking

### Analysis Added

- August transaction summary by product
- Category average transaction calculation
- Product vs. category average comparison
- Percentage variance from category average
- Ranking products within categories
- Identification of products performing furthest below category average

### Learning Progress

Day 21 represents continued progression from foundational SQL toward practical analytical SQL and business-focused data analysis.

## Day 20 - Demand Shift & Purchase Behavior Analysis

### Added

- Added product-level July → August transaction analysis.
- Added category-level transaction analysis.
- Added Accessories and Networking drill-down analysis.
- Added business-wide transaction percentage change.
- Added business-wide unit percentage change.
- Added average units per transaction analysis.
- Added product-level purchase behavior analysis.
- Added change in average units per transaction.

### Key Findings

- Transactions declined 41.0% from July to August.
- Units sold declined 38.7%.
- Average units per transaction increased approximately 3.9%.
- All product categories experienced transaction declines.
- Accessories and Networking accounted for 72% of the total transaction decline.
- Wireless Mouse was the largest Accessories contributor.
- Mesh Wi-Fi System was the largest Networking contributor.
- No strong evidence of a broad demand shift was identified.

### Learned

- Absolute vs. percentage change.
- Business-level vs. category-level vs. product-level analysis.
- Conditional aggregation.
- Purchase behavior analysis.
- Average units per transaction.
- Distinguishing transaction volume from purchase quantity.
- Separating hypotheses from evidence.

### Next

Day 21:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY
- Ranking products within categories.

### Status

Day 20 complete.

## Day 19 - Percentage Change, Purchase Behavior & Inventory Investigation

### Added

- Added July → August transaction percentage change analysis.
- Added purchase behavior analysis for Wireless Mouse.
- Added inventory availability investigation.

### Learned

- Percentage change vs. absolute change.
- `NULLIF()` and `COALESCE()` for safe percentage calculations.
- Conditional aggregation for units and transactions.
- Average units per transaction.
- Identifying limitations in source data.

### Business Insight

Wireless Mouse experienced a 100% transaction decline from July to August.

Current inventory records show 269 units across New York and Dallas, but inventory is not timestamped, so August stock availability cannot be definitively established.

### Status

Day 19 complete.

## Day 18 - Conditional Aggregation & Period Comparison

### Added

- Added July vs. August transaction comparison.
- Added conditional aggregation analysis.
- Added product-level transaction change analysis.
- Added transaction status classification.

### Learned

- Conditional aggregation using `SUM(CASE WHEN ... THEN 1 ELSE 0 END)`.
- Using CTEs for multi-step analysis.
- Calculating period-over-period changes.
- Using CASE to classify results.

### Business Insight

July → August transactions declined by 25.

15 of 25 products (60%) experienced declining transaction activity.

Wireless Mouse, Mesh Wi-Fi System, and Business Laptop accounted for 52% of the overall transaction decline.

### Status

Day 18 complete.

## Day 17 - Sales Trend & Purchase Behavior Analysis

### Added

- Added monthly sales trend analysis.
- Added product-level monthly sales analysis.
- Added category-level sales analysis.
- Added transaction-level purchase behavior analysis.
- Added average units per transaction metric.
- Added June → July decline analysis.
- Added July → August trend analysis.

### Learned

- Using `DATE_TRUNC()` for time-based aggregation.
- Comparing sales across months.
- Drilling down from business-level trends to categories and products.
- Distinguishing transaction volume from units per transaction.
- Using `COUNT()` and `SUM()` together for behavioral analysis.
- Quantifying contribution to an overall decline.
- Recognizing data limitations and avoiding unsupported causal conclusions.

### Business Insight

Overall unit sales declined 35.8% from June to July.

Accessories, Audio, and Networking accounted for 87.7% of the decline.

Mouse Pad, Bluetooth Speaker, and Ethernet Adapter were major product-level contributors and collectively accounted for 68.75% of the decline in sales transactions.

Sales continued to decline into August, with transaction volume falling substantially while average units per transaction remained approximately stable.

### Next

Day 18 will introduce conditional aggregation for side-by-side period comparisons.

### Status

Day 17 complete.

## Day 16 - Inventory & Sales Analysis

### Added

- Added product sales-volume analysis.
- Added product revenue analysis.
- Added revenue-per-unit calculation.
- Added inventory summary CTE.
- Added sales summary CTE.
- Added stock coverage calculation.
- Added inventory status classification.
- Added high-demand and critical-inventory filtering.

### Learned

- Comparing sales volume and revenue.
- Using NULLIF() to prevent division-by-zero errors.
- Using ROUND() and ::numeric for decimal calculations.
- Aggregating data before joining to prevent row multiplication.
- Using multiple CTEs for structured analysis.
- Creating business metrics from raw data.
- Translating SQL results into business recommendations.

### Business Insight

Mesh Wi-Fi System was identified as a high-demand product with critical stock coverage of 1.55 and should be prioritized for inventory review.

### Status

Day 16 complete.

## Day 15 - Inventory Analytics Dataset & SQL Analysis

### Added

- Added realistic inventory data.
- Added 200 sales transactions.
- Added inventory validation.
- Added sales validation.
- Added inventory stock classification.
- Added CTE-based inventory summary analysis.

### Learned

- Defining table grain.
- Generating realistic business data.
- Validating data before database insertion.
- Aggregating inventory to product level.
- Using CASE with aggregate functions.
- Using CTEs for multi-step analysis.
- Understanding PostgreSQL functional dependencies.

### Database Progress

- Suppliers: 10
- Products: 25
- Inventory: 51
- Sales: 200

### Next

Analyze inventory and sales together to identify fast-moving products and potential inventory risks.

## Day 14 - Inventory Product Data Generation

### Added

- Added product-generation logic to the Inventory Analytics data generator.
- Added five product categories.
- Added 25 unique products.
- Added category-specific pricing ranges.
- Added supplier assignment logic.
- Added product data validation.
- Loaded 25 products into PostgreSQL.

### Learned

- Generating unique product records.
- Using dictionaries to organize data by category.
- Generating realistic random values.
- Maintaining valid foreign-key relationships.
- Validating generated data before database insertion.
- Using SQL JOINs to validate relational data.

### Database Progress

- Suppliers: 10 records
- Products: 25 records
- Inventory: Pending
- Sales: Pending

### Next

- Generate inventory records.
- Validate inventory data.
- Load inventory data into PostgreSQL.
  
## Day 13 - Python Data Generation & PostgreSQL Integration

### Added

- Added `06_InventoryAnalytics/generate_data.py`.
- Added Python-based supplier data generation.
- Added PostgreSQL connectivity using psycopg2.
- Added automated supplier insertion into PostgreSQL.
- Added 10 supplier records to the Inventory Analytics database.

### Learned

- Python variables, lists, tuples, and loops.
- Using range() and append().
- Connecting Python to PostgreSQL.
- Using database cursors.
- Executing parameterized SQL.
- Committing database transactions.
- Managing database connections.
- Maintaining valid foreign-key relationships during data generation.

### Next

- Generate 25 products.
- Assign products to valid suppliers.
- Insert products into PostgreSQL.
  
## Day 12 - Inventory Analytics Database Design

### Added

- Created Inventory Analytics database schema.
- Designed Suppliers, Products, Inventory and Sales tables.
- Established foreign key relationships.
- Introduced one-to-many relationship concepts.

### Learned

- Why table creation order matters.
- How foreign keys enforce referential integrity.
- How to identify table relationships before writing JOINs.
- How experienced analysts approach unfamiliar databases.

## Day 11 - Emerging Customers

### Added

- New Emerging Customer business scenario.
- Multi-CTE architecture.
- Country average spending calculation.
- Customer ranking by country.
- Business rule filtering.

### Learned

- Designing SQL before writing code.
- Importance of dataset grain.
- Reusable CTE architecture.
- LEFT JOIN vs INNER JOIN decision making.
- Building maintainable SQL solutions.

## Day 10

### Added

- Complete analytical SQL solution for identifying consistent high-value customers.
- Customer Spending Summary CTE.
- Average Customer Spending CTE.
- Customer Ranking CTE.
- Production-style SQL review process.
- Business requirement validation checklist.

### Improved

- Business-first SQL design.
- Independent CTE architecture.
- Dataset grain understanding.
- Window function usage.
- SQL readability.
- Business reasoning before implementation.

### Milestone

Completed the first end-to-end business analytics ticket with minimal guidance.

## Day 9

- Customer Summary CTE
- Country Average CTE
- Country Ranking CTE
- Complete analytical pipeline for loyal customer identification
- Practice with ROW_NUMBER() and PARTITION BY
- Comparison of CROSS JOIN, INNER JOIN and LEFT JOIN
- Business-first SQL solution design process

### Improved

- Stronger understanding of dataset grain
- Better CTE design skills
- Improved analytical thinking before coding
- More confidence explaining SQL design decisions

### Key Milestone

Successfully designed a complete multi-CTE analytical solution from business requirements before writing SQL.

## Day 8

- Temporary-table approach to solving SQL problems
- Multi-level aggregation
- Reading nested SQL from the inside out
- CTEs and Subqueries as equivalent logical approaches
- Business-first SQL problem solving

## Day 7 - Introduction to Subqueries

- Learned scalar subqueries.
- Learned list subqueries using IN and NOT IN.
- Compared subqueries with CTEs.
- Reviewed WHERE versus HAVING.
- Solved first scalar subquery.
- Began solving customer spending versus average customer spending business problem.

## Day 6 - CTEs & SQL Assessment

- Learned Common Table Expressions (CTEs).
- Solved five business reporting tickets.
- Introduced NULLIF() for defensive SQL programming.
- Practiced ROW_NUMBER() with PARTITION BY.
- Learned the difference between COUNT(*) and COUNT(column) in LEFT JOIN scenarios.
- Completed first SQL assessment (49/50).

## Day 5 - Business Reporting & Window Functions

- Implemented SQL CASE statements for customer segmentation.
- Learned ROW_NUMBER() and PARTITION BY.
- Solved five business reporting tickets.
- Practiced choosing appropriate JOIN types.
- Strengthened understanding of WHERE vs HAVING.
- Introduced analytical ranking concepts.

## Day 4 - SQL JOINs & Business Reporting
- Inserted realistic transaction dataset.
- Learned INNER JOIN.
- Learned LEFT JOIN.
- Learned HAVING.
- Learned COALESCE().
- Built customer spending reports.
- Built country spending reports.
- Included customers with no transactions.
- Expanded Ujjsha Financial Technologies relational database.

## Day 3
- Initialized Git repository
- Published project to GitHub
- Added transactions table
- Learned relational database concepts

## Day 2
- Learned ORDER BY
- Learned GROUP BY
- Learned AVG()
- Added aggregation examples

## Day 1
- Installed PostgreSQL
- Created customers table
- Inserted sample customer data