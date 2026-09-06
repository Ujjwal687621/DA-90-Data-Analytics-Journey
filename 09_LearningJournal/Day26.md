# DA-90 — Day 26: Retail Revenue Analysis & Business Recommendations

**Date:** September 5, 2026
**Project:** Ujjsha Retail Sales Analysis
**Tool:** Microsoft Excel
**Phase:** Portfolio Project 1

---

## Objective

Continue the Ujjsha Retail Sales analysis by moving from unit and transaction analysis into revenue analysis.

The primary objectives were to:

1. Calculate revenue from sales data.
2. Compare July and August revenue.
3. Measure revenue change and percentage change.
4. Analyze revenue by category.
5. Drill down to product-level revenue.
6. Determine whether pricing contributed to the revenue decline.
7. Analyze revenue per transaction and revenue per unit.
8. Translate the findings into business recommendations.

---

## Data Preparation

The existing SalesTable contained:

- `sale_id`
- `product_id`
- `sale_date`
- `quantity`
- `product_name`
- `category`

The SalesTable did not originally contain product pricing or revenue.

A `unit_price` column was added using XLOOKUP against ProductsTable.

The formula used was:

=XLOOKUP(VALUE([@product_id]),ProductsTable[product_id],ProductsTable[unit_price],"Not Found")

The `VALUE()` function was used to ensure the product ID was treated as a numeric value during the lookup.

A `revenue` column was then added using:

=[@quantity]*[@unit_price]

This calculated revenue for each sales record.

---

## July vs. August Revenue

A PivotTable was created using:

Rows:
- `sale_date` grouped by Month

Values:
- Sum of `revenue`

The resulting monthly revenue was:

| Month       |     Revenue |
| ----------- | ----------: |
| May         |  $40,328.44 |
| June        |  $84,754.79 |
| July        |  $57,237.81 |
| August      |  $42,551.47 |
| Grand Total | $224,872.51 |

The primary comparison was July versus August.

July revenue:

**$57,237.81**

August revenue:

**$42,551.47**

Revenue change:

**-$14,686.34**

Revenue percentage change:

**-25.66%**

---

## Revenue Per Transaction

Revenue per transaction was calculated as:

Total Revenue / Total Transactions

July:

$57,237.81 / 61 = $938.32

August:

$42,551.47 / 36 = $1,181.99

Revenue per transaction increased from:

**$938.32 → $1,181.99**

Percentage change:

**+25.97%**

### Finding

Although the number of transactions declined significantly, the average revenue generated per transaction increased substantially.

This indicates that the transactions occurring in August were, on average, higher-value transactions than those occurring in July.

---

## Revenue Per Unit

Revenue per unit was calculated as:

Total Revenue / Total Units Sold

July:

$57,237.81 / 204 = $280.58

August:

$42,551.47 / 125 = $340.41

Revenue per unit increased from:

**$280.58 → $340.41**

Percentage change:

**+21.32%**

### Finding

The average revenue generated per unit increased significantly in August.

This supports the conclusion that August's sales mix shifted toward higher-value products.

---

## July vs. August Overall Metrics

| Metric                |       July |     August |      Change | % Change |
| --------------------- | ---------: | ---------: | ----------: | -------: |
| Transactions          |         61 |         36 |         -25 |  -40.98% |
| Units Sold            |        204 |        125 |         -79 |  -38.73% |
| Units / Transaction   |       3.34 |       3.47 |       +0.13 |    +3.9% |
| Revenue               | $57,237.81 | $42,551.47 | -$14,686.34 |  -25.66% |
| Revenue / Transaction |    $938.32 |  $1,181.99 |    +$243.66 |  +25.97% |
| Revenue / Unit        |    $280.58 |    $340.41 |     +$59.83 |  +21.32% |

---

## Revenue by Category

A PivotTable was created using:

Rows:
- `category`

Columns:
- Month

Values:
- Sum of `revenue`

| Category    | July Revenue | August Revenue | Revenue Change | Revenue % Change |
| ----------- | -----------: | -------------: | -------------: | ---------------: |
| Accessories |    $3,257.14 |        $701.98 |     -$2,555.16 |          -78.45% |
| Audio       |    $8,096.37 |      $6,943.71 |     -$1,152.66 |          -14.24% |
| Computer    |   $19,694.50 |     $12,907.99 |     -$6,786.51 |          -34.46% |
| Networking  |   $20,800.13 |     $14,303.65 |     -$6,496.48 |          -31.23% |
| Office      |    $5,389.67 |      $7,694.14 |     +$2,304.47 |          +42.76% |
| Grand Total |   $57,237.81 |     $42,551.47 |    -$14,686.34 |          -25.66% |

### Findings

Accessories had the largest percentage decline:

**-78.45%**

Computer had the largest absolute revenue decline:

**-$6,786.51**

Networking had the second-largest absolute revenue decline:

**-$6,496.48**

Computer and Networking together accounted for:

**-$13,282.99**

of the net revenue decline.

This represents approximately:

**90.44% of the total net revenue decline.**

Office was the only category to increase revenue:

**+$2,304.47 (+42.76%)**

---

## Product-Level Revenue Analysis

A category-to-product hierarchy was created to drill down into the Computer and Networking categories.

### Computer

| Product          | July Revenue | August Revenue |     Change |
| ---------------- | -----------: | -------------: | ---------: |
| Business Laptop  |    $1,024.59 |          $0.00 | -$1,024.59 |
| Desktop Computer |    $6,937.20 |          $0.00 | -$6,937.20 |
| Gaming Laptop    |    $3,321.60 |      $2,214.40 | -$1,107.20 |
| Mini PC          |    $3,379.44 |      $4,224.30 |   +$844.86 |
| Workstation      |    $5,031.67 |      $6,469.29 | +$1,437.62 |
| Computer Total   |   $19,694.50 |     $12,907.99 | -$6,786.51 |

