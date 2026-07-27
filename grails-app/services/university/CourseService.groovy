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

    void delete(Serializable id) {
        Course.get(id)?.delete()
    }

    Course save(Course course) {
        course.save()
        course
    }
}