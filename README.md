## Day 15 – Inventory Analytics Dataset & SQL Analysis

Completed the core Inventory Analytics dataset and began business-focused SQL analysis.

### Database

- Suppliers: 10
- Products: 25
- Inventory: 51
- Sales: 200

### Completed

- Generated realistic inventory data using warehouse-specific distribution.
- Generated 200 sales transactions.
- Ensured every product has inventory.
- Ensured every product has sales activity.
- Validated generated data before database insertion.
- Analyzed inventory using JOIN, GROUP BY, SUM, and COUNT.
- Created inventory classifications using CASE.
- Practiced CTEs for higher-level aggregation.

### SQL Concepts

- INNER JOIN
- GROUP BY
- SUM()
- COUNT()
- CASE
- CTE
- Functional dependency in PostgreSQL
- Understanding table grain

### Key Takeaway

The project is transitioning from data generation toward business-focused SQL analysis.

**Status:** ✅ Completed

## Day 14 – Inventory Product Data Generation

Today I continued the Inventory Analytics project by generating and loading product data using Python and PostgreSQL.

### Completed

- Created 25 unique products.
- Created five product categories.
- Implemented category-specific pricing.
- Assigned products to valid suppliers.
- Ensured every supplier received at least one product.
- Validated the generated product dataset.
- Loaded 25 products into PostgreSQL.
- Validated the Product → Supplier relationship using SQL JOIN.

### Python Concepts

- Lists
- Tuples
- Dictionaries
- For loops
- range()
- random.choice()
- random.randint()
- random.uniform()
- append()

### Database Status

Suppliers → 10 records  
Products → 25 records  
Inventory → Not populated  
Sales → Not populated

### Key Takeaway

Realistic data generation requires business rules and validation rather than simply generating random values.

**Status:** ✅ Completed

## Day 13 – Python Data Generation & PostgreSQL Integration

Today I introduced Python into the Inventory Analytics project to automate data generation and loading into PostgreSQL.

### Topics Covered

- Python Variables
- Python Lists
- Python Tuples
- For Loops
- range()
- append()
- psycopg2
- PostgreSQL Connections
- Database Cursors
- Parameterized SQL
- Transaction Commit
- Automated Data Insertion
- Foreign Key Dependencies

### Completed

- Installed and verified psycopg2.
- Connected Python successfully to PostgreSQL.
- Created a Python data-generation workflow.
- Generated 10 supplier records.
- Automatically inserted all 10 suppliers into PostgreSQL.
- Verified the supplier data in the database.

### Key Takeaway

Python can automate repetitive database operations and make data-generation workflows more scalable and maintainable.

### Inventory Data Pipeline

Suppliers
↓
Products
↓
Inventory
↓
Sales

**Status:** ✅ Completed

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