package university

class Enrollment {
    double grade
    Date enrollAt = new Date()
    static belongsTo =  [student: Student, course: Course]

    static constraints = {
        grade (nullable: true)
    }
}
