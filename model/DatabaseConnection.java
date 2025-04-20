// File: model/DatabaseConnection.java
// Description: This class manages the connection to the MySQL database for the Jewellery Store Management System.
// It provides a reusable method to establish and return a Connection object using JDBC.

package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Database URL: Replace 'localhost' and port if hosted differently
    private static final String URL = "jdbc:mysql://localhost:3306/jewellery_store";

    // Database username
    private static final String USER = "root";

    // Database password (change to your actual password)
    private static final String PASSWORD = "your_password";

    /**
     * Establishes and returns a connection to the MySQL database.
     *
     * @return Connection object to interact with the database
     * @throws SQLException if the connection fails
     */
    public static Connection getConnection() throws SQLException {
        // Establish connection using JDBC DriverManager
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