### Networking

| Product           | July Revenue | August Revenue |     Change |
| ----------------- | -----------: | -------------: | ---------: |
| Ethernet Adapter  |    $2,434.70 |      $2,921.64 |   +$486.94 |
| Mesh Wi-Fi System |   $11,800.25 |      $3,304.07 | -$8,496.18 |
| Network Switch    |    $3,761.12 |      $2,735.36 | -$1,025.76 |
| Wi-Fi Extender    |    $1,039.10 |      $5,195.50 | +$4,156.40 |
| Wi-Fi Router      |    $1,764.96 |        $147.08 | -$1,617.88 |
| Networking Total  |   $20,800.13 |     $14,303.65 | -$6,496.48 |

### Major Product Findings

The largest individual revenue losses were:

- Mesh Wi-Fi System: -$8,496.18
- Desktop Computer: -$6,937.20
- Wi-Fi Router: -$1,617.88
- Gaming Laptop: -$1,107.20
- Business Laptop: -$1,024.59

Several products partially offset these losses:

- Wi-Fi Extender: +$4,156.40
- Workstation: +$1,437.62
- Mini PC: +$844.86
- Ethernet Adapter: +$486.94

Mesh Wi-Fi System and Desktop Computer alone lost:

**$15,433.38**

This exceeded the net revenue decline because other products generated additional revenue that partially offset those losses.

---

## Pricing Analysis

Average unit price was compared between July and August for major declining products.

| Product           | July Average Price | August Average Price |
| ----------------- | -----------------: | -------------------: |
| Business Laptop   |            $146.37 |      No August sales |
| Desktop Computer  |          $1,387.44 |      No August sales |
| Gaming Laptop     |          $1,107.20 |            $1,107.20 |
| Mesh Wi-Fi System |            $472.01 |              $472.01 |
| Wi-Fi Router      |            $147.08 |              $147.08 |

For products that sold in both months, unit prices remained unchanged.

### Finding

For the major declining products examined, there is no evidence that price reductions caused the revenue decline.

The observed revenue declines were primarily associated with lower sales volume rather than lower unit prices.

This conclusion is limited to the products examined and does not establish that pricing had no effect anywhere else in the business.

---

## Product Mix Analysis

August showed a meaningful shift in product mix.

Notable increases in unit sales included:

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

Office Chair was the largest increase:

**2 → 23 units**

Office Chair represented:

**23 / 125 = 18.4%**

of all August units sold.

### Finding

August was not simply a universal decline across all products.

Instead, the data shows a shift in product mix. Several products experienced significant declines while other products increased substantially.

---

# Business Recommendations

## 1. Investigate the Transaction Decline

Transactions declined:

**61 → 36 (-40.98%)**

This is the largest overall change identified.

The business should investigate potential causes such as:

- Customer activity
- Website or store traffic
- Marketing activity
- Promotions
- Product availability
- Seasonal effects
- Competitive activity

**Priority: High**

---

## 2. Investigate Mesh Wi-Fi System Performance

Mesh Wi-Fi System revenue declined:

**$11,800.25 → $3,304.07**

Change:

**-$8,496.18**

Units declined:

**25 → 7**

The unit price remained:

**$472.01**

The evidence therefore indicates a volume-driven decline.

**Priority: High**

---

## 3. Investigate Desktop Computer

Desktop Computer revenue declined:

**$6,937.20 → $0**

Units declined:

**5 → 0**

The complete disappearance of August sales warrants investigation.

Potential questions include whether the product was available, whether customer demand changed, or whether customers shifted toward other computer products.

**Priority: High**

---

## 4. Investigate the Networking Category

Networking revenue declined by:

**$6,496.48 (-31.23%)**

However, performance varied substantially within the category.

Mesh Wi-Fi System declined while Wi-Fi Extender increased significantly.

This may indicate a potential shift in customer demand within the category.

**Priority: High**

---

## 5. Investigate Office Category Growth

Office revenue increased:

**$5,389.67 → $7,694.14**

Change:

**+$2,304.47 (+42.76%)**

Office Chair was particularly significant, increasing from 2 units to 23 units.

The business should investigate what drove this growth and whether the factors behind the increase can be replicated.

**Priority: Medium**

---

## Final Analyst Takeaway

The July-to-August revenue decline was primarily associated with a substantial reduction in transaction volume.

Transactions declined by approximately 41%, while revenue declined by approximately 26%.

However, revenue per transaction increased by approximately 26%, and revenue per unit increased by approximately 21%.

This indicates that August transactions were, on average, higher-value transactions and that the product mix shifted toward higher-value products.

Computer and Networking were responsible for approximately 90% of the net revenue decline. Mesh Wi-Fi System and Desktop Computer were the largest individual revenue losses.

For the major declining products examined, unit prices remained stable between July and August, suggesting that lower sales volume rather than price reductions was the primary driver of their revenue declines.

Further investigation is required to determine why transaction volume declined. The current dataset does not include customer IDs, historical inventory snapshots, pricing history beyond current transaction-level prices, promotion data, marketing activity, or website/store traffic.

---

## Skills Practiced

- Excel Tables
- XLOOKUP
- VALUE function
- Data-type troubleshooting
- Calculated columns
- Revenue calculation
- PivotTables
- Date grouping
- Revenue aggregation
- Percentage change analysis
- Revenue per transaction
- Revenue per unit
- Category-level analysis
- Product-level drill-down
- Average price analysis
- Product-mix analysis
- Root-cause investigation
- Business recommendations
- Data limitation assessment