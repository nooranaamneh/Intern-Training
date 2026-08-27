<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Tasks List</title>
</head>
<body>

<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Tasks</h1>
    </div>
    <g:link controller="task" action="create" class="btn btn-primary">+ New Task</g:link>
</div>

<div class="card shadow-sm border-0 mb-3">
    <div class="card-body">
        <g:form controller="task" action="list" method="GET" class="d-flex align-items-center gap-2">
            <label class="form-label fw-semibold mb-0">Filter by status:</label>
            <select name="status" class="form-select w-auto">
                <option value="">All</option>
                <g:each in="${['TO_DO', 'IN_PROGRESS', 'DONE']}" var="s">
                    <option value="${s}" ${currentStatus == s ? 'selected' : ''}>${s}</option>
                </g:each>
            </select>
            <button type="submit" class="btn btn-outline-primary">Filter</button>
        </g:form>
    </div>
</div>

<div class="card shadow-sm border-0">
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0">
            <thead class="table-light">
                <tr>
                    <th>Title</th>
                    <th>Deadline</th>
                    <th>Status</th>
                    <th>Assigned User</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${taskList}" var="task">
                    <tr>
                        <td>${task.title}</td>
                        <td><g:formatDate date="${task.deadline}" format="yyyy-MM-dd"/></td>
                        <td>
                            <span class="badge bg-secondary">${task.status}</span>
                        </td>
                        <td>${task.assignedUser?.username ?: '-'}</td>
                        <td class="text-end">
                            <g:link controller="task" action="show" id="${task.id}" class="btn btn-sm btn-outline-secondary">View</g:link>
                               <sec:ifAnyGranted roles="ROLE_ADMIN">
                                 <g:link controller="task" action="edit" id="${task.id}" class="btn btn-sm btn-outline-primary">Edit</g:link>
                               </sec:ifAnyGranted>
                            <g:if test="${task.assignedUser?.id == currentUserId}">
                               <sec:ifNotGranted roles="ROLE_ADMIN">
                                  <g:link controller="task" action="edit" id="${task.id}" class="btn btn-sm btn-outline-primary">Edit</g:link>
                               </sec:ifNotGranted>
                            </g:if>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>

<div class="mt-3">
    <g:paginate total="${taskCount ?: 0}"/>
</div>

</body>
</html>