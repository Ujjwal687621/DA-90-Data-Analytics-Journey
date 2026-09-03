# Day 24 — Excel Sales Analysis & Business Insights

Date: September 2, 2026

## Overview

Day 24 focused on transitioning from SQL-based analysis into Excel and reproducing business analysis using PivotTables, XLOOKUP, formulas, filtering, and category-level drill-down.

The work was completed across two sessions, both treated as Day 24.

The objective was to take the existing Ujjsha Retail dataset, recover the source tables from PostgreSQL, load the relevant data into Excel, enrich the sales data with product information, and analyze July-to-August unit sales performance.

---

## Part 1 — Dataset Recovery and Excel Setup

The original PostgreSQL database contained six tables:

- customers
- inventory
- products
- sales
- suppliers
- transactions

The tables were exported into CSV files and stored in:

08_Datasets/

The recovered dataset files included:

- customers.csv
- inventory.csv
- products.csv
- sales.csv
- suppliers.csv
- transactions.csv

The row counts were verified from the CSV files.

Verified CSV line counts:

- customers.csv — 7 lines
- inventory.csv — 56 lines
- products.csv — 26 lines
- sales.csv — 201 lines
- suppliers.csv — 11 lines
- transactions.csv — 9 lines

The sales and products datasets were then loaded into Excel.

---

## Part 2 — Excel Tables and Lookups

The sales dataset was loaded into Excel and converted into:

SalesTable

SalesTable contained 200 sales records.

The products dataset was converted into:

ProductsTable

XLOOKUP was used to bring product information into the sales data.

The product lookups were verified successfully.

The resulting sales analysis included:

- sale_id
- product_id
- sale_date
- quantity
- product_name
- category

This created an analysis-ready sales table.

---

## Part 3 — Category Sales Overview

A PivotTable was created from SalesTable.

The PivotTable summarized total quantity sold by category.

Results:

| Category    | Units Sold | % of Total |
| ----------- | ---------- | ---------- |
| Networking  | 218        | 29.38%     |
| Accessories | 199        | 26.82%     |
| Audio       | 142        | 19.14%     |
| Office      | 108        | 14.56%     |
| Computer    | 75         | 10.11%     |
| Grand Total | 742        | 100.00%    |

Total units sold across the dataset were 742.

Networking was the largest category by total unit volume at 218 units, representing 29.38% of total units sold.

Accessories was the second-largest category at 199 units, representing 26.82%.

---

## Part 4 — July vs. August Analysis

A second PivotTable was created to compare monthly unit sales.

The sale_date field was grouped into months.

May and June were excluded from the comparison, leaving July and August.

The monthly totals were:

- July: 204 units
- August: 125 units

Combined July and August total:

329 units

Overall July-to-August change:

125 - 204 = -79 units

Therefore, unit sales declined by 79 units from July to August.

---

## Part 5 — Product-Level Change

The PivotTable displayed product-level July and August quantities.

Two additional formula columns were created beside the PivotTable:

- Change
- % Change

These columns were intentionally kept outside the PivotTable because they were standard Excel calculations based on the PivotTable results.

Change was calculated as:

August - July

Example:

Business Laptop:

July = 7
August = 0

Change = 0 - 7
Change = -7

Positive Change indicates growth.

Negative Change indicates decline.

Zero indicates no change.

---

## Part 6 — Percentage Change

Percentage change was calculated using:

Change / July

The Excel formula used was:

=IF(B5=0,"N/A",E5/B5)

This prevented division-by-zero errors when July sales were zero.

Example:

Business Laptop:

July = 7
August = 0
Change = -7

Percentage Change = -100%

Desk Lamp:

July = 0
August = 3
Change = +3

Percentage Change = N/A

Percentage change was formatted as a percentage with two decimal places.

---

## Part 7 — Declining Products

A filter was applied to identify products with:

Change < 0

This resulted in:

15 products declining from July to August.

A second filter was applied:

% Change <= -50%

This narrowed the results to:

12 products experiencing a decline of 50% or more.

---

## Part 8 — Largest Product-Level Declines

The largest absolute unit declines were identified.

Top decline:

Wireless Mouse = -30 units

Second:

Mesh Wi-Fi System = -18 units

Third-largest decline was a three-way tie:

- Monitor Arm = -11 units
- Mouse Pad = -11 units
- Wi-Fi Router = -11 units

The tie was preserved rather than arbitrarily selecting one product as third.

---

## Part 9 — Category-Level Analysis

The PivotTable was expanded to show:

Category → Product

Category-level July and August totals were analyzed.

Results:

| Category    | July | August | Change |
| ----------- | ---- | ------ | ------ |
| Accessories | 70   | 17     | -53    |
| Audio       | 25   | 28     | +3     |
| Computer    | 26   | 16     | -10    |
| Networking  | 55   | 32     | -23    |
| Office      | 28   | 32     | +4     |
| Total       | 204  | 125    | -79    |

Three categories declined:

- Accessories
- Networking
- Computer

