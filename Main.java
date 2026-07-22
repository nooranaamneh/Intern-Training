import java.util.*;
import java.util.Deque;

public class Main {
    public static void main(String[] args) {

        /////////////// Arraylist ///////////////////////////

        ArrayList<Integer> arrayList = new ArrayList<>();
        long startArray = System.nanoTime();

        for (int i = 0; i < 10000; i++) { // O(n) , shift elements to add new element
            arrayList.add(0, i);
        }

        long endArray = System.nanoTime();

        ////////////////////// Linked List //////////////////////

        LinkedList<Integer> linkedList = new LinkedList<>();
        long startLinked = System.nanoTime();

        for (int i = 0; i < 10000; i++) { // O(1) , only update reference
            linkedList.add(0, i);
        }

        long endLinked = System.nanoTime();

        //////////////////// results ///////////////////////

        System.out.println("ArrayList Insertion Time :" + (endArray - startArray) + "nano seconds");
        System.out.println("LinkedList Insertion Time :" + (endLinked - startLinked) + "nano seconds");

        //////////////////// Stack /////////////////////

        Deque<Integer> stack = new ArrayDeque<>();

        stack.push(1);
        stack.push(2);
        stack.push(3);
        stack.push(4);
        stack.push(5);

        System.out.println("Top Element :" + stack.peek());

        LinkedList<Integer> list1 = new LinkedList<>();
        while (!stack.isEmpty()) {
            int stackelement = stack.pop();
            System.out.println(stackelement);
            list1.add(stackelement);
        }
        //////////////////////// Queue //////////////
        Queue<String> queue = new LinkedList<>();

        queue.add("File.pdf");
        queue.add("Report.docx");
        queue.add("Photo.png");
        queue.add("Assignment.pdf");
        queue.add("Notes.txt");

        System.out.println("Queue Elements :");
        System.out.println(queue);

        while (!queue.isEmpty()) {
            String job = queue.poll();
            System.out.println("Printing: " + job);
        }

        //////////////// hashMap /////////////////
        HashMap<String, List<String>> hashMap = new HashMap<>();

        hashMap.put("Noora", Arrays.asList("AI", "Web", "Java"));
        hashMap.put("Maysan", Arrays.asList("Database", "Networks"));
        hashMap.put("Hanin", Arrays.asList("Math", "Physics"));

        for (Map.Entry<String, List<String>> entry : hashMap.entrySet()) {
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }

        ///////////////////////// Hashset /////////////////////////
        HashSet<String> hashSet = new HashSet<>();
        String[] names = {"Noura", "Ahmad", "Sara", "Noura", "Ali", "Ahmad"};

        for (String name : names) {
            hashSet.add(name);
        }

        System.out.println("Names without duplicates:");
        System.out.println(hashSet);

        /////////////////////// TreeMap ///////////////////////////
        TreeMap<String, Integer> treeMap = new TreeMap<>();

        treeMap.put("Laptop", 2500);
        treeMap.put("Phone", 1200);
        treeMap.put("Camera", 800);
        treeMap.put("Tablet", 1500);

        for (Map.Entry<String, Integer> entry : treeMap.entrySet()) {
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }

        ////////////////// Binary Search ////////////////
        int[] numbers = {2, 5, 8, 12, 16, 23, 38, 45};

        // found case
        int result1 = binarySearch(numbers, 23);
        if (result1 != -1) {
            System.out.println("23 found at index " + result1);
        } else {
            System.out.println("23 not found");
        }


        // Not found case
        int result2 = binarySearch(numbers, 10);
        if (result2 != -1) {
            System.out.println("10 found at index " + result2);
        } else {
            System.out.println("10 not found");
        }

        ////////////////  Big-O  ////////////////

        /*
        Big-O
        1- ArrayList
           add : O(1) - when adding last , O(n) - when adding in middle
           get : O(1)
           remove : O(n)

        2- LinkedList
           add : O(1)
           get : O(n)
           remove : O(1) - Just removing , O(n) - for searching for that element

        3- HashMap
           add : O(1)
           get : O(1)
           remove : O(1)

        4- TreeMap
           add : O(log n)
           get : O(log n)
           remove : O(log n)
        */

        System.out.println("--------------------------------------------------------------------");
        System.out.println("In-memory inventory system");
        //////////////////////////  In-memory inventory system //////////////////////////

        HashMap<String, Product> inventory = new HashMap<>();
        Scanner input = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n--- Inventory Menu ---");
            System.out.println("1. Add Product");
            System.out.println("2. Remove Product");
            System.out.println("3. Search Product");
            System.out.println("4. List Products");
            System.out.println("5. Exit");
            System.out.print("Enter choice: ");

            choice = input.nextInt();
            input.nextLine();

            switch (choice) {
                case 1:
                    System.out.print("Enter product code: ");
                    String code = input.nextLine();

                    System.out.print("Enter product name: ");
                    String name = input.nextLine();

                    System.out.print("Enter price: ");
                    double price = input.nextDouble();

                    System.out.print("Enter quantity: ");
                    int quantity = input.nextInt();

                    Product p = new Product(code, name, price, quantity);

                    inventory.put(code, p);

                    System.out.println("Product added successfully!");
                    break;

                case 2:
                    System.out.print("Enter product code to remove: ");
                    code = input.nextLine();

                    if (inventory.containsKey(code)) {
                        inventory.remove(code);
                        System.out.println("Product removed!");
                    } else {
                        System.out.println("Product not found!");
                    }
                    break;

                case 3:
                    System.out.print("Enter product code to search: ");
                    code = input.nextLine();

                    if (inventory.containsKey(code)) {
                        inventory.get(code).toString();
                    } else {
                        System.out.println("Product not found!");
                    }
                    break;

                case 4:
                    if (inventory.isEmpty()) {
                        System.out.println("Inventory is empty!");
                    } else {
                        for (Product product : inventory.values()) {
                            product.toString();
                        }
                    }
                    break;

                case 5:
                    System.out.println("Exiting...");
                    break;

                default:
                    System.out.println("Invalid choice!");
            }

        } while (choice != 5);

        input.close();
    }

    public static void printStudentDescByCourses(HashMap<String, List<String>> students) {
        List<Map.Entry<String, List<String>>> list = new ArrayList<>(students.entrySet());
        list.sort((s1, s2) -> Integer.compare(s2.getValue().size(), s1.getValue().size()));
        for (Map.Entry<String, List<String>> entry : list) {
            System.out.println(entry.getKey() + " : " + entry.getValue().size() + " courses");
        }
    }

    public static void frequencyCounter(String s) {
        HashMap<String, Integer> frequency = new HashMap<>();

        String[] words = s.split(" ");

        for (String word : words) {
            if (frequency.containsKey(word)) {
                frequency.put(word, frequency.get(word) + 1);
            } else {
                frequency.put(word, 1);
            }
        }

        System.out.println(frequency);
    }


    public static int binarySearch(int[] arr, int target) {
        int left = 0;
        int right = arr.length - 1;

        while (left <= right) {
            int mid = (left + right) / 2;

            if (arr[mid] == target) {
                return mid;
            } else if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return -1;
    }

}