/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package com.mycompany.javareview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author UBS
 */
public class JavaReview {

    public static void main(String[] args) {
        System.out.println("Hello World!");
        int num = 0;
        double dnum = 0.0;
        boolean bol = false;
        char c = 'a';

        System.out.print("Enter grade :");
        Scanner n = new Scanner(System.in);
        int grade = n.nextInt();

        if (grade == 1) {
            System.out.println(grade);
        } else if (grade == 2) {
            System.out.println(grade);

        } else if (grade == 3) {
            System.out.println(grade);

        } else if (grade == 4) {
            System.out.println(grade);

        } else if (grade == 5) {
            System.out.println(grade);

        } else {
            System.out.println("Grade Must be between 1 and 5 !");
        }

        switch (grade) {
            case 1:
                System.out.println(grade);
                break;
            case 2:
                System.out.println(grade);

                break;
            case 3:
                System.out.println(grade);

                break;
            case 4:
                System.out.println(grade);

                break;
            case 5:
                System.out.println(grade);

                break;
            default:

        }

        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= 10; j++) {
                System.out.println(i * j);
            }
        }

        System.out.println("Enter Number or 0 to end");
        int numberr = n.nextInt();
        int sum = 0;
        while (numberr != 0) {
            sum += numberr;
            System.out.println("Enter Number or 0 to end");
            numberr = n.nextInt();

        }
        System.out.println("sum = " + sum);
        System.out.println(isEven(4));
        System.out.println(factorial(4));
        System.out.println(reverseString("noora"));

        int arr[] = new int[10];
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            arr[i] = r.nextInt(100);
            System.out.println(arr[i]);
        }

        System.out.println("min = " + min(arr));
        System.out.println("max = " + max(arr));
        System.out.println("average = " + average(arr));

        String S1 = " M,a,y,s,a,n";
        System.out.println("String : " + S1);
        System.out.println("length : " + S1.length());
        System.out.println("char at : " + S1.charAt(3));
        System.out.println("substring : " + S1.substring(2));
        System.out.println("replace : " + S1.replace("y", "i"));
        String sarr[] = S1.split(",");
        System.out.println("split :");
        for (int i = 0; i < sarr.length; i++) {
            System.out.println(sarr[i]);
        }
        System.out.println("trim : " + S1.trim());
        System.out.println("upper case :" + S1.toUpperCase());
        try {
            System.out.println("divide : " + divide(3, 1));

        } catch (ArithmeticException a) {
            System.out.println("can not divide to 0 ");
        }

        ArrayList<String> list = new ArrayList<>();
        list.add("meso");
        list.add("mes");
        list.add("me");
        list.add("m");
        list.add("n");
        System.out.println(list.toString());
        for (String s : list) {
            if (s.equals("n")) {
                list.remove(s);
                break;
            }
        }
        System.out.println(list.toString());

        HashMap<String, Integer> students = new HashMap<>();
        students.put("noora", 90);
        students.put("maysan", 80);
        students.put("hanin", 70);

        for (Map.Entry<String, Integer> entry : students.entrySet()) {
            System.out.println("Student :" + entry.getKey() + " - Score :" + entry.getValue());
        }
        System.out.println("*******Student clas*******");
        Student s = new Student("roqaya", "1231420", 64);
        Course course1 = new Course("web", "comp123");
        Course course2 = new Course("AI", "comp129");
        s.enrollment(course1);
        s.enrollment(course2);
        s.printReport();

    }

    public static boolean isEven(int n) {
        return n % 2 == 0;
    }

    public static int factorial(int n) {
        if (n == 0) {
            return 1;
        }
        return n * factorial(n - 1);
    }

    public static String reverseString(String S) {
        String result = "";
        for (int i = S.length() - 1; i >= 0; i--) {
            result += S.charAt(i);
        }
        return result;
    }

    public static int min(int arr[]) {
        int min = Integer.MAX_VALUE;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] < min) {
                min = arr[i];
            }

        }
        return min;
    }

    public static int max(int arr[]) {
        int max = Integer.MIN_VALUE;
        for (int i = 0; i < arr.length; i++) {
            if (arr[i] > max) {
                max = arr[i];
            }

        }
        return max;
    }

    public static double average(int arr[]) {
        int sum = 0;
        for (int i = 0; i < arr.length; i++) {
            sum += arr[i];

        }
        return sum / arr.length;
    }

    public static double divide(int a, int b) {
        if (b == 0) {
            throw new ArithmeticException();
        }

        return a / b;

    }
}
