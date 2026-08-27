# Day 20 – Demand Shift & Purchase Behavior Analysis

## Objective

Continue investigating the July → August decline in sales transactions.

The main questions for Day 20 were:

- Was the August decline caused by fewer transactions across the business?
- Did customers shift demand toward other products?
- How did average units purchased per transaction change?
- Which products contributed to changes in purchase quantity?

---

## 1. Testing the Demand-Shift Hypothesis

At the product level, some products increased in transaction activity while others declined.

Products with increases included:

- Office Chair: +3
- Desk Lamp: +2
- Mini PC: +1
- Webcam Cover: +1
- Workstation: +1

The products that increased gained a total of 8 transactions.

However, the products experiencing declines lost substantially more transactions.

This suggested that increases in individual products were not large enough to explain the overall decline.

---

## 2. Category-Level Transaction Analysis

I compared July and August transaction activity by category.

| Category    | July | August | Change |
| ----------- | ---: | -----: | -----: |
| Office      |   10 |      9 |     -1 |
| Audio       |   10 |      8 |     -2 |
| Computer    |   12 |      8 |     -4 |
| Networking  |   14 |      7 |     -7 |
| Accessories |   15 |      4 |    -11 |

### Key Finding

Every category experienced a decline in transaction activity.

The largest declines were:

- Accessories: -11
- Networking: -7

Together:

    -11 + -7 = -18 transactions

The overall business lost 25 transactions.

Therefore:

    18 / 25 × 100 = 72%

Accessories and Networking accounted for 72% of the total transaction decline.

### Business Interpretation

There was no evidence of a broad category-level demand shift because every category declined.

A careful conclusion is:

> The July → August transaction decline appears broad-based rather than the result of a simple shift in demand from declining categories to growing categories.

---

## 3. Accessories Investigation

I drilled into the Accessories category to identify the products responsible for its decline.

| Product        | July | August | Change |
| -------------- | ---: | -----: | -----: |
| Webcam Cover   |    1 |      2 |     +1 |
| Laptop Stand   |    2 |      0 |     -2 |
| Mouse Pad      |    3 |      1 |     -2 |
| USB-C Cable    |    4 |      1 |     -3 |
| Wireless Mouse |    5 |      0 |     -5 |

Accessories declined from:

    15 → 4 transactions

Net change:

    -11 transactions

Wireless Mouse was the largest contributor, declining by 5 transactions.

The other declining products lost:

    2 + 2 + 3 + 5 = 12 transactions

Webcam Cover gained 1 transaction, partially offsetting the decline:

    -12 + 1 = -11

Wireless Mouse accounted for:

    5 / 11 × 100 = 45.45%

of the Accessories category's net transaction decline.

### Business Interpretation

> Accessories experienced a broad decline across four of its five products, with Wireless Mouse representing the largest contributor. Webcam Cover was the only product to increase, but its increase was not large enough to offset the broader decline.

---

## 4. Networking Investigation

I then investigated the Networking category.

| Product           | July | August | Change |
| ----------------- | ---: | -----: | -----: |
| Wi-Fi Extender    |    2 |      2 |      0 |
| Ethernet Adapter  |    2 |      1 |     -1 |
| Network Switch    |    3 |      2 |     -1 |
| Wi-Fi Router      |    2 |      1 |     -1 |
| Mesh Wi-Fi System |    5 |      1 |     -4 |

Networking declined from:

    14 → 7 transactions

Net change:

    -7 transactions

Mesh Wi-Fi System was the largest contributor:

    5 → 1 transactions

    Change = -4

Mesh Wi-Fi System accounted for:

    4 / 7 × 100 = 57.1%

of the Networking category's net transaction decline.

### Business Interpretation

> Networking experienced a broad decline, with four of five products losing transaction activity and no products increasing. Mesh Wi-Fi System accounted for the majority of the category's decline.

---

## 5. Business-Wide Transaction Decline

I then moved from product and category analysis to the overall business level.

July transactions:

    61

August transactions:

    36

Transaction change:

    36 - 61 = -25

Percentage change:

    (36 - 61) / 61 × 100
    = -40.98%

### Key Finding

> Total transactions declined approximately 41.0% from July to August.

This established that the decline was not limited to a small number of products.

---

## 6. Units Sold Comparison

I compared total units sold between July and August.

| Metric     | July | August |
| ---------- | ---: | -----: |
| Units Sold |  204 |    125 |

Percentage change:

    (125 - 204) / 204 × 100
    = -38.73%

### Key Finding

> Total units sold declined approximately 38.7% from July to August.

This decline was slightly smaller than the 41.0% decline in transactions.

---

## 7. Average Units per Transaction

I calculated average units purchased per transaction.

Formula:

    Total Units Sold / Total Transactions

July:

    204 / 61
    = 3.34 units per transaction

August:

    125 / 36
    = 3.47 units per transaction

