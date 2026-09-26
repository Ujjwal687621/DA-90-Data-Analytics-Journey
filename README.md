### Day 38 — Power BI Interactive Analysis & Navigation

* Learned when to use Visual, Page, Report filters, and Slicers from an analyst perspective.
* Improved dashboard layout with a professionally positioned dropdown slicer.
* Created the first `Category → Product Name` hierarchy.
* Practiced Drill Down, Drill Up, Go to Next Level, and Expand All.
* Built and tested a complete hierarchy QA workflow.
* Learned how Power BI displays hierarchy breadcrumbs inside tooltips.
* Built a Drill-through report page (`Product Details`).
* Configured automatic drill-through using `ProductsTable[category]`.
* Verified automatic Back button behavior.
* Enhanced and cleaned up visual tooltips.
* Updated chart titles for better business readability.
* Learned the Progressive Disclosure dashboard design principle.
* Built a connected two-page interactive Power BI report.
* **Status: ✅ Complete**
* Next: **Day 39 — DAX Measures & Business Calculations**

### Day 37 — Power BI Filtering, Slicers & Visual Interactions

* Learned the differences between Visual, Page, and Report-level filters.
* Practiced applying and clearing filters at each scope.
* Created the first interactive Category slicer.
* Tested Vertical List, Tile, and Dropdown slicer styles.
* Practiced Single Select and Multi-Select behavior.
* Created a Revenue by Category donut chart.
* Learned cross-highlighting between visuals.
* Used **Edit Interactions** to test Highlight, Filter, and None behaviors.
* Verified that a single slicer can control multiple visuals simultaneously.
* Restored the report to its default interactive state.
* **Status: ✅ Complete**
* Next: **Day 38 — Interactive Analysis & Navigation**


### Day 36 — Power BI Fundamentals

- Started Power BI Desktop using the Ujjsha Retail Portfolio Project #1 workbook.
- Learned the Power BI workflow: Source → Power Query → Model → Calculations → Visuals → Report.
- Reviewed Report, Data, and Model views.
- Identified SalesTable as the fact table and ProductsTable as the dimension table.
- Verified the many-to-one product_id relationship.
- Learned data grain, cardinality, active relationships, and filter direction.
- Built a Revenue by Category visual using Category and Sum of revenue.
- Practiced Power BI tooltips.
- Practiced cross-highlighting by selecting category data points.
- Learned and applied visual-level filters through the Filters pane.
- Troubleshot an incorrect Power Query source that was limiting the dataset to Computers.
- Corrected the Navigation step to use the original SalesTable containing all categories.
- Removed stale dependent Applied Steps.
- Verified data types for the corrected SalesTable.
- Reapplied the corrected query and verified the data model.
- Completed Day 36 Power BI fundamentals practice.
- **Status: ✅ Complete**
- Next: **Day 37 — Power BI Filtering, Slicers & Report Interactions**
  
  
### Day 35 — Excel Dashboard & Excel Sign-Off

- Completed the Portfolio Project #1 Excel dashboard using the July vs. August retail analysis.
- Built KPI calculations for revenue, transactions, units sold, revenue per transaction, revenue per unit, and MoM revenue change.
- Created a Revenue by Category comparison chart.
- Created a Product-Level Revenue comparison chart.
- Added conditional formatting to KPI percentage changes.
- Added and tested an interactive Category slicer.
- Added business findings, recommended investigation, and data limitations.
- Completed final dashboard formatting and one-page print configuration.
- Configured the dashboard for US Letter, Landscape, Narrow Margins, and 1-page × 1-page printing.
- Prepared the dashboard for optional PDF export as a portfolio presentation artifact.
- Completed the Day 35 Excel dashboard validation.
- **Status: ✅ Complete**
- **Excel Phase Status: ✅ Complete**
- Next: **Day 36 — Power BI Fundamentals**


### Day 34 — Power Query & Data Preparation

