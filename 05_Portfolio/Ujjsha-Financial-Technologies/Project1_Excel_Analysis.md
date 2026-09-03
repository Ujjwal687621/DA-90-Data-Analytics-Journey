# Project 1 — Ujjsha Retail Sales Analysis
## Excel Analysis

## Project Overview

This analysis extends the Ujjsha Retail Sales Analysis project into Excel.

The objective was to reproduce and expand the sales-performance analysis using Excel tools and create a business-focused view of July-to-August unit sales performance.

The analysis focused on:

- Data preparation
- XLOOKUP
- PivotTables
- Monthly sales analysis
- Product-level change
- Percentage change
- Category-level analysis
- Identification of major declining products

---

## Data Preparation

The source data originated from the Ujjsha Retail PostgreSQL database.

The database contained:

- customers
- inventory
- products
- sales
- suppliers
- transactions

The relevant CSV files were stored in:

08_Datasets/

The primary datasets used in this Excel analysis were:

- sales.csv
- products.csv

The sales data contained 200 records.

---

## Excel Data Model

Two Excel Tables were created:

SalesTable

ProductsTable

XLOOKUP was used to enrich SalesTable with product information from ProductsTable.

The final analysis-ready sales data included:

- sale_id
- product_id
- sale_date
- quantity
- product_name
- category

All product lookups were verified.

---

## Overall Category Performance

A PivotTable was created to summarize total quantity sold by category.

| Category    | Units Sold | % of Total |
| ----------- | ---------- | ---------- |
| Networking  | 218        | 29.38%     |
| Accessories | 199        | 26.82%     |
| Audio       | 142        | 19.14%     |
| Office      | 108        | 14.56%     |
| Computer    | 75         | 10.11%     |
| Grand Total | 742        | 100.00%    |

Total units sold:

742

Networking represented the largest share of total units sold at 29.38%.

---

## July vs. August Performance

The sale_date field was grouped by month in a PivotTable.

July:

204 units

August:

125 units

Change:

125 - 204 = -79 units

Therefore:

July-to-August unit sales declined by 79 units.

July and August combined:

329 units

---

## Product-Level Analysis

Product-level July and August quantities were analyzed.

The following calculations were added beside the PivotTable:

### Absolute Change

August - July

### Percentage Change

Change / July

The percentage calculation was protected against division by zero using:

=IF(B5=0,"N/A",E5/B5)

Products with no July baseline were therefore reported as N/A instead of producing a division-by-zero error.

---

## Decline Criteria

The analysis applied two conditions:

1. Change < 0
2. Percentage Change <= -50%

Results:

15 products declined.

12 products experienced a decline of 50% or more.

---

## Largest Product Declines

The largest absolute declines were:

| Product           | Change |
| ----------------- | ------ |
| Wireless Mouse    | -30    |
| Mesh Wi-Fi System | -18    |
| Monitor Arm       | -11    |
| Mouse Pad         | -11    |
| Wi-Fi Router      | -11    |

There was a three-way tie for the third-largest decline.

---

## Category Performance

| Category    | July | August | Change |
| ----------- | ---- | ------ | ------ |
| Accessories | 70   | 17     | -53    |
| Audio       | 25   | 28     | +3     |
| Computer    | 26   | 16     | -10    |
| Networking  | 55   | 32     | -23    |
| Office      | 28   | 32     | +4     |
| Total       | 204  | 125    | -79    |

### Interpretation

Accessories experienced the largest decline at 53 units.

Networking declined by 23 units.

Computer declined by 10 units.

Audio increased by 3 units.

Office increased by 4 units.

---

## Accessories Analysis

Accessories:

July = 70

August = 17

Change = -53

| Product        | July | August | Change |
| -------------- | ---- | ------ | ------ |
| Laptop Stand   | 3    | 0      | -3     |
| Mouse Pad      | 17   | 6      | -11    |
| USB-C Cable    | 13   | 5      | -8     |
| Webcam Cover   | 7    | 6      | -1     |
| Wireless Mouse | 30   | 0      | -30    |
| Total          | 70   | 17     | -53    |

Wireless Mouse was the primary driver.

Wireless Mouse contributed approximately 56.6% of the Accessories decline.

---

## Networking Analysis

Networking:

July = 55

August = 32

Change = -23

| Product           | July | August | Change |
| ----------------- | ---- | ------ | ------ |
| Ethernet Adapter  | 5    | 6      | +1     |
| Mesh Wi-Fi System | 25   | 7      | -18    |
| Network Switch    | 11   | 8      | -3     |
| Wi-Fi Extender    | 2    | 10     | +8     |
| Wi-Fi Router      | 12   | 1      | -11    |
| Total             | 55   | 32     | -23    |

The largest Networking declines were:

- Mesh Wi-Fi System: -18
- Wi-Fi Router: -11

The decline was partially offset by growth in Wi-Fi Extender and Ethernet Adapter.

---

## Computer Analysis

Computer:

July = 26

August = 16

Change = -10

| Product          | July | August | Change |
| ---------------- | ---- | ------ | ------ |
| Business Laptop  | 7    | 0      | -7     |
| Desktop Computer | 5    | 0      | -5     |
| Gaming Laptop    | 3    | 2      | -1     |
| Mini PC          | 4    | 5      | +1     |
| Workstation      | 7    | 9      | +2     |
| Total            | 26   | 16     | -10    |

Business Laptop and Desktop Computer were the primary contributors to the Computer category decline.

---

## Major Drivers

The five largest absolute product declines were:

- Wireless Mouse: -30
- Mesh Wi-Fi System: -18
- Wi-Fi Router: -11
- Business Laptop: -7
- Desktop Computer: -5

Combined decline:

-71 units

Overall decline:

-79 units

Share of total decline:

approximately 89.9%

---

## Business Conclusion

The July-to-August decline was highly concentrated.

Accessories was the largest source of lost unit volume, followed by Networking and Computer.

A small group of products accounted for the majority of the overall decline.

The most significant products were:

- Wireless Mouse
- Mesh Wi-Fi System
- Wi-Fi Router
- Business Laptop
- Desktop Computer

The analysis identifies where the decline occurred but does not establish its cause.

Further analysis should investigate:

- Pricing
- Inventory
- Product availability
- Supplier activity
- Customer behavior
- Transaction frequency
- Potential substitution between related products

---

## Tools Used

- PostgreSQL
- Excel
- Excel Tables
- XLOOKUP
- PivotTables
- PivotTable date grouping
- Excel formulas
- Excel filtering
- Percentage calculations

---

## Project Status

Project 1 Excel analysis completed for Day 24.

The next phase is root-cause investigation of the major declining products.