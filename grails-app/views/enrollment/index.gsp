<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Enrollments - UBS University</title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Enrollments Page Specific Styles */
        .enrollment-hero {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border-radius: 1.5rem;
            padding: 2rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(245, 87, 108, 0.25);
        }
        
        .enrollment-hero::before {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 350px;
            height: 350px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }
        
        .enrollment-hero::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -5%;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .enrollment-hero .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .enrollment-hero h1 {
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.25rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .enrollment-hero p {
            opacity: 0.9;
            margin: 0;
            font-size: 1rem;
        }
        
        .enrollment-hero .breadcrumb-custom {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            font-size: 0.85rem;
            opacity: 0.8;
            margin-top: 0.5rem;
        }
        
        .enrollment-hero .breadcrumb-custom a {
            color: white;
            text-decoration: none;
        }
        
        .enrollment-hero .breadcrumb-custom a:hover {
            text-decoration: underline;
        }
        
        /* Stats Bar */
        .stats-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .stats-bar .stat-card {
            background: white;
            border-radius: 1rem;
            padding: 1rem 1.25rem;
            border: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
        }
        
        .stats-bar .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-color: #f5576c;
        }
        
        .stats-bar .stat-card .stat-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            flex-shrink: 0;
        }
        
        .stats-bar .stat-card .stat-icon.pink {
            background: #fff5f5;
            color: #f5576c;
        }
        
        .stats-bar .stat-card .stat-icon.blue {
            background: #ebf8ff;
            color: #0d6efd;
        }
        
        .stats-bar .stat-card .stat-icon.green {
            background: #f0fff4;
            color: #48bb78;
        }
        
        .stats-bar .stat-card .stat-icon.orange {
            background: #fffbeb;
            color: #ed8936;
        }
        
        .stats-bar .stat-card .stat-info .stat-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2d3748;
            line-height: 1.2;
        }
        
        .stats-bar .stat-card .stat-info .stat-label {
            font-size: 0.8rem;
            color: #718096;
            font-weight: 500;
        }
        
        /* Table Card */
        .table-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 1.5rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            overflow: hidden;
        }
        
        .table-card .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.25rem;
        }
        
        .table-card .table-header .table-title {
            font-weight: 700;
            color: #2d3748;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .table-card .table-header .table-title i {
            color: #f5576c;
        }
        
        .table-card .table-header .table-actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .btn-add {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border: none;
            padding: 0.5rem 1.25rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(245, 87, 108, 0.3);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1.5rem rgba(245, 87, 108, 0.4);
            color: white;
        }
        
        .btn-export {
            border: 2px solid #e2e8f0;
            padding: 0.5rem 1.25rem;
            border-radius: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
            color: #4a5568;
            background: transparent;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-export:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            color: #4a5568;
        }
        
        /* Table Styling */
        .table-custom {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .table-custom thead th {
            background: #f7fafc;
            color: #4a5568;
            font-weight: 600;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 0.75rem 1rem;
            border-bottom: 2px solid #e2e8f0;
            border-top: none;
        }
        
        .table-custom tbody td {
            padding: 0.75rem 1rem;
            vertical-align: middle;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .table-custom tbody tr {
            transition: all 0.2s ease;
        }
        
        .table-custom tbody tr:hover {
            background: #f7fafc;
        }
        
        .table-custom tbody tr:last-child td {
            border-bottom: none;
        }
        
        .table-custom .student-cell {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .table-custom .student-cell .student-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.75rem;
            flex-shrink: 0;
        }
        
        .table-custom .student-cell .student-name {
            font-weight: 500;
            color: #2d3748;
        }
        
        .table-custom .course-cell {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .table-custom .course-cell .course-code {
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.15rem 0.5rem;
            border-radius: 0.5rem;
            background: #ebf8ff;
            color: #0d6efd;
        }
        
        /* Grade Badge */
        .grade-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.25rem 0.75rem;
            border-radius: 50rem;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .grade-badge .grade-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            display: inline-block;
        }
        
        .grade-badge.excellent {
            background: #c6f6d5;
            color: #22543d;
        }
        
        .grade-badge.excellent .grade-dot {
            background: #48bb78;
        }
        
        .grade-badge.good {
            background: #fefcbf;
            color: #744210;
        }
        
        .grade-badge.good .grade-dot {
            background: #f6ad55;
        }
        
        .grade-badge.average {
            background: #fed7d7;
            color: #742a2a;
        }
        
        .grade-badge.average .grade-dot {
            background: #fc8181;
        }
        
        .grade-badge.not-graded {
            background: #e2e8f0;
            color: #718096;
        }
        
        .grade-badge.not-graded .grade-dot {
            background: #a0aec0;
        }
        
        /* Action Buttons in Table */
        .action-btns {
            display: flex;
            gap: 0.3rem;
            justify-content: center;
        }
        
        .action-btns .btn-action {
            padding: 0.2rem 0.5rem;
            border-radius: 0.5rem;
            font-size: 0.8rem;
            transition: all 0.3s ease;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .action-btns .btn-action:hover {
            transform: translateY(-2px);
        }
        
        .action-btns .btn-view-action {
            background: #ebf8ff;
            color: #0d6efd;
        }
        
        .action-btns .btn-view-action:hover {
            background: #bee3f8;
            color: #0d6efd;
        }
        
        .action-btns .btn-edit-action {
            background: #f0f4ff;
            color: #4a6cf7;
        }
        
        .action-btns .btn-edit-action:hover {
            background: #c7d2fe;
            color: #4a6cf7;
        }
        
        .action-btns .btn-grade-action {
            background: #faf5ff;
            color: #805ad5;
        }
        
        .action-btns .btn-grade-action:hover {
            background: #e9d5ff;
            color: #805ad5;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
        }
        
        .empty-state i {
            font-size: 4rem;
            color: #cbd5e0;
            margin-bottom: 1rem;
        }
        
        .empty-state h5 {
            color: #4a5568;
            margin-bottom: 0.5rem;
        }
        
        .empty-state p {
            color: #718096;
            max-width: 400px;
            margin: 0 auto 1.5rem;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .enrollment-hero {
                padding: 1.5rem;
                text-align: center;
            }
            
            .enrollment-hero h1 {
                font-size: 1.5rem;
                justify-content: center;
            }
            
            .enrollment-hero .breadcrumb-custom {
                justify-content: center;
            }
            
            .stats-bar {
                grid-template-columns: 1fr 1fr;
            }
            
            .table-card .table-header {
                flex-direction: column;
                align-items: stretch;
            }
            
            .table-card .table-header .table-actions {
                flex-direction: column;
            }
            
            .table-card .table-header .table-actions .btn {
                justify-content: center;
            }
            
            .action-btns {
                flex-wrap: wrap;
            }
            
            .table-responsive-custom {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
        }
        
        @media (max-width: 480px) {
            .stats-bar {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="enrollment-hero">
        <div class="hero-content">
            <h1>
                <i class="bi bi-journal"></i>
                Enrollments
            </h1>
            <p>Manage all student enrollments and grades</p>
            <div class="breadcrumb-custom">
                <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
                <span>/</span>
                <span>Enrollments</span>
            </div>
        </div>
    </div>

    <!-- Stats Bar -->
    <div class="stats-bar">
        <div class="stat-card">
            <div class="stat-icon pink">
                <i class="bi bi-journal"></i>
            </div>
            <div class="stat-info">
                <span class="stat-number">${totalEnrollments ?: enrollmentList?.size() ?: 0}</span>
                <div class="stat-label">Total Enrollments</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon blue">
                <i class="bi bi-person"></i>
            </div>
            <div class="stat-info">
                <span class="stat-number">${uniqueStudents ?: 0}</span>
                <div class="stat-label">Unique Students</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon green">
                <i class="bi bi-book"></i>
            </div>
            <div class="stat-info">
                <span class="stat-number">${uniqueCourses ?: 0}</span>
                <div class="stat-label">Unique Courses</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon orange">
                <i class="bi bi-star"></i>
            </div>
            <div class="stat-info">
                <span class="stat-number">${gradedCount ?: 0}</span>
                <div class="stat-label">Graded</div>
            </div>
        </div>
    </div>

    <!-- Table Card -->
    <div class="table-card">
        <div class="table-header">
            <div class="table-title">
                <i class="bi bi-list-ul"></i>
                Enrollment Records
                <span class="badge bg-secondary bg-opacity-10 text-secondary ms-2">
                    ${enrollmentList?.size() ?: 0} records
                </span>
            </div>
            <div class="table-actions">
                <g:link action="create" class="btn-add">
                    <i class="bi bi-plus-circle"></i>
                    Add New Enrollment
                </g:link>
                <a href="#" class="btn-export" onclick="window.print(); return false;">
                    <i class="bi bi-download"></i>
                    Export
                </a>
            </div>
        </div>

        <g:if test="${enrollmentList}">
            <div class="table-responsive-custom">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Course</th>
                            <th>Grade</th>
                            <th>Enrolled At</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${enrollmentList}" var="e">
                            <tr>
                                <td>
                                    <div class="student-cell">
                                        <div class="student-avatar">
                                            ${e.student?.name?.charAt(0)?.toUpperCase() ?: 'S'}
                                        </div>
                                        <span class="student-name">${e.student?.name}</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="course-cell">
                                        <span>${e.course?.title}</span>
                                        <span class="course-code">${e.course?.code}</span>
                                    </div>
                                </td>
                                <td>
                                    <g:if test="${e.grade != null && e.grade != ''}">
                                        <g:set var="gradeNum" value="${e.grade as Double}" />
                                        <g:if test="${gradeNum >= 90}">
                                            <span class="grade-badge excellent">
                                                <span class="grade-dot"></span>
                                                ${gradeNum}% - A
                                            </span>
                                        </g:if>
                                        <g:elseif test="${gradeNum >= 80}">
                                            <span class="grade-badge good">
                                                <span class="grade-dot"></span>
                                                ${gradeNum}% - B
                                            </span>
                                        </g:elseif>
                                        <g:elseif test="${gradeNum >= 70}">
                                            <span class="grade-badge good">
                                                <span class="grade-dot"></span>
                                                ${gradeNum}% - C
                                            </span>
                                        </g:elseif>
                                        <g:elseif test="${gradeNum >= 60}">
                                            <span class="grade-badge average">
                                                <span class="grade-dot"></span>
                                                ${gradeNum}% - D
                                            </span>
                                        </g:elseif>
                                        <g:else>
                                            <span class="grade-badge average">
                                                <span class="grade-dot"></span>
                                                ${gradeNum}% - F
                                            </span>
                                        </g:else>
                                    </g:if>
                                    <g:else>
                                        <span class="grade-badge not-graded">
                                            <span class="grade-dot"></span>
                                            Not Graded
                                        </span>
                                    </g:else>
                                </td>
                                <td>
                                    <i class="bi bi-calendar3 text-muted me-1"></i>
                                    <g:formatDate date="${e.enrollAt}" format="dd MMM yyyy"/>
                                </td>
                                <td class="text-center">
                                    <div class="action-btns">
                                        <g:link controller="enrollment" action="show" id="${e.id}" class="btn-action btn-view-action">
                                            <i class="bi bi-eye"></i>
                                        </g:link>
                                        <g:link controller="enrollment" action="editGrade" id="${e.id}" class="btn-action btn-grade-action">
                                            <i class="bi bi-star"></i>
                                        </g:link>
                                        <g:link controller="enrollment" action="edit" id="${e.id}" class="btn-action btn-edit-action">
                                            <i class="bi bi-pencil"></i>
                                        </g:link>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination -->
            <g:if test="${enrollmentCount > params.int('max')}">
                <div class="mt-3 pt-3 border-top">
                    <g:paginate 
                        total="${enrollmentCount ?: 0}" 
                        max="${params.max ?: 10}" 
                        offset="${params.offset ?: 0}" 
                        params="${params}"
                        class="pagination-custom"
                        prev="&laquo;"
                        next="&raquo;" />
                </div>
            </g:if>
        </g:if>
        <g:else>
            <div class="empty-state">
                <i class="bi bi-journal"></i>
                <h5>No Enrollments Found</h5>
                <p>There are no enrollments in the system yet. Start by enrolling a student in a course.</p>
                <g:link action="create" class="btn-add">
                    <i class="bi bi-plus-circle"></i>
                    Create First Enrollment
                </g:link>
            </div>
        </g:else>
    </div>
</body>
</html>