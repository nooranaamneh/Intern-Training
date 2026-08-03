package university

class Course {

    String title
    String code
    Integer creditHours

    static hasMany = [enrollments: Enrollment]

    static responseFormats = ['json', 'html']

    static constraints = {

        title blank: false
        code unique: true
        creditHours range: 1..6

    }
}
