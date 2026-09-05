# DA-90 — Day 25: Retail Sales Root Cause Investigation

**Date:** September 4, 2026
**Project:** Ujjsha Retail Sales Analysis
**Tool:** Microsoft Excel
**Phase:** Portfolio Project 1

---

## Objective

Continue the Ujjsha Retail Sales analysis by investigating the July-to-August sales decline identified during Day 24.

The main objective was to determine whether the decline was related to:

1. Inventory availability
2. Transaction volume
3. Units purchased per transaction
4. Category-level transaction activity
5. Product-level transaction activity
6. Changes in product mix

---

## Data Used

The analysis used the following project datasets:

- Sales data
- Products data
- Inventory data

The datasets were loaded into the existing Excel workbook:

`02_Excel/Ujjsha_Retail_Project1.xlsx`

Existing Excel tables used:

- `SalesTable`
- `ProductsTable`
- `InventoryTable`

---

# Part 1 — Inventory Investigation

## Inventory Table

The inventory dataset contained:

- `inventory_id`
- `product_id`
- `warehouse`
- `stock_quantity`

There was no inventory date/history field.

The data was converted into an Excel Table named:

`InventoryTable`

---

## Product Lookup

A product-name lookup was added to the inventory data using XLOOKUP.

The lookup initially produced inconsistent results because of data-type issues with the product IDs.

The final working formula was:

=XLOOKUP(VALUE([@product_id]),ProductsTable[product_id],ProductsTable[product_name],"Not Found")

This converted the inventory product ID to a numeric value before performing the lookup.

The following product lookups were verified:

- Wireless Mouse
- Mesh Wi-Fi System
- Wi-Fi Router
- Business Laptop
- Desktop Computer

---

## Inventory PivotTable

An inventory PivotTable was created using:

Rows:
- `product_name`

Columns:
- `warehouse`

Values:
- `stock_quantity` summarized as Sum

Total inventory across all warehouses:

**5,064 units**

Warehouse totals:

- Chicago: 1,875
- Dallas: 1,662
- New York: 1,527

---

## Inventory for Major Declining Products

| Product           | Current Inventory |
| ----------------- | ----------------: |
| Wireless Mouse    |               269 |
| Mesh Wi-Fi System |               113 |
| Wi-Fi Router      |               168 |
| Business Laptop   |                69 |
| Desktop Computer  |                30 |

### Finding

The current inventory data does not support insufficient inventory as an obvious explanation for the sales decline.

However, the inventory dataset does not contain historical inventory dates. Therefore, it is not possible to determine whether inventory shortages occurred specifically during July or August.

### Analyst Conclusion

**Hypothesis:** The July-to-August sales decline was caused by insufficient inventory.

**Status:** Not supported by current evidence, but not completely ruled out.

---

# Part 2 — Transaction Volume Investigation

The next investigation focused on whether the sales decline was caused by fewer transactions or smaller purchases per transaction.

A PivotTable was created using:

Rows:
- `sale_date` grouped by Month

Values:
- Count of `sale_id`
- Sum of `quantity`

---

## July vs. August

| Metric              | July | August | Change | % Change |
| ------------------- | ---: | -----: | -----: | -------: |
| Transactions        |   61 |     36 |    -25 |  -40.98% |
| Units Sold          |  204 |    125 |    -79 |  -38.73% |
| Units / Transaction | 3.34 |   3.47 |  +0.13 |    +3.9% |

Units per transaction were calculated as:

`Total Units Sold / Total Transactions`

July:

`204 / 61 = 3.34`

August:

`125 / 36 = 3.47`

### Finding

Transaction volume declined by approximately 41%, while units sold declined by approximately 39%.

At the same time, average units per transaction increased by approximately 4%.

### Analyst Conclusion

The July-to-August decline appears to be driven primarily by fewer transactions, rather than customers purchasing substantially fewer units per transaction.

---

# Category-Level Transaction Analysis

A PivotTable was created using:

Rows:
- `category`

Columns:
- Month

Values:
- Count of `sale_id`

| Category    |   July | August |  Change |   % Change |
| ----------- | -----: | -----: | ------: | ---------: |
| Accessories |     15 |      4 |     -11 |     -73.3% |
| Audio       |     10 |      8 |      -2 |     -20.0% |
| Computer    |     12 |      8 |      -4 |     -33.3% |
| Networking  |     14 |      7 |      -7 |     -50.0% |
| Office      |     10 |      9 |      -1 |     -10.0% |
| **Total**   | **61** | **36** | **-25** | **-41.0%** |

### Finding

Accessories experienced the largest transaction decline:

