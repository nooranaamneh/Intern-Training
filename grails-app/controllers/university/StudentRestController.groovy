package university

import grails.rest.RestfulController
import grails.converters.JSON

class StudentRestController extends RestfulController<Student> {

    static responseFormats = ['json']

    EnrollmentService enrollmentService

    StudentRestController() {
        super(Student)
    }


@Override
def index(Integer max) {

    params.max = Math.min(max ?: 10, 100)
    params.offset = params.int('offset') ?: 0

    def students = Student.createCriteria().list(
            max: params.max,
            offset: params.offset
    ) {

        if (params.name) {
            ilike("name", "%${params.name}%")
        }

        if (params.email) {
            ilike("email", "%${params.email}%")
        }
    }

    def total = students.totalCount
    Integer page = (params.offset / params.max) + 1

   render([total: total,page: page,data: students] as JSON)
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

def gpa(Long id) {

    Student student = Student.get(id)

    if (!student) {
        render(status: 404, text: '{"error":"Student not found"}')
        return
    }

    render([
        studentId: id,
        gpa: enrollmentService.calculateGpa(id)
    ] as JSON)
}

@Override
def update() {
    Student student = queryForResource(params.id)

    if (!student) {
        render status: 404, contentType: 'application/json', text: '{"error": "Student not found", "id": ' + params.id + '}'
        return
    }

    student.properties = request.JSON

    if (!student.save(flush: true)) {
        respond student.errors, status: 422
        return
    }

    respond student
}
}