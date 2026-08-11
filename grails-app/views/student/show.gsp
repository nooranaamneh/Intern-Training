<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Modern Show Page Styling */
        .page-header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            padding: 2rem 2.5rem;
            border-radius: 1.25rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: 0 0.5rem 1rem rgba(79, 172, 254, 0.3);
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
        
        .profile-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 2rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
        }
        
        .profile-card:hover {
            box-shadow: 0 0.75rem 2rem rgba(0, 0, 0, 0.12);
        }
        
        .profile-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 700;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(79, 172, 254, 0.3);
            flex-shrink: 0;
        }
        
        .profile-info {
            flex: 1;
        }
        
        .profile-info .detail-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.75rem 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .profile-info .detail-item:last-child {
            border-bottom: none;
        }
        
        .profile-info .detail-item .label {
            font-weight: 600;
            color: #4a5568;
            min-width: 140px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .profile-info .detail-item .label i {
            color: #4facfe;
            width: 20px;
        }
        
        .profile-info .detail-item .value {
            color: #2d3748;
            font-weight: 500;
        }
        
        .action-buttons {
            background: #f7fafc;
            border-radius: 1rem;
            padding: 1.25rem 1.5rem;
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            margin-top: 1.5rem;
        }
        
        .btn-edit-custom {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            border: none;
            padding: 0.6rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(79, 172, 254, 0.3);
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-edit-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1rem rgba(79, 172, 254, 0.4);
            color: white;
            text-decoration: none;
        }
        
        .btn-delete-custom {
            background: #fff5f5;
            border: 2px solid #fc8181;
            padding: 0.6rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: #e53e3e;
            cursor: pointer;
        }
        
        .btn-delete-custom:hover {
            background: #fed7d7;
            border-color: #fc8181;
            transform: translateY(-2px);
        }
        
        .section-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: #2d3748;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
        }
        
        .section-title i {
            color: #4facfe;
            font-size: 1.5rem;
        }
        
        .course-card {
            background: #ffffff;
            border-radius: 0.75rem;
            padding: 1.25rem 1.5rem;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .course-card:hover {
            border-color: #4facfe;
            box-shadow: 0 0.25rem 0.75rem rgba(79, 172, 254, 0.1);
            transform: translateX(5px);
        }
        
        .course-card .course-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .course-card .course-badge {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 50rem;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .course-card .course-title {
            font-weight: 600;
            color: #2d3748;
        }
        
        .course-card .course-code {
            color: #718096;
            font-size: 0.85rem;
        }
        
        .course-actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .btn-grade {
            background: #ebf8ff;
            border: 1px solid #bee3f8;
            border-radius: 0.5rem;
            padding: 0.35rem 1rem;
            font-size: 0.8rem;
            font-weight: 500;
            color: #2b6cb0;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-grade:hover {
            background: #bee3f8;
            transform: translateY(-2px);
            text-decoration: none;
            color: #2b6cb0;
        }
        
        .btn-unenroll {
            background: #fff5f5;
            border: 1px solid #fed7d7;
            border-radius: 0.5rem;
            padding: 0.35rem 1rem;
            font-size: 0.8rem;
            font-weight: 500;
            color: #e53e3e;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-unenroll:hover {
            background: #fed7d7;
            transform: translateY(-2px);
            text-decoration: none;
            color: #e53e3e;
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            background: #f7fafc;
            border-radius: 1rem;
            border: 2px dashed #e2e8f0;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #cbd5e0;
            margin-bottom: 1rem;
        }
        
        .empty-state p {
            color: #718096;
            margin: 0;
        }
        
        .btn-gpa {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(245, 87, 108, 0.3);
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-gpa:hover {
            transform: translateY(-3px);
            box-shadow: 0 0.5rem 1.5rem rgba(245, 87, 108, 0.4);
            color: white;
            text-decoration: none;
        }
        
        .btn-outline-custom {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            color: #4a5568;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-outline-custom:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            text-decoration: none;
            color: #4a5568;
        }
        
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.35rem 0.9rem;
            border-radius: 50rem;
            font-size: 0.75rem;
            font-weight: 600;
            background: #c6f6d5;
            color: #22543d;
        }
        
        .status-badge .dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #48bb78;
            display: inline-block;
            animation: pulse-dot 2s infinite;
        }
        
        @keyframes pulse-dot {
            0% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.5; transform: scale(0.8); }
            100% { opacity: 1; transform: scale(1); }
        }
        
        @media (max-width: 768px) {
            .page-header {
                padding: 1.5rem;
            }
            
            .profile-card {
                padding: 1.25rem;
            }
            
            .profile-avatar {
                width: 60px;
                height: 60px;
                font-size: 24px;
            }
            
            .profile-info .detail-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.25rem;
            }
            
            .profile-info .detail-item .label {
                min-width: auto;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: stretch;
            }
            
            .course-card {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .course-actions {
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
                    <div class="d-flex align-items-center gap-3 flex-wrap">
                        <h1 class="display-6">
                            <i class="bi bi-person-circle me-2"></i>
                            <g:message code="default.show.label" args="[entityName]" />
                        </h1>
                        <span class="status-badge">
                            <span class="dot"></span>
                            Active Record
                        </span>
                    </div>
                    <p class="mb-0 opacity-75 mt-1">
                        <i class="bi bi-info-circle me-1"></i>
                        View complete student information and enrolled courses
                    </p>
                </div>
                <div class="d-flex gap-2">
                    <a href="${createLink(uri: '/')}" class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill">
                        <i class="bi-house me-1"></i> <g:message code="default.home.label"/>
                    </a>
                    <g:link class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill" action="index" aria-label="List">
                        <i class="bi-database me-1"></i> <g:message code="default.list.label" args="[entityName]" />
                    </g:link>
                    <g:link class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill" action="create" aria-label="Create">
                        <i class="bi-plus-circle me-1"></i> <g:message code="default.new.label" args="[entityName]" />
                    </g:link>
                </div>
            </div>
        </div>
        
        <!-- Student Profile Section -->
        <div class="profile-card mb-4">
            <div class="d-flex flex-wrap align-items-start gap-4">
                <!-- Avatar -->
                <div class="profile-avatar">
                    ${student?.name?.charAt(0)?.toUpperCase() ?: 'S'}
                </div>
                
                <!-- Profile Information -->
                <div class="profile-info">
                    <div class="detail-item">
                        <div class="label">
                            <i class="bi bi-person"></i> Full Name
                        </div>
                        <div class="value">${student?.name}</div>
                    </div>
                    <div class="detail-item">
                        <div class="label">
                            <i class="bi bi-envelope"></i> Email
                        </div>
                        <div class="value">
                            <a href="mailto:${student?.email}" class="text-decoration-none">${student?.email}</a>
                        </div>
                    </div>
                    <div class="detail-item">
                        <div class="label">
                            <i class="bi bi-person-badge"></i> Student Number
                        </div>
                        <div class="value">
                            <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 rounded-pill">
                                ${student?.studentNumber}
                            </span>
                        </div>
                    </div>
                    <!-- REMOVED: dateCreated field that was causing the error -->
                </div>
            </div>
            
            <!-- Action Buttons -->
            <div class="action-buttons">
                <div class="d-flex align-items-center gap-2">
                    <i class="bi bi-info-circle text-muted"></i>
                    <span class="text-muted small">Manage this student record</span>
                </div>
                <div class="d-flex gap-2">
                    <g:link class="btn-edit-custom" action="edit" resource="${this.student}" controller="${controllerName}">
                        <i class="bi bi-pencil-square me-1"></i> <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <g:form resource="${this.student}" controller="${controllerName}" method="DELETE" class="d-inline">
                        <button class="btn-delete-custom" type="submit" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this student?')}');">
                            <i class="bi bi-trash me-1"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}
                        </button>
                    </g:form>
                    </sec:ifAnyGranted>
                </div>
            </div>
        </div>
        
        <!-- Enrolled Courses Section -->
        <div class="profile-card mb-4">
            <div class="section-title">
                <i class="bi bi-book"></i>
                Enrolled Courses
                <span class="badge bg-primary bg-opacity-10 text-primary ms-2">
                    ${student?.enrollments?.size() ?: 0} Course(s)
                </span>
            </div>
            
            <g:if test="${student?.enrollments}">
                <div class="d-flex flex-column gap-3">
                    <g:each in="${student.enrollments}" var="enrollment">
                        <div class="course-card">
                            <div class="course-info">
                                <span class="course-badge">Course</span>
                                <div>
                                    <div class="course-title">${enrollment.course.title}</div>
                                    <div class="course-code">${enrollment.course.code}</div>
                                </div>
                            </div>
                            <div class="course-actions">
                                <g:link controller="enrollment" action="editGrade" id="${enrollment.id}" class="btn-grade">
                                    <i class="bi bi-pencil me-1"></i> Update Grade
                                </g:link>
                                <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <g:link controller="enrollment" action="delete" id="${enrollment.id}" class="btn-unenroll"
                                    onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to unenroll from this course?')}')">
                                    <i class="bi bi-x-circle me-1"></i> Unenroll
                                </g:link>
                                </sec:ifAnyGranted>
                            </div>
                        </div>
                    </g:each>
                </div>
            </g:if>
            <g:else>
                <div class="empty-state">
                    <i class="bi bi-book"></i>
                    <p class="fw-semibold mb-1">No courses enrolled yet</p>
                    <p class="small">This student hasn't enrolled in any courses</p>
                </div>
            </g:else>
        </div>
        
        <!-- GPA & Additional Actions -->
        <div class="d-flex flex-wrap gap-3">
            <g:link controller="enrollment" action="calcgpa" params="[studentId: student.id]" class="btn-gpa">
                <i class="bi bi-graph-up-arrow me-2"></i> View GPA
            </g:link>
            <g:link controller="enrollment" action="create" params="[studentId: student.id]" class="btn-outline-custom">
                <i class="bi bi-plus-circle me-1"></i> Enroll in New Course
            </g:link>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>