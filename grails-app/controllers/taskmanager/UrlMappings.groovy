package taskmanager

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                
            }
        }

        "/api/tasks"(controller: "task", action: "list", method: "GET")
        "/api/tasks"(controller: "task", action: "save", method: "POST")
        "/api/tasks/$id"(controller: "task", action: "show", method: "GET")
        "/api/tasks/$id"(controller: "task", action: "update", method: "PUT")
        "/api/tasks/$id"(controller: "task", action: "delete", method: "DELETE")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}