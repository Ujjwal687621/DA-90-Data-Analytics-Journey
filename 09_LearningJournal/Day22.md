# Day 22 – Category-Level Impact Analysis

## Date
August 29, 2026

## Focus
Category-level business impact analysis using SQL.

---

## Objective

Today I continued building on the July vs. August transaction analysis.

The goal was to move beyond identifying individual products with declining transactions and determine which product categories were most affected.

I learned how to aggregate flagged products at the category level and compare both absolute transaction losses and percentage declines.

---

## Concepts Practiced

- CTEs
- `SUM()`
- `COUNT()`
- `GROUP BY`
- Percentage change
- Absolute vs. relative change
- Category-level aggregation
- Business impact analysis
- Baseline analysis
- Interpreting percentage changes carefully

---

## Business Rules

A product was considered flagged when:

1. Transaction change was less than or equal to `-2`
2. Percentage change was less than or equal to `-50%`

This helped prevent very small changes from being treated as major business issues.

---

## Analysis Process

### Step 1 – Product-Level Summary

I calculated:

- July transactions
- August transactions
- Transaction change

The transaction change was calculated as:

`August transactions - July transactions`

---

### Step 2 – Percentage Change

I calculated percentage change using July as the baseline:

`Transaction Change / July Transactions × 100`

I also used `NULLIF()` to prevent division-by-zero errors.

---

### Step 3 – Flagged Products

I filtered products using the business rules:

- Transaction change <= -2
- Percentage change <= -50%

This produced 9 flagged products.

---

### Step 4 – Category-Level Aggregation

I grouped the flagged products by category and calculated:

- Number of flagged products
- Total July transactions for flagged products
- Total transaction change

The results were:

| Category    | Flagged Products | July Transactions | Transaction Change |
| ----------- | ---------------: | ----------------: | -----------------: |
| Accessories |                4 |                14 |                -12 |
| Computer    |                2 |                 6 |                 -6 |
| Office      |                2 |                 7 |                 -5 |
| Networking  |                1 |                 5 |                 -4 |

---

## Relative Decline Analysis

I then calculated the percentage decline using the July transaction baseline.

| Category    | July Baseline | Transaction Change | Percentage Change |
| ----------- | ------------: | -----------------: | ----------------: |
| Accessories |            14 |                -12 |           -85.71% |
| Computer    |             6 |                 -6 |          -100.00% |
| Office      |             7 |                 -5 |           -71.43% |
| Networking  |             5 |                 -4 |           -80.00% |

---

## Key Business Insight

Computer had the largest relative decline at 100%.

However, Accessories had the greatest absolute business impact because it lost 12 transactions from a July baseline of 14, representing an 85.71% decline.

This demonstrated why percentage change should not be interpreted by itself.

A category with a smaller transaction volume can show a very large percentage decline even when its absolute business impact is smaller.

---

## Analyst Takeaway

The analysis showed the importance of evaluating both:

- Absolute change
- Relative percentage change

A strong analyst should consider the underlying baseline before determining which decline is the most important business issue.

The appropriate conclusion is not simply:

"Computer is the worst because it declined 100%."

Instead, the analysis should distinguish between:

- **Relative severity:** Computer
- **Absolute transaction impact:** Accessories

---

## What I Learned

Today I learned that a percentage can provide important context, but it can also be misleading when the underlying baseline is small.

I also practiced moving from product-level analysis to category-level analysis.

The analysis progression was:

Product performance
→ Flagged products
→ Category aggregation
→ Absolute impact
→ Relative impact
→ Business interpretation

This is helping me think beyond writing SQL and focus on answering actual business questions.

---

## Next Step

Next session I will move from descriptive analysis toward diagnostic analysis.

The goal will be to investigate **why** transaction performance changed rather than only identifying where the decline occurred.