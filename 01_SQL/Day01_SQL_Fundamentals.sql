-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 01
-- Topic: SQL Fundamentals
-- Author: Ujjwal Poudel
-- =========================================================

/*
Objective:
Learn the fundamentals of SQL by creating a table,
inserting data, and writing basic queries.

Business Scenario:
As a Junior Data Analyst at Ujjsha Financial Technologies,
I was asked to create a simple customer table and verify
that customer data was successfully loaded into the database.
*/

------------------------------------------------------------
-- Create Customers Table
------------------------------------------------------------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(30),
    balance DECIMAL(10,2)
);

------------------------------------------------------------
-- Insert Sample Customer Data
------------------------------------------------------------

INSERT INTO customers (
    customer_id,
    customer_name,
    country,
    balance
)
VALUES
(1, 'John Smith', 'USA', 450.00),
(2, 'Emily Johnson', 'Canada', 620.50),
(3, 'David Lee', 'USA', 150.75),
(4, 'Sarah Brown', 'UK', 980.25),
(5, 'Michael Chen', 'USA', 1200.00);

------------------------------------------------------------
-- Display All Customers
------------------------------------------------------------

SELECT *
FROM customers;

------------------------------------------------------------
-- Display USA Customers
------------------------------------------------------------

SELECT *
FROM customers
WHERE country = 'USA';

------------------------------------------------------------
-- Display Customers with Balance Greater Than $500
------------------------------------------------------------

SELECT *
FROM customers
WHERE balance > 500;