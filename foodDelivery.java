public class foodDelivery extends Delivery { // Inheritance

    public foodDelivery(int id, double distance) {
        super(id, distance);
    }

    @Override
    public double calculateCost() { // Method Overriding
        return distance * 2;
    }
}