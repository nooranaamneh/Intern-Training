<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Task Details</title>
</head>
<body>
<div class="mb-4">
    <g:link controller="task" action="list" class="text-decoration-none text-body-secondary small">&larr; Back to list</g:link>
    <div class="d-flex justify-content-between align-items-center mt-2">
        <h1 class="fw-bold mb-0">${task?.title}</h1>
        <span class="badge bg-secondary fs-6">${task?.status}</span>
    </div>
</div>
<div class="card shadow-sm border-0 mb-3">
    <div class="card-body p-4">
        <div class="row mb-3">
            <div class="col-12 col-md-6">
                <h6 class="text-uppercase text-body-secondary small mb-1">Deadline</h6>
                <p class="mb-0"><g:formatDate date="${task?.deadline}" format="yyyy-MM-dd"/></p>
            </div>
            <div class="col-12 col-md-6">
                <h6 class="text-uppercase text-body-secondary small mb-1">Assigned User</h6>
                <p class="mb-0">${task?.assignedUser?.username ?: 'Unassigned'}</p>
            </div>
        </div>
        <div>
            <h6 class="text-uppercase text-body-secondary small mb-1">Description</h6>
            <p class="mb-0">${task?.description ?: '-'}</p>
        </div>
    </div>
</div>
<div class="d-flex gap-2">
    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <g:link controller="task" action="edit" id="${task?.id}" class="btn btn-primary">Edit</g:link>
    </sec:ifAnyGranted>
    <g:if test="${task?.assignedUser?.id == currentUserId}">
        <sec:ifNotGranted roles="ROLE_ADMIN">
            <g:link controller="task" action="edit" id="${task?.id}" class="btn btn-primary">Edit</g:link>
        </sec:ifNotGranted>
    </g:if>

    <sec:ifAnyGranted roles="ROLE_ADMIN">
        <g:form controller="task" action="delete" method="DELETE" style="display:inline">
            <g:hiddenField name="id" value="${task?.id}"/>
            <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Are you sure?')">Delete</button>
        </g:form>
    </sec:ifAnyGranted>
</div>
</body>
</html>