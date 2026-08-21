# Day 17 – Sales Trend & Purchase Behavior Analysis

## Objective

Today I moved from inventory analysis into sales trend analysis.

The goal was to investigate a business question:

> Why did sales decline after June?

The analysis started with monthly sales trends and progressively drilled down into categories, products, and transaction behavior.

---

# 1. Monthly Sales Trend

## Business Question

> How are sales performing over time?

The first metric selected was:

    Total Units Sold per Month

The calculation used:

    SUM(quantity)

Sales were grouped by month using:

    DATE_TRUNC('month', sale_date)

### Key SQL Concept: DATE_TRUNC()

DATE_TRUNC() allows dates to be grouped into time periods.

For example:

    2026-05-22
    2026-05-31

both become:

    2026-05-01

when using:

    DATE_TRUNC('month', sale_date)

This allows all sales from the same month to be aggregated together.

### Important Note

DATE_TRUNC() returns a timestamp representing the beginning of the period.

The output may therefore appear as:

    2026-06-01 00:00:00

This is correct.

For analysis, the timestamp representation is useful because it can be sorted and compared as a date/time value.

---

# 2. Monthly Sales Observation

The monthly analysis showed:

    May → June: Significant increase
    June → July: Significant decline
    July → August: Continued decline

The analysis therefore moved from:

> What happened?

to:

> Why did sales decline after June?

---

# 3. Product-Level Monthly Analysis

## Business Question

> Which products contributed most to the monthly sales changes?

The sales table was joined with the products table to obtain:

- Product name
- Product category

The analysis used:

    DATE_TRUNC('month', sale_date)
    SUM(quantity)

The grain became:

> One row per product per month.

This allowed products to be compared across May, June, July, and August.

---

# 4. Major June Contributors

Three products were identified as major contributors to June sales:

- Product 5
- Product 1
- Product 25

Their sales were:

| Product    |  May | June | July | August |
| ---------- | ---: | ---: | ---: | -----: |
| Product 5  |    — |   43 |   17 |      6 |
| Product 1  |    — |   38 |   30 |      — |
| Product 25 |   13 |   28 |   25 |      7 |

These products also declined after June.

---

# 5. Quantifying the June → July Decline

Total units sold:

    June = 318
    July = 204

Overall decline:

    318 - 204 = 114 units

Percentage decline:

    114 / 318 × 100
    ≈ 35.8%

Therefore:

> Total unit sales declined by approximately 35.8% from June to July.

The three major June contributors declined by:

    Product 5  → -26 units
    Product 1  → -8 units
    Product 25 → -3 units

Combined:

    -37 units

Contribution to total decline:

    37 / 114 × 100
    ≈ 32.5%

Therefore:

> These three products accounted for approximately 32.5% of the June → July unit-sales decline.

---

# 6. Category-Level Analysis

## Business Question

> Which product categories contributed most to the June → July decline?

The analysis grouped sales by:

    Month
    Category

Results:

| Category    | June | July | Change |
| ----------- | ---: | ---: | -----: |
| Accessories |  107 |   70 |    -37 |
| Computer    |   25 |   26 |     +1 |
| Audio       |   57 |   25 |    -32 |
| Office      |   43 |   28 |    -15 |
| Networking  |   86 |   55 |    -31 |
| Total       |  318 |  204 |   -114 |

### Key Finding

The three largest declining categories were:

- Accessories: -37
- Audio: -32
- Networking: -31

Combined decline:

    37 + 32 + 31 = 100 units

Contribution:

    100 / 114 × 100
    ≈ 87.7%

Therefore:

> Accessories, Audio, and Networking accounted for approximately 87.7% of the overall June → July decline.

### Additional Observation

Computer sales increased slightly:

    25 → 26 units

Therefore, the decline was not uniform across all categories.

---

# 7. Product-Level Drill-Down

The analysis then investigated the largest product-level contributors within the declining categories.

## Accessories

### Mouse Pad

    June = 43
    July = 17

Decline:

    26 units

Percentage decline:

    26 / 43 × 100
    ≈ 60.5%

Accessories declined by 37 units overall.

Mouse Pad contribution:

    26 / 37 × 100
    ≈ 70.3%

Therefore:

> Mouse Pad accounted for approximately 70.3% of the Accessories category's decline.

---

# 8. Audio

### Bluetooth Speaker

    June = 19
    July = 4

Decline:

    15 units

Percentage decline:

    15 / 19 × 100
    ≈ 78.9%

Audio declined by 32 units overall.

Bluetooth Speaker contribution:

    15 / 32 × 100
    ≈ 46.9%

Therefore:

> Bluetooth Speaker accounted for approximately 46.9% of the Audio category's decline.

---

# 9. Networking

### Ethernet Adapter

    June = 20
    July = 5

Decline:

    15 units

Percentage decline:

    15 / 20 × 100
    = 75%

Networking declined by 31 units overall.

Ethernet Adapter contribution:

    15 / 31 × 100
    ≈ 48.4%

Therefore:

> Ethernet Adapter accounted for approximately 48.4% of the Networking category's decline.

---

# 10. Purchase Behavior Analysis

## Business Question

> Did the decline come from fewer transactions, smaller purchases, or both?

A new metric was introduced:

    Average Units per Sale

Formula:

    SUM(quantity) / COUNT(sale_id)

NULLIF() was used to protect against division by zero:

    SUM(quantity) /
    NULLIF(COUNT(sale_id), 0)

---

# 11. Monthly Purchase Behavior

