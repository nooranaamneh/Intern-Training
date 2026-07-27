package university

class Course {

    String title
    String code
    Integer creditHours

    static constraints = {

        title blank: false
        code unique: true
        creditHours range: 1..6

    }
}
