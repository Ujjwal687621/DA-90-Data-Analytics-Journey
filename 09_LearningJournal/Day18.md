# Day 18 – Conditional Aggregation & Period Comparison

## Objective

Today I continued investigating the July → August decline in sales transactions.

The main question was:

> Which products experienced the largest change in transaction activity from July to August?

I learned how to use conditional aggregation to compare multiple periods within the same query.

---

## 1. July Transactions by Product

I started by calculating the number of July transactions for each product.

Key functions/concepts used:

- COUNT()
- JOIN
- WHERE
- GROUP BY

The result provided the number of transactions for each product during July.

---

## 2. Conditional Aggregation

I learned how to use:

    SUM(CASE WHEN ... THEN 1 ELSE 0 END)

The CASE statement evaluates each sale:

- Returns 1 if the sale meets the condition.
- Returns 0 if it does not.

SUM() then adds the results.

For example:

    July sale → 1
    Non-July sale → 0

This allows SQL to conditionally count transactions without filtering other rows out.

---

## 3. July and August Comparison

Conditional aggregation allowed July and August transactions to be calculated in the same query.

The result provides:

    product_name
    july_transactions
    august_transactions

This made it possible to compare the two months side-by-side.

---

## 4. CTE for Transaction Comparison

I used a CTE called:

    transaction_summary

The CTE calculated:

- July transactions
- August transactions

The outer query then calculated:

    august_transactions - july_transactions

as:

    transaction_change

Example:

    July = 5
    August = 1

    1 - 5 = -4

A negative value means transactions declined.

---

## 5. Transaction Status

I used CASE to classify products based on their transaction change.

    Negative → Declined
    Zero → No Change
    Positive → Increased

The final classification was:

    Declined
    No Change
    Increased

---

## 6. July → August Results

The largest transaction declines were:

| Product           | July | August | Change |
| ----------------- | ---: | -----: | -----: |
| Wireless Mouse    |    5 |      0 |     -5 |
| Mesh Wi-Fi System |    5 |      1 |     -4 |
| Business Laptop   |    4 |      0 |     -4 |

The three products combined accounted for:

    5 + 4 + 4 = 13 transactions

Overall July → August decline:

    25 transactions

Contribution:

    13 / 25 = 52%

Therefore:

> Wireless Mouse, Mesh Wi-Fi System, and Business Laptop accounted for 52% of the overall July → August transaction decline.

---

## 7. Transaction Status Distribution

There were 25 products in the analysis.

Results:

- 15 Declined
- 5 No Change
- 5 Increased

Percentage:

    Declined: 15 / 25 = 60%
    No Change: 5 / 25 = 20%
    Increased: 5 / 25 = 20%

### Key Finding

60% of products experienced declining transaction activity from July to August.

This suggests that the decline was relatively widespread across the product catalog rather than being limited to only a few products.

However, the largest three declining products still accounted for 52% of the overall transaction decline.

---

## 8. Comparison With Day 17

The products driving the transaction decline changed between periods.

### June → July

- Mouse Pad: -4 transactions
- Bluetooth Speaker: -4 transactions
- Ethernet Adapter: -3 transactions

Combined:

    -11 transactions

### July → August

- Wireless Mouse: -5 transactions
- Mesh Wi-Fi System: -4 transactions
- Business Laptop: -4 transactions

Combined:

    -13 transactions

This shows that the products contributing most to the decline were not necessarily the same from one month to the next.

---

## Key SQL Concepts Learned

- Conditional aggregation
- CASE
- SUM(CASE WHEN ... THEN 1 ELSE 0 END)
- CTEs
- Period-over-period comparison
- Calculated columns
- Classification using CASE

---

## Business Insight

The July → August transaction decline was widespread across the product catalog.

15 of 25 products experienced declining transaction activity, while 5 increased and 5 remained unchanged.

At the same time, the decline was concentrated among a few products, with Wireless Mouse, Mesh Wi-Fi System, and Business Laptop accounting for 52% of the overall transaction decline.

---

## Next Session

Continue building on conditional aggregation and CTEs to further investigate the sales decline.

**Status: Day 18 Complete**