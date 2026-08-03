package university

import grails.rest.RestfulController

class CourseRestController extends RestfulController<Course> {

    static responseFormats = ['json']

    CourseRestController() {
        super(Course)
    }

    @Override
    protected Integer countResources() {
        Course.count()
    }
}