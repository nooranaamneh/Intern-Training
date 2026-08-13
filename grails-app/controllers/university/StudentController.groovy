package university

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StudentController {

    StudentService studentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.offset = params.offset ?: 0

        def studentList
        def studentCount

        if(params.search){

            studentList = Student.findAllByNameIlike("%${params.search}%" , params)
            studentCount = Student.countByNameIlike("%${params.search}%")
            
        }else{

            studentList = studentService.list(params)
            studentCount = studentService.count()
        }

        respond studentList, model: [studentCount : studentCount]
    }

    def show(Long id) {
        respond studentService.get(id)
    }

    
    def create() {
        respond new Student(params)
    }
 
   
    def save(Student student) {
        if (student == null) {
            notFound()
            return
        }

        try {
            studentService.save(student)
        } catch (ValidationException e) {
            respond student.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), student.id])
                redirect student
            }
            '*' { respond student, [status: CREATED] }
        }
    }

    
    def edit(Long id) {
        respond studentService.get(id)
    }

    
    def update(Student student) {
    if (student == null) {
        notFound()
        return
    }

    def photoFile = request.getFile('profilePhoto')

    if (photoFile && !photoFile.empty) {
        if (!photoFile.contentType?.startsWith('image/')) {
            flash.message = "File must be an image (JPG, PNG, etc.)"
            redirect action: 'edit', id: student.id
            return
        }

        if (photoFile.size > 2 * 1024 * 1024){
            flash.message = "Image is too large. Please choose an image smaller than 2MB."
            redirect action: 'edit', id: student.id
            return
        }

        student.profilePhoto = photoFile.bytes
        student.contentType = photoFile.contentType
    }

    try {
        studentService.save(student)
    } catch (ValidationException e) {
        respond student.errors, view: 'edit'
        return
    }

    request.withFormat {
        form multipartForm {
            flash.message = message(code: 'default.updated.message', args: [message(code: 'student.label', default: 'Student'), student.id])
            redirect student
        }
        '*' { respond student, [status: OK] }
    }
}


    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        studentService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'student.label', default: 'Student'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def renderPhoto() {
    println "PHOTO PARAMS = ${params}"

    Long id = params.long('id')

    if (!id) {
        render status: 400, text: 'Invalid student ID'
        return
    }

    Student student = Student.get(id)

    if (!student?.profilePhoto) {
        render status: 404
        return
    }

    response.contentType = student.contentType ?: 'image/jpeg'
    response.outputStream << student.profilePhoto
    response.outputStream.flush()
}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
