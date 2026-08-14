/*
===========================================================
DA-90 Data Analytics Journey
Day 11 - Emerging Customers
Author: Ujjwal Poudel
===========================================================

Objective:
Identify Emerging Customers for the Marketing Team.

Business Requirements:
1. Customer must have at least 2 completed transactions.
2. Customer must spend more than the average customer in their own country.
3. Customer must NOT be the highest spender in their country.
4. Display:
   - Customer ID
   - Customer Name
   - Country
   - Total Completed Spending
   - Total Completed Transactions
   - Country Average Spending
   - Customer Rank
5. Sort by:
   - Country (Ascending)
   - Customer Completed Spending (Descending)

Concepts Practiced:
- CTEs
- Aggregate Functions
- LEFT JOIN
- ROW_NUMBER()
- Window Functions
- PARTITION BY
- GROUP BY
- Business Logic Filtering
- SQL Architecture
- Code Review

Key Learning:
Always design the data flow and dataset grain before writing SQL.
Reusable datasets reduce duplicate logic and simplify future business requirements.
===========================================================
*/