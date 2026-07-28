package university
import grails.gorm.transactions.Transactional
 @Transactional

class EnrollmentController {

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

     def existing = Enrollment.findByStudentAndCourse(enrollment.student, enrollment.course)

    if (existing) {
        flash.message = "This student is already enrolled in this course."
        redirect action: 'create'
        return
    }

    enrollment.save flush: true

    redirect action: 'index'
}

    def delete(Enrollment enrollment){
        if (enrollment == null) {
          notFound()
          return
     }
     enrollment.delete flush: true
     redirect action: 'index'

    }
}
