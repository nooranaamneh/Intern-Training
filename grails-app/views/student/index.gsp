<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Modern List Page Styling */
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
        
        .stats-bar {
            display: flex;
            gap: 2rem;
            flex-wrap: wrap;
            background: #f7fafc;
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #e2e8f0;
        }
        
        .stats-bar .stat-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .stats-bar .stat-item i {
            color: #667eea;
            font-size: 1.25rem;
        }
        
        .stats-bar .stat-item .stat-number {
            font-weight: 700;
            color: #2d3748;
            font-size: 1.1rem;
        }
        
        .stats-bar .stat-item .stat-label {
            color: #718096;
            font-size: 0.85rem;
        }
        
        .search-section {
            background: #ffffff;
            border-radius: 1rem;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.04);
            border: 1px solid #e2e8f0;
        }
        
        .search-section .input-group-custom {
            position: relative;
        }
        
        .search-section .input-group-custom .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            z-index: 10;
        }
        
        .search-section .input-group-custom .form-control {
            padding-left: 2.8rem;
            border-radius: 0.75rem;
            border: 2px solid #e2e8f0;
            padding: 0.6rem 1rem;
            transition: all 0.3s ease;
        }
        
        .search-section .input-group-custom .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }
        
        .search-section .btn-search {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 0.75rem;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
        }
        
        .search-section .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.25rem 0.75rem rgba(102, 126, 234, 0.3);
        }
        
        .search-section .btn-clear {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.6rem 1.5rem;
            font-weight: 500;
            color: #4a5568;
            transition: all 0.3s ease;
        }
        
        .search-section .btn-clear:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
        }
        
        .student-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .student-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 1.5rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
        }
        
        .student-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.12);
        }
        
        .student-card .card-header-content {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }
        
        .student-card .card-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 700;
            color: white;
            flex-shrink: 0;
            box-shadow: 0 0.25rem 0.5rem rgba(102, 126, 234, 0.2);
        }
        
        .student-card .card-name {
            font-size: 1.1rem;
            font-weight: 600;
            color: #2d3748;
            margin: 0;
        }
        
        .student-card .card-student-id {
            font-size: 0.8rem;
            color: #718096;
        }
        
        .student-card .card-details {
            flex: 1;
        }
        
        .student-card .card-detail-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .student-card .card-detail-item:last-child {
            border-bottom: none;
        }
        
        .student-card .card-detail-item i {
            color: #667eea;
            width: 18px;
            font-size: 0.9rem;
        }
        
        .student-card .card-detail-item .detail-label {
            font-size: 0.8rem;
            color: #718096;
            min-width: 80px;
        }
        
        .student-card .card-detail-item .detail-value {
            font-size: 0.9rem;
            color: #2d3748;
            font-weight: 500;
        }
        
        .student-card .card-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid #f0f0f0;
        }
        
        .student-card .card-actions .btn-action {
            flex: 1;
            padding: 0.4rem 0.75rem;
            border-radius: 0.5rem;
            font-size: 0.8rem;
            font-weight: 500;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
        }
        
        .student-card .card-actions .btn-view {
            background: #ebf8ff;
            color: #2b6cb0;
            border: 1px solid #bee3f8;
        }
        
        .student-card .card-actions .btn-view:hover {
            background: #bee3f8;
            transform: translateY(-2px);
        }
        
        .student-card .card-actions .btn-edit {
            background: #f0f4ff;
            color: #4a6cf7;
            border: 1px solid #c7d2fe;
        }
        
        .student-card .card-actions .btn-edit:hover {
            background: #c7d2fe;
            transform: translateY(-2px);
        }
        
        .student-card .card-status {
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            padding: 0.2rem 0.6rem;
            border-radius: 50rem;
            font-size: 0.65rem;
            font-weight: 600;
            background: #c6f6d5;
            color: #22543d;
        }
        
        .student-card .card-status .dot {
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #48bb78;
            display: inline-block;
        }
        
        .paginate-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0.5rem;
            flex-wrap: wrap;
            padding: 1rem 0;
        }
        
        .paginate-container .paginate-btn {
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
        
        .paginate-container .paginate-btn:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
        }
        
        .paginate-container .paginate-btn.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-color: #667eea;
        }
        
        .paginate-container .paginate-btn.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: #f7fafc;
            border-radius: 1rem;
            border: 2px dashed #e2e8f0;
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
        }
        
        .alert-custom {
            border-radius: 1rem;
            border: none;
            padding: 1rem 1.5rem;
        }
        
        .alert-custom-success {
            background: #f0fff4;
            border-left: 4px solid #48bb78;
            color: #22543d;
        }
        
        @media (max-width: 768px) {
            .page-header {
                padding: 1.5rem;
            }
            
            .stats-bar {
                flex-direction: column;
                gap: 0.75rem;
            }
            
            .search-section .input-group {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .search-section .input-group .btn {
                width: 100%;
            }
            
            .student-grid {
                grid-template-columns: 1fr;
            }
            
            .student-card .card-actions {
                flex-direction: column;
            }

            .student-photo {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 50%;
    border: 3px solid #e2e8f0;
}

.student-photo-placeholder {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: #edf2f7;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #a0aec0;
    font-size: 1.5rem;
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
                        <i class="bi bi-people me-2"></i>
                        <g:message code="default.list.label" args="[entityName]" />
                    </h1>
                    <p class="mb-0 opacity-75 mt-1">
                        <i class="bi bi-info-circle me-1"></i>
                        Manage and view all student records
                    </p>
                </div>

                <div class="d-flex gap-2">
                    <a href="${createLink(uri: '/')}" class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill">
                        <i class="bi-house me-1"></i>
                        <g:message code="default.home.label"/>
                    </a>

                    <g:link class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill"
                            action="create"
                            aria-label="Create">
                        <i class="bi-plus-circle me-1"></i>
                        <g:message code="default.new.label" args="[entityName]" />
                    </g:link>
                </div>
            </div>
        </div>

        <!-- Stats Bar -->
        <div class="stats-bar">
            <div class="stat-item">
                <i class="bi bi-people"></i>
                <div>
                    <div class="stat-number">${studentCount ?: 0}</div>
                    <div class="stat-label">Total Students</div>
                </div>
            </div>

            <div class="stat-item">
                <i class="bi bi-person-check"></i>
                <div>
                    <div class="stat-number">${studentList?.size() ?: 0}</div>
                    <div class="stat-label">Showing</div>
                </div>
            </div>

            <g:if test="${params.search}">
                <div class="stat-item">
                    <i class="bi bi-search"></i>
                    <div>
                        <div class="stat-number">${params.search}</div>
                        <div class="stat-label">Search Results</div>
                    </div>
                </div>
            </g:if>
        </div>

        <!-- Flash Messages -->
        <g:flashMessages />

        <!-- Search Section -->
        <div class="search-section">
            <g:form controller="student" action="index" method="GET" class="row g-3 align-items-end">

                <div class="col-md-6 col-lg-8">
                    <label for="search" class="form-label fw-semibold text-muted small">
                        <i class="bi bi-search me-1"></i>
                        Search Students
                    </label>

                    <div class="input-group-custom">
                        <i class="bi bi-search search-icon"></i>

                        <input type="text"
                               name="search"
                               id="search"
                               value="${params.search}"
                               class="form-control"
                               placeholder="Search by name, email, or student number..."
                               autofocus />
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="d-flex gap-2">

                        <button type="submit" class="btn-search">
                            <i class="bi bi-search me-1"></i>
                            Search
                        </button>

                        <g:if test="${params.search}">
                            <g:link action="index" class="btn-clear">
                                <i class="bi bi-x-circle me-1"></i>
                                Clear
                            </g:link>
                        </g:if>

                    </div>
                </div>

            </g:form>
        </div>

        <!-- Student Grid -->
<g:if test="${studentList}">

    <div class="student-grid">

        <g:each in="${studentList}" var="student">

            <div class="student-card">

                <!-- Card Header -->
                <div class="card-header-content">

                    <!-- Student Photo -->
                    

                    <!-- Default Avatar if No Photo -->
                    <g:if test="${student?.profilePhoto}">
    <img src="${createLink(
        controller: 'student',
        action: 'renderPhoto',
        params: [id: student.id]
    )}"
         alt="Profile Photo"
         class="card-avatar" />
</g:if>

                    <div>
                        <div class="card-name">
                            ${student.name}
                        </div>

                        <div class="card-student-id">
                            <span class="card-status">
                                <span class="dot"></span>
                                Active
                            </span>
                        </div>
                    </div>

                </div>

                <!-- Card Details -->
                <div class="card-details">

                    <div class="card-detail-item">
                        <i class="bi bi-envelope"></i>
                        <span class="detail-label">Email</span>
                        <span class="detail-value">
                            ${student.email}
                        </span>
                    </div>

                    <div class="card-detail-item">
                        <i class="bi bi-person-badge"></i>
                        <span class="detail-label">Student #</span>
                        <span class="detail-value">
                            ${student.studentNumber}
                        </span>
                    </div>

                    <g:if test="${student.enrollments}">
                        <div class="card-detail-item">
                            <i class="bi bi-book"></i>
                            <span class="detail-label">Courses</span>
                            <span class="detail-value">
                                <span class="badge bg-primary bg-opacity-10 text-primary rounded-pill">
                                    ${student.enrollments.size()}
                                </span>
                            </span>
                        </div>
                    </g:if>

                </div>

                <!-- Card Actions -->
                <div class="card-actions">

                    <g:link controller="student"
                            action="show"
                            id="${student.id}"
                            class="btn-action btn-view">
                        <i class="bi bi-eye me-1"></i>
                        View
                    </g:link>

                    <g:link controller="student"
                            action="edit"
                            id="${student.id}"
                            class="btn-action btn-edit">
                        <i class="bi bi-pencil me-1"></i>
                        Edit
                    </g:link>

                </div>

            </div>

        </g:each>

    </div>

</g:if>

<g:if test="${!studentList}">

    <div class="empty-state">

        <i class="bi bi-people"></i>

        <h5>No Students Found</h5>

        <p>

            <g:if test="${params.search}">
                No students match your search criteria. Try adjusting your search.
            </g:if>

            <g:if test="${!params.search}">
                There are no students in the system yet.
                <br />

                <g:link action="create" class="btn btn-primary mt-3">
                    <i class="bi bi-plus-circle me-1"></i>
                    Add Your First Student
                </g:link>
            </g:if>

        </p>

    </div>

</g:if>

<!-- Pagination -->
<g:if test="${studentCount > params.int('max')}">

    <div class="paginate-container">

        <g:paginate
            total="${studentCount ?: 0}"
            max="${params.max ?: 10}"
            offset="${params.offset ?: 0}"
            params="${params}"
            prev="&laquo;"
            next="&raquo;"
            class="paginate" />

    </div>

</g:if>

</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>