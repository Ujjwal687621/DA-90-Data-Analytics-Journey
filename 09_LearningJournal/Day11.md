# Day 11 – Emerging Customers

## What I Learned

Today I focused on designing the solution before writing SQL.

Instead of immediately writing queries, I first identified:

- The business requirement
- The data flow
- The number of CTEs required
- The grain of each dataset

This made writing the SQL much easier.

---

## Biggest Takeaways

I learned that changing a business requirement does not necessarily require changing the SQL architecture.

The same reusable Customer Spending Summary dataset was used to calculate:

- Country Average Spending
- Customer Ranking

The only thing that changed was the business logic in the final report.

---

I also learned the importance of dataset grain.

Customer Spending Summary

One row represents one customer.

Average Customer Spending

One row represents one country.

Customer Ranking

One row represents one customer.

Knowing the grain before writing SQL makes it much easier to avoid incorrect calculations.

---

During code review I accidentally used an INNER JOIN instead of a LEFT JOIN.

After discussing the advantages and disadvantages of both approaches, I understood that:

- LEFT JOIN creates a reusable dataset.
- INNER JOIN is acceptable when intentionally filtering data.

The most important lesson was being able to justify the design decision.

---

Today's biggest lesson:

> Good SQL starts with understanding the business problem, not writing SELECT statements.