| Metric                   | July | August |
| ------------------------ | ---: | -----: |
| Transactions             |   61 |     36 |
| Units Sold               |  204 |    125 |
| Avg. Units / Transaction | 3.34 |   3.47 |

The average increased from:

    3.34 → 3.47

Approximate change:

    +3.9%

### Key Finding

Although overall transaction activity declined significantly, the average transaction became slightly larger in terms of units purchased.

This means the decline was primarily associated with fewer transactions rather than customers purchasing fewer units in each transaction.

---

## 8. Product-Level Purchase Behavior

I extended the purchase behavior analysis to every product.

For each product I calculated:

- July transactions
- July units sold
- August transactions
- August units sold
- Average July units per transaction
- Average August units per transaction
- Change in average units per transaction

### Products with the largest increases in average units per transaction

| Product          | July Avg | August Avg | Change |
| ---------------- | -------: | ---------: | -----: |
| Wi-Fi Extender   |      1.0 |        5.0 |   +4.0 |
| Office Chair     |      1.0 |        4.6 |   +3.6 |
| Ethernet Adapter |      2.5 |        6.0 |   +3.5 |
| Wireless Earbuds |      2.5 |        6.0 |   +3.5 |
| USB Microphone   |      2.0 |        5.0 |   +3.0 |

---

## 9. Important Purchase-Behavior Distinction

I learned that an increase in average units per transaction does not automatically mean overall demand increased.

For example:

### Office Chair

    Transactions: 2 → 5
    Units sold: 2 → 23
    Avg. units/transaction: 1.0 → 4.6

Both transaction activity and purchase quantity increased.

This represents stronger evidence of increased demand.

### Ethernet Adapter

    Transactions: 2 → 1
    Units sold: 5 → 6
    Avg. units/transaction: 2.5 → 6.0

The average units per transaction increased, but transaction activity actually declined.

Therefore, the higher average does not necessarily represent stronger overall demand.

### Key Lesson

> A higher average units-per-transaction does not necessarily mean stronger overall demand.

Transaction volume, total units, and average units per transaction should be considered together.

---

## 10. Overall Purchase Behavior Finding

The business-wide results were:

    Transactions:
    61 → 36
    -41.0%

    Units Sold:
    204 → 125
    -38.7%

    Average Units per Transaction:
    3.34 → 3.47
    approximately +3.9%

### Business Interpretation

> Overall transaction activity declined 41.0% from July to August, while units sold declined 38.7%. Despite the decline, average units per transaction increased slightly from 3.34 to 3.47, indicating that the remaining transactions were marginally larger on average.

The increase in average units per transaction was influenced by larger purchase quantities for several products, particularly Wi-Fi Extender and Office Chair.

However, this did not indicate an overall increase in transaction demand.

---

## 11. Key Analytical Lessons

### Absolute Change vs. Percentage Change

Absolute change measures business impact.

Percentage change measures relative severity.

Both should be considered when prioritizing an issue.

---

### Business Level vs. Category Level vs. Product Level

The level of aggregation should match the business question.

Examples:

    Business-wide question
    → Analyze the entire sales dataset

    Category question
    → GROUP BY category

    Product question
    → GROUP BY product

This allows the analysis to move from a broad business view into specific drivers.

---

### Purchase Behavior

To understand purchase behavior, I learned to examine:

    Number of transactions
    +
    Total units sold
    +
    Average units per transaction

Looking at only one metric can lead to an incorrect conclusion.

---

## Final Day 20 Business Story

The July → August decline was broad-based.

Total transactions declined from 61 to 36, a 41.0% decrease.

Every product category experienced a decline, with Accessories (-11) and Networking (-7) accounting for 18 of the 25 lost transactions, or 72% of the total decline.

Within Accessories, Wireless Mouse was the largest contributor, losing 5 transactions.

Within Networking, Mesh Wi-Fi System was the largest contributor, losing 4 transactions.

There was no strong evidence of a broad demand shift because every category declined.

At the business level, units sold declined 38.7%, slightly less than the 41.0% decline in transactions. As a result, average units per transaction increased from 3.34 to 3.47.

This indicates that the August decline was primarily driven by fewer transactions rather than smaller purchase quantities.

However, product-level behavior varied. Some products experienced larger purchases per transaction even while transaction activity declined, while others experienced increases in both transaction activity and purchase quantity.

---

## SQL Concepts Practiced

- Conditional aggregation
- `CASE`
- `SUM()`
- `COUNT()`
- `GROUP BY`
- CTEs
- `COALESCE()`
- `NULLIF()`
- Numeric division
- Percentage change
- Absolute change
- Product-level analysis
- Category-level analysis
- Business-level aggregation
- Average units per transaction

---

## Next Session

### Day 21 — Window Functions

New concepts:

- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `PARTITION BY`

These will be introduced using the same business dataset and applied to questions such as:

> Which products had the largest transaction declines within each category?

---

## Status

**Day 20 Complete** ✅