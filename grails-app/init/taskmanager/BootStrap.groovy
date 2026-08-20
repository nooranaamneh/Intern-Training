package taskmanager

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        Role.withTransaction {
            def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)
            def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)

            if (!User.findByUsername('admin')) {
                def admin = new User(
                        username: 'admin',
                        password: springSecurityService.encodePassword('admin123')
                )
                admin.save(flush: true)
                UserRole.create(admin, adminRole, true)
            }

            if (!User.findByUsername('user')) {
                def normalUser = new User(
                        username: 'user',
                        password: springSecurityService.encodePassword('user123')
                )
                normalUser.save(flush: true)
                UserRole.create(normalUser, userRole, true)
            }
        }
    }

    def destroy = {
    }
}