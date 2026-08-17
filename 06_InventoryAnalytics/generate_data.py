import psycopg2

# --------------------------------------------------
# Supplier Data
# --------------------------------------------------

supplier_names = [
    "Everest Electronics",
    "Himalayan Imports",
    "Pacific Wholesale",
    "Global Tech Supply",
    "Metro Distribution",
    "Summit Products",
    "NorthStar Supply",
    "Prime Retail Supply",
    "Atlas Wholesale",
    "Universal Distribution"
]

supplier_countries = [
    "USA",
    "Nepal",
    "USA",
    "Canada",
    "USA",
    "Nepal",
    "Canada",
    "USA",
    "Mexico",
    "USA"
]

suppliers = []

for i in range(1, 11):
    supplier = (
        i,
        supplier_names[i - 1],
        supplier_countries[i - 1]
    )

    suppliers.append(supplier)

print(suppliers)


# --------------------------------------------------
# PostgreSQL Connection
# --------------------------------------------------

connection = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="ujjwalpoudel",
    password="DA90PY"
)

print("Database connection successful!")


# --------------------------------------------------
# Insert Supplier Data
# --------------------------------------------------

cursor = connection.cursor()

for supplier in suppliers:
    cursor.execute("""
        INSERT INTO suppliers
            (supplier_id, supplier_name, country)
        VALUES (%s, %s, %s)
    """, supplier)

connection.commit()

print("All suppliers inserted successfully!")

cursor.close()
connection.close()