# java-project
Jewellery Store Management System
A Java-based management system for a jewellery store, handling inventory, customers, and transactions with full database integration. This project was collaboratively developed by four team members, each responsible for different modules including data modeling, DAO implementation, business logic, and transaction processing.
 Features
Manage jewellery inventory (CRUD operations)


Customer registration and management


Process sales transactions with stock updates


Real-time sales reporting and date-based filtering


Exception handling for missing data and stock issues


Clean separation of concerns using DAO and Service layers


Technologies Used
Java (OOP, Exception Handling, JDBC)


MySQL (for data storage)


DAO Pattern (for data access abstraction)


Manual Compilation


🧱 Database Schema

-- Jewellery table
CREATE TABLE Jewellery (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  type ENUM('Ring', 'Necklace', 'Bracelet', 'Earrings') NOT NULL,
  material VARCHAR(50) NOT NULL,
  weight DECIMAL(10,2) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  date_added DATE NOT NULL
);

-- Customers table
CREATE TABLE Customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20) NOT NULL,
  address TEXT,
  join_date DATE NOT NULL
);

-- Transactions table
CREATE TABLE Transactions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  jewellery_id INT,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  transaction_date DATETIME NOT NULL,
  payment_method ENUM('Cash', 'Card', 'UPI'),
  FOREIGN KEY (customer_id) REFERENCES Customers(id),
  FOREIGN KEY (jewellery_id) REFERENCES Jewellery(id)
);


SET UP
1. Clone the Repository

git clone https://github.com/malarms/jewellery-store.git
cd jewellery-store

2. Set Up the Database
Create a MySQL database named jewellery_store.


Execute the schema SQL script (above) to create tables.


Update the database credentials in DatabaseConnection.java.


3. Compile and Run
Compile with:
bash
CopyEdit
javac -cp .:mysql-connector-java.jar Main.java
java -cp .:mysql-connector-java.jar Main

Make sure the MySQL JDBC Driver is in your classpath.

📦 Project Structure
css
CopyEdit
├── model
│   ├── DatabaseConnection.java
│   ├── Jewellery.java
│   ├── Customer.java
│   └── Transaction.java
├── dao
│   ├── JewelleryDAO.java
│   ├── CustomerDAO.java
│   └── TransactionDAO.java
├── service
│   ├── JewelleryService.java
│   ├── CustomerService.java
│   └── TransactionService.java
├── exceptions
│   ├── JewelleryNotFoundException.java
│   ├── InsufficientStockException.java
│   └── CustomerNotFoundException.java
└── Main.java


👨‍💻 Team Contributions
Team Member 1: Database schema, database connection setup


Team Member 2: Model classes and DAO interface design


Team Member 3: Jewellery service logic, inventory handling


Team Member 4: Transaction service, reporting, customer-service integration




