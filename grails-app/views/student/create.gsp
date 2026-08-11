<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Modern Form Styling */
        .form-section {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 2rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
        }
        
        .form-section:hover {
            box-shadow: 0 0.75rem 2rem rgba(0, 0, 0, 0.12);
        }
        
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 2rem 2.5rem;
            border-radius: 1.25rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: 0 0.5rem 1rem rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            transform: rotate(45deg);
        }
        
        .page-header::after {
            content: '';
            position: absolute;
            bottom: -60%;
            left: -10%;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .page-header h1 {
            position: relative;
            z-index: 1;
            font-weight: 700;
            letter-spacing: -0.5px;
            margin: 0;
        }
        
        .page-header .breadcrumb-nav {
            position: relative;
            z-index: 1;
        }
        
        .page-header .breadcrumb-nav .btn {
            color: rgba(255, 255, 255, 0.9);
            border-color: rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }
        
        .page-header .breadcrumb-nav .btn:hover {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }
        
        .form-label-custom {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
            margin-bottom: 0.4rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-label-custom i {
            color: #667eea;
            font-size: 1rem;
        }
        
        .form-control-custom {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
            font-size: 0.95rem;
            background: #f7fafc;
        }
        
        .form-control-custom:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.15);
            background: #ffffff;
        }
        
        .form-control-custom.is-invalid {
            border-color: #fc8181;
            background: #fff5f5;
        }
        
        .form-control-custom.is-invalid:focus {
            box-shadow: 0 0 0 4px rgba(252, 129, 129, 0.15);
        }
        
        .error-message {
            color: #e53e3e;
            font-size: 0.8rem;
            font-weight: 500;
            margin-top: 0.4rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .error-message i {
            font-size: 0.9rem;
        }
        
        .alert-custom {
            border-radius: 1rem;
            border: none;
            padding: 1.25rem 1.5rem;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.05);
        }
        
        .alert-custom-danger {
            background: #fff5f5;
            border-left: 4px solid #fc8181;
            color: #742a2a;
        }
        
        .alert-custom-danger li {
            padding: 0.25rem 0;
        }
        
        .alert-custom-danger i {
            color: #fc8181;
            margin-right: 0.5rem;
        }
        
        .form-actions {
            background: #f7fafc;
            border-radius: 1rem;
            padding: 1.5rem 2rem;
            margin-top: 1.5rem;
            border: 2px dashed #e2e8f0;
            display: flex;
            gap: 1rem;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        
        .btn-primary-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 0.5rem 1.5rem rgba(102, 126, 234, 0.5);
            color: white;
        }
        
        .btn-primary-custom:active {
            transform: translateY(0);
        }
        
        .btn-outline-custom {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            color: #4a5568;
        }
        
        .btn-outline-custom:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
        }
        
        .required-field::after {
            content: '*';
            color: #e53e3e;
            margin-left: 0.25rem;
            font-weight: 700;
        }
        
        .input-group-custom {
            position: relative;
        }
        
        .input-group-custom .form-control-custom {
            padding-left: 2.8rem;
        }
        
        .input-group-custom .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            z-index: 10;
            font-size: 1rem;
        }
        
        @media (max-width: 768px) {
            .page-header {
                padding: 1.5rem;
            }
            
            .form-section {
                padding: 1.25rem;
            }
            
            .form-actions {
                flex-direction: column;
                align-items: stretch;
            }
            
            .form-actions .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div id="content" role="main">
    <div class="container py-4">
        <!-- Page Header -->
        <div class="page-header">
            <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 breadcrumb-nav">
                <div>
                    <h1 class="display-6">
                        <i class="bi bi-person-plus me-2"></i>
                        <g:message code="default.create.label" args="[entityName]" />
                    </h1>
                    <p class="mb-0 opacity-75 mt-1">
                        <i class="bi bi-info-circle me-1"></i>
                        Fill in the details below to add a new student
                    </p>
                </div>
                <div class="d-flex gap-2">
                    <a href="${createLink(uri: '/')}" class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill">
                        <i class="bi-house me-1"></i> <g:message code="default.home.label"/>
                    </a>
                    <g:link class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill" action="index" aria-label="List">
                        <i class="bi-database me-1"></i> <g:message code="default.list.label" args="[entityName]" />
                    </g:link>
                </div>
            </div>
        </div>
        
        <!-- Main Form Section -->
        <div class="form-section">
            <!-- Flash Messages -->
            <g:flashMessages />
            
            <!-- Error Messages -->
            <g:hasErrors bean="${this.student}">
                <div class="alert alert-custom alert-custom-danger mb-4" role="alert">
                    <div class="d-flex align-items-start">
                        <i class="bi bi-exclamation-triangle-fill fs-4 me-2" style="color: #fc8181;"></i>
                        <div>
                            <strong class="d-block mb-1">Please fix the following errors:</strong>
                            <ul class="list-unstyled mb-0">
                                <g:eachError bean="${this.student}" var="error">
                                    <li>
                                        <i class="bi bi-dot"></i>
                                        <g:message error="${error}"/>
                                    </li>
                                </g:eachError>
                            </ul>
                        </div>
                    </div>
                </div>
            </g:hasErrors>
            
            <!-- Form - FIXED: Removed novalidate and added proper GSP syntax -->
            <g:form 
                resource="${this.student}" 
                controller="${controllerName}" 
                method="POST" 
                class="needs-validation" 
                novalidate="novalidate">
                
                <fieldset>
                    <!-- Name Field -->
                    <div class="mb-4">
                        <label for="name" class="form-label-custom">
                            <i class="bi bi-person"></i>
                            <span class="required-field">Full Name</span>
                        </label>
                        <div class="input-group-custom">
                            <i class="bi bi-person input-icon"></i>
                            <g:textField 
                                name="name" 
                                value="${student?.name}" 
                                class="form-control form-control-custom ${hasErrors(bean: student, field: 'name', 'is-invalid')}" 
                                placeholder="Enter student's full name" />
                        </div>
                        <g:if test="${hasErrors(bean: student, field: 'name')}">
                            <div class="error-message">
                                <i class="bi bi-exclamation-circle"></i>
                                <g:fieldError bean="${student}" field="name" />
                            </div>
                        </g:if>
                        <div class="form-text mt-1">
                            <i class="bi bi-info-circle text-muted"></i> 
                            Enter the full name of the student
                        </div>
                    </div>
                    
                    <!-- Email Field -->
                    <div class="mb-4">
                        <label for="email" class="form-label-custom">
                            <i class="bi bi-envelope"></i>
                            <span class="required-field">Email Address</span>
                        </label>
                        <div class="input-group-custom">
                            <i class="bi bi-envelope input-icon"></i>
                            <g:textField 
                                name="email" 
                                value="${student?.email}" 
                                class="form-control form-control-custom ${hasErrors(bean: student, field: 'email', 'is-invalid')}" 
                                placeholder="Enter email address" />
                        </div>
                        <g:if test="${hasErrors(bean: student, field: 'email')}">
                            <div class="error-message">
                                <i class="bi bi-exclamation-circle"></i>
                                <g:fieldError bean="${student}" field="email" />
                            </div>
                        </g:if>
                        <div class="form-text mt-1">
                            <i class="bi bi-info-circle text-muted"></i> 
                            We'll send verification to this email
                        </div>
                    </div>
                    
                    <!-- Student Number Field -->
                    <div class="mb-4">
                        <label for="studentNumber" class="form-label-custom">
                            <i class="bi bi-person-badge"></i>
                            <span class="required-field">Student Number</span>
                        </label>
                        <div class="input-group-custom">
                            <i class="bi bi-hash input-icon"></i>
                            <g:textField 
                                name="studentNumber" 
                                value="${student?.studentNumber}" 
                                class="form-control form-control-custom ${hasErrors(bean: student, field: 'studentNumber', 'is-invalid')}" 
                                placeholder="Enter student number (e.g., STU-2024-001)" />
                        </div>
                        <g:if test="${hasErrors(bean: student, field: 'studentNumber')}">
                            <div class="error-message">
                                <i class="bi bi-exclamation-circle"></i>
                                <g:fieldError bean="${student}" field="studentNumber" />
                            </div>
                        </g:if>
                        <div class="form-text mt-1">
                            <i class="bi bi-info-circle text-muted"></i> 
                            Must be unique and follow the format: STU-YYYY-XXX
                        </div>
                    </div>
                </fieldset>
                
                <!-- Form Actions -->
                <div class="form-actions">
                    <div class="d-flex align-items-center gap-2">
                        <i class="bi bi-info-circle text-primary" style="font-size: 1.2rem;"></i>
                        <span class="text-muted small">All fields marked with <span class="text-danger">*</span> are required</span>
                    </div>
                    <div class="d-flex gap-2">
                        <g:link action="index" class="btn btn-outline-custom">
                            <i class="bi bi-x-circle me-1"></i> Cancel
                        </g:link>
                        <button class="btn btn-primary-custom" type="submit">
                            <i class="bi bi-check-circle me-2"></i> 
                            ${message(code: 'default.button.create.label', default: 'Create Student')}
                        </button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

<!-- Bootstrap JS for validation -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
</body>
</html>