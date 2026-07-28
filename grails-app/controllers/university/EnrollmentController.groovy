package university
import grails.gorm.transactions.Transactional
 @Transactional

class EnrollmentController {
    EnrollmentService enrollmentService

    def index() { 
      [enrollmentList: Enrollment.list()]
    }

    def create() {
    [enrollment: new Enrollment(),students: Student.list(),courses: Course.list()]
   }

    def save(Enrollment enrollment) {
      if (enrollment == null) {
          notFound()
          return
     }

     if (enrollment.hasErrors()) {
        respond enrollment.errors, view: 'create'
        return
     }

     def result = enrollmentService.enroll(enrollment.student.id , enrollment.course.id)

    if (!result) {
        flash.message = "This student is already enrolled in this course."
        redirect action: 'create'
        return
    }

    redirect action: 'index'
}

    def delete(Enrollment enrollment){
        if (enrollment == null) {
          notFound()
          return
     }

      enrollmentService.unenroll(enrollment.id)
     redirect action: 'index'

    }

    def editGrade(Enrollment enrollment) {
    if (enrollment == null) {
        notFound()
        return
    }
    respond enrollment
}

def updateGrade(Enrollment enrollment) {
    if (enrollment == null) {
        notFound()
        return
    }

    def result = enrollmentService.updateGrade(enrollment.id, params.grade as Integer)

    if (!result) {
        flash.message = "Could not update grade."
    }

    redirect action: 'index'
}

def testGpa() {

    Long studentId = 4L 

    def gpa = enrollmentService.calculateGpa(studentId)

    render "GPA for student ${studentId}: ${gpa}"
}

def calcgpa(Long studentId){
    def gpa = enrollmentService.calculateGpa(studentId)

    render "GPA for student ${studentId}: ${gpa}"
}
}