| Month  | Transactions | Units Sold | Avg. Units/Sale |
| ------ | -----------: | ---------: | --------------: |
| June   |           77 |        318 |               4 |
| July   |           61 |        204 |               3 |
| August |           36 |        125 |               3 |

## June → July

Transactions:

    77 → 61

Decline:

    16 transactions
    ≈ 20.8%

Units sold:

    318 → 204

Decline:

    114 units
    ≈ 35.8%

Average units per sale:

    4 → 3

Decline:

    25%

### Finding

The June → July decline was associated with both:

- Fewer sales transactions
- Smaller average quantities per transaction

Because there is no customer_id in the dataset, the analysis refers to sales transactions rather than individual customers.

---

# 12. Product-Level Transaction Analysis

The three major product contributors were investigated to determine whether their declines were driven by:

- Fewer transactions
- Smaller quantities per transaction

---

## Mouse Pad

| Metric          | June | July |
| --------------- | ---: | ---: |
| Transactions    |    7 |    3 |
| Units Sold      |   43 |   17 |
| Avg. Units/Sale |    6 |    5 |

Transactions declined:

    7 → 3
    ≈ 57.1%

Average units per sale declined:

    6 → 5
    ≈ 16.7%

### Finding

The decline in Mouse Pad sales was primarily associated with fewer transactions rather than a major change in average quantity per transaction.

---

## Bluetooth Speaker

| Metric          | June | July |
| --------------- | ---: | ---: |
| Transactions    |    6 |    2 |
| Units Sold      |   19 |    4 |
| Avg. Units/Sale |    3 |    2 |

Transactions declined:

    6 → 2
    ≈ 66.7%

Average units per sale declined:

    3 → 2
    ≈ 33.3%

### Finding

The decline was primarily associated with fewer transactions, with smaller quantities per transaction contributing as well.

---

## Ethernet Adapter

| Metric          | June | July |
| --------------- | ---: | ---: |
| Transactions    |    5 |    2 |
| Units Sold      |   20 |    5 |
| Avg. Units/Sale |    4 |    2 |

Transactions declined:

    5 → 2
    = 60%

Average units per sale declined:

    4 → 2
    = 50%

### Finding

Ethernet Adapter experienced both:

- A substantial decline in transaction volume
- A significant decline in average units sold per transaction

---

# 13. Transaction Contribution

Overall transactions declined:

    77 → 61

Total decline:

    16 transactions

The three major products contributed:

    Mouse Pad          -4
    Bluetooth Speaker  -4
    Ethernet Adapter   -3

Combined:

    -11 transactions

Contribution:

    11 / 16 × 100
    = 68.75%

Therefore:

> Mouse Pad, Bluetooth Speaker, and Ethernet Adapter accounted for 68.75% of the June → July decline in sales transactions.

---

# 14. July → August Trend

The decline continued into August.

| Month  | Transactions | Units Sold | Avg. Units/Sale |
| ------ | -----------: | ---------: | --------------: |
| June   |           77 |        318 |               4 |
| July   |           61 |        204 |               3 |
| August |           36 |        125 |               3 |

July → August:

Transactions:

    61 → 36

Decline:

    25 transactions
    ≈ 41.0%

Units sold:

    204 → 125

Decline:

    79 units
    ≈ 38.7%

Average units per sale:

    3 → 3

The average remained approximately stable.

### Finding

The continued July → August decline appears to be driven primarily by a reduction in transaction volume rather than a reduction in average units per transaction.

---

# 15. Overall Business Finding

The analysis supports the following conclusion:

> Overall unit sales declined 35.8% from June to July. Accessories, Audio, and Networking accounted for 87.7% of the decline, with Mouse Pad, Bluetooth Speaker, and Ethernet Adapter emerging as key product-level contributors. The decline was associated with fewer sales transactions across all three products, while Ethernet Adapter also experienced a 50% decline in average units sold per transaction.

Sales continued to decline into August, with transactions falling from 61 to 36 while average units per transaction remained approximately stable.

---

# 16. Data Limitations

The dataset does not contain:

- customer_id
- historical inventory snapshots
- customer demographics
- promotions
- marketing activity
- product availability history
- supplier lead times

Therefore, the analysis can identify patterns and associations but cannot establish a definitive causal explanation for the decline.

For example, we cannot conclude that:

> Customers stopped purchasing these products.

We can conclude that:

> Sales transactions involving these products declined.

This distinction is important for responsible business analysis.

---

# Key SQL Concepts Learned

- DATE_TRUNC()
- COUNT()
- SUM()
- NULLIF()
- LEFT JOIN
- GROUP BY
- ORDER BY
- Aggregation by month
- Aggregation by product
- Aggregation by category
- Drill-down analysis
- Average units per transaction
- Percentage contribution analysis

---

# Analytical Workflow

Today's analysis followed this structure:

    Business Question
          ↓
    Monthly Sales Trend
          ↓
    Identify Decline
          ↓
    Category Drill-Down
          ↓
    Product Drill-Down
          ↓
    Transaction Analysis
          ↓
    Purchase Behavior
          ↓
    Business Finding

---

# Day 17 Summary

Today I learned how to use SQL to investigate a sales trend rather than simply calculate totals.

The analysis moved from a high-level monthly trend into category, product, and transaction-level analysis.

The main finding was that the decline in sales was concentrated in a small number of categories and products and was strongly associated with reduced transaction activity.

The next session will introduce a new SQL concept:

> Conditional Aggregation

This will allow July and August performance to be compared side-by-side more efficiently.

**Status: Day 17 Complete**