- Completed hands-on Power Query training using the Ujjsha Retail Project #1 workbook.
- Practiced validating data types and managing Power Query Applied Steps.
- Practiced filtering rows, replacing values, trimming text, and inspecting missing values and duplicates.
- Created custom columns for calculated revenue and revenue validation.
- Created conditional columns for data-quality status.
- Practiced Power Query Merge using `product_id` with a Left Outer join.
- Connected Power Query Merge to SQL `JOIN` concepts.
- Learned the difference between Merge and Append:
  - Merge adds columns.
  - Append adds rows.
- Connected Power Query Append to SQL `UNION / UNION ALL`.
- Practiced refreshing Power Query transformations.
- Loaded cleaned queries back into Excel using Close & Load.
- Completed the Day 34 competency checkpoint with an 8/8 result.
- **Status: ✅ Complete**

 
### Day 33 — PivotTable & PivotChart Mastery
- Completed advanced PivotTable analysis including % of Grand Total, Difference From, % Difference From, Top N, sorting, date grouping, Slicers, Timelines, and refresh/validation.
- Practiced selecting appropriate PivotCharts for categorical comparisons, time trends, and numerical relationships.
- Strengthened business interpretation and PivotTable validation concepts.
  
## Day 32 — Dates, Dynamic Arrays & Advanced Analysis

### Excel Analysis & Reporting

Continued structured Excel learning with date analysis, dynamic arrays, and advanced business analysis techniques.

Key work completed:

- Practiced YEAR, MONTH, DAY, WEEKDAY, TEXT, EDATE, EOMONTH, and WEEKNUM for date analysis.
- Practiced date arithmetic and month-over-month calculations.
- Learned to distinguish WEEKDAY from WEEKNUM for reporting purposes.
- Practiced dynamic arrays using UNIQUE, SORT, SORTBY, FILTER, and SEQUENCE.
- Practiced FILTER with multiple AND and OR conditions.
- Learned how spill ranges work and how the `#` operator references an entire spill range.
- Practiced ranking using RANK.EQ and absolute references.
- Practiced absolute and percentage growth calculations.
- Practiced variance analysis using actual versus budget.
- Practiced contribution analysis using percentage of total revenue.
- Practiced threshold-based segmentation using nested IF logic.
- Practiced trend analysis by identifying overall direction and temporary reversals.
- Practiced anomaly identification and investigation thinking.
- Applied advanced analysis concepts to Ujjsha Retail business scenarios.
- Reinforced the analytical workflow:
  **Calculate → Compare → Interpret → Investigate**
- Classified YEARFRAC as Nice to Know rather than prioritizing it during the current Excel learning phase.

### Day 32 Outcome

Completed structured learning across dates, dynamic arrays, and advanced analytical techniques, with emphasis on translating Excel calculations into business insights and investigation questions.

## Day 31 — Logic, Conditional Analysis & Data Cleaning

### Excel Analysis & Reporting

Completed structured Excel training focused on logical functions, conditional analysis, and data cleaning.

Key work completed:

- Practiced IF, AND, OR, NOT, and IFS for business-rule classification.
- Practiced IFERROR and IFNA for Excel error handling.
- Practiced SUMIF, SUMIFS, COUNTIF, COUNTIFS, AVERAGEIF, and AVERAGEIFS.
- Practiced COUNTBLANK for identifying missing values.
- Practiced TRIM, CLEAN, LEFT, RIGHT, MID, LEN, FIND, SEARCH, SUBSTITUTE, REPLACE, and PROPER for text cleaning and transformation.
- Practiced duplicate identification using business-key reasoning.
- Practiced systematic Find & Replace techniques.
- Applied cleaning and conditional analysis to a simulated Ujjsha business dataset.
- Reinforced the importance of cleaning and validating data before business reporting.
- Completed an integrated IF + AND business classification exercise.

### Day 31 Outcome

Strengthened Excel competency across logic, conditional aggregation, and data-cleaning workflows. Most Day 31 concepts reached the Strong Practice level through hands-on exercises and business scenarios.

**Next:** Day 32 — Dates, Dynamic Arrays & Advanced Analysis.

## Day 30 — Advanced Lookup & Reference

### Excel Analysis & Reporting

