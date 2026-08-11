<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Home - UBS University System</title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #1a2a6c 0%, #0d6efd 50%, #00d2ff 100%);
            border-radius: 1.5rem;
            padding: 3rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2.5rem;
            box-shadow: 0 10px 40px rgba(13, 110, 253, 0.25);
        }
        
        .hero-section::before {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .hero-section::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -5%;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 50%;
        }
        
        .hero-section .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .hero-section .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 0.5rem 1rem;
            border-radius: 50rem;
            font-size: 0.8rem;
            font-weight: 500;
            margin-bottom: 1rem;
        }
        
        .hero-section .hero-badge .dot {
            width: 8px;
            height: 8px;
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
        
        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.75rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .hero-section h1 i {
            margin-right: 0.5rem;
        }
        
        .hero-section p {
            font-size: 1.1rem;
            opacity: 0.9;
            max-width: 600px;
            line-height: 1.6;
        }
        
        .hero-section .hero-stats {
            display: flex;
            gap: 2.5rem;
            margin-top: 1.5rem;
            flex-wrap: wrap;
        }
        
        .hero-section .hero-stats .stat-item {
            text-align: center;
        }
        
        .hero-section .hero-stats .stat-item .stat-number {
            font-size: 1.8rem;
            font-weight: 700;
            display: block;
        }
        
        .hero-section .hero-stats .stat-item .stat-label {
            font-size: 0.8rem;
            opacity: 0.8;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2.5rem;
        }
        
        .quick-actions .action-card {
            background: white;
            border-radius: 1rem;
            padding: 1.25rem;
            text-align: center;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
        }
        
        .quick-actions .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-color: #0d6efd;
            text-decoration: none;
            color: inherit;
        }
        
        .quick-actions .action-card .action-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin: 0 auto 0.75rem;
        }
        
        .quick-actions .action-card .action-icon.blue {
            background: #ebf8ff;
            color: #0d6efd;
        }
        
        .quick-actions .action-card .action-icon.green {
            background: #f0fff4;
            color: #48bb78;
        }
        
        .quick-actions .action-card .action-icon.purple {
            background: #faf5ff;
            color: #805ad5;
        }
        
        .quick-actions .action-card .action-icon.orange {
            background: #fffbeb;
            color: #ed8936;
        }
        
        .quick-actions .action-card .action-title {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 0.25rem;
        }
        
        .quick-actions .action-card .action-desc {
            font-size: 0.85rem;
            color: #718096;
            margin: 0;
        }
        
        /* Section Cards */
        .section-card {
            background: white;
            border-radius: 1.25rem;
            padding: 1.5rem;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .section-card:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }
        
        .section-card .card-header-custom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .section-card .card-header-custom h5 {
            font-weight: 700;
            color: #2d3748;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .section-card .card-header-custom h5 i {
            color: #0d6efd;
        }
        
        .section-card .card-header-custom .badge-custom {
            background: #ebf8ff;
            color: #0d6efd;
            padding: 0.25rem 0.75rem;
            border-radius: 50rem;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .section-card .list-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0.6rem 0;
            border-bottom: 1px solid #f7fafc;
            transition: all 0.2s ease;
        }
        
        .section-card .list-item:hover {
            padding-left: 0.5rem;
        }
        
        .section-card .list-item:last-child {
            border-bottom: none;
        }
        
        .section-card .list-item .item-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .section-card .list-item .item-info .item-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0d6efd, #00d2ff);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.75rem;
        }
        
        .section-card .list-item .item-info .item-name {
            font-weight: 500;
            color: #2d3748;
        }
        
        .section-card .list-item .item-info .item-detail {
            font-size: 0.8rem;
            color: #718096;
        }
        
        .section-card .list-item .item-status {
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.2rem 0.6rem;
            border-radius: 50rem;
        }
        
        .section-card .list-item .item-status.active {
            background: #c6f6d5;
            color: #22543d;
        }
        
        .section-card .list-item .item-status.pending {
            background: #fefcbf;
            color: #744210;
        }
        
        .section-card .list-item .item-status.completed {
            background: #bee3f8;
            color: #2a4365;
        }
        
        .section-card .view-all-link {
            display: block;
            text-align: center;
            padding-top: 0.75rem;
            margin-top: 0.75rem;
            border-top: 1px solid #f0f0f0;
            color: #0d6efd;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        
        .section-card .view-all-link:hover {
            color: #0a4fc2;
        }
        
        .section-card .empty-state {
            text-align: center;
            padding: 2rem 1rem;
        }
        
        .section-card .empty-state i {
            font-size: 2.5rem;
            color: #cbd5e0;
            margin-bottom: 0.5rem;
        }
        
        .section-card .empty-state p {
            color: #718096;
            font-size: 0.9rem;
            margin: 0;
        }
        
        /* Features Grid */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .features-grid .feature-item {
            text-align: center;
            padding: 1rem;
            border-radius: 0.75rem;
            background: #f7fafc;
            transition: all 0.3s ease;
        }
        
        .features-grid .feature-item:hover {
            background: #ebf8ff;
            transform: scale(1.02);
        }
        
        .features-grid .feature-item i {
            font-size: 1.5rem;
            color: #0d6efd;
            margin-bottom: 0.5rem;
        }
        
        .features-grid .feature-item .feature-label {
            font-size: 0.85rem;
            font-weight: 500;
            color: #2d3748;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .hero-section {
                padding: 2rem 1.5rem;
                text-align: center;
            }
            
            .hero-section h1 {
                font-size: 1.8rem;
            }
            
            .hero-section p {
                font-size: 1rem;
                margin-left: auto;
                margin-right: auto;
            }
            
            .hero-section .hero-stats {
                justify-content: center;
                gap: 1.5rem;
            }
            
            .hero-section .hero-stats .stat-item .stat-number {
                font-size: 1.4rem;
            }
            
            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .section-card .list-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
        }
        
        @media (max-width: 480px) {
            .quick-actions {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-content">
            <div class="hero-badge">
                <span class="dot"></span>
                System Online
            </div>
            
            <h1>
                <i class="bi bi-mortarboard-fill"></i>
                Welcome to UBS University
            </h1>
            
            <p>
                Manage students, courses, and enrollments efficiently with our comprehensive 
                university management system. Streamline your academic operations today.
            </p>
            
            <div class="hero-stats">
                <div class="stat-item">
                    <span class="stat-number" id="studentCount">0</span>
                    <span class="stat-label">Students</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number" id="courseCount">0</span>
                    <span class="stat-label">Courses</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number" id="enrollmentCount">0</span>
                    <span class="stat-label">Enrollments</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="quick-actions">
        <g:link controller="student" action="create" class="action-card">
            <div class="action-icon blue">
                <i class="bi bi-person-plus"></i>
            </div>
            <div class="action-title">Add Student</div>
            <p class="action-desc">Register new student</p>
        </g:link>
        
        <g:link controller="course" action="create" class="action-card">
            <div class="action-icon green">
                <i class="bi bi-book-plus"></i>
            </div>
            <div class="action-title">Add Course</div>
            <p class="action-desc">Create new course</p>
        </g:link>
        
        <g:link controller="enrollment" action="create" class="action-card">
            <div class="action-icon purple">
                <i class="bi bi-journal-plus"></i>
            </div>
            <div class="action-title">Enroll Student</div>
            <p class="action-desc">Enroll in course</p>
        </g:link>
        
        <g:link controller="dashboard" action="index" class="action-card">
            <div class="action-icon orange">
                <i class="bi bi-speedometer2"></i>
            </div>
            <div class="action-title">Dashboard</div>
            <p class="action-desc">View analytics</p>
        </g:link>
    </div>

    <!-- Content Sections -->
    <div class="row g-4">
        <!-- Recent Students -->
        <div class="col-lg-6">
            <div class="section-card">
                <div class="card-header-custom">
                    <h5>
                        <i class="bi bi-people"></i>
                        Recent Students
                    </h5>
                    <span class="badge-custom">
                        <i class="bi bi-clock"></i> Latest
                    </span>
                </div>
                
                <g:if test="${recentStudents}">
                    <g:each in="${recentStudents}" var="student">
                        <div class="list-item">
                            <div class="item-info">
                                <div class="item-avatar">
                                    ${student?.name?.charAt(0)?.toUpperCase() ?: 'S'}
                                </div>
                                <div>
                                    <div class="item-name">${student.name}</div>
                                    <div class="item-detail">${student.email}</div>
                                </div>
                            </div>
                            <span class="item-status active">Active</span>
                        </div>
                    </g:each>
                </g:if>
                <g:else>
                    <div class="empty-state">
                        <i class="bi bi-people"></i>
                        <p>No students registered yet.<br>Start by adding your first student.</p>
                    </div>
                </g:else>
                
                <g:link controller="student" action="index" class="view-all-link">
                    View All Students <i class="bi bi-arrow-right"></i>
                </g:link>
            </div>
        </div>
        
        <!-- Recent Courses -->
        <div class="col-lg-6">
            <div class="section-card">
                <div class="card-header-custom">
                    <h5>
                        <i class="bi bi-book"></i>
                        Recent Courses
                    </h5>
                    <span class="badge-custom">
                        <i class="bi bi-clock"></i> Latest
                    </span>
                </div>
                
                <g:if test="${recentCourses}">
                    <g:each in="${recentCourses}" var="course">
                        <div class="list-item">
                            <div class="item-info">
                                <div style="width: 32px; height: 32px; border-radius: 8px; background: #ebf8ff; display: flex; align-items: center; justify-content: center; color: #0d6efd; font-weight: 700; font-size: 0.75rem;">
                                    ${course?.code?.charAt(0)?.toUpperCase() ?: 'C'}
                                </div>
                                <div>
                                    <div class="item-name">${course.title}</div>
                                    <div class="item-detail">${course.code}</div>
                                </div>
                            </div>
                            <span class="item-status active">Active</span>
                        </div>
                    </g:each>
                </g:if>
                <g:else>
                    <div class="empty-state">
                        <i class="bi bi-book"></i>
                        <p>No courses available.<br>Create your first course.</p>
                    </div>
                </g:else>
                
                <g:link controller="course" action="index" class="view-all-link">
                    View All Courses <i class="bi bi-arrow-right"></i>
                </g:link>
            </div>
        </div>
    </div>
    
    <!-- Features / Quick Stats -->
    <div class="row g-4 mt-2">
        <div class="col-12">
            <div class="section-card">
                <div class="card-header-custom">
                    <h5>
                        <i class="bi bi-grid-3x3-gap-fill"></i>
                        System Features
                    </h5>
                </div>
                <div class="features-grid">
                    <div class="feature-item">
                        <i class="bi bi-person-check"></i>
                        <div class="feature-label">Student Management</div>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-book"></i>
                        <div class="feature-label">Course Management</div>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-journal"></i>
                        <div class="feature-label">Enrollment Tracking</div>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-graph-up"></i>
                        <div class="feature-label">GPA Calculation</div>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-search"></i>
                        <div class="feature-label">Advanced Search</div>
                    </div>
                    <div class="feature-item">
                        <i class="bi bi-shield-lock"></i>
                        <div class="feature-label">Secure Access</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Animate stats counter
        document.addEventListener('DOMContentLoaded', function() {
            function animateCounter(element, target, duration = 1000) {
                if (!element) return;
                const start = 0;
                const startTime = performance.now();
                
                function update(currentTime) {
                    const elapsed = currentTime - startTime;
                    const progress = Math.min(elapsed / duration, 1);
                    const current = Math.floor(progress * target);
                    element.textContent = current;
                    
                    if (progress < 1) {
                        requestAnimationFrame(update);
                    } else {
                        element.textContent = target;
                    }
                }
                requestAnimationFrame(update);
            }
            
            // Get counts from server or use fallback
            const studentCount = ${studentCount ?: 0};
            const courseCount = ${courseCount ?: 0};
            const enrollmentCount = ${enrollmentCount ?: 0};
            
            animateCounter(document.getElementById('studentCount'), studentCount);
            animateCounter(document.getElementById('courseCount'), courseCount);
            animateCounter(document.getElementById('enrollmentCount'), enrollmentCount);
        });
    </script>
</body>
</html>