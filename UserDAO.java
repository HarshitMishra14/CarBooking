package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public static boolean isValidUser(String username, String password) throws SQLException {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement statement = con.prepareStatement("SELECT * FROM customers WHERE cusername = ? AND cpassword = ?")) {
            statement.setString(1, username);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        }
    }
}
