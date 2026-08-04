package university

class UrlMappings {

    static mappings = {
        "/$namespace/$controller/$action?/$id?(.$format)?" {}
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/api/students"(resources: "studentRest")
       "/api/students/details/$id"(controller: "studentRest", action: "details")
        "/api/courses"(resources: "courseRest")
        "/api/enrollments"(resources: "enrollmentRest")
       "/api/students/$id/courses"(controller: "studentRest", action: "courses")
       "/api/students/$id/gpa"(controller: "studentRest", action: "gpa")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}