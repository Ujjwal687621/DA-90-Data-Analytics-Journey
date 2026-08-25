# Day 19 – Percentage Change, Purchase Behavior & Inventory Investigation

## Objective

Today I continued investigating the July → August decline in sales transactions.

The analysis focused on:

- Percentage change
- Absolute vs. relative decline
- Purchase behavior
- Inventory availability as a possible explanation for declining sales

---

## 1. Percentage Change

I extended the July → August transaction analysis by calculating percentage change.

The formula used was:

    (August - July) / July × 100

For example:

    July = 10
    August = 6

    Change = -4

    Percentage Change = (-4 / 10) × 100
                       = -40%

This allowed me to evaluate the relative severity of a change in addition to the absolute transaction change.

---

## 2. Absolute Change vs. Percentage Change

I learned that absolute change and percentage change provide different perspectives.

Example:

    Product A
    July = 20
    August = 10
    Change = -10
    Percentage Change = -50%

    Product B
    July = 2
    August = 0
    Change = -2
    Percentage Change = -100%

Product B experienced the larger percentage decline, but Product A had a much larger impact in terms of lost transactions.

### Key Insight

> Absolute change helps measure business impact, while percentage change helps measure relative severity.

Both metrics should be considered when prioritizing products for investigation.

---

## 3. Handling Zero Baselines

Some products had zero July transactions.

For example:

    July = 0
    August = 2

A percentage change cannot be meaningfully calculated because the July baseline is zero.

I used:

    NULLIF(july_transactions, 0)

to prevent division-by-zero errors.

I also used:

    COALESCE(..., 0)

to handle the resulting NULL value.

However, I recognized that a displayed 0% in this situation does NOT mean there was no change.

It means the percentage change could not be calculated using July as the baseline.

---

## 4. Wireless Mouse Purchase Behavior

I investigated Wireless Mouse because it had one of the largest absolute transaction declines.

July vs. August:

| Metric                        | July | August |
| ----------------------------- | ---: | -----: |
| Transactions                  |    5 |      0 |
| Units Sold                    |   30 |      0 |
| Average Units per Transaction |    6 |      0 |

The July calculation was:

    30 units / 5 transactions = 6 units per transaction

August had:

    0 transactions
    0 units sold

### Key Finding

Wireless Mouse experienced a complete loss of transaction activity in August.

Because there were no August transactions, I cannot conclude that customers were purchasing fewer units per transaction.

The decline was driven entirely by the loss of transaction activity.

---

## 5. Inventory Investigation

Because Wireless Mouse had zero August transactions, I investigated whether inventory availability could explain the decline.

The inventory query returned:

| Warehouse | Stock Quantity |
| --------- | -------------: |
| New York  |            133 |
| Dallas    |            136 |
| **Total** |        **269** |

The current inventory records therefore show:

    133 + 136 = 269 units

This makes a simple "completely out of stock" explanation unlikely based on the recorded inventory.

---

## 6. Inventory Data Limitation

An important limitation was identified.

The inventory table does not contain an inventory date.

Therefore, I cannot definitively establish that the 269 units were available throughout August.

The correct interpretation is:

> Current inventory records show 269 units across New York and Dallas, but because inventory is not timestamped, the available data cannot definitively establish August stock availability.

This prevents me from incorrectly concluding that inventory did or did not cause the sales decline.

---

## 7. Business Interpretation

The analysis followed this path:

    Sales decline
          ↓
    Transaction decline
          ↓
    Purchase behavior
          ↓
    Inventory hypothesis
          ↓
    Inventory evidence
          ↓
    Data limitation

Wireless Mouse experienced:

- 100% transaction decline
- 100% unit sales decline
- 6 average units per transaction in July
- 0 August transactions
- 269 units in current inventory records

The available evidence does not support concluding that the product was out of stock.

Because inventory is not timestamped, further investigation would be required before determining whether stock availability contributed to the August sales decline.

---

## Key SQL Concepts Learned

- Percentage change
- Absolute vs. percentage change
- Numeric division
- NULLIF()
- COALESCE()
- Conditional aggregation
- CTEs
- Purchase behavior analysis
- Inventory investigation
- Identifying data limitations

---

## Key Business Insight

The largest percentage decline does not necessarily represent the largest business impact.

Wireless Mouse experienced a 100% decline in transactions, falling from 5 transactions and 30 units sold in July to zero in August.

Current inventory records show 269 units across two warehouses, but because inventory is not timestamped, the data cannot definitively establish whether sufficient inventory was available during August.

This means the next investigation should focus on whether customer demand shifted toward other products.

---

## Next Session

Investigate whether transaction activity shifted from declining products toward other products, particularly products that experienced increased transaction activity in August.

**Status: Day 19 Complete**