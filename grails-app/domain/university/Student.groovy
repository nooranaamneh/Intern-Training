package university

class Student {

    String name
    String email
    String studentNumber

    static hasMany = [enrollments: Enrollment]

    static responseFormats = ['json', 'html']

    static constraints = {
        name(blank: false)
        email(unique: true, email: true)
        studentNumber(blank: false)
    }
}
