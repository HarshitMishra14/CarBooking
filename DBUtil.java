package dao;

import java.sql.*;

public class DBUtil {
    public static Connection getConnection() throws SQLException {
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Harshit", "123");
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException appropriately
            e.printStackTrace();
            throw new SQLException("Database driver not found.", e);
        } catch (SQLException e) {
            // Handle SQLException appropriately
            e.printStackTrace();
            throw e;
        }
        return con;
    }

    public static void closeConnection(Connection con, PreparedStatement preparedStatement, ResultSet resultSet) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            // Handle SQLException appropriately
            e.printStackTrace();
        }
    }

    public static void closeStatementAndConnection(PreparedStatement statement, Connection con) {
        try {
            if (statement != null) {
                statement.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            // Handle SQLException appropriately
            e.printStackTrace();
        }
    }
}
