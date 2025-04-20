package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // JDBC URL, username, and password for the MySQL database
    private static final String URL = "jdbc:mysql://localhost:3306/jewellery_store";  // Database URL
    private static final String USER = "root";  // Database username
    private static final String PASSWORD = "password";  // Database password
    
    // Singleton instance of the database connection
    private static Connection connection;

    // Private constructor to prevent instantiation
    private DatabaseConnection() {}

    /**
     * Returns the single instance of the database connection.
     * If the connection is not already established or has been closed, it establishes a new one.
     * 
     * @return Connection object for the MySQL database.
     * @throws SQLException if a database access error occurs.
     */
    public static Connection getConnection() throws SQLException {
        // Check if the connection is null or closed, and create a new one if necessary
        if (connection == null || connection.isClosed()) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection to the database
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (ClassNotFoundException e) {
                // Handle the case where the MySQL JDBC driver is not found
                throw new SQLException("Database driver not found", e);
            }
        }
        return connection;
    }

    /**
     * Closes the database connection if it is open.
     * This should be called to release the database resources when no longer needed.
     */
    public static void closeConnection() {
        try {
            // Close the connection if it is not already closed
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            // Print error message if there's an issue closing the connection
            System.err.println("Error closing connection: " + e.getMessage());
        }
    }
}
