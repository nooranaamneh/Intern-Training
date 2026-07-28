package university
import grails.gorm.transactions.Transactional
import groovy.util.logging.Slf4j

@Slf4j
@Transactional
class EnrollmentService {

    def serviceMethod() {

    }

    def enroll(Long studentId, Long courseId){
          
          log.info("enroll")

         try {

        Student student = Student.get(studentId)
        Course course = Course.get(courseId)

         if (!student || !course) {
            return null
        }

        def existing = Enrollment.findByStudentAndCourse(student, course)

        if (existing) {
            return null
        }

        Enrollment enrollment = new Enrollment(student: student, course: course)
        enrollment.save(flush: true)
        enrollment

        } catch(Exception e){
            log.error("Error enrollment in this course {}", studentId, e)
            throw e
        }

    }

    def updateGrade(Long enrollmentId, Integer grade) {
        log.info("update grade")
        try{
       Enrollment enrollment = Enrollment.get(enrollmentId)

    if (!enrollment) {
        return null
    }

    enrollment.grade = grade
    enrollment.save(flush: true)

    enrollment

    }catch(Exception e){
        log.error("Error updating this grade", e)
        throw e
    }
}

   def unenroll(Long enrollmentId){
    log.info("unenroll")
    try{
     Enrollment enrollment = Enrollment.get(enrollmentId)
     if(!enrollment){
        return false
     }
     enrollment.delete(flush:true)
    }catch(Exception e){
        log.error("error unenrollment in this course", e)
        throw e
    }
   }

   def calculateGpa(Long studentId){
    log.info("calculating GPA")
    try{
    Student student = Student.get(studentId)
    if(!student){
        return null
    }

    List<Enrollment> enrollments = Enrollment.findAllByStudent(student)

    List<Integer> grades = []
    for (enrollment in enrollments) {
      if (enrollment.grade != null) {
        grades.add(enrollment.grade)
    }
}

    if (!grades) {
        return 0.0d
    }

    (grades.sum() / grades.size()) as Double
    }catch(Exception e){
        log.error("Error calculating gpa", e)
        throw e
    }
    
   }

}
