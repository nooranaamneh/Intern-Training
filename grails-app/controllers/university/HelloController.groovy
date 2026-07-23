package university

class HelloController {

    def index() { }

    def showMessage(String name) {
        render text: "Hello, ${name}! Welcome to UBS Intern Training.", contentType: "text/plain"
    }
}