Continued structured Excel learning with advanced lookup and reference techniques.

Key work completed:

- Practiced INDEX, MATCH, and XMATCH for position-based lookups.
- Built INDEX + XMATCH formulas for flexible and left-side lookups.
- Built dynamic two-way lookups using row and column matching.
- Practiced multi-criteria lookups using multiple conditions.
- Practiced last-occurrence lookups using reverse search mode.
- Applied IFNA for lookup error handling.
- Reinforced FILTER for returning multiple matching records.
- Practiced approximate matching using threshold-based business scenarios.
- Reinforced the distinction between match mode and search mode.
- Practiced selecting lookup functions based on the business requirement.

### Day 30 Outcome

Completed the structured Lookup & Reference portion of the Excel learning phase with extensive hands-on practice across simple, dynamic, multi-criteria, reverse, two-way, and threshold-based lookup scenarios.

**Next:** Day 31 — Logic, Conditional Analysis & Data Cleaning.

## Day 29 — Excel Lookup Fundamentals

### Excel Analysis & Reporting

Started the structured Excel learning phase for lookup and reference functions.

Key work completed:

- Learned and practiced XLOOKUP fundamentals, including exact and approximate matching.
- Practiced VLOOKUP, HLOOKUP, and LOOKUP and compared their use cases.
- Learned the distinction between match mode and search mode in XLOOKUP.
- Practiced duplicate-match behavior and first-to-last vs. last-to-first searches.
- Applied multi-criteria lookup logic using multiple conditions.
- Introduced FILTER for returning multiple matching records.
- Practiced combining FILTER conditions using AND logic.
- Reinforced the distinction between project exposure and independent Excel competency.

### Learning Structure Update

The Lookup & Reference curriculum was divided into smaller learning units to prioritize understanding and hands-on practice.

- **Day 29:** Lookup Fundamentals
- **Day 30:** Advanced Lookup & Reference

### Day 29 Outcome

Established a foundation in Excel lookup and reference functions and identified additional practice required before these skills can be considered independently mastered.

**Next:** Day 30 — Advanced Lookup & Reference.

## Day 28 — Excel Analyst Competency Checkpoint

### Excel Analysis & Reporting

Completed the Excel Analyst Competency Checkpoint following Portfolio Project #1.

Key work completed:

- Reassessed Excel skills based on the distinction between exposure, practice, and independent competency.
- Identified that many Excel concepts used during Project #1 were learned through project application rather than systematic instruction.
- Reviewed current competency across Excel foundations, formulas, logic, conditional aggregation, lookups, data cleaning, dates, dynamic arrays, PivotTables, PivotCharts, Power Query, data validation, visualization, and dashboard design.
- Identified analytical thinking and business interpretation as current strengths.
- Established areas requiring structured learning and additional hands-on practice.
- Revised the Excel learning approach to follow:
  **Learn → Example → Solve → Business Scenario → Ujjsha Application → Explain Reasoning**
- Extended the structured Excel learning phase through Day 35 to ensure important analyst concepts are properly covered.

### Day 28 Outcome

Established a more accurate baseline of Excel competency and shifted the learning approach from primarily project-first exposure toward structured concept learning combined with practical business application.

**Next:** Day 29 — Lookup Fundamentals.

## Day 27 — Business Storytelling & Validation

### Ujjsha Retail — Portfolio Project #1

Completed the business storytelling and validation stage of the Excel analysis.

Key work completed:

- Evaluated July vs. August performance using transactions, units sold, revenue, revenue per transaction, and revenue per unit.
- Identified a 25.66% decline in revenue, driven primarily by declines in transaction and unit volume.
- Identified Computer and Networking as the primary contributors to the revenue decline.
- Confirmed that Computer and Networking collectively accounted for approximately 90.44% of the net revenue decline.
- Identified Mesh Wi-Fi System as the largest individual product-level revenue decline at $8,496.18.
- Identified Office as the only category with positive revenue growth, increasing by $2,304.47.
- Separated data-supported facts from hypotheses and recommendations.
- Established investigation priorities for Mesh Wi-Fi System, Computer and Networking, and transaction volume/product mix.
- Identified additional data requirements including inventory history, customer behavior, promotions, pricing, competitor data, traffic, and product margin.
- Developed a potential pricing experiment framework for Mesh Wi-Fi System.
- Defined transaction volume, sales revenue, and profit/gross margin as key experiment metrics.
- Completed the Executive Summary for Portfolio Project #1.

