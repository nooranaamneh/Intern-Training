<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>
        <g:layoutTitle default="UBS University System"/>
    </title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <g:layoutHead/>
    
    <style>
        /* Global Styles */
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #f8fafc;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        /* Main Content Wrapper */
        .main-content {
            flex: 1;
        }
        
        /* Header */
        .app-header {
            background: linear-gradient(135deg, #1a2a6c 0%, #0d6efd 50%, #00d2ff 100%);
            padding: 1rem 0;
            box-shadow: 0 4px 20px rgba(13, 110, 253, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .app-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .app-header::after {
            content: '';
            position: absolute;
            bottom: -50%;
            left: -5%;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 50%;
        }
        
        .app-header .header-content {
            position: relative;
            z-index: 1;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .app-header .brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .app-header .brand .brand-icon {
            width: 45px;
            height: 45px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            backdrop-filter: blur(10px);
        }
        
        .app-header .brand h1 {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .app-header .brand .subtitle {
            font-size: 0.75rem;
            opacity: 0.8;
            font-weight: 300;
            display: block;
        }
        
        .app-header .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .app-header .header-actions .btn-outline-light {
            border-color: rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
        }
        
        .app-header .header-actions .btn-outline-light:hover {
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-2px);
        }
        
        /* Navigation */
        .app-nav {
            background: #ffffff;
            border-bottom: 1px solid #e2e8f0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .app-nav .navbar {
            padding: 0.5rem 0;
        }
        
        .app-nav .navbar-brand img {
            max-height: 35px;
            transition: transform 0.3s ease;
        }
        
        .app-nav .navbar-brand img:hover {
            transform: scale(1.05);
        }
        
        .app-nav .nav-link {
            font-weight: 500;
            color: #4a5568 !important;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .app-nav .nav-link i {
            font-size: 1.1rem;
        }
        
        .app-nav .nav-link:hover {
            color: #0d6efd !important;
            background: #f0f4ff;
        }
        
        .app-nav .nav-link.active {
            color: #0d6efd !important;
            background: #f0f4ff;
        }
        
        .app-nav .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 3px;
            background: linear-gradient(135deg, #0d6efd, #00d2ff);
            border-radius: 10px;
        }
        
        .app-nav .user-section {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .app-nav .user-section .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0d6efd, #00d2ff);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.85rem;
        }
        
        .app-nav .user-section .user-name {
            font-weight: 500;
            color: #2d3748;
            font-size: 0.9rem;
        }
        
        .app-nav .user-section .user-role {
            font-size: 0.7rem;
            color: #718096;
        }
        
        /* Page Content */
        .page-content {
            padding: 2rem 0;
            min-height: 500px;
        }
        
        /* Footer */
        .app-footer {
            background: #ffffff;
            border-top: 1px solid #e2e8f0;
            padding: 3rem 0 1.5rem;
            margin-top: auto;
        }
        
        .app-footer .footer-brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .app-footer .footer-brand i {
            font-size: 2rem;
            color: #0d6efd;
        }
        
        .app-footer .footer-brand h5 {
            font-weight: 700;
            color: #2d3748;
            margin: 0;
        }
        
        .app-footer .footer-brand p {
            color: #718096;
            font-size: 0.85rem;
            margin: 0;
        }
        
        .app-footer .footer-card {
            transition: all 0.3s ease;
            border: 1px solid #e2e8f0;
            border-radius: 1rem;
            overflow: hidden;
            height: 100%;
        }
        
        .app-footer .footer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-color: #0d6efd;
        }
        
        .app-footer .footer-card .card-body {
            padding: 1.5rem;
        }
        
        .app-footer .footer-card .card-title {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }
        
        .app-footer .footer-card .card-text {
            color: #718096;
            font-size: 0.9rem;
        }
        
        .app-footer .footer-card .card-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            background: #f0f4ff;
            color: #0d6efd;
        }
        
        .app-footer .footer-bottom {
            border-top: 1px solid #e2e8f0;
            padding-top: 1.5rem;
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .app-footer .footer-bottom .copyright {
            color: #718096;
            font-size: 0.85rem;
        }
        
        .app-footer .footer-bottom .footer-links {
            display: flex;
            gap: 1.5rem;
        }
        
        .app-footer .footer-bottom .footer-links a {
            color: #718096;
            text-decoration: none;
            font-size: 0.85rem;
            transition: color 0.3s ease;
        }
        
        .app-footer .footer-bottom .footer-links a:hover {
            color: #0d6efd;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .app-header .header-content {
                flex-direction: column;
                text-align: center;
            }
            
            .app-header .brand h1 {
                font-size: 1.2rem;
            }
            
            .app-nav .navbar-collapse {
                background: white;
                padding: 1rem;
                border-radius: 0.75rem;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                margin-top: 0.5rem;
            }
            
            .app-nav .user-section {
                flex-direction: column;
                align-items: stretch;
                text-align: center;
            }
            
            .app-footer .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
            
            .app-footer .footer-bottom .footer-links {
                flex-wrap: wrap;
                justify-content: center;
            }
        }
        
        /* Flash Messages */
        .flash-messages {
            margin-bottom: 1.5rem;
        }
        
        .flash-messages .alert {
            border-radius: 0.75rem;
            border: none;
            padding: 1rem 1.25rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .flash-messages .alert i {
            font-size: 1.2rem;
        }
        
        .flash-messages .alert-success {
            background: #f0fff4;
            border-left: 4px solid #48bb78;
            color: #22543d;
        }
        
        .flash-messages .alert-danger {
            background: #fff5f5;
            border-left: 4px solid #fc8181;
            color: #742a2a;
        }
        
        .flash-messages .alert-warning {
            background: #fffbeb;
            border-left: 4px solid #f6ad55;
            color: #744210;
        }
        
        .flash-messages .alert-info {
            background: #ebf8ff;
            border-left: 4px solid #63b3ed;
            color: #2a4365;
        }
        
        /* Loading Spinner */
        #spinner {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 9999;
            background: white;
            padding: 0.75rem;
            border-radius: 50%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #0d6efd, #00d2ff);
            border-radius: 10px;
        }
        
        ::-webkit-scrollbar-thumb:hover {
            background: #0d6efd;
        }
    </style>
</head>

<body>

    <!-- Header -->
    <header class="app-header">
        <div class="container-lg">
            <div class="header-content">
                <div class="brand">
                    <div class="brand-icon">
                        <i class="bi bi-mortarboard-fill"></i>
                    </div>
                    <div>
                        <h1>UBS</h1>
                        <span class="subtitle">Student Management System</span>
                    </div>
                </div>
                <div class="header-actions">
                    <sec:ifNotLoggedIn>
                        <g:link uri="/login" class="btn btn-outline-light btn-sm px-3 py-2 rounded-pill">
                            <i class="bi bi-box-arrow-in-right me-1"></i> Login
                        </g:link>
                    </sec:ifNotLoggedIn>
                    <sec:ifLoggedIn>
                        <span class="text-white-50 small d-none d-md-inline">
                            <i class="bi bi-clock me-1"></i>
                            <span id="currentTime"></span>
                        </span>
                    </sec:ifLoggedIn>
                </div>
            </div>
        </div>
    </header>

    <!-- Navigation -->
    <nav class="app-nav">
        <div class="container-lg">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid px-0">
                    <a class="navbar-brand" href="${request.contextPath}/">
                        <asset:image src="grails.svg" alt="Grails Logo" style="max-height: 35px;"/>
                    </a>
                    
                    <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" 
                            data-bs-target="#navbarNav" aria-controls="navbarNav" 
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav me-auto gap-1">
                            <li class="nav-item">
                                <g:link class="nav-link" url="${request.contextPath}/">
                                    <i class="bi bi-house"></i> Home
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link class="nav-link" controller="hello">
                                    <i class="bi bi-hand-thumbs-up"></i> Hello
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link class="nav-link" controller="student">
                                    <i class="bi bi-people"></i> Students
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link class="nav-link" controller="course">
                                    <i class="bi bi-book"></i> Courses
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link class="nav-link" controller="enrollment">
                                    <i class="bi bi-journal"></i> Enrollments
                                </g:link>
                            </li>
                            <li class="nav-item">
                                <g:link class="nav-link" controller="dashboard">
                                    <i class="bi bi-speedometer2"></i> Dashboard
                                </g:link>
                            </li>
                        </ul>
                        
                        <!-- User Section -->
                        <sec:ifLoggedIn>
                            <div class="user-section">
                                <div class="user-avatar">
                                    <sec:loggedInUserInfo field="username" var="username"/>
                                    ${username?.charAt(0)?.toUpperCase() ?: 'U'}
                                </div>
                                <div class="d-none d-md-block">
                                    <div class="user-name">
                                        <sec:loggedInUserInfo field="username"/>
                                    </div>
                                    <div class="user-role">
                                      <sec:ifAnyGranted roles="ROLE_ADMIN">
                                              Administrator
                                      </sec:ifAnyGranted>

                                     <sec:ifAnyGranted roles="ROLE_USER">
                                       Intern
                                    </sec:ifAnyGranted>
                                </div>
                                </div>
                                <a href="${createLink(uri: '/logout')}" class="btn btn-outline-danger btn-sm rounded-pill px-3">
                                    <i class="bi bi-box-arrow-right me-1"></i> Logout
                                </a>
                            </div>
                        </sec:ifLoggedIn>
                    </div>
                </div>
            </nav>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container-lg">
            <div class="page-content">
                <!-- Flash Messages -->
                <div class="flash-messages">
                    <g:flashMessages/>
                </div>
                
                <!-- Page Content -->
                <g:layoutBody/>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="app-footer">
        <div class="container-lg">
            <div class="row g-4">
                <!-- Brand -->
                <div class="col-12 col-md-4">
                    <div class="footer-brand mb-3">
                        <i class="bi bi-mortarboard-fill"></i>
                        <div>
                            <h5>UBS University</h5>
                            <p>Excellence in Education</p>
                        </div>
                    </div>
                    <p class="text-muted small">
                        Empowering students with knowledge and skills for a brighter future.
                        <br>
                        <i class="bi bi-geo-alt"></i> Dubai, UAE
                    </p>
                </div>
                
                <!-- Quick Links -->
                <div class="col-12 col-md-8">
                    <div class="row g-3">
                        <div class="col-12 col-md-4">
                            <div class="footer-card card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="card-icon">
                                            <i class="bi bi-compass"></i>
                                        </div>
                                        <div>
                                            <h6 class="card-title mb-1">Guides</h6>
                                            <p class="card-text mb-0">Step-by-step tutorials</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="footer-card card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="card-icon">
                                            <i class="bi bi-book"></i>
                                        </div>
                                        <div>
                                            <h6 class="card-title mb-1">Docs</h6>
                                            <p class="card-text mb-0">Full documentation</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="footer-card card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="card-icon">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div>
                                            <h6 class="card-title mb-1">Community</h6>
                                            <p class="card-text mb-0">Join the conversation</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Footer Bottom -->
            <div class="footer-bottom">
                <div class="copyright">
                    <i class="bi bi-c-circle me-1"></i> 2026 UBS Intern Training. All rights reserved.
                </div>
                <div class="footer-links">
                    <a href="#"><i class="bi bi-question-circle me-1"></i> Help</a>
                    <a href="#"><i class="bi bi-shield me-1"></i> Privacy</a>
                    <a href="#"><i class="bi bi-file-text me-1"></i> Terms</a>
                    <a href="#"><i class="bi bi-envelope me-1"></i> Contact</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Loading Spinner -->
    <div id="spinner" style="display: none;">
        <div class="spinner-border spinner-border-sm text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Scripts -->
    <asset:javascript src="application.js"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Current time display
        function updateTime() {
            const timeElement = document.getElementById('currentTime');
            if (timeElement) {
                const now = new Date();
                timeElement.textContent = now.toLocaleTimeString('en-US', {
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit',
                    hour12: true
                });
            }
        }
        updateTime();
        setInterval(updateTime, 1000);
        
        // Active nav link highlighting
        document.addEventListener('DOMContentLoaded', function() {
            const currentPath = window.location.pathname;
            const navLinks = document.querySelectorAll('.app-nav .nav-link');
            
            navLinks.forEach(link => {
                const href = link.getAttribute('href');
                if (href && currentPath.includes(href) && href !== '/') {
                    link.classList.add('active');
                } else if (currentPath === '/' && href === '/') {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>

</html>