# Day 13 – Python Data Generation & PostgreSQL Integration

## What I Learned

Today I continued Phase 2 of my DA-90 journey by working with the new Inventory Analytics database.

The main focus was learning how Python can be used to generate and load data into PostgreSQL automatically instead of manually writing large numbers of INSERT statements.

I started by learning basic Python concepts that were necessary for the data-generation process.

### Python Concepts Practiced

- Variables
- Lists
- Tuples
- For loops
- range()
- append()

I learned that a list can hold multiple values, while a tuple can represent a group of related values.

For example:

    (1, "Everest Electronics", "USA")

can represent one row in the suppliers table:

    supplier_id = 1
    supplier_name = Everest Electronics
    country = USA

I then combined lists, tuples, loops, and range() to generate supplier records automatically.

## PostgreSQL Integration

I installed the psycopg2-binary Python package and successfully connected Python to my PostgreSQL database.

I learned how to:

- Create a PostgreSQL connection using Python.
- Create a database cursor.
- Execute SQL statements from Python.
- Use parameterized SQL values.
- Use commit() to save database changes.
- Close the cursor and database connection.

## Data Generation

I created 10 supplier records using Python and automatically inserted them into the PostgreSQL suppliers table.

The data-generation process now works like this:

    Python
        ↓
    Generate supplier records
        ↓
    Loop through records
        ↓
    Execute INSERT statements
        ↓
    PostgreSQL
        ↓
    suppliers table

## Database Relationship Lesson

I also reinforced the importance of foreign keys when generating related data.

Products will contain a supplier_id that references the suppliers table.

Therefore, generated supplier_id values must correspond to existing suppliers.

This reinforced the dependency order of our Inventory Analytics database:

    Suppliers
        ↓
    Products
        ↓
    Inventory
        ↓
    Sales

## Challenges

I encountered a Python error:

    NameError: name 'supplier_names' is not defined

This happened because the variable was not defined before Python attempted to use it.

I also encountered:

    psycopg2.InterfaceError: connection already closed

This happened because the database connection had been closed before the cursor was created.

Both errors helped me understand that Python executes code sequentially and that database connections must remain open while database operations are being performed.

## Key Takeaway

Today's biggest takeaway was learning that Python can automate repetitive database tasks.

Instead of manually creating hundreds of INSERT statements, Python can generate records and send them directly to PostgreSQL.

This makes the workflow more scalable and maintainable.

## Next Session

Continue building the Inventory Analytics dataset by generating 25 products and automatically assigning each product to a valid supplier.