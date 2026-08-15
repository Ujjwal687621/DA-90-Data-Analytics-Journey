## Day 12 – Inventory Analytics Database Design

Today I began Phase 2 of my Data Analytics Journey by transitioning from Banking Analytics to Inventory Analytics.

Instead of immediately solving SQL business problems, I focused on understanding how a new database is designed.

### Topics Covered

- Database Design
- Primary Keys
- Foreign Keys
- One-to-Many Relationships
- Database Schema Planning
- Table Relationships
- Thinking Before Writing JOINs

### New Database

- Suppliers
- Products
- Inventory
- Sales

### Key Takeaway

Before writing analytical SQL, it is important to understand how the data is structured and how tables relate to one another.

**Status:** ✅ Completed

## Day 11 – Emerging Customers

Today's challenge focused on identifying **Emerging Customers** for the Marketing team using reusable SQL architecture.

### Business Scenario

The Marketing team wanted to identify customers who are showing strong purchasing behavior but are not yet the highest spender in their country.

### Concepts Practiced

- Business Requirement Analysis
- Data Flow Design
- CTE Architecture
- Aggregate Functions
- Window Functions
- ROW_NUMBER()
- PARTITION BY
- LEFT JOIN vs INNER JOIN
- Business Logic Filtering
- Query Maintainability

### Key Takeaways

- Designed the solution before writing SQL.
- Reinforced the importance of dataset grain.
- Reused customer-level datasets for multiple business calculations.
- Learned to justify SQL design decisions based on business requirements rather than syntax alone.

**Status:** ✅ Completed

## Day 10 ✅

Today's focus shifted toward independent business problem solving.

Key achievements:

- Designed the solution before writing SQL.
- Built a reusable multi-CTE analytical pipeline.
- Applied window functions to rank customers within each country.
- Reviewed SQL using production code review principles.
- Validated the final solution against business requirements.

Major milestone:

Completed the first full analytical business ticket independently with only code review feedback.

## Day 9 ✅

Today's focus shifted from learning SQL syntax to designing analytical solutions.

Key achievements:

- Designed a complete SQL pipeline before writing code.
- Reinforced the importance of dataset grain.
- Built reusable CTEs for customer summaries, country averages and customer rankings.
- Improved understanding of window functions and dataset relationships.
- Learned to select joins based on business logic and data relationships instead of memorization.

Major milestone:

Started thinking like a data analyst by designing datasets first and writing SQL second.