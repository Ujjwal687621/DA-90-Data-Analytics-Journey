import random
import psycopg2


# ==================================================
# SUPPLIER DATA
# ==================================================

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


# ==================================================
# PRODUCT DEFINITIONS
# ==================================================

product_names = {
    "Accessories": [
        "Wireless Mouse",
        "USB-C Cable",
        "Laptop Stand",
        "Webcam Cover",
        "Mouse Pad"
    ],
    "Computer": [
        "Business Laptop",
        "Gaming Laptop",
        "Desktop Computer",
        "Mini PC",
        "Workstation"
    ],
    "Audio": [
        "Bluetooth Speaker",
        "Wireless Headphones",
        "Soundbar",
        "USB Microphone",
        "Wireless Earbuds"
    ],
    "Office": [
        "Office Chair",
        "Desk Lamp",
        "Standing Desk",
        "Monitor Arm",
        "Keyboard Tray"
    ],
    "Networking": [
        "Wi-Fi Router",
        "Network Switch",
        "Wi-Fi Extender",
        "Ethernet Adapter",
        "Mesh Wi-Fi System"
    ]
}


# ==================================================
# CATEGORY PRICE RANGES
# ==================================================

category_prices = {
    "Accessories": (5, 75),
    "Computer": (50, 1500),
    "Audio": (20, 500),
    "Office": (10, 300),
    "Networking": (25, 800)
}


# ==================================================
# CREATE UNIQUE PRODUCT LIST
# ==================================================

all_products = []

for category in product_names:
    for product_name in product_names[category]:
        all_products.append((product_name, category))


# ==================================================
# GENERATE PRODUCTS
# ==================================================

products = []

for i in range(1, 26):

    product_name, category = all_products[i - 1]

    # Ensure every supplier receives at least one product.
    if i <= 10:
        supplier_id = i
    else:
        supplier_id = random.randint(1, 10)

    minimum_price, maximum_price = category_prices[category]

    unit_price = round(
        random.uniform(minimum_price, maximum_price),
        2
    )

    product = (
        i,
        product_name,
        category,
        supplier_id,
        unit_price
    )

    products.append(product)


# ==================================================
# VALIDATE GENERATED DATA
# ==================================================

print(f"Generated products: {len(products)}")

supplier_counts = {}

for product in products:
    supplier_id = product[3]

    if supplier_id not in supplier_counts:
        supplier_counts[supplier_id] = 0

    supplier_counts[supplier_id] += 1

print("Products by supplier:")
print(supplier_counts)


# ==================================================
# CONNECT TO POSTGRESQL
# ==================================================

connection = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="ujjwalpoudel",
    password="DA90PY"
)

print("Database connection successful!")


# ==================================================
# INSERT PRODUCTS
# ==================================================

cursor = connection.cursor()

for product in products:
    cursor.execute("""
        INSERT INTO products
            (
                product_id,
                product_name,
                category,
                supplier_id,
                unit_price
            )
        VALUES (%s, %s, %s, %s, %s)
    """, product)

connection.commit()

print("All products inserted successfully!")


# ==================================================
# CLOSE DATABASE CONNECTION
# ==================================================

cursor.close()
connection.close()

print("Database connection closed.")