### Project 1 Documentation Updated

- `Project1_Excel_Analysis.md`
- `Project1_Excel_Methodology.md`
- `Project1_Business_Findings.md`
- `09_LearningJournal/Day27.md`

### Day 27 Outcome

The Excel analysis progressed from KPI calculation into business interpretation, investigation prioritization, data-gap analysis, and actionable recommendations.


## Day 26 — Retail Revenue Analysis & Business Recommendations

### Focus
Extended the Ujjsha Retail Sales portfolio project from unit and transaction analysis into revenue analysis and business recommendations.

### Work Completed
- Added `unit_price` to SalesTable using XLOOKUP.
- Created a calculated `revenue` field.
- Analyzed monthly revenue using PivotTables.
- Compared July and August revenue.
- Analyzed revenue by category.
- Drilled down into product-level revenue.
- Compared average unit prices.
- Calculated revenue per transaction and revenue per unit.
- Investigated product-mix changes.
- Developed evidence-based business recommendations.

### Key Findings
- July revenue: **$57,237.81**
- August revenue: **$42,551.47**
- Revenue declined **25.66%**.
- Transactions declined **40.98%**.
- Units sold declined **38.73%**.
- Revenue per transaction increased **25.97%**.
- Revenue per unit increased **21.32%**.
- Computer and Networking accounted for approximately **90.44% of the net revenue decline**.
- Mesh Wi-Fi System was the largest individual revenue loss.
- Office revenue increased **42.76%**.
- Office Chair represented **18.4% of August unit sales**.

### Analyst Takeaway
The July-to-August revenue decline appears to be primarily a transaction-volume issue rather than a pricing issue. August transactions were fewer but higher in average value, indicating a meaningful shift in product mix.

The analysis identified Mesh Wi-Fi System, Desktop Computer, and the Networking category as high-priority areas for further investigation while also identifying Office products and Wi-Fi Extender as potential areas of positive performance worth understanding and replicating.

### Portfolio Documentation
Updated:
- `Project1_Excel_Analysis.md`
- `Project1_Excel_Methodology.md`
- `Project1_Business_Findings.md`

## Day 25 — Retail Sales Root Cause Investigation

### Focus
Continued the Ujjsha Retail Sales portfolio project in Excel by investigating the July-to-August sales decline.

### Work Completed
- Added and analyzed the inventory dataset using `InventoryTable`.
- Used `XLOOKUP` to connect inventory records with product names.
- Troubleshot product ID data-type issues using `VALUE()`.
- Built inventory PivotTables by product and warehouse.
- Investigated current inventory levels for major declining products.
- Compared July vs. August transaction volume and units sold.
- Analyzed transaction changes by category and product.
- Investigated changes in product mix.

### Key Findings
- Units sold declined from **204 in July to 125 in August (-38.7%)**.
- Transactions declined from **61 to 36 (-41.0%)**.
- Units per transaction increased from **3.34 to 3.47 (+3.9%)**.
- **Accessories and Networking accounted for 72% of the lost transactions.**
- Major declining products also experienced significant transaction declines.
- **Office Chair increased from 2 to 23 units**, representing **18.4% of August unit sales**.
- Current inventory does not support insufficient inventory as an obvious explanation, although historical inventory data is unavailable.

### Analyst Takeaway
The July-to-August decline appears to be primarily driven by **fewer transactions rather than smaller transaction sizes**, with the decline concentrated in Accessories and Networking. August also showed a significant shift in product mix. Additional customer, pricing, promotion, marketing, and historical inventory data would be required to determine the underlying cause of the transaction decline.

## Day 24 — Excel Sales Analysis

Day 24 extended Project 1 from PostgreSQL/SQL analysis into Excel.

