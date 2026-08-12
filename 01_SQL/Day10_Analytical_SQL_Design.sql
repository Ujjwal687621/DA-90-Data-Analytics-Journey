/*
===========================================================
DA-90 Journey - Day 10

Topic
- Business Problem Solving
- Analytical SQL Design
- Window Functions
- CTE Architecture
- SQL Code Review

Business Request

Identify Consistent High-Value Customers.

Requirements:

1. At least 3 completed transactions.
2. Spending greater than the average customer spending in their own country.
3. Ranked within the Top 3 customers in their country.
4. Display customer details, spending metrics and ranking.

===========================================================

Today's Learning Objectives

✓ Translate business requirements into SQL.
✓ Design data flow before coding.
✓ Build reusable CTEs.
✓ Apply ROW_NUMBER().
✓ Review SQL like production code.
✓ Validate SQL against business requirements.

===========================================================

CTEs Created

1. customer_spending_summary

Purpose:
Summarize completed transactions for every customer.

Columns:

- customer_id
- customer_name
- country
- total_completed_spending
- total_completed_transactions

Grain:

One row represents one customer.

-----------------------------------------------------------

2. average_customer_spending

Purpose:

Calculate average customer spending for each country.

Columns:

- country
- average_customer_spending

Grain:

One row represents one country.

-----------------------------------------------------------

3. customer_ranking

Purpose:

Rank customers within each country based on total completed spending.

Columns:

- customer_id
- customer_name
- country
- total_completed_spending
- total_completed_transactions
- customer_rank

Grain:

One row represents one customer.

===========================================================

Data Flow

Transactions
      │
      ▼
Customer Spending Summary
      │
      ├──────────────┐
      ▼              ▼
Average Customer   Customer Ranking
Spending
      │              │
      └───────┬──────┘
              ▼
         Final Report

===========================================================

Major Concepts Practiced

✓ Business-first SQL Design
✓ Dataset Grain
✓ CTE Architecture
✓ Window Functions
✓ ROW_NUMBER()
✓ LEFT JOIN
✓ INNER JOIN discussion
✓ WHERE vs HAVING
✓ GROUP BY review
✓ Code Review Process

===========================================================

Key Lesson

Always solve the business problem before writing SQL.

Business Request
↓

Dataset Design
↓

CTEs
↓

Final SQL

===========================================================
*/