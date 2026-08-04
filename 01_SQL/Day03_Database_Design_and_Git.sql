-- =========================================================
-- Project DA-90
-- Company: Ujjsha Financial Technologies
-- Day: 03
-- Topic: Database Design, Relationships & GitHub
-- Author: Ujjwal Poudel
-- =========================================================

/*
Objective:
Understand relational database design by creating a transactions
table and introducing primary keys, foreign keys, and one-to-many
relationships.

Business Scenario:
The Payments Department requested a transaction database to
record customer purchases and prepare for future analytics.
*/

------------------------------------------------------------
-- Create Transactions Table
------------------------------------------------------------

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(20),
    payment_method VARCHAR(20),
    status VARCHAR(20),
    description VARCHAR(100),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

------------------------------------------------------------
-- Verify Table
------------------------------------------------------------

SELECT *
FROM transactions;

------------------------------------------------------------
-- Skills Practiced
------------------------------------------------------------

-- ✔ Database Design
-- ✔ CREATE TABLE
-- ✔ PRIMARY KEY
-- ✔ FOREIGN KEY
-- ✔ One-to-Many Relationship
-- ✔ Relational Database Concepts