Two categories increased:

- Audio
- Office

---

## Part 10 — Accessories Drill-Down

Accessories declined from 70 units in July to 17 units in August.

Total change:

-53 units

Product breakdown:

| Product        | July | August | Change |
| -------------- | ---- | ------ | ------ |
| Laptop Stand   | 3    | 0      | -3     |
| Mouse Pad      | 17   | 6      | -11    |
| USB-C Cable    | 13   | 5      | -8     |
| Webcam Cover   | 7    | 6      | -1     |
| Wireless Mouse | 30   | 0      | -30    |
| Total          | 70   | 17     | -53    |

Wireless Mouse was the largest contributor to the Accessories decline.

Wireless Mouse accounted for:

30 / 53 = approximately 56.6%

of the Accessories category decline.

---

## Part 11 — Networking Drill-Down

Networking declined from 55 units in July to 32 units in August.

Total change:

-23 units

Product breakdown:

| Product           | July | August | Change |
| ----------------- | ---- | ------ | ------ |
| Ethernet Adapter  | 5    | 6      | +1     |
| Mesh Wi-Fi System | 25   | 7      | -18    |
| Network Switch    | 11   | 8      | -3     |
| Wi-Fi Extender    | 2    | 10     | +8     |
| Wi-Fi Router      | 12   | 1      | -11    |
| Total             | 55   | 32     | -23    |

The largest declines were:

- Mesh Wi-Fi System: -18
- Wi-Fi Router: -11

These declines were partially offset by:

- Wi-Fi Extender: +8
- Ethernet Adapter: +1

Network Switch declined by 3 units.

---

## Part 12 — Computer Drill-Down

Computer declined from 26 units in July to 16 units in August.

Total change:

-10 units

Product breakdown:

| Product          | July | August | Change |
| ---------------- | ---- | ------ | ------ |
| Business Laptop  | 7    | 0      | -7     |
| Desktop Computer | 5    | 0      | -5     |
| Gaming Laptop    | 3    | 2      | -1     |
| Mini PC          | 4    | 5      | +1     |
| Workstation      | 7    | 9      | +2     |
| Total            | 26   | 16     | -10    |

The largest declines were:

- Business Laptop: -7
- Desktop Computer: -5
- Gaming Laptop: -1

These were partially offset by:

- Mini PC: +1
- Workstation: +2

---

## Key Findings

1. Total unit sales declined by 79 units from July to August.

2. July unit sales were 204 while August unit sales were 125.

3. Accessories experienced the largest category decline:
   70 → 17 units
   Change = -53

4. Networking experienced the second-largest decline:
   55 → 32 units
   Change = -23

5. Computer declined by:
   26 → 16 units
   Change = -10

6. Audio increased by 3 units.

7. Office increased by 4 units.

8. Wireless Mouse was the single largest product-level decline:
   -30 units.

9. Mesh Wi-Fi System declined by:
   -18 units.

10. Wi-Fi Router declined by:
    -11 units.

11. Business Laptop declined by:
    -7 units.

12. Desktop Computer declined by:
    -5 units.

The five products above accounted for:

30 + 18 + 11 + 7 + 5 = 71 units

of the 79-unit overall decline.

Therefore, these five products accounted for approximately:

71 / 79 = 89.9%

of the overall July-to-August unit decline.

---

## Business Interpretation

The July-to-August decline was not evenly distributed across the product portfolio.

The majority of the decline was concentrated in three categories:

- Accessories
- Networking
- Computer

Accessories was the most significant contributor, accounting for 53 of the 79 units of overall decline.

Within Accessories, Wireless Mouse was the dominant driver.

Within Networking, Mesh Wi-Fi System and Wi-Fi Router were the main sources of decline.

Within Computer, Business Laptop and Desktop Computer were the primary declining products.

At the same time, some products showed growth, including:

- Wi-Fi Extender
- Workstation
- Mini PC
- Office products overall
- Audio products overall

This indicates that the decline was concentrated rather than universal across every product.

---

## Analyst Thinking Practiced

Day 24 reinforced several important analyst concepts:

- Recovering and validating source data
- Working between PostgreSQL and Excel
- Creating Excel Tables
- Using XLOOKUP
- Building PivotTables
- Grouping dates by month
- Calculating absolute change
- Calculating percentage change
- Handling division-by-zero cases
- Filtering based on business rules
- Drilling from category to product
- Distinguishing absolute decline from percentage decline
- Identifying concentrated drivers of a business problem
- Preserving ties instead of forcing arbitrary rankings
- Validating totals throughout the analysis

---

## Next Investigation

The next analytical question should move beyond identifying the decline and investigate why these products declined.

Potential areas for investigation include:

- Changes in pricing
- Inventory availability
- Supplier issues
- Product availability by month
- Customer purchasing behavior
- Transaction volume versus quantity sold
- Whether declining products experienced unusually low August availability
- Whether growth in substitute products explains some of the decline

Day 24 established the performance problem.

The next phase should investigate the potential causes.