# Day 12 – Inventory Analytics Database Design

## What I Learned

Today marked the beginning of a new phase in my Data Analytics Journey.

Instead of working with the banking dataset, I transitioned into Inventory Analytics. Before solving any business problems, I learned the importance of understanding the database structure and relationships between tables.

We designed a new database consisting of four tables:

- Suppliers
- Products
- Inventory
- Sales

I learned why databases must be created in a specific order when foreign keys are involved. Since the Products table references Suppliers, Suppliers must exist before Products can be created. Likewise, Inventory and Sales both depend on Products.

We also discussed one-to-many relationships.

- One supplier can have many products.
- One product can have many inventory records.
- One product can have many sales records.

Another important lesson today was learning to trace relationships before writing SQL. Instead of thinking about JOINs first, I practiced identifying which tables contain the required information and how they connect together.

For example:

Sales → Products → Suppliers

or

Inventory → Products → Suppliers

This helped me understand that experienced analysts first identify the path between tables before writing SQL queries.

Today's biggest takeaway was that understanding the database is just as important as understanding SQL syntax.

I am excited to start building a realistic inventory dataset using Python and PostgreSQL in the next session.