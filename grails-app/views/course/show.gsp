<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Course Show Specific Styles */
        .course-hero {
            background: linear-gradient(135deg, #805ad5 0%, #6b46c1 100%);
            border-radius: 1.5rem;
            padding: 2rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(128, 90, 213, 0.25);
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
        
        .course-hero .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.35rem 0.9rem;
            border-radius: 50rem;
            font-size: 0.75rem;
            font-weight: 600;
            background: rgba(255, 255, 255, 0.15);
            color: white;
            backdrop-filter: blur(10px);
        }
        
        .course-hero .status-badge .dot {
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
        
        /* Course Info Card */
        .info-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 2rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
        }
        
        .info-card:hover {
            box-shadow: 0 0.75rem 2rem rgba(0, 0, 0, 0.12);
        }
        
        .info-card .card-header-custom {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .info-card .card-header-custom .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: linear-gradient(135deg, #805ad5 0%, #6b46c1 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            flex-shrink: 0;
        }
        
        .info-card .card-header-custom h3 {
            font-weight: 700;
            color: #2d3748;
            margin: 0;
        }
        
        .info-card .card-header-custom .subtitle {
            color: #718096;
            font-size: 0.85rem;
        }
        
        .info-card .detail-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.25rem;
        }
        
        .info-card .detail-item {
            padding: 1rem;
            background: #f7fafc;
            border-radius: 0.75rem;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
        }
        
        .info-card .detail-item:hover {
            border-color: #805ad5;
            background: #faf5ff;
        }
        
        .info-card .detail-item .detail-label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #718096;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 0.25rem;
        }
        
        .info-card .detail-item .detail-label i {
            color: #805ad5;
        }
        
        .info-card .detail-item .detail-value {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2d3748;
        }
        
        .info-card .detail-item .detail-value .code-badge {
            display: inline-block;
            padding: 0.2rem 0.75rem;
            border-radius: 50rem;
            background: #ebf8ff;
            color: #2b6cb0;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .info-card .detail-item .detail-value .credit-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            padding: 0.2rem 0.75rem;
            border-radius: 50rem;
            background: #f0fff4;
            color: #22543d;
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 2px solid #f0f0f0;
            flex-wrap: wrap;
        }
        
        .btn-edit {
            background: linear-gradient(135deg, #805ad5 0%, #6b46c1 100%);
            border: none;
            padding: 0.6rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(128, 90, 213, 0.3);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1.5rem rgba(128, 90, 213, 0.4);
            color: white;
        }
        
        .btn-delete {
            background: #fff5f5;
            border: 2px solid #fc8181;
            padding: 0.6rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: #e53e3e;
            cursor: pointer;
        }
        
        .btn-delete:hover {
            background: #fed7d7;
            border-color: #fc8181;
            transform: translateY(-2px);
        }
        
        .btn-back {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.6rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            color: #4a5568;
            background: transparent;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-back:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            color: #4a5568;
        }
        
        /* Enrolled Students Section */
        .students-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 1.5rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            margin-top: 1.5rem;
        }
        
        .students-card .section-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.25rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .students-card .section-header h4 {
            font-weight: 700;
            color: #2d3748;
            margin: 0;
        }
        
        .students-card .section-header i {
            color: #805ad5;
            font-size: 1.3rem;
        }
        
        .students-card .section-header .count-badge {
            background: #ebf8ff;
            color: #2b6cb0;
            padding: 0.15rem 0.75rem;
            border-radius: 50rem;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .student-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .student-list li {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.6rem 0.75rem;
            border-bottom: 1px solid #f0f0f0;
            transition: all 0.2s ease;
            border-radius: 0.5rem;
        }
        
        .student-list li:hover {
            background: #f7fafc;
        }
        
        .student-list li:last-child {
            border-bottom: none;
        }
        
        .student-list li .student-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: linear-gradient(135deg, #805ad5 0%, #6b46c1 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.75rem;
            flex-shrink: 0;
        }
        
        .student-list li .student-info {
            flex: 1;
        }
        
        .student-list li .student-info .student-name {
            font-weight: 500;
            color: #2d3748;
        }
        
        .student-list li .student-info .student-number {
            font-size: 0.8rem;
            color: #718096;
        }
        
        .student-list li .student-status {
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.15rem 0.6rem;
            border-radius: 50rem;
            background: #c6f6d5;
            color: #22543d;
        }
        
        .student-list li .student-status i {
            font-size: 0.6rem;
            margin-right: 0.2rem;
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem 1.5rem;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #cbd5e0;
            margin-bottom: 0.5rem;
        }
        
        .empty-state p {
            color: #718096;
            margin: 0;
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
            
            .info-card .detail-grid {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .action-buttons .btn {
                width: 100%;
                justify-content: center;
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
                <div class="d-flex flex-wrap align-items-center gap-3">
                    <h1>
                        <i class="bi bi-book"></i>
                        <g:message code="default.show.label" args="[entityName]" />
                    </h1>
                    <span class="status-badge">
                        <span class="dot"></span>
                        Active Course
                    </span>
                </div>
                <p>View detailed course information</p>
                <div class="breadcrumb-custom">
                    <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
                    <span>/</span>
                    <a href="${createLink(controller: 'course', action: 'index')}">Courses</a>
                    <span>/</span>
                    <span>${course.title}</span>
                </div>
            </div>
        </div>

        <!-- Course Information Card -->
        <div class="info-card">
            <div class="card-header-custom">
                <div class="card-icon">
                    <i class="bi bi-book"></i>
                </div>
                <div>
                    <h3>Course Details</h3>
                    <div class="subtitle">Complete information about this course</div>
                </div>
            </div>

            <div class="detail-grid">
                <div class="detail-item">
                    <div class="detail-label">
                        <i class="bi bi-book"></i>
                        Title
                    </div>
                    <div class="detail-value">${course.title}</div>
                </div>
                
                <div class="detail-item">
                    <div class="detail-label">
                        <i class="bi bi-hash"></i>
                        Code
                    </div>
                    <div class="detail-value">
                        <span class="code-badge">${course.code}</span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <div class="detail-label">
                        <i class="bi bi-clock"></i>
                        Credit Hours
                    </div>
                    <div class="detail-value">
                        <span class="credit-badge">
                            <i class="bi bi-clock"></i>
                            ${course.creditHours}
                        </span>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <g:form resource="${this.course}" controller="${controllerName}" method="DELETE" class="d-flex gap-2 flex-wrap w-100">
                    <g:link action="edit" resource="${this.course}" controller="${controllerName}" class="btn-edit">
                        <i class="bi bi-pencil-square me-1"></i> 
                        <g:message code="default.button.edit.label" default="Edit Course" />
                    </g:link>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <button class="btn-delete" type="submit" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this course?')}');">
                        <i class="bi bi-trash me-1"></i> 
                        <g:message code="default.button.delete.label" default="Delete Course" />
                    </button>
                    </sec:ifAnyGranted>
                    <g:link action="index" class="btn-back">
                        <i class="bi bi-arrow-left me-1"></i> Back to Courses
                    </g:link>
                </g:form>
            </div>
        </div>

        <!-- Enrolled Students Section -->
        <div class="students-card">
            <div class="section-header">
                <i class="bi bi-people"></i>
                <h4>Enrolled Students</h4>
                <span class="count-badge">
                    <i class="bi bi-person"></i> ${course.enrollments?.size() ?: 0}
                </span>
            </div>

            <g:if test="${course.enrollments}">
                <ul class="student-list">
                    <g:each in="${course.enrollments}" var="enrollment">
                        <li>
                            <div class="student-avatar">
                                ${enrollment.student?.name?.charAt(0)?.toUpperCase() ?: 'S'}
                            </div>
                            <div class="student-info">
                                <div class="student-name">${enrollment.student?.name}</div>
                                <div class="student-number">
                                    <i class="bi bi-person-badge me-1"></i>
                                    ${enrollment.student?.studentNumber}
                                </div>
                            </div>
                            <span class="student-status">
                                <i class="bi bi-check-circle"></i> Enrolled
                            </span>
                        </li>
                    </g:each>
                </ul>
            </g:if>
            <g:else>
                <div class="empty-state">
                    <i class="bi bi-people"></i>
                    <p>No students enrolled in this course yet</p>
                </div>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>