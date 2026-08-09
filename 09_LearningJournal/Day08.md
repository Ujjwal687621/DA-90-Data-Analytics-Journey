# Day 8 Learning Journal

## Today's Goal

Instead of learning a new SQL feature, today's goal was to understand how experienced analysts solve complex SQL problems.

---

## What I Learned

Today's biggest breakthrough was understanding that complex SQL should be approached by building temporary datasets rather than trying to solve everything in one query.

I learned to ask:

- What temporary table do I need?
- What does each row represent?
- Can I solve the business problem from this dataset?

This made CTEs and subqueries much easier to understand.

---

## Biggest Takeaway

I realized that nested SQL is simply creating one temporary table after another.

Example:

Transactions

↓

Customer Totals

↓

Country Average Spending

↓

Final Report

Thinking this way made reading nested SQL significantly easier.

---

## Challenges

Initially, I struggled to read nested SQL because I tried to understand the entire query at once.

Breaking the query into temporary tables helped me overcome this difficulty.

---

## Reflection

Today's session completely changed the way I think about SQL.

Instead of asking:

"Which SQL keyword should I use?"

I now ask:

"What temporary table do I need to build first?"

This approach feels much more natural and makes solving complex business problems easier.

---

## Tomorrow

Continue practicing business scenarios involving:

- CTEs
- Subqueries
- Window Functions
- Aggregate Comparisons

using the temporary-table mindset.