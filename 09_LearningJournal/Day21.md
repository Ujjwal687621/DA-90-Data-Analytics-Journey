# Day 21 — Window Functions & Category-Level Analysis

**Date:** August 2026  
**Program:** DA-90 — Data Analytics Journey  
**Focus:** Advanced SQL Analysis

---

## Today's Objective

Today we continued developing practical SQL analysis skills using the Ujjsha Retail dataset.

The main focus was learning how to use window functions to compare individual products against other products within the same category.

---

## Concepts Learned

### 1. ROW_NUMBER()

`ROW_NUMBER()` assigns a unique sequential number to every row.

For example, if products are ordered by transaction count:

1, 2, 3, 4, 5...

Even when two products have the same transaction count, each product receives a different number.

This makes `ROW_NUMBER()` useful when we need a unique sequence for every row.

---

### 2. RANK()

`RANK()` assigns the same rank to tied values but skips the following rank.

Example:

Values:

10, 10, 8, 7

Ranks:

1, 1, 3, 4

The second rank is skipped because two products are tied at rank 1.

---

### 3. DENSE_RANK()

`DENSE_RANK()` also gives tied values the same rank, but it does not skip ranks.

Example:

Values:

10, 10, 8, 7

Ranks:

1, 1, 2, 3

This makes `DENSE_RANK()` particularly useful when finding the second-highest or second-lowest distinct value.

Today we used `DENSE_RANK()` to rank products within their categories.

---

## PARTITION BY

One of the most important concepts learned today was `PARTITION BY`.

`PARTITION BY` divides the rows into groups for the purpose of a window function while keeping the individual rows in the result.

For example, calculating:

`AVG(total_august_transactions) OVER (PARTITION BY category)`

means that the average is calculated separately for each product category.

The important distinction is:

`GROUP BY` collapses rows into groups.

`PARTITION BY` creates groups for a window calculation while keeping the individual rows.

---

## Category-Level Analysis

We built an August transaction summary containing:

- Product name
- Product category
- Total August transactions

We then used a window function to calculate the average August transactions for each category.

This allowed us to compare each individual product against the average performance of the other products in its category.

---

## Product vs. Category Average

We calculated the difference between a product's August transactions and its category average.

The calculation was:

`total_august_transactions - category_average_transactions`

Interpretation:

- Positive value = product performed above its category average
- Zero = product performed exactly at the category average
- Negative value = product performed below its category average

This is more useful from a business perspective than looking only at the raw transaction count.

---

## Percentage Difference

We also calculated the percentage difference between a product and its category average.

The calculation was based on:

`(total_august_transactions - category_average_transactions) / category_average_transactions * 100`

This allowed us to understand the size of the difference relative to the category average.

For example, a product could be 2 transactions below its category average, but the percentage difference tells us whether that is a small or significant gap.

---

## Ranking Within Categories

We then used:

`DENSE_RANK() OVER (PARTITION BY category ORDER BY percentage_vs_category_avg ASC)`

This ranked products separately within each category.

Because the ranking was partitioned by category, each category received its own ranking system.

Rank 1 represented the product performing furthest below its category average.

We then filtered for rank 1 to identify the weakest-performing product relative to its category average.

---

## Multiple CTEs

Today's analysis used multiple Common Table Expressions (CTEs).

The analysis was broken into several stages:

1. `august_transaction_summary`
2. `category_comparison`
3. `category_percentage`
4. `rank`

Each CTE performed one logical step of the analysis.

This made the overall query easier to understand, debug, and extend.

---

## Business Questions We Can Now Answer

The concepts learned today allow us to answer questions such as:

- Which product has the most transactions within each category?
- Which product has the fewest transactions within each category?
- Which products are performing below their category average?
- How far below the category average is each product?
- Which product is furthest below its category average?
- What is the second-highest performing product in each category?
- What is the second-lowest performing product in each category?

These are realistic types of questions a Data Analyst may encounter.

---

## Important Learning

Today's biggest lesson was understanding that window functions allow us to perform calculations across related rows without losing the individual row-level information.

For example, we can show:

- Product transactions
- Category average
- Difference from category average
- Percentage difference
- Product's rank within the category

all in the same result.

This is one of the major differences between basic SQL aggregation and analytical SQL.

---

## Practical Business Interpretation

Instead of simply reporting:

"This product had 2 transactions."

we can now provide more meaningful analysis:

"This product had 2 transactions and performed below the average transaction volume for its category."

We can go even further:

"This product ranked last within its category based on percentage performance versus the category average."

This moves our SQL work from data retrieval toward actual business analysis.

---

## Day 21 Takeaways

- Learned `ROW_NUMBER()`
- Learned `RANK()`
- Learned `DENSE_RANK()`
- Strengthened understanding of `PARTITION BY`
- Learned how window functions differ from `GROUP BY`
- Calculated category-level averages
- Compared products against category averages
- Calculated absolute differences from category averages
- Calculated percentage differences
- Ranked products within categories
- Used multiple CTEs to structure complex SQL analysis
- Identified underperforming products within categories
- Practiced translating SQL results into business insights

---

## Reflection

Day 21 was an important step forward in the DA-90 journey.

The SQL work is becoming less about simply retrieving information and more about answering business questions.

The most important concept today was `PARTITION BY`.

Understanding that a window function can calculate something separately within each category while still keeping every product row is a major improvement in our analytical SQL skills.

We also learned how `DENSE_RANK()` can be used to solve practical ranking problems such as finding the top, bottom, second-highest, or second-lowest performers within groups.

---

## Next Step

Continue building on window functions and analytical SQL with increasingly realistic business problems.

The next stage should focus on combining these SQL skills with broader Data Analyst workflows, including Excel, real project development, business interpretation, and eventually job-focused practice.

---

**Day 21 Status: Completed**