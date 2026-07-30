<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <a href="#show-course" class="visually-hidden-focusable" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <ul class="navbar-nav container-fluid">
                    <li class="nav-item"><a class="nav-link btn" aria-label="Home" href="${createLink(uri: '/')}">
                        <i class="bi-house"></i> <g:message code="default.home.label"/></a>
                    </li>
                    <li class="nav-item"><g:link class="nav-link btn" aria-label="List" action="index">
                        <i class="bi-database"></i> <g:message code="default.list.label" args="[entityName]" /></g:link>
                    </li>
                    <li class="nav-item me-lg-auto">
                        <g:link class="nav-link btn" aria-label="List" action="create"><i class="bi-database-add"></i> <g:message code="default.new.label" args="[entityName]" /></g:link>
                    </li>
                </ul>
            </nav>
        </section>
        <section class="row">
            <div id="show-course" class="col-12 content scaffold-show" role="main">
                <h2> Course <h2>
                <h3> Title :  ${course.title}</h3>
                <h3> Code :  ${course.code}<h3>
                <h3> Credit Hours :  ${course.creditHours}<h3>
                <br>
                <g:form resource="${this.course}" controller="${controllerName}" method="DELETE">
                    <fieldset class="bg-body-tertiary">
                        <g:link class="btn btn-primary" action="edit" resource="${this.course}" controller="${controllerName}">
                            <i class="bi-pencil-square"></i> <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>
                        <button class="btn btn-primary" type="submit" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <i class="bi-trash"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}
                        </button>
                    </fieldset>
                </g:form>
                <br>
                <h3>Enrolled Students</h3>
                <g:if test="${course.enrollments}">
                  <ul>
                    <g:each in="${course.enrollments}" var="enrollment">
                      <li>${enrollment.student.name} - ${enrollment.student.studentNumber}</li>
                    </g:each>
                  </ul>
                </g:if>
                <g:else>
                  <p>no students enrolled in this course yet</p>
                </g:else>
            </div>
        </section>
    </div>
</div>
</body>
</html>
