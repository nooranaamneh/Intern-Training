<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div id="content" role="main">
    <div class="container">
        <section class="row">
            <a href="#edit-course" class="visually-hidden-focusable" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
            <div id="edit-course" class="col-12 content scaffold-edit" role="main">
                <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                <g:flashMessages />
                <g:hasErrors bean="${this.course}">
                    <ul class="alert alert-danger list-unstyled" role="alert">
                        <g:eachError bean="${this.course}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><i class="bi-exclamation-circle"></i> <g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form resource="${this.course}" controller="${controllerName}" method="PUT">
                    <g:hiddenField name="version" value="${this.course?.version}" />
                    <fieldset class="form">
                        <div class="mb-3">
                          <label for="title" class="form-label">Title </label>
                          <g:textField name="title" class="form-control" />
                          <div class="text-danger small>
                            <g:fieldError bean="${course}" field="title"/>
                          </div>
                        </div>
                        <div class="mb-3">
                          <label for="code" class="form-label">Code </label>
                          <g:textField name="code" class="form-control" />
                          <div class="text-danger small>
                            <g:fieldError bean="${course}" field="code"/>
                          </div>
                        </div>
                        <div class="mb-3">
                          <label for="creditHours" class="form-label">Credit Hours </label>
                          <g:textField name="creditHours" class="form-control" />
                          <div class="text-danger small>
                            <g:fieldError bean="${course}" field="creditHours"/>
                          </div>
                        </div>
                    </fieldset>
                    <fieldset class="bg-body-tertiary">
                        <button class="btn btn-primary" type="submit">
                            <i class="bi-floppy"></i> ${message(code: 'default.button.update.label', default: 'Update')}
                        </button>
                    </fieldset>
                </g:form>
            </div>
        </section>
    </div>
</div>
</body>
</html>