### Completed

- Recovered the existing PostgreSQL retail tables.
- Exported the source tables to CSV.
- Verified the datasets in `08_Datasets/`.
- Loaded sales and products data into Excel.
- Created `SalesTable` and `ProductsTable`.
- Used XLOOKUP to enrich sales data with product name and category.
- Verified all lookups.
- Created PivotTables for category and monthly sales analysis.
- Calculated July-to-August unit changes.
- Calculated percentage changes.
- Applied decline filters.
- Drilled from category-level performance into product-level drivers.
- Identified the major contributors to the July-to-August decline.

### Key Results

Total units sold:

742

July units:

204

August units:

125

July-to-August change:

-79 units

Largest category declines:

- Accessories: -53
- Networking: -23
- Computer: -10

Largest product declines:

- Wireless Mouse: -30
- Mesh Wi-Fi System: -18
- Wi-Fi Router: -11
- Business Laptop: -7
- Desktop Computer: -5

These five products accounted for approximately 89.9% of the overall July-to-August decline.

### Business Insight

The decline was highly concentrated rather than evenly distributed across the product portfolio.

The next stage of Project 1 will investigate the potential causes of the decline, including pricing, inventory availability, supplier activity, and customer purchasing behavior.

## Day 23 — Project #1 SQL Analysis Complete

### Completed

Day 23 completed the SQL analysis for Project #1.

Today's analysis focused on month-over-month transaction performance using the `LAG()` window function.

### SQL Skills Practiced

- CTEs
- Window functions
- `LAG()`
- `PARTITION BY`
- Month-over-month analysis
- Transaction change calculations
- Percentage change
- `NULLIF()`
- Category-level aggregation
- Business-focused analysis

### Key Findings

9 products met the significant-decline criteria:

- Transaction change <= -2
- Percentage change <= -50%

Category impact:

| Category    | Flagged Products | July Transactions | Transaction Change | % Change |
| ----------- | ---------------: | ----------------: | -----------------: | -------: |
| Accessories |                4 |                14 |                -12 |   -85.7% |
| Computer    |                2 |                 6 |                 -6 |  -100.0% |
| Office      |                2 |                 7 |                 -5 |   -71.4% |
| Networking  |                1 |                 5 |                 -4 |   -80.0% |

### Business Insight

Computer had the largest percentage decline at 100%.

Accessories had the largest overall impact, with 4 flagged products and a decline of 12 transactions from a July baseline of 14.

### Project #1 Status

**SQL Analysis: Complete**

The next step is to transform the analysis into a portfolio-ready reporting project before moving into the next major phase of the DA-90 journey.

### Day 22 – Category-Level Impact Analysis

**Focus:** Category-level business impact analysis

Today I extended the July vs. August transaction analysis from the product level to the category level.

#### Work Completed

- Compared July and August transaction performance
- Calculated transaction change
- Calculated percentage change
- Identified significantly declining products using business thresholds
- Counted flagged products by category
- Calculated total transaction decline by category
- Calculated the July transaction baseline for flagged products
- Compared absolute transaction decline with relative percentage decline
- Practiced interpreting business impact using multiple metrics

#### Key Learning

Percentage change should not be interpreted without considering the underlying baseline.

Computer had the largest relative decline at 100%, while Accessories had the largest absolute transaction decline with 12 fewer transactions.

This demonstrated the importance of considering both relative severity and absolute business impact when evaluating performance.

#### Key SQL Concepts

- CTEs
- `SUM()`
- `COUNT()`
- `GROUP BY`
- `NULLIF()`
- Percentage calculations
- Category-level aggregation
- Business-oriented SQL analysis

## Day 21 — Window Functions & Category Analysis

Day 21 focused on advanced SQL analysis using window functions and Common Table Expressions.

### Concepts Practiced

- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `PARTITION BY`
- Window functions
- Category-level averages
- Product performance comparison
- Percentage variance from category averages
- Ranking products within categories
- Multiple CTEs
- Business-oriented SQL analysis

### Practical Analysis

