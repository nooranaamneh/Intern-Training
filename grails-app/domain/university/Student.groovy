package university

class Student {

    String name
    String email
    String studentNumber
    String contentType
    byte[] profilePhoto

    static hasMany = [enrollments: Enrollment]

    static responseFormats = ['json', 'html']

    static constraints = {
        name blank: false
        email unique: true, email: true
        studentNumber blank: false
        profilePhoto nullable: true, maxSize: 2 * 1024 * 1024
        contentType nullable: true
    }

    static mapping = {
        profilePhoto sqlType: 'longblob'
    }
}