-- DATABASE SCHEMA: Jewellery Store Management System
-- Description:
-- This script creates the necessary tables for the jewellery store database.
-- It defines the structure of three tables: Jewellery, Customers, and Transactions.

-- Create the Jewellery table to store information about each jewellery item
CREATE TABLE Jewellery (
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique identifier for each jewellery item
    name VARCHAR(100) NOT NULL,                -- Name of the jewellery item
    type ENUM('Ring', 'Necklace', 'Bracelet', 'Earrings') NOT NULL,  -- Type of the jewellery item (e.g., Ring, Necklace, etc.)
    material VARCHAR(50) NOT NULL,             -- Material the jewellery is made from (e.g., Gold, Silver)
    weight DECIMAL(10,2) NOT NULL,             -- Weight of the jewellery item (in grams, for example)
    price DECIMAL(10,2) NOT NULL,              -- Price of the jewellery item
    stock_quantity INT NOT NULL,               -- Quantity available in stock
    date_added DATE NOT NULL                   -- Date the jewellery item was added to the inventory
);

-- Create the Customers table to store information about customers
CREATE TABLE Customers (
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique identifier for each customer
    name VARCHAR(100) NOT NULL,                -- Customer's full name
    email VARCHAR(100) UNIQUE,                 -- Customer's email address (must be unique)
    phone VARCHAR(20) NOT NULL,                -- Customer's phone number
    address TEXT,                              -- Customer's address (optional)
    join_date DATE NOT NULL                    -- Date the customer joined (e.g., registered with the store)
);

-- Create the Transactions table to record customer purchases
CREATE TABLE Transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique identifier for each transaction
    customer_id INT,                           -- Reference to the customer making the purchase (foreign key)
    jewellery_id INT,                          -- Reference to the jewellery item purchased (foreign key)
    quantity INT NOT NULL,                     -- Quantity of the jewellery item purchased
    total_price DECIMAL(10,2) NOT NULL,        -- Total price for the transaction (quantity * price)
    transaction_date DATETIME NOT NULL,        -- Date and time when the transaction occurred
    payment_method ENUM('Cash', 'Card', 'UPI'), -- Payment method used (Cash, Card, or UPI)
    
    -- Foreign key constraint to link to the Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    
    -- Foreign key constraint to link to the Jewellery table
    FOREIGN KEY (jewellery_id) REFERENCES Jewellery(id)
);
