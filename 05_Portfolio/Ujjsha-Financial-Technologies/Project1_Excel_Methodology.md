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

## Day 26 — Revenue Analysis Methodology

### Objective

Extend the Excel analysis from transaction and unit volume into revenue analysis and business impact.

### Step 1 — Add Unit Price

The SalesTable did not originally contain product pricing.

A `unit_price` column was added using XLOOKUP against ProductsTable.

Formula:

=XLOOKUP(VALUE([@product_id]),ProductsTable[product_id],ProductsTable[unit_price],"Not Found")

The VALUE function was used to ensure consistent numeric data types for the product ID lookup.

### Step 2 — Calculate Revenue

A calculated `revenue` column was added to SalesTable.

Formula:

=[@quantity]*[@unit_price]

This calculated revenue at the individual sales-record level.

### Step 3 — Monthly Revenue PivotTable

A PivotTable was created with:

Rows:
- `sale_date` grouped by Month

Values:
- Sum of `revenue`

This produced monthly revenue totals and allowed July and August to be compared.

### Step 4 — Revenue Change

Revenue change was calculated as:

August Revenue - July Revenue

July revenue:

$57,237.81

August revenue:

$42,551.47

Revenue change:

-$14,686.34

Revenue percentage change was calculated as:

(August Revenue - July Revenue) / July Revenue

Result:

-25.66%

### Step 5 — Revenue Per Transaction

Revenue per transaction was calculated as:

Total Revenue / Total Transactions

July:

$57,237.81 / 61 = $938.32

August:

$42,551.47 / 36 = $1,181.99

Percentage change:

+25.97%

### Step 6 — Revenue Per Unit

Revenue per unit was calculated as:

Total Revenue / Total Units Sold

July:

$57,237.81 / 204 = $280.58

August:

$42,551.47 / 125 = $340.41

Percentage change:

+21.32%

### Step 7 — Category Revenue Analysis

A PivotTable was created with:

Rows:
- `category`

Columns:
- Month

Values:
- Sum of `revenue`

Additional columns were used to calculate:

- Revenue Change
- Revenue % Change

This identified which categories contributed most to the overall revenue decline.

### Step 8 — Product-Level Revenue Drill-Down

A category-to-product hierarchy was created using:

Rows:
- `category`
- `product_name`

Columns:
- Month

Values:
- Sum of `revenue`

This allowed the Computer and Networking categories to be investigated at the individual product level.

### Step 9 — Average Unit Price Analysis

A PivotTable was created with:

Rows:
- `product_name`

Columns:
- Month

Values:
- Average of `unit_price`

This was used to determine whether changes in product pricing contributed to revenue changes.

### Step 10 — Product Mix Analysis

July and August unit sales were compared at the product level.

This identified products that increased or decreased in unit volume and helped explain why revenue per transaction and revenue per unit increased in August.

### Analytical Approach

The analysis followed a progressive drill-down:

Overall revenue
→ Transaction volume
→ Units sold
→ Revenue per transaction
→ Revenue per unit
→ Category revenue
→ Product revenue
→ Unit pricing
→ Product mix
→ Business recommendations

This approach helped distinguish between volume effects, pricing effects, and product-mix effects while avoiding unsupported causal conclusions.