Using the Ujjsha Retail dataset, we analyzed August transaction performance by product and category.

We calculated:

- Total August transactions
- Average transactions within each category
- Difference between product transactions and category average
- Percentage difference from category average
- Rank of each product within its category
- Lowest-performing product relative to its category average

### Key Learning

Day 21 introduced the transition from simply retrieving and aggregating data toward performing analytical comparisons.

Window functions allowed us to calculate category-level metrics while retaining individual product rows.

This is an important SQL skill for real-world Data Analyst work.

### Progress

**Day 21 completed.**

## Day 20 – Demand Shift & Purchase Behavior Analysis

Continued the July → August sales decline investigation.

### Completed

- Tested the demand-shift hypothesis.
- Compared product-level transaction changes.
- Compared category-level transaction changes.
- Investigated Accessories and Networking.
- Calculated business-wide transaction decline.
- Compared July vs. August units sold.
- Calculated average units per transaction.
- Investigated product-level purchase behavior.

### Key Findings

- Total transactions declined from **61 to 36**, a **41.0% decrease**.
- Total units sold declined from **204 to 125**, a **38.7% decrease**.
- Average units per transaction increased from **3.34 to 3.47**, approximately **3.9%**.
- All five product categories experienced declining transaction activity.
- Accessories declined by **11 transactions**.
- Networking declined by **7 transactions**.
- Accessories and Networking accounted for **18 of the 25 lost transactions, or 72% of the total decline**.
- Wireless Mouse was the largest Accessories contributor at **-5 transactions**.
- Mesh Wi-Fi System was the largest Networking contributor at **-4 transactions**.

### Business Insight

The July → August transaction decline appears broad-based rather than the result of a broad demand shift.

Although transaction activity declined by 41.0%, average units per transaction increased slightly, indicating that the remaining transactions were marginally larger on average.

Product-level purchase behavior varied, demonstrating that transaction volume, total units, and average units per transaction should be analyzed together.

### Key SQL Concepts

- Conditional aggregation
- CTEs
- CASE
- COALESCE()
- NULLIF()
- Percentage change
- Absolute change
- Product-level analysis
- Category-level analysis
- Business-level aggregation
- Average units per transaction

### Next

Day 21 will introduce window functions:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PARTITION BY

### Status

**Day 20 Complete**

## Day 19 – Percentage Change, Purchase Behavior & Inventory Investigation

Continued the July → August sales decline investigation.

### Completed

- Calculated percentage change alongside absolute transaction change.
- Compared relative severity vs. business impact.
- Investigated Wireless Mouse purchase behavior.
- Compared transactions, units sold, and average units per transaction.
- Investigated inventory as a possible explanation for zero August sales.
- Identified a limitation caused by the lack of inventory dates.

### Key Findings

- Wireless Mouse declined from **5 transactions and 30 units in July to 0 transactions and 0 units in August**.
- July average units per transaction was **6**.
- Current inventory records show **269 units** across New York and Dallas.
- Inventory is not timestamped, so the available data cannot definitively establish August stock availability.

### Key SQL Concepts

- Percentage change
- `NULLIF()`
- `COALESCE()`
- Conditional aggregation
- CTEs
- Purchase behavior analysis

### Business Insight

Absolute change helps measure business impact, while percentage change measures relative severity.

Wireless Mouse experienced a complete loss of transaction activity, but the available inventory data does not support concluding that the product was out of stock.

### Next Session

Investigate whether customer demand shifted toward other products that experienced increased transaction activity in August.

### Status

**Day 19 Complete** ✅

## Day 18 – Conditional Aggregation & Period Comparison

Continued the sales decline investigation by comparing July and August transaction activity by product.

### Completed

- Learned conditional aggregation using `SUM(CASE WHEN ... THEN 1 ELSE 0 END)`.
- Compared July and August transactions side-by-side.
- Used CTEs to calculate period-over-period changes.
- Classified products as Declined, No Change, or Increased.
- Investigated the breadth and concentration of the transaction decline.

### Key Findings

