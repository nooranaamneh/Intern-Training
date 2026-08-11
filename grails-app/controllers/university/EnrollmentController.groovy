package university
import grails.plugin.springsecurity.annotation.Secured
import grails.gorm.transactions.Transactional
 @Transactional

class EnrollmentController {
    EnrollmentService enrollmentService

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def index() { 
      [enrollmentList: Enrollment.list()]
    }
    
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def create() {
    [enrollment: new Enrollment(),students: Student.list(),courses: Course.list()]
   }
  
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
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
        flash.error = "This student is already enrolled in this course."
        redirect action: 'create'
        return
    }

    redirect action: 'index'
}
 
    @Secured(['ROLE_ADMIN'])
    def delete(Enrollment enrollment){
        if (enrollment == null) {
          notFound()
          return
     }

      enrollmentService.unenroll(enrollment.id)
     redirect action: 'index'

    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def editGrade(Enrollment enrollment) {
    if (enrollment == null) {
        notFound()
        return
    }
    respond enrollment
}
 
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
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

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
def testGpa() {

    Long studentId = 4L 

    def gpa = enrollmentService.calculateGpa(studentId)

    render "GPA for student ${studentId}: ${gpa}"
}

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
def calcgpa(Long studentId){
    def gpa = enrollmentService.calculateGpa(studentId)

    render "GPA for student ${studentId}: ${gpa}"
}
}

