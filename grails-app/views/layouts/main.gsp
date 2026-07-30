<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title><g:layoutTitle default="Grails"/></title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <g:layoutHead/>
</head>

<body>

<header class="bg-primary text-white py-3">
    <div class="container-lg">
        <h1 class="h3 mb-0">University Management System</h1>
    </div>
</header>

<nav class="navbar navbar-expand-lg bg-body border-bottom shadow-sm">
    <div class="container-lg">
        <a class="navbar-brand d-flex align-items-center" href="${request.contextPath}/">
            <asset:image class="w-75" src="grails.svg" alt="Grails Logo"/>
        </a>
    </div>
</nav>

<div class="bg-body-tertiary">
    <div class="container-lg py-4">
        <g:flashMessages />
        <nav class="navbar navbar-expand bg-light px-3">
        <ul class="navbar-nav gap-3">
            <li class="nav-item"><g:link class="fw-semibold text-primary" controller="home">Home</g:link></li>
            <li class="nav-item"><g:link class="fw-semibold text-primary" controller="hello">Hello</g:link></li>
            <li class="nav-item"><g:link class="fw-semibold text-primary" controller="student">student</g:link></li>
            <li class="nav-item"><g:link class="fw-semibold text-primary" controller="course">Course</g:link></li>
            <li class="nav-item"><g:link class="fw-semibold text-primary" controller="enrollment">Enrollment</g:link></li>
            <li class="nav-item"><g:link class="fw-semibold text-primary" controller="dashboard">Dashboard</g:link></li>
        </ul>
    </nav>
    <br>
        <g:layoutBody/>
    </div>
</div>

<footer class="border-top py-5" role="contentinfo">
    <div class="container-lg">
        <div class="row g-4">
            <div class="col-12 col-md-4">
                <a class="card h-100 text-decoration-none shadow-sm border-1"
                   href="https://guides.grails.org" target="_blank" rel="noopener">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="card-title mb-0 fw-semibold">Grails Guides</h6>
                            <asset:image src="advancedgrails.svg" alt="Grails Guides" width="34" height="34"/>
                        </div>
                        <p class="card-text text-body-secondary mb-0">
                            Building your first Grails app? Looking to add security, or create a Single-Page-App?
                            Check out the Grails Guides for step-by-step tutorials.
                        </p>
                    </div>
                </a>
            </div>
            <div class="col-12 col-md-4">
                <a class="card h-100 text-decoration-none shadow-sm border-1"
                   href="https://grails.apache.org/docs/" target="_blank" rel="noopener">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="card-title mb-0 fw-semibold">Documentation</h6>
                            <asset:image src="documentation.svg" alt="Grails Documentation" width="34" height="34"/>
                        </div>
                        <p class="card-text text-body-secondary mb-0">
                            Ready to dig in? You can find in-depth documentation for all the features
                            of Grails in the User Guide.
                        </p>
                    </div>
                </a>
            </div>
            <div class="col-12 col-md-4">
                <a class="card h-100 text-decoration-none shadow-sm border-1"
                   href="https://grails.apache.org/community.html" target="_blank" rel="noopener">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="card-title mb-0 fw-semibold">Join the Community</h6>
                            <asset:image src="community.svg" alt="Grails Community" width="34" height="34"/>
                        </div>
                        <p class="card-text text-body-secondary mb-0">
                            Get feedback and share your experience with other Grails developers
                            on the Grails mailing lists, GitHub discussions, or the community Slack channel.
                        </p>
                    </div>
                </a>
            </div>
        </div>
        <br>
        <div>
        <p class="text-body-secondary mb-0">University Management System — UBS Intern Training 2026</p>
        </div>
    </div>
</footer>
<div id="spinner" class="position-absolute top-0 end-0 p-1" style="display:none;">
    <div class="spinner-border spinner-border-sm" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>
</html>
