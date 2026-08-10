package university

class CustomLogoutController {

    def index() {
        session.invalidate()
        redirect uri: '/login/auth'
    }
}