public abstract class Delivery { // Abstraction

    protected int id;
    protected double distance;

    public Delivery(int id, double distance) {
        this.id = id;
        this.distance = distance;
    }

    public abstract double calculateCost();

    public int getId() {
        return id;
    }

    public double getDistance() {
        return distance;
    }
}