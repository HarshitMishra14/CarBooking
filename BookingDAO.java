package dao;

import entities.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO implements AutoCloseable {
    private Connection connection;

    public BookingDAO() throws SQLException {
        this.connection = DBUtil.getConnection();
    }

    public boolean addBooking(Booking booking) {
        String insertQuery = "INSERT INTO booking (bid, pickup, dropout, startdate, enddate, bdate, amount, carname) " +
                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
            preparedStatement.setString(1, booking.getBid());
            preparedStatement.setString(2, booking.getPickupLocation());
            preparedStatement.setString(3, booking.getDropLocation());
            preparedStatement.setDate(4, new java.sql.Date(booking.getStartDate().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(booking.getEndDate().getTime()));
            preparedStatement.setDate(6, new java.sql.Date(booking.getBookingDate().getTime()));
            preparedStatement.setDouble(7, booking.getTotalAmount());
            preparedStatement.setString(8, booking.getCarName()); // Set the carName

            int rows = preparedStatement.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String selectQuery = "SELECT * FROM booking";

        try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Booking booking = new Booking(
                    resultSet.getString("bid"),
                    resultSet.getString("pickupLocation"),
                    resultSet.getString("dropLocation"),
                    resultSet.getDate("startDate"),
                    resultSet.getDate("endDate"),
                    resultSet.getDate("bookingDate"),
                    resultSet.getDouble("totalAmount"),
                    resultSet.getString("carName") // Retrieve the carName
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    @Override
    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
