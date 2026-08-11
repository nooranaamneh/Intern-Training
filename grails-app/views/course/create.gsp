<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Course Form Specific Styles */
        .course-hero {
            background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            border-radius: 1.5rem;
            padding: 2rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(72, 187, 120, 0.25);
        }
        
        .course-hero::before {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 350px;
            height: 350px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }
        
        .course-hero::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -5%;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .course-hero .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .course-hero h1 {
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.25rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .course-hero p {
            opacity: 0.9;
            margin: 0;
            font-size: 1rem;
        }
        
        .course-hero .breadcrumb-custom {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            font-size: 0.85rem;
            opacity: 0.8;
            margin-top: 0.5rem;
        }
        
        .course-hero .breadcrumb-custom a {
            color: white;
            text-decoration: none;
        }
        
        .course-hero .breadcrumb-custom a:hover {
            text-decoration: underline;
        }
        
        /* Form Card */
        .form-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 2rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-card:hover {
            box-shadow: 0 0.75rem 2rem rgba(0, 0, 0, 0.12);
        }
        
        .form-card .form-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .form-card .form-header .form-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            flex-shrink: 0;
        }
        
        .form-card .form-header h3 {
            font-weight: 700;
            color: #2d3748;
            margin: 0;
        }
        
        .form-card .form-header .subtitle {
            color: #718096;
            font-size: 0.85rem;
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
            color: #48bb78;
            font-size: 1rem;
        }
        
        .form-label-custom .required {
            color: #e53e3e;
            font-weight: 700;
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
            border-color: #48bb78;
            box-shadow: 0 0 0 4px rgba(72, 187, 120, 0.15);
            background: #ffffff;
        }
        
        .form-control-custom.is-invalid {
            border-color: #fc8181;
            background: #fff5f5;
        }
        
        .form-control-custom.is-invalid:focus {
            box-shadow: 0 0 0 4px rgba(252, 129, 129, 0.15);
        }
        
        .form-text-custom {
            font-size: 0.8rem;
            color: #718096;
            margin-top: 0.3rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .form-text-custom i {
            font-size: 0.9rem;
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
        
        /* Form Actions */
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
        
        .btn-save {
            background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(72, 187, 120, 0.4);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-save:hover {
            transform: translateY(-3px);
            box-shadow: 0 0.5rem 1.5rem rgba(72, 187, 120, 0.5);
            color: white;
        }
        
        .btn-save:active {
            transform: translateY(0);
        }
        
        .btn-cancel {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            color: #4a5568;
            background: transparent;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-cancel:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            text-decoration: none;
            color: #4a5568;
        }
        
        .input-group-custom {
            position: relative;
        }
        
        .input-group-custom .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            z-index: 10;
            transition: color 0.3s ease;
        }
        
        .input-group-custom .form-control-custom {
            padding-left: 2.8rem;
        }
        
        .input-group-custom .form-control-custom:focus ~ .input-icon,
        .input-group-custom .form-control-custom:focus + .input-icon {
            color: #48bb78;
        }
        
        /* Stats Bar */
        .stats-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .stats-bar .stat-card {
            background: white;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .stats-bar .stat-card:hover {
            border-color: #48bb78;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        
        .stats-bar .stat-card .stat-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2d3748;
            display: block;
        }
        
        .stats-bar .stat-card .stat-label {
            font-size: 0.75rem;
            color: #718096;
            font-weight: 500;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .course-hero {
                padding: 1.5rem;
                text-align: center;
            }
            
            .course-hero h1 {
                font-size: 1.5rem;
                justify-content: center;
            }
            
            .course-hero .breadcrumb-custom {
                justify-content: center;
            }
            
            .form-card {
                padding: 1.25rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .form-actions .btn {
                width: 100%;
                justify-content: center;
            }
            
            .stats-bar {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
</head>
<body>
<div id="content" role="main">
    <div class="container py-4">
        <!-- Hero Section -->
        <div class="course-hero">
            <div class="hero-content">
                <h1>
                    <i class="bi bi-book-plus"></i>
                    <g:message code="default.create.label" args="[entityName]" />
                </h1>
                <p>Add a new course to the university curriculum</p>
                <div class="breadcrumb-custom">
                    <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
                    <span>/</span>
                    <a href="${createLink(controller: 'course', action: 'index')}">Courses</a>
                    <span>/</span>
                    <span>Create</span>
                </div>
            </div>
        </div>

        <!-- Stats Bar -->
        <div class="stats-bar">
            <div class="stat-card">
                <span class="stat-number">${university.Course.count()}</span>
                <span class="stat-label">Total Courses</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">${university.Student.count()}</span>
                <span class="stat-label">Total Students</span>
            </div>
            <div class="stat-card">
                <span class="stat-number">${university.Enrollment.count()}</span>
                <span class="stat-label">Total Enrollments</span>
            </div>
        </div>

        <!-- Form Card -->
        <div class="form-card">
            <div class="form-header">
                <div class="form-icon">
                    <i class="bi bi-book"></i>
                </div>
                <div>
                    <h3>Course Details</h3>
                    <div class="subtitle">Fill in the information below to create a new course</div>
                </div>
            </div>

            <!-- Flash Messages -->
            <g:flashMessages />
            
            <!-- Error Messages -->
            <g:hasErrors bean="${this.course}">
                <div class="alert alert-custom alert-custom-danger mb-4" role="alert">
                    <div class="d-flex align-items-start">
                        <i class="bi bi-exclamation-triangle-fill fs-4 me-2" style="color: #fc8181;"></i>
                        <div>
                            <strong class="d-block mb-1">Please fix the following errors:</strong>
                            <ul class="list-unstyled mb-0">
                                <g:eachError bean="${this.course}" var="error">
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

            <!-- Form -->
            <g:form resource="${this.course}" controller="${controllerName}" method="POST" class="needs-validation" novalidate="novalidate">
                <fieldset>
                    <!-- Title Field -->
                    <div class="mb-4">
                        <label for="title" class="form-label-custom">
                            <i class="bi bi-book"></i>
                            Course Title <span class="required">*</span>
                        </label>
                        <div class="input-group-custom">
                            <i class="bi bi-book input-icon"></i>
                            <g:textField 
                                name="title" 
                                value="${course?.title}" 
                                class="form-control form-control-custom ${hasErrors(bean: course, field: 'title', 'is-invalid')}" 
                                placeholder="Enter course title (e.g., Introduction to Programming)"
                                required="required"
                            />
                        </div>
                        <g:if test="${hasErrors(bean: course, field: 'title')}">
                            <div class="error-message">
                                <i class="bi bi-exclamation-circle"></i>
                                <g:fieldError bean="${course}" field="title" />
                            </div>
                        </g:if>
                        <div class="form-text-custom">
                            <i class="bi bi-info-circle"></i>
                            Enter the full name of the course
                        </div>
                    </div>

                    <!-- Code Field -->
                    <div class="mb-4">
                        <label for="code" class="form-label-custom">
                            <i class="bi bi-hash"></i>
                            Course Code <span class="required">*</span>
                        </label>
                        <div class="input-group-custom">
                            <i class="bi bi-hash input-icon"></i>
                            <g:textField 
                                name="code" 
                                value="${course?.code}" 
                                class="form-control form-control-custom ${hasErrors(bean: course, field: 'code', 'is-invalid')}" 
                                placeholder="Enter course code (e.g., CS101)"
                                required="required"
                            />
                        </div>
                        <g:if test="${hasErrors(bean: course, field: 'code')}">
                            <div class="error-message">
                                <i class="bi bi-exclamation-circle"></i>
                                <g:fieldError bean="${course}" field="code" />
                            </div>
                        </g:if>
                        <div class="form-text-custom">
                            <i class="bi bi-info-circle"></i>
                            Must be unique (e.g., CS101, MATH201, ENG101)
                        </div>
                    </div>

                    <!-- Credit Hours Field -->
                    <div class="mb-4">
                        <label for="creditHours" class="form-label-custom">
                            <i class="bi bi-clock"></i>
                            Credit Hours <span class="required">*</span>
                        </label>
                        <div class="input-group-custom">
                            <i class="bi bi-clock input-icon"></i>
                            <g:textField 
                                name="creditHours" 
                                value="${course?.creditHours}" 
                                class="form-control form-control-custom ${hasErrors(bean: course, field: 'creditHours', 'is-invalid')}" 
                                placeholder="Enter number of credit hours"
                                type="number"
                                min="1"
                                max="6"
                                required="required"
                            />
                        </div>
                        <g:if test="${hasErrors(bean: course, field: 'creditHours')}">
                            <div class="error-message">
                                <i class="bi bi-exclamation-circle"></i>
                                <g:fieldError bean="${course}" field="creditHours" />
                            </div>
                        </g:if>
                        <div class="form-text-custom">
                            <i class="bi bi-info-circle"></i>
                            Enter a number between 1 and 6 credit hours
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
                        <g:link action="index" class="btn-cancel">
                            <i class="bi bi-x-circle me-1"></i> Cancel
                        </g:link>
                        <button class="btn-save" type="submit">
                            <i class="bi bi-check-circle me-2"></i> 
                            <g:message code="default.button.create.label" default="Create Course" />
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