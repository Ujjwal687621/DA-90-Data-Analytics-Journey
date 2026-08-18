# Day 14 – Inventory Product Data Generation

## What I Learned

Today I continued working as a Junior Data Analyst on the Inventory Analytics project.

The main objective was to generate realistic product data using Python and load the validated data into PostgreSQL.

The supplier data was already completed from Day 13, with 10 suppliers available in the database.

Today's focus was building the Products dataset.

## Business Requirements

The product dataset needed to satisfy several requirements:

- Generate 25 products.
- Use 5 realistic product categories.
- Ensure every product has a unique product name.
- Assign every product to an existing supplier.
- Ensure every supplier has at least one product.
- Generate realistic product prices based on category.
- Validate the generated data before loading it into PostgreSQL.

## Product Categories

The five categories used were:

- Accessories
- Computer
- Audio
- Office
- Networking

Each category contains five unique products, giving us a total of 25 products.

## Python Concepts Practiced

Today I continued using:

- Lists
- Tuples
- Dictionaries
- For loops
- range()
- random.choice()
- random.randint()
- random.uniform()
- append()

I used Python dictionaries to organize products by category and to define category-specific price ranges.

## Category-Based Pricing

Instead of generating completely random prices, I created realistic price ranges based on product category.

Example:

- Accessories: $5–$75
- Computer: $50–$1,500
- Audio: $20–$500
- Office: $10–$300
- Networking: $25–$800

This helped ensure that the generated data was random while still being realistic.

## Supplier Assignment

There are 10 suppliers and 25 products.

A business rule was established that every supplier must have at least one product.

The first 10 products were assigned one-to-one with the 10 suppliers.

The remaining 15 products were assigned randomly among the suppliers.

This ensured that no supplier was left without a product.

## Data Validation

Before inserting the products into PostgreSQL, I validated the generated data.

The validation confirmed:

- 25 product records were generated.
- 25 product names were unique.
- Product IDs ranged from 1 to 25.
- All five categories were represented.
- All supplier IDs were between 1 and 10.
- Every supplier had at least one product.
- Product prices followed the category-specific ranges.

The supplier distribution was also checked programmatically.

## PostgreSQL Integration

I used psycopg2 to connect Python to PostgreSQL and insert the generated product records.

The product data was inserted into the:

    products

table.

The final database now contains:

    suppliers → 10 records
    products  → 25 records

## SQL Validation

After loading the products, I used a JOIN between the products and suppliers tables to validate the relationship.

The query joined:

    products.supplier_id

to:

    suppliers.supplier_id

This confirmed that each product was connected to a valid supplier and allowed supplier information to be viewed alongside product information.

## Challenges

I encountered several errors while developing the data generator.

### NameError

I encountered errors where variables such as category_prices or supplier_names were not defined.

This reinforced that Python executes code sequentially and variables must be defined before they are used.

### Duplicate Supplier Error

I encountered a duplicate primary key error when the script attempted to insert suppliers that were already present in PostgreSQL.

This reinforced the importance of understanding the current database state before running data-loading scripts.

### Cursor Error

I also encountered an error when attempting to close a database cursor that had not been created.

This helped reinforce the importance of managing database connections and cursors correctly.

## Key Takeaways

Today's biggest lesson was that data generation should follow business rules rather than simply producing random values.

Random data can still be unrealistic or invalid.

A good data-generation process should:

    Generate
        ↓
    Validate
        ↓
    Load
        ↓
    Verify

I also learned that data quality decisions should be made before loading data into the database.

## Current Inventory Analytics Database

The current database contains:

    Suppliers → 10 records
    Products  → 25 records
    Inventory → Not populated yet
    Sales     → Not populated yet

## Next Session

Continue building the Inventory Analytics dataset by generating inventory records.

The next focus will be:

- Inventory quantities
- Product inventory relationships
- Stock levels
- Inventory data validation
- Loading inventory data into PostgreSQL