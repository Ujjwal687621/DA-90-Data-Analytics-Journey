# DA-90 | Day 23 — Month-over-Month Analysis with LAG()

Date: August 31, 2026

## Objective

Continue Project #1 by using SQL window functions to perform a month-over-month transaction analysis.

The goal for Day 23 was to:

- Learn and apply LAG()
- Compare each product's current-month transactions with the previous month
- Calculate absolute transaction change
- Calculate percentage change
- Identify products experiencing significant declines
- Aggregate flagged products to the category level
- Validate the results against the category-impact analysis completed on Day 22

## What I Learned

### LAG()

LAG() is a SQL window function that allows us to access a value from a previous row without using a self-join.

For this analysis:

LAG(transactions) OVER (
    PARTITION BY product_id
    ORDER BY month
)

PARTITION BY product_id keeps each product's monthly history separate.

ORDER BY month ensures that the rows are evaluated chronologically.

Example:

Ethernet Adapter

May       4
June      5
July      2
August    1

Using LAG():

May       4    previous = NULL
June      5    previous = 4
July      2    previous = 5
August    1    previous = 2

This allows month-over-month changes to be calculated dynamically.

## LAG() vs LEAD()

LAG() looks at the previous row.

LEAD() looks at the next row.

For our month-over-month analysis, LAG() is the appropriate function because August needs to be compared against July.

## Month-over-Month Transaction Change

The absolute transaction change was calculated as:

transactions - previous_month_transactions

Examples:

Wireless Mouse

July:      5
August:    0
Change:   -5

Office Chair

July:      2
August:    5
Change:   +3

A negative value represents a decline.

A positive value represents an increase.

A value of zero represents no change.

## Percentage Change

Percentage change was calculated using the previous month's transaction count as the baseline.

(
    transaction_change::numeric
    / NULLIF(previous_month_transactions, 0)
    * 100
)

NULLIF() was used to prevent division-by-zero errors.

If the previous month had zero transactions, percentage growth is not meaningful.

Example:

Desk Lamp

July:        0
August:      2
Change:     +2
Percentage: NULL

The result remains NULL instead of attempting to calculate a percentage from a zero baseline.

## Significant Decline Criteria

A product is considered a significant decline when:

transaction_change <= -2
AND
percentage_change <= -50%

This prevents products with very small transaction volumes from being treated as major business problems based only on percentage change.

## Key Results

Using the LAG()-based analysis, 9 significant-decline products were identified.

Flagged Products:

Wireless Mouse
Category: Accessories
July: 5
August: 0
Change: -5
Percentage Change: -100%

Mesh Wi-Fi System
Category: Networking
July: 5
August: 1
Change: -4
Percentage Change: -80%

Business Laptop
Category: Computer
July: 4
August: 0
Change: -4
Percentage Change: -100%

USB-C Cable
Category: Accessories
July: 4
August: 1
Change: -3
Percentage Change: -75%

Monitor Arm
Category: Office
July: 4
August: 1
Change: -3
Percentage Change: -75%

Mouse Pad
Category: Accessories
July: 3
August: 1
Change: -2
Percentage Change: -66.7%

Desktop Computer
Category: Computer
July: 2
August: 0
Change: -2
Percentage Change: -100%

Keyboard Tray
Category: Office
July: 3
August: 1
Change: -2
Percentage Change: -66.7%

Laptop Stand
Category: Accessories
July: 2
August: 0
Change: -2
Percentage Change: -100%

## Category-Level Impact

Accessories
Flagged Products: 4
July Baseline: 14
Transaction Change: -12
Percentage Change: -85.7%

Computer
Flagged Products: 2
July Baseline: 6
Transaction Change: -6
Percentage Change: -100%

Office
Flagged Products: 2
July Baseline: 7
Transaction Change: -5
Percentage Change: -71.4%

Networking
Flagged Products: 1
July Baseline: 5
Transaction Change: -4
Percentage Change: -80%

## Business Insight

Computer had the largest percentage decline at -100%.

However, Accessories had the largest absolute transaction decline at -12 transactions.

Accessories also had the largest number of flagged products with 4 products.

Therefore, Accessories represents the most significant overall category-level impact despite Computer having the largest percentage decline.

## Validation Against Day 22

Day 22 identified:

Accessories: 4 flagged products
Office: 2 flagged products
Computer: 2 flagged products
Networking: 1 flagged product

Day 23 produced the exact same result using LAG().

The total number of flagged products was also the same:

9 products.

This confirms that the LAG()-based month-over-month approach reproduces the findings from the previous analysis.

## Key Analytical Lesson

Percentage change should not be analyzed by itself.

A large percentage change can come from a very small baseline.

For example:

1 -> 0 = -100%

has a much smaller absolute impact than:

5 -> 0 = -100%

Both represent a 100% decline, but the second represents five times the transaction loss.

Therefore, when evaluating business impact, I should consider:

1. Percentage change
2. Absolute transaction change
3. Baseline transaction volume
4. Number of affected products

## SQL Concepts Practiced

- WITH
- CTEs
- LAG()
- PARTITION BY
- ORDER BY inside window functions
- NULLIF()
- Aggregate functions
- GROUP BY
- Month-over-month analysis
- Percentage change calculations
- Window functions
- Business-oriented SQL analysis

## Project #1 Progress

With Day 23 completed, the SQL analysis for Project #1 has progressed from basic aggregation into more advanced analytical SQL.

The project now includes:

- Product-level transaction analysis
- Month-over-month comparison
- Window functions
- Significant-decline identification
- Category-level impact analysis
- Business interpretation of absolute vs. relative change
- Validation of findings using multiple SQL approaches

## Reflection

Today was an important step because I moved beyond simply calculating metrics and started using SQL to answer a business question.

I learned that window functions such as LAG() allow month-over-month comparisons to be performed efficiently without manually joining each month.

More importantly, I learned that the SQL result itself is only part of the analysis. I need to interpret the numbers in business context.

The biggest percentage decline is not necessarily the biggest business problem.

For this analysis, Accessories had the greatest overall impact because it had the largest absolute transaction decline and the highest number of flagged products.