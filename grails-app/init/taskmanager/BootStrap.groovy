package taskmanager
import grails.plugin.springsecurity.SpringSecurityService

class BootStrap {

    SpringSecurityService springSecurityService

    def init = { servletContext ->
        
         Role.withTransaction {

        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)

        if (!User.findByUsername('admin')) {
            def admin = new User(username: 'admin', password: 'admin123')
            admin.save(flush: true)
            UserRole.create(admin, adminRole, true)
        }

        if (!User.findByUsername('user')) {
            def user = new User(username: 'user', password: 'user123')
            user.save(flush: true)
            UserRole.create(user, userRole, true)
        }

        }
    }

    def destroy = {
    }
}