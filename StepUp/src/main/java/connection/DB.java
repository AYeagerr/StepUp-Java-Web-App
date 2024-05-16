package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    public static Connection getConnection() {
        Connection con = null;  // Remove static from con declaration
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Replace based on your connection settings!!
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stepup", "root", "");
            System.out.println("Connected");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection Failed: " + e.getMessage());
            e.printStackTrace();
        }
        return con;
    }
}