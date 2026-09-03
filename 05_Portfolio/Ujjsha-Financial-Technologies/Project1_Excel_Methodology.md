# Project 1 — Excel Methodology

## Objective

Use Excel to analyze July-to-August retail unit sales performance and identify the products and categories responsible for the decline.

---

## Data Sources

Primary source tables:

- sales
- products

Source system:

PostgreSQL

Export format:

CSV

Excel datasets:

- sales.csv
- products.csv

---

## Excel Tables

The following Excel Tables were created:

SalesTable

ProductsTable

SalesTable contained 200 sales records.

---

## Data Enrichment

XLOOKUP was used to bring product attributes into SalesTable.

Product information added:

- product_name
- category

All lookups were verified.

---

## PivotTable 1 — Overall Category Performance

Rows:

category

Values:

Sum of quantity

Second value:

% of Grand Total

Result:

Total units = 742

---

## PivotTable 2 — Monthly Product Performance

Rows:

product_name

Columns:

sale_date

Values:

Sum of quantity

The date field was grouped by month.

May and June were excluded.

July and August were retained.

---

## Monthly Results

July:

204

August:

125

Change:

-79

---

## Product-Level Calculations

Two regular Excel formula columns were placed beside the PivotTable:

Change

% Change

### Change Formula

August - July

Example:

=C5-B5

### Percentage Change Formula

=IF(B5=0,"N/A",E5/B5)

The IF statement prevents division-by-zero errors.

---

## Decline Filters

First filter:

Change < 0

Result:

15 declining products

Second filter:

% Change <= -50%

Result:

12 products

---

## Category Drill-Down

The PivotTable Rows hierarchy was changed to:

category
product_name

This allowed category-level performance to be analyzed and then broken down into individual products.

---

## Category Results

Accessories:

70 → 17 = -53

Networking:

55 → 32 = -23

Computer:

26 → 16 = -10

Audio:

25 → 28 = +3

Office:

28 → 32 = +4

Total:

204 → 125 = -79

---

## Analytical Principles

The analysis distinguished between:

### Absolute Change

Measures the number of units gained or lost.

Example:

30 → 0 = -30 units

### Percentage Change

Measures the relative change compared with the previous period.

Example:

30 → 0 = -100%

Both measures are useful.

Absolute change shows business volume impact.

Percentage change shows relative severity.

---

## Handling Zero Baselines

When July quantity was zero, percentage change was reported as N/A.

Example:

July = 0

August = 3

Absolute change = +3

Percentage change = N/A

This avoids an invalid division-by-zero calculation.

---

## Validation

The following totals were validated:

Overall total units:

742

July units:

204

August units:

125

July + August:

329

July-to-August change:

-79

Category totals reconciled to monthly totals.

Product totals reconciled to category totals during category drill-down.

---

## Final Result

The Excel analysis successfully identified the primary drivers of the July-to-August decline and provided a structured path from:

Overall performance

to

Category performance

to

Product-level drivers.