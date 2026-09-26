# Day 39 — DAX Measures & Executive KPI Dashboard

**Phase:** Phase 3 — Power BI & Data Visualization

**Project:** Portfolio Project #1 — Ujjsha Retail Analysis

**Status:** ✅ Complete

---

## Objective

Learn how analysts create dynamic business calculations using DAX Measures and build an executive KPI dashboard that automatically responds to slicers, drill-down, and drill-through.

Today's focus shifted from using existing columns to creating reusable business metrics.

---

# Module 1 — Calculated Columns vs Measures

Learned the difference between calculated columns and measures.

| Calculated Column        | Measure                    |
| ------------------------ | -------------------------- |
| Calculates per row       | Calculates dynamically     |
| Stored in every row      | Calculated when needed     |
| Used for row-level logic | Used for dashboard metrics |

Key lesson:

Measures are reusable business calculations that automatically respond to filters.

---

# First DAX Measure

Created the first DAX measure.

```DAX
Total Revenue = SUM(SalesTable[revenue])
```

Learned:

* SUM()
* calculator icon identifies measures
* measures do not create new table rows

Created the first KPI Card.

Result:

`$224.87K`

---

# Executive KPI Dashboard

Built a professional KPI row.

Created:

* Total Revenue
* Total Transactions
* Total Quantity
* Average Selling Price
* Avg Items / Transaction

---

# Total Quantity

Created:

```DAX
Total Quantity = SUM(SalesTable[quantity])
```

Result:

`742`

Encountered a temporary syntax error while creating the measure.

Resolved it by recreating the measure from scratch.

Learned that DAX editor errors are sometimes caused by incomplete edits rather than incorrect formulas.

---

# Total Transactions

Created:

```DAX
Total Transactions = COUNTROWS(SalesTable)
```

Result:

`200`

Learned the business difference between:

* items sold
* transactions

Example:

One purchase containing five items increases:

* Quantity by 5
* Transactions by 1

---

# Average Selling Price

Created the first measure built from other measures.

```DAX
Average Selling Price =
DIVIDE([Total Revenue], [Total Quantity])
```

Result:

`$303.06`

Learned:

* DIVIDE()
* safe division
* why DIVIDE() is preferred over /

Formatted the measure as Currency.

---

# Filter Context

Tested the Category slicer.

Selected:

`Computer`

Observed automatic recalculation.

| KPI               | Computer |
| ----------------- | -------: |
| Revenue           |  $61.68K |
| Quantity          |       75 |
| Transactions      |       35 |
| Avg Selling Price |  $822.43 |

Most important lesson:

The DAX formulas never changed.

Power BI simply changed the filter context.

This demonstrated one of the core concepts of DAX.

---

# Average Items per Transaction

Created another derived business KPI.

```DAX
Average Items per Transaction =
DIVIDE([Total Quantity], [Total Transactions])
```

Results:

* Overall: `3.71`
* Computer: `2.14`

Business interpretation:

Computer purchases contain fewer items per order but much higher-value products.

---

# Dashboard Polish

Improved the executive dashboard.

Completed:

* renamed slicer title to Product Category
* sorted Revenue by Product Category descending
* aligned KPI cards
* made KPI cards equal width
* shortened KPI title to Avg Items / Transaction
* reduced excessive white space
* preserved consistent dashboard spacing

Final dashboard structure:

Top section:

* Product Category slicer
* Five KPI cards

Bottom section:

* Revenue by Product Category
* Revenue Share by Category

The dashboard now follows a professional executive reporting layout.

---

# DAX Pattern Library

Built a reusable DAX reference.

| Business Question         | DAX Pattern |
| ------------------------- | ----------- |
| Total Revenue             | SUM()       |
| Total Quantity            | SUM()       |
| Total Transactions        | COUNTROWS() |
| Average Selling Price     | DIVIDE()    |
| Avg Items per Transaction | DIVIDE()    |

---

# Business Insights

Overall business performance:

* Revenue: $224.87K
* Quantity Sold: 742
* Transactions: 200
* Avg Selling Price: $303.06
* Avg Items per Transaction: 3.71

Computer category observations:

* Revenue: $61.68K
* Quantity: 75
* Transactions: 35
* Avg Selling Price: $822.43
* Avg Items per Transaction: 2.14

Interpretation:

Computer products generate higher revenue per item while customers purchase fewer items per transaction compared to the overall business average.

---

# Biggest Lesson

Day 39 demonstrated that DAX measures become significantly more powerful when combined with filter context.

Instead of creating separate calculations for every category, one reusable measure can answer multiple business questions automatically through slicers and report interactions.

---

# Day 39 Status

**DAX Measures & Executive KPI Dashboard — ✅ Complete**

---

# Next Step

**Day 40 — Advanced DAX & CALCULATE()**

Planned topics:

* CALCULATE()
* Running Totals
* Month-over-Month Revenue
* Top N Products
* Highest Revenue Category
* ALL()
* Advanced Filter Context
