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

#cursor = connection.cursor()

#for product in products:
#    cursor.execute("""
#        INSERT INTO products
#            (
#                product_id,
#                product_name,
 #               category,
 #               supplier_id,
#                unit_price
#            )
#        VALUES (%s, %s, %s, %s, %s)
##    """, product)

connection.commit()

#print("All products inserted successfully!")

# ==================================================
# INVENTORY DATA
# ==================================================

warehouses = [
    "New York",
    "Chicago",
    "Dallas"
]

stock_ranges = {
    "Accessories": (50, 300),
    "Computer": (5, 50),
    "Audio": (20, 150),
    "Office": (10, 100),
    "Networking": (15, 120)
}

inventory = []

inventory_id = 1

for product in products:

    product_id = product[0]
    category = product[2]

    selected_warehouses = random.sample(
        warehouses,
        random.randint(1, 3)
    )

    minimum_stock, maximum_stock = stock_ranges[category]

    for warehouse in selected_warehouses:

        stock_quantity = random.randint(
            minimum_stock,
            maximum_stock
        )

        inventory_record = (
            inventory_id,
            product_id,
            warehouse,
            stock_quantity
        )

        inventory.append(inventory_record)

        inventory_id += 1

print("Inventory records generated:", len(inventory))
print(inventory)

product_inventory_counts = {}

for record in inventory:
    product_id = record[1]

    if product_id not in product_inventory_counts:
        product_inventory_counts[product_id] = 0

    product_inventory_counts[product_id] += 1

print("Inventory records by product:")
print(product_inventory_counts)

# ==================================================
# INSERT INVENTORY
# ==================================================

#cursor = connection.cursor()

#for record in inventory:
#    cursor.execute("""
#        INSERT INTO inventory
#            (
#                inventory_id,
#                product_id,
#                warehouse,
#                stock_quantity
#            )
#        VALUES (%s, %s, %s, %s)
#    """, record)

#connection.commit()

#print("All inventory records inserted successfully!")

#cursor.close()
#connection.close()

#print("Database connection closed.")

# ==================================================
# SALES DATA
# ==================================================

from datetime import date, timedelta

sales = []

sale_id = 1

today = date.today()
start_date = today - timedelta(days=89)

# First, guarantee every product has at least one sale
for product in products:

    product_id = product[0]
    category = product[2]

    sale_date = start_date + timedelta(
        days=random.randint(0, 89)
    )

    if category == "Accessories":
        quantity = random.randint(1, 10)

    elif category == "Computer":
        quantity = random.randint(1, 3)

    elif category == "Audio":
        quantity = random.randint(1, 6)

    elif category == "Office":
        quantity = random.randint(1, 5)

    else:
        quantity = random.randint(1, 8)

    sale = (
        sale_id,
        product_id,
        sale_date,
        quantity
    )

    sales.append(sale)
    sale_id += 1


# Generate the remaining sales randomly
while len(sales) < 200:

    product = random.choice(products)

    product_id = product[0]
    category = product[2]

    sale_date = start_date + timedelta(
        days=random.randint(0, 89)
    )

    if category == "Accessories":
        quantity = random.randint(1, 10)

    elif category == "Computer":
        quantity = random.randint(1, 3)

    elif category == "Audio":
        quantity = random.randint(1, 6)

    elif category == "Office":
        quantity = random.randint(1, 5)

    else:
        quantity = random.randint(1, 8)

    sale = (
        sale_id,
        product_id,
        sale_date,
        quantity
    )

    sales.append(sale)
    sale_id += 1


print("Sales records generated:", len(sales))
print(sales)

# ==================================================
# VALIDATE SALES DATA
# ==================================================

product_sales_counts = {}

for sale in sales:
    product_id = sale[1]

    if product_id not in product_sales_counts:
        product_sales_counts[product_id] = 0

    product_sales_counts[product_id] += 1

print("Sales records by product:")
print(product_sales_counts)

# ==================================================
# INSERT SALES
# ==================================================

cursor = connection.cursor()

for sale in sales:
    cursor.execute("""
        INSERT INTO sales
            (
                sale_id,
                product_id,
                sale_date,
                quantity
            )
        VALUES (%s, %s, %s, %s)
    """, sale)

connection.commit()

print("All sales records inserted successfully!")

cursor.close()
connection.close()

print("Database connection closed.")


# ==================================================
# CLOSE DATABASE CONNECTION
# ==================================================

#cursor.close()
#connection.close()

print("Database connection closed.")