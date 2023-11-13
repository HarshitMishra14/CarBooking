package entities;
public class Car {
    private String carId;
    private String carname;
    private String category;
    private String seat;

    public Car(String carId, String carname, String category, String seat) {
        this.carId = carId;
        this.carname = carname;
        this.category = category;
        this.seat = seat;
    }

    public Car(String carname, String category, String seat) {
        this.carname = carname;
        this.category = category;
        this.seat = seat;
        
    }

    public Car() {
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }
}
    
    