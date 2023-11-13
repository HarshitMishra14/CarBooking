package entities;

import java.util.Date;

public class Booking {
    private String bid;
    private String pickupLocation;
    private String dropLocation;
    private Date startDate;
    private Date endDate;
    private Date bookingDate;
    private double totalAmount;
    private String carName; // New field for car name

    public Booking(String bid, String pickupLocation, String dropLocation, Date startDate, Date endDate, Date bookingDate, double totalAmount, String carName) {
        this.bid = bid;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.startDate = startDate;
        this.endDate = endDate;
        this.bookingDate = bookingDate;
        this.totalAmount = totalAmount;
        this.carName = carName;
    }

    public Booking(String pickupLocation, String dropLocation, Date startDate, Date endDate, Date bookingDate, double totalAmount, String carName) {
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.startDate = startDate;
        this.endDate = endDate;
        this.bookingDate = bookingDate;
        this.totalAmount = totalAmount;
        this.carName = carName;
    }

    public Booking() {
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDropLocation() {
        return dropLocation;
    }

    public void setDropLocation(String dropLocation) {
        this.dropLocation = dropLocation;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }
}
