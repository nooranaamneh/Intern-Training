package university

import grails.gorm.transactions.Transactional

@Transactional
class StudentService {

    Student get(Serializable id) {
        Student.get(id)
    }

    List<Student> list(Map args) {
        Student.list(args)
    }

    Long count() {
        Student.count()
    }

    void delete(Serializable id) {
        Student.get(id)?.delete()
    }

    Student save(Student student) {
    if (!student.save()) {
        throw new grails.validation.ValidationException("Student validation failed", student.errors)
    }
    student
}
}