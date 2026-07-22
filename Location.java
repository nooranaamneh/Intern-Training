public class Location {
    private String street; //Encapsulation
    private String city;
    private String building;

    public Location(String street, String city, String building) {
        this.street = street;
        this.city = city;
        this.building = building;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }
}
