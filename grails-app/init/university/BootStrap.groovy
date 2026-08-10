package university

import grails.plugin.springsecurity.SpringSecurityService

class BootStrap {

    SpringSecurityService springSecurityService

    def init = { servletContext ->

        Role.withTransaction {

            def adminRole = Role.findByAuthority("ROLE_ADMIN") ?:
                    new Role(authority: "ROLE_ADMIN").save(failOnError: true)

            def userRole = Role.findByAuthority("ROLE_USER") ?:
                    new Role(authority: "ROLE_USER").save(failOnError: true)

            def admin = User.findByUsername("admin@ubs.com")
            if (!admin) {
                admin = new User(
                        username: "admin@ubs.com",
                        password: springSecurityService.encodePassword("admin123"),
                        enabled: true
                ).save(failOnError: true)

                UserRole.create(admin, adminRole, true)
            }

            def intern = User.findByUsername("intern@ubs.com")
            if (!intern) {
                intern = new User(
                        username: "intern@ubs.com",
                        password: springSecurityService.encodePassword("intern123"),
                        enabled: true
                ).save(failOnError: true)

                UserRole.create(intern, userRole, true)
            }
        }
    }

    def destroy = {
    }
}