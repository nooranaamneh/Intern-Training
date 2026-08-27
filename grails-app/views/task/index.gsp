<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard - Task Manager</title>
</head>
<body>

<div class="mb-4">
    <h1 class="fw-bold">Task Manager Dashboard</h1>
</div>

<div class="row g-3 mb-4">

    <div class="col-12 col-md-4">
        <div class="card shadow-sm border-0" style="background-color:#eef3ff;">
            <div class="card-body">
                <h6 class="text-uppercase text-body-secondary small mb-2">Total Tasks</h6>
                <p class="display-5 fw-bold mb-0" style="color:#3b5bdb;">${totalTasks}</p>
            </div>
        </div>
    </div>

    <div class="col-12 col-md-4">
        <div class="card shadow-sm border-0" style="background-color:#eafaf0;">
            <div class="card-body">
                <h6 class="text-uppercase text-body-secondary small mb-2">Completed</h6>
                <p class="display-5 fw-bold mb-0" style="color:#2f9e44;">${doneTasks}</p>
            </div>
        </div>
    </div>

    <div class="col-12 col-md-4">
        <div class="card shadow-sm border-0" style="background-color:${overdueTasks > 0 ? '#fff0f0' : '#f5f5f5'};">
            <div class="card-body">
                <h6 class="text-uppercase text-body-secondary small mb-2">Overdue</h6>
                <p class="display-5 fw-bold mb-0" style="color:${overdueTasks > 0 ? '#e03131' : '#868e96'};">${overdueTasks}</p>
            </div>
        </div>
    </div>

</div>

<div class="card shadow-sm border-0 mb-4">
    <div class="card-body">
        <h5 class="card-title mb-3">Tasks by Status</h5>
        <div class="row g-2">
            <g:each in="${statusCounts}" var="entry">
                <div class="col-12 col-sm-4">
                    <div class="d-flex justify-content-between align-items-center p-2 border rounded">
                        <span class="text-body-secondary">${entry.key}</span>
                        <span class="badge bg-secondary rounded-pill">${entry.value}</span>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</div>

<g:link controller="task" action="list" class="btn btn-primary">View All Tasks</g:link>
<g:link controller="task" action="create" class="btn btn-outline-secondary">+ New Task</g:link>

</body>
</html>