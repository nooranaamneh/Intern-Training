/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.ArrayList;

/**
 *
 * @author UBS
 */
public class Student extends Person implements Enrollment{
    private String name ;
    private String id ; 
    private int grade ; 
    private ArrayList<Course>courses = new ArrayList<>();
    
   public  Student(String name,String id,int grade){
       super(name, id);
       this.grade=grade;
}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public ArrayList<Course> getCourses() {
        return courses;
    }

    public void setCourses(ArrayList<Course> courses) {
        this.courses = courses;
    }

    @Override
    public void printInfo() {
        System.out.println("Name : " + name);
        System.out.println("ID : " + id);
        System.out.println("Grade : " + grade);
        System.out.println("Courses : ");
        for(Course c : courses){
            System.out.println(c.getCode() + "-" + c.getTitle());
        }
    }

    @Override
    public void enroll(Course course) {
        courses.add(course);
    }
}

