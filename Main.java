import java.util.ArrayList;
import java.util.Collections;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        ArrayList<Delivery> deliveries = new ArrayList<>();

        foodDelivery food1 = new foodDelivery(1, 5);
        foodDelivery food2 = new foodDelivery(2, 10);
        clothesDelivery clothes1 = new clothesDelivery(3, 4);

        //Polymorphism
        deliveries.add(food1);
        deliveries.add(food2);
        deliveries.add(clothes1);

        //Display all deliveries
        System.out.println("All Deliveries:");
        for (Delivery d : deliveries) {
            System.out.println("Delivery{" +
                    "id=" + d.id +
                    ", distance=" + d.distance + ", Total Cost=" + d.calculateCost() +
                    '}');
            System.out.println("----------------");
        }

        //sorting (sorting deliveries by cost)
        Collections.sort(deliveries, (d1, d2) ->
                Double.compare(d1.calculateCost(), d2.calculateCost())
        );

        System.out.println("\nSorted by Cost:");
        for (Delivery d : deliveries) {
            System.out.println(
                    "ID: " + d.getId() +
                            " Cost: " + d.calculateCost()
            );
        }

        //filtering
        System.out.println("\nDeliveries less than 10 km:");
        for (Delivery d : deliveries) {
            if (d.distance < 10) {
                System.out.println("Delivery ID: " + d.getId());
            }
        }
    }
}