`15 → 4 transactions (-11)`

Networking experienced the second-largest decline:

`14 → 7 transactions (-7)`

Together, Accessories and Networking accounted for:

`11 + 7 = 18 lost transactions`

Out of the total 25 lost transactions:

`18 / 25 = 72%`

Therefore, Accessories and Networking accounted for **72% of the total transaction decline**.

---

# Product-Level Transaction Analysis

A product-level PivotTable was created using:

Rows:
- `product_name`

Columns:
- Month

Values:
- Count of `sale_id`

Several major declining products also experienced significant transaction declines.

| Product           | July Transactions | August Transactions | Change |
| ----------------- | ----------------: | ------------------: | -----: |
| Wireless Mouse    |                 5 |                   0 |     -5 |
| Mesh Wi-Fi System |                 5 |                   1 |     -4 |
| Business Laptop   |                 4 |                   0 |     -4 |
| Monitor Arm       |                 4 |                   1 |     -3 |
| USB-C Cable       |                 4 |                   1 |     -3 |
| Desktop Computer  |                 2 |                   0 |     -2 |
| Mouse Pad         |                 3 |                   1 |     -2 |
| Laptop Stand      |                 2 |                   0 |     -2 |
| Wi-Fi Router      |                 2 |                   1 |     -1 |

This aligned with the major product-level unit declines identified during Day 24.

---

# Product Mix Investigation

A final PivotTable compared units sold by product across July and August.

Several products increased their unit sales in August.

Notable increases included:

| Product           | July Units | August Units | Change |
| ----------------- | ---------: | -----------: | -----: |
| Office Chair      |          2 |           23 |    +21 |
| Wi-Fi Extender    |          2 |           10 |     +8 |
| USB Microphone    |          4 |           10 |     +6 |
| Bluetooth Speaker |          4 |            6 |     +2 |
| Workstation       |          7 |            9 |     +2 |
| Ethernet Adapter  |          5 |            6 |     +1 |
| Mini PC           |          4 |            5 |     +1 |
| Wireless Earbuds  |          5 |            6 |     +1 |

Office Chair was the most significant increase:

July: 2 units

August: 23 units

Change: +21 units

Office Chairs represented:

`23 / 125 = 18.4%`

of all August units sold.

### Finding

August was not simply a universal decline across every product.

Instead, the data shows evidence of a shift in product mix, with some products declining substantially while others increased.

---

# Overall Day 25 Findings

The investigation produced the following conclusions:

### 1. Sales volume declined

July:

**204 units**

August:

**125 units**

Change:

**-79 units (-38.7%)**

### 2. Transaction volume declined more significantly

July:

**61 transactions**

August:

**36 transactions**

Change:

**-25 transactions (-41.0%)**

### 3. Average transaction size did not decline

Units per transaction increased:

**3.34 → 3.47**

This indicates that the decline was primarily associated with fewer transactions rather than smaller transaction sizes.

### 4. The transaction decline was concentrated

Accessories and Networking accounted for:

**18 of 25 lost transactions**

or:

**72% of the total transaction decline.**

### 5. Major declining products also lost transaction frequency

Products such as Wireless Mouse, Mesh Wi-Fi System, Business Laptop, Monitor Arm, and USB-C Cable experienced meaningful declines in transaction frequency.

### 6. August had a meaningful product-mix shift

Office Chair increased from 2 units in July to 23 units in August and represented **18.4% of August unit sales**.

### 7. The root cause has not yet been established

The available data does not include:

- Customer IDs
- Historical inventory snapshots
- Pricing history
- Promotion/discount data
- Marketing activity
- Website traffic
- Product availability by date

Therefore, the analysis can identify where the decline occurred and what patterns accompanied it, but cannot yet determine the underlying business cause.

---

# Analyst Takeaway

The strongest current interpretation is:

> **The July-to-August sales decline was primarily driven by a reduction in transaction volume, with the decline concentrated in Accessories and Networking. Several of the products responsible for the largest unit declines also experienced substantial drops in transaction frequency. At the same time, some products—especially Office Chairs—experienced significant growth, indicating a shift in product mix rather than a universal decline across all products.**

Further investigation would require additional data such as customer activity, historical inventory, pricing, promotions, and marketing activity.

---

## Skills Practiced

- Excel Tables
- XLOOKUP
- Data-type troubleshooting
- PivotTables
- Date grouping by month
- Transaction counting
- Quantity aggregation
- Percentage change calculations
- Units-per-transaction analysis
- Category-level analysis
- Product-level drill-down
- Product-mix analysis
- Hypothesis testing
- Evidence-based business reasoning
- Recognizing data limitations