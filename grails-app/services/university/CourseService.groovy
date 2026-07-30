package university

import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    Course get(Serializable id) {
        Course.get(id)
    }

    List<Course> list(Map args) {
        Course.list(args)
    }

    Long count() {
        Course.count()
    }

    Course save(Course course) {
    if (!course.save()) {
        throw new grails.validation.ValidationException("Course validation failed", course.errors)
    }
    course
}

    void delete(Serializable id) {
        Course course = Course.get(id)
        if (course) {
            course.delete()
        }
    }
}