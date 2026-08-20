<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title><g:layoutTitle default="Task Manager"/></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow-sm" style="background-color:#3b5bdb;">
    <div class="container-lg">
        <a class="navbar-brand fw-bold d-flex align-items-center gap-2" href="${request.contextPath}/task/index">
            <i class="bi bi-check2-square"></i> Task Manager
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav gap-2">
                <li class="nav-item">
                    <a class="nav-link" href="${request.contextPath}/task/index">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${request.contextPath}/task/list">All Tasks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="${request.contextPath}/task/create">+ New Task</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="bg-body-tertiary">
    <div class="container-lg py-4">
        <g:flashMessages />
        <g:layoutBody/>
    </div>
</div>

<div id="spinner" class="position-absolute top-0 end-0 p-1" style="display:none;">
    <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>
</html>