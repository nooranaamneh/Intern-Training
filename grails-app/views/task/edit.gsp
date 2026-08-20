<%@ page import="taskmanager.Task" %>
<%@ page import="taskmanager.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Task</title>
</head>
<body>

<div class="mb-4">
    <h1 class="fw-bold">Edit Task</h1>
    <p class="text-body-secondary">Update the task details below</p>
</div>

<g:hasErrors bean="${task}">
    <div class="alert alert-danger">
        <ul class="mb-0">
            <g:eachError bean="${task}" var="error">
                <li><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<div class="card shadow-sm border-0">
    <div class="card-body p-4">

        <g:form controller="task" action="update" method="PUT">
            <g:hiddenField name="id" value="${task?.id}"/>

            <div class="mb-3">
                <label for="title" class="form-label fw-semibold">Title</label>
                <g:textField name="title" value="${task?.title}" class="form-control"/>
                <div class="text-danger small"><g:fieldError bean="${task}" field="title"/></div>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label fw-semibold">Description</label>
                <g:textArea name="description" value="${task?.description}" class="form-control" rows="3"/>
                <div class="text-danger small"><g:fieldError bean="${task}" field="description"/></div>
            </div>

            <div class="mb-3">
                <label for="deadline" class="form-label fw-semibold">Deadline</label>
                <g:datePicker name="deadline" value="${task?.deadline}" precision="day" class="form-select d-inline-block w-auto"/>
                <div class="text-danger small"><g:fieldError bean="${task}" field="deadline"/></div>
            </div>

            <div class="mb-3">
                <label for="status" class="form-label fw-semibold">Status</label>
                <g:select name="status" from="${Task.TaskStatus.values()}" value="${task?.status}" class="form-select"/>
                <div class="text-danger small"><g:fieldError bean="${task}" field="status"/></div>
            </div>

            <div class="mb-4">
                <label for="assignedUser" class="form-label fw-semibold">Assigned User</label>
                <g:select name="assignedUser.id" from="${User.list()}" optionKey="id" optionValue="username" value="${task?.assignedUser?.id}" class="form-select"/>
                <div class="text-danger small"><g:fieldError bean="${task}" field="assignedUser"/></div>
            </div>

            <button type="submit" class="btn btn-primary px-4">Update Task</button>
            <g:link controller="task" action="show" id="${task?.id}" class="btn btn-outline-secondary">Cancel</g:link>

        </g:form>

    </div>
</div>

</body>
</html>