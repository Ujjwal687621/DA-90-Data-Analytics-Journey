/*
===========================================================
DA-90 Journey - Day 9
Topic:
- CTE Design
- Data Modeling
- Window Functions
- Analytical Problem Solving

Business Problem:
Find loyal customers who:
1. Rank in the Top 2 customers within their country based on completed spending.
2. Spend more than their country's average customer spending.

===========================================================
Today's Learning Objectives
===========================================================

- Design SQL solutions before writing code.
- Think in terms of data flow.
- Understand dataset grain.
- Build reusable CTEs.
- Practice ROW_NUMBER().
- Understand INNER JOIN vs LEFT JOIN.
- Compare CROSS JOIN with normal JOIN.

===========================================================
Concepts Practiced
===========================================================

✓ Customer Summary CTE
✓ Country Average CTE
✓ Country Ranking CTE
✓ ROW_NUMBER()
✓ PARTITION BY
✓ AVG()
✓ SUM()
✓ COUNT()
✓ COALESCE()
✓ LEFT JOIN
✓ INNER JOIN
✓ Dataset Grain
✓ Business-first SQL Design

===========================================================
Data Flow

Transactions
      │
      ▼
Customer Summary
      │
      ├─────────────┐
      ▼             ▼
Country Average   Country Ranking
      │             │
      └──────┬──────┘
             ▼
      Loyal Customers

===========================================================
Key Lesson

Before writing SQL ask:

"What should one row represent?"

If that question is answered first,
the SQL becomes much easier.

===========================================================
*/