- July → August transactions declined by **25**.
- Wireless Mouse, Mesh Wi-Fi System, and Business Laptop accounted for **52%** of the decline.
- **15 of 25 products (60%)** experienced declining transaction activity.
- 5 products increased and 5 remained unchanged.

### Key SQL Concepts

- `CASE`
- Conditional aggregation
- `SUM(CASE WHEN ... THEN 1 ELSE 0 END)`
- CTEs
- Period-over-period comparison

### Status

**Day 18 Complete** ✅

## Day 17 – Sales Trend & Purchase Behavior Analysis

Investigated the decline in sales after June using SQL.

### Completed

- Built monthly sales trend analysis using `DATE_TRUNC()`.
- Analyzed monthly sales by product.
- Analyzed monthly sales by category.
- Quantified the June → July sales decline.
- Drilled down from category to product-level performance.
- Introduced transaction-level analysis.
- Calculated average units per transaction.
- Investigated whether declining sales were associated with fewer transactions or smaller transaction quantities.
- Compared July and August sales trends.

### Key Findings

- Unit sales declined **35.8%** from June to July.
- Accessories, Audio, and Networking accounted for **87.7%** of the decline.
- Mouse Pad, Bluetooth Speaker, and Ethernet Adapter were major product-level contributors.
- These three products accounted for **68.75%** of the decline in sales transactions from June to July.
- Sales continued to decline into August.
- July → August transactions declined from **61 to 36**, while average units per transaction remained approximately stable.

### Key SQL Concepts

- `DATE_TRUNC()`
- `COUNT()`
- `SUM()`
- `NULLIF()`
- `LEFT JOIN`
- `GROUP BY`
- `ORDER BY`
- Monthly aggregation
- Product-level drill-down
- Category-level drill-down
- Transaction analysis

### Next

Day 18 will introduce **conditional aggregation** to compare periods side-by-side.

### Status

**Day 17 Complete** ✅

## Day 16 – Inventory & Sales Analysis

Moved from dataset generation into business-focused SQL analysis.

### Completed

- Analyzed products by total units sold.
- Analyzed product revenue.
- Compared sales volume with revenue.
- Calculated revenue per unit.
- Built inventory and sales summary CTEs.
- Learned why aggregation should occur before joining multiple one-to-many tables.
- Calculated stock coverage.
- Classified products as Critical, Monitor, or Healthy.
- Identified high-demand products with critical inventory coverage.
- Translated SQL results into a business recommendation.

### Key SQL Concepts

- `LEFT JOIN`
- `SUM()`
- `GROUP BY`
- `ORDER BY`
- `COALESCE()`
- `NULLIF()`
- `ROUND()`
- `::numeric`
- `CASE`
- Common Table Expressions (CTEs)
- Aggregation before joining

### Business Insight

The analysis identified **Mesh Wi-Fi System** as a high-demand product with critical stock coverage:

- Units sold: 73
- Total stock: 113
- Stock coverage: 1.55
- Status: Critical

Based on these indicators, the product should be prioritized for inventory review and potential replenishment.

### Status

**Day 16 Complete** ✅

## Day 15 – Inventory Analytics Dataset & SQL Analysis

Completed the core Inventory Analytics dataset and began business-focused SQL analysis.

### Database

- Suppliers: 10
- Products: 25
- Inventory: 51
- Sales: 200

### Completed

- Generated realistic inventory data using warehouse-specific distribution.
- Generated 200 sales transactions.
- Ensured every product has inventory.
- Ensured every product has sales activity.
- Validated generated data before database insertion.
- Analyzed inventory using JOIN, GROUP BY, SUM, and COUNT.
- Created inventory classifications using CASE.
- Practiced CTEs for higher-level aggregation.

### SQL Concepts

- INNER JOIN
- GROUP BY
- SUM()
- COUNT()
- CASE
- CTE
- Functional dependency in PostgreSQL
- Understanding table grain

### Key Takeaway

The project is transitioning from data generation toward business-focused SQL analysis.

**Status:** ✅ Completed

## Day 14 – Inventory Product Data Generation

