package university

import grails.rest.RestfulController

class StudentRestController extends RestfulController<Student> {

    static responseFormats = ['json']

    StudentRestController() {
        super(Student)
    }

    @Override
    protected Integer countResources() {
        Student.count()
    }

    @Override
    def show() {
        Student student = queryForResource(params.id)

        if (!student) {
            render status: 404, contentType: 'application/json', text: '{"error": "Student not found", "id": ' + params.id + '}'
            return
        }

        respond student
    }

    def details(Long id) {
        Student student = Student.get(id)

        if (!student) {
            render status: 404, contentType: 'application/json', text: '{"error": "Student not found", "id": ' + params.id + '}'
            return
        }

        def courseNames = student.enrollments?.collect { it.course.title } ?: []
        Map result = [studentName: student.name, email: student.email, courses: courseNames]

        respond result
    }

    def courses(Long id) {
    Student student = Student.get(id)

    if (!student) {
        render status: 404, contentType: 'application/json', text: '{"error": "Student not found", "id": ' + id + '}'
        return
    }

    def courseList = student.enrollments?.collect {
        [id: it.course.id, title: it.course.title, code: it.course.code]
    } ?: []

    respond courseList
}
}