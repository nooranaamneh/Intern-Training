<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Course List Specific Styles */
        .course-hero {
            background: linear-gradient(135deg, #4299e1 0%, #2b6cb0 100%);
            border-radius: 1.5rem;
            padding: 2rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(66, 153, 225, 0.25);
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
            border-color: #4299e1;
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
        
        .stats-bar .stat-card .stat-icon.blue {
            background: #ebf8ff;
            color: #4299e1;
        }
        
        .stats-bar .stat-card .stat-icon.green {
            background: #f0fff4;
            color: #48bb78;
        }
        
        .stats-bar .stat-card .stat-icon.orange {
            background: #fffbeb;
            color: #ed8936;
        }
        
        .stats-bar .stat-card .stat-icon.purple {
            background: #faf5ff;
            color: #805ad5;
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
            color: #4299e1;
        }
        
        .table-card .table-header .table-actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .btn-add {
            background: linear-gradient(135deg, #4299e1 0%, #2b6cb0 100%);
            border: none;
            padding: 0.5rem 1.25rem;
            border-radius: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(66, 153, 225, 0.3);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1.5rem rgba(66, 153, 225, 0.4);
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
        
        .table-custom .course-title {
            font-weight: 500;
            color: #2d3748;
        }
        
        .table-custom .course-code {
            display: inline-block;
            padding: 0.2rem 0.75rem;
            border-radius: 50rem;
            background: #ebf8ff;
            color: #2b6cb0;
            font-weight: 600;
            font-size: 0.8rem;
        }
        
        .table-custom .credit-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            padding: 0.2rem 0.75rem;
            border-radius: 50rem;
            background: #f0fff4;
            color: #22543d;
            font-weight: 600;
            font-size: 0.8rem;
        }
        
        .table-custom .credit-badge i {
            font-size: 0.7rem;
        }
        
        /* Action Buttons in Table */
        .action-btns {
            display: flex;
            gap: 0.3rem;
            flex-wrap: wrap;
        }
        
        .action-btns .btn-action {
            padding: 0.25rem 0.75rem;
            border-radius: 0.5rem;
            font-size: 0.75rem;
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
        
        .action-btns .btn-delete-action {
            background: #fff5f5;
            color: #e53e3e;
        }
        
        .action-btns .btn-delete-action:hover {
            background: #fed7d7;
            color: #e53e3e;
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
        
        /* Pagination */
        .pagination-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0.5rem;
            flex-wrap: wrap;
            padding: 1rem 0 0;
            border-top: 1px solid #f0f0f0;
            margin-top: 1.5rem;
        }
        
        .pagination-container .paginate-btn {
            padding: 0.5rem 0.75rem;
            border-radius: 0.5rem;
            border: 1px solid #e2e8f0;
            color: #4a5568;
            transition: all 0.3s ease;
            text-decoration: none;
            min-width: 36px;
            text-align: center;
            font-weight: 500;
        }
        
        .pagination-container .paginate-btn:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
        }
        
        .pagination-container .paginate-btn.active {
            background: linear-gradient(135deg, #4299e1 0%, #2b6cb0 100%);
            color: white;
            border-color: #4299e1;
        }
        
        .pagination-container .paginate-btn.disabled {
            opacity: 0.5;
            cursor: not-allowed;
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
<div id="content" role="main">
    <div class="container py-4">
        <!-- Hero Section -->
        <div class="course-hero">
            <div class="hero-content">
                <h1>
                    <i class="bi bi-book"></i>
                    <g:message code="default.list.label" args="[entityName]" />
                </h1>
                <p>Browse and manage all courses in the university</p>
                <div class="breadcrumb-custom">
                    <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
                    <span>/</span>
                    <span>Courses</span>
                </div>
            </div>
        </div>

        <!-- Stats Bar -->
        <div class="stats-bar">
            <div class="stat-card">
                <div class="stat-icon blue">
                    <i class="bi bi-book"></i>
                </div>
                <div class="stat-info">
                    <span class="stat-number">${courseCount ?: 0}</span>
                    <div class="stat-label">Total Courses</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon green">
                    <i class="bi bi-clock"></i>
                </div>
                <div class="stat-info">
                    <span class="stat-number">${totalCreditHours ?: 0}</span>
                    <div class="stat-label">Total Credit Hours</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon orange">
                    <i class="bi bi-people"></i>
                </div>
                <div class="stat-info">
                    <span class="stat-number">${totalEnrollments ?: 0}</span>
                    <div class="stat-label">Total Enrollments</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon purple">
                    <i class="bi bi-star"></i>
                </div>
                <div class="stat-info">
                    <span class="stat-number">${avgCreditHours ?: '0'}</span>
                    <div class="stat-label">Avg Credit Hours</div>
                </div>
            </div>
        </div>

        <!-- Table Card -->
        <div class="table-card">
            <div class="table-header">
                <div class="table-title">
                    <i class="bi bi-list-ul"></i>
                    Course Records
                    <span class="badge bg-secondary bg-opacity-10 text-secondary ms-2">
                        ${courseList?.size() ?: 0} records
                    </span>
                </div>
                <div class="table-actions">
                    <g:link action="create" class="btn-add">
                        <i class="bi bi-plus-circle"></i>
                        Add New Course
                    </g:link>
                    <a href="#" class="btn-export" onclick="window.print(); return false;">
                        <i class="bi bi-download"></i>
                        Export
                    </a>
                </div>
            </div>

            <g:if test="${courseList}">
                <div class="table-responsive-custom">
                    <table class="table table-custom">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Code</th>
                                <th>Credit Hours</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${courseList}" var="course">
                                <tr>
                                    <td>
                                        <div class="course-title">
                                            <i class="bi bi-book text-primary me-2"></i>
                                            ${fieldValue(bean: course, field: "title")}
                                        </div>
                                    </td>
                                    <td>
                                        <span class="course-code">${fieldValue(bean: course, field: "code")}</span>
                                    </td>
                                    <td>
                                        <span class="credit-badge">
                                            <i class="bi bi-clock"></i>
                                            ${fieldValue(bean: course, field: "creditHours")}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-btns justify-content-center">
                                            <g:link controller="course" action="show" id="${course.id}" class="btn-action btn-view-action">
                                                <i class="bi bi-eye"></i> View
                                            </g:link>
                                            <g:link controller="course" action="edit" id="${course.id}" class="btn-action btn-edit-action">
                                                <i class="bi bi-pencil"></i> Edit
                                            </g:link>
                                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                                            <g:link controller="course" action="delete" id="${course.id}" class="btn-action btn-delete-action" 
                                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this course?')}');">
                                                <i class="bi bi-trash"></i> Delete
                                            </g:link>
                                            </sec:ifAnyGranted>
                                        </div>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
                
                <!-- Pagination -->
                <g:if test="${courseCount > params.int('max')}">
                    <div class="pagination-container">
                        <g:paginate 
                            total="${courseCount ?: 0}" 
                            max="${params.max ?: 10}" 
                            offset="${params.offset ?: 0}" 
                            params="${params}"
                            prev="&laquo;"
                            next="&raquo;"
                            class="pagination-custom" />
                    </div>
                </g:if>
            </g:if>
            <g:else>
                <div class="empty-state">
                    <i class="bi bi-book"></i>
                    <h5>No Courses Found</h5>
                    <p>There are no courses in the system yet. Start by adding your first course.</p>
                    <g:link action="create" class="btn-add">
                        <i class="bi bi-plus-circle"></i>
                        Create First Course
                    </g:link>
                </div>
            </g:else>
        </div>
    </div>
</div>

<!-- Custom Pagination Styling -->
<style>
    .pagination-custom {
        display: flex;
        gap: 0.25rem;
        align-items: center;
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .pagination-custom .step {
        padding: 0.5rem 0.75rem;
        border-radius: 0.5rem;
        border: 1px solid #e2e8f0;
        color: #4a5568;
        transition: all 0.3s ease;
        text-decoration: none;
        min-width: 36px;
        text-align: center;
        font-weight: 500;
    }
    
    .pagination-custom .step:hover {
        background: #f7fafc;
        border-color: #cbd5e0;
        text-decoration: none;
        color: #4a5568;
    }
    
    .pagination-custom .currentStep {
        background: linear-gradient(135deg, #4299e1 0%, #2b6cb0 100%);
        color: white;
        border-color: #4299e1;
        padding: 0.5rem 0.75rem;
        border-radius: 0.5rem;
        min-width: 36px;
        text-align: center;
        font-weight: 600;
    }
    
    .pagination-custom .prevLink, .pagination-custom .nextLink {
        padding: 0.5rem 0.75rem;
        border-radius: 0.5rem;
        border: 1px solid #e2e8f0;
        color: #4a5568;
        transition: all 0.3s ease;
        text-decoration: none;
    }
    
    .pagination-custom .prevLink:hover, .pagination-custom .nextLink:hover {
        background: #f7fafc;
        border-color: #cbd5e0;
        text-decoration: none;
        color: #4a5568;
    }
</style>
</body>
</html>