Today I continued the Inventory Analytics project by generating and loading product data using Python and PostgreSQL.

### Completed

- Created 25 unique products.
- Created five product categories.
- Implemented category-specific pricing.
- Assigned products to valid suppliers.
- Ensured every supplier received at least one product.
- Validated the generated product dataset.
- Loaded 25 products into PostgreSQL.
- Validated the Product → Supplier relationship using SQL JOIN.

### Python Concepts

- Lists
- Tuples
- Dictionaries
- For loops
- range()
- random.choice()
- random.randint()
- random.uniform()
- append()

### Database Status

Suppliers → 10 records  
Products → 25 records  
Inventory → Not populated  
Sales → Not populated

### Key Takeaway

Realistic data generation requires business rules and validation rather than simply generating random values.

**Status:** ✅ Completed

## Day 13 – Python Data Generation & PostgreSQL Integration

Today I introduced Python into the Inventory Analytics project to automate data generation and loading into PostgreSQL.

### Topics Covered

- Python Variables
- Python Lists
- Python Tuples
- For Loops
- range()
- append()
- psycopg2
- PostgreSQL Connections
- Database Cursors
- Parameterized SQL
- Transaction Commit
- Automated Data Insertion
- Foreign Key Dependencies

### Completed

- Installed and verified psycopg2.
- Connected Python successfully to PostgreSQL.
- Created a Python data-generation workflow.
- Generated 10 supplier records.
- Automatically inserted all 10 suppliers into PostgreSQL.
- Verified the supplier data in the database.

### Key Takeaway

Python can automate repetitive database operations and make data-generation workflows more scalable and maintainable.

### Inventory Data Pipeline

Suppliers
↓
Products
↓
Inventory
↓
Sales

**Status:** ✅ Completed

## Day 12 – Inventory Analytics Database Design

Today I began Phase 2 of my Data Analytics Journey by transitioning from Banking Analytics to Inventory Analytics.

Instead of immediately solving SQL business problems, I focused on understanding how a new database is designed.

### Topics Covered

- Database Design
- Primary Keys
- Foreign Keys
- One-to-Many Relationships
- Database Schema Planning
- Table Relationships
- Thinking Before Writing JOINs

### New Database

- Suppliers
- Products
- Inventory
- Sales

### Key Takeaway

Before writing analytical SQL, it is important to understand how the data is structured and how tables relate to one another.

**Status:** ✅ Completed

## Day 11 – Emerging Customers

Today's challenge focused on identifying **Emerging Customers** for the Marketing team using reusable SQL architecture.

### Business Scenario

The Marketing team wanted to identify customers who are showing strong purchasing behavior but are not yet the highest spender in their country.

### Concepts Practiced

- Business Requirement Analysis
- Data Flow Design
- CTE Architecture
- Aggregate Functions
- Window Functions
- ROW_NUMBER()
- PARTITION BY
- LEFT JOIN vs INNER JOIN
- Business Logic Filtering
- Query Maintainability

### Key Takeaways

- Designed the solution before writing SQL.
- Reinforced the importance of dataset grain.
- Reused customer-level datasets for multiple business calculations.
- Learned to justify SQL design decisions based on business requirements rather than syntax alone.

**Status:** ✅ Completed

## Day 10 ✅

Today's focus shifted toward independent business problem solving.

Key achievements:

- Designed the solution before writing SQL.
- Built a reusable multi-CTE analytical pipeline.
- Applied window functions to rank customers within each country.
- Reviewed SQL using production code review principles.
- Validated the final solution against business requirements.

Major milestone:

Completed the first full analytical business ticket independently with only code review feedback.

## Day 9 ✅

Today's focus shifted from learning SQL syntax to designing analytical solutions.

Key achievements:

- Designed a complete SQL pipeline before writing code.
- Reinforced the importance of dataset grain.
- Built reusable CTEs for customer summaries, country averages and customer rankings.
- Improved understanding of window functions and dataset relationships.
- Learned to select joins based on business logic and data relationships instead of memorization.

Major milestone:

Started thinking like a data analyst by designing datasets first and writing SQL second.