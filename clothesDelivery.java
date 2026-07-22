public class clothesDelivery extends Delivery {//inheritance

    public clothesDelivery(int id, double distance) {
        super(id, distance);
    }

    @Override
    public double calculateCost() {//Method Overriding
        return distance * 4;
    }
}
