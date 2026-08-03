package university

import grails.rest.RestfulController

class EnrollmentRestController extends RestfulController<Enrollment> {

    static responseFormats = ['json']

    EnrollmentRestController() {
        super(Enrollment)
    }

    @Override
    protected Integer countResources() {
        Enrollment.count()
    }
}