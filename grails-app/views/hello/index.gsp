<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Hello - UBS University System</title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Hello Page Specific Styles */
        .hello-hero {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            border-radius: 1.5rem;
            padding: 3rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(245, 87, 108, 0.25);
        }
        
        .hello-hero::before {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            animation: float 20s ease-in-out infinite;
        }
        
        .hello-hero::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -5%;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 50%;
            animation: float 25s ease-in-out infinite reverse;
        }
        
        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(30px, -20px) rotate(10deg); }
        }
        
        .hello-hero .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .hello-hero .greeting-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 0.5rem 1.25rem;
            border-radius: 50rem;
            font-size: 0.85rem;
            font-weight: 500;
            margin-bottom: 1rem;
        }
        
        .hello-hero .greeting-badge .wave {
            animation: wave 2.5s ease-in-out infinite;
            display: inline-block;
            font-size: 1.2rem;
        }
        
        @keyframes wave {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(15deg); }
            50% { transform: rotate(-5deg); }
            75% { transform: rotate(10deg); }
        }
        
        .hello-hero h1 {
            font-size: 3rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .hello-hero h1 .highlight {
            background: rgba(255, 255, 255, 0.2);
            padding: 0.1rem 0.75rem;
            border-radius: 0.5rem;
            display: inline-block;
        }
        
        .hello-hero .subtitle {
            font-size: 1.15rem;
            opacity: 0.9;
            max-width: 600px;
            line-height: 1.6;
        }
        
        .hello-hero .datetime-display {
            display: inline-flex;
            align-items: center;
            gap: 1rem;
            background: rgba(255, 255, 255, 0.12);
            backdrop-filter: blur(10px);
            padding: 0.75rem 1.5rem;
            border-radius: 1rem;
            margin-top: 1.5rem;
            font-family: 'Courier New', monospace;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .hello-hero .datetime-display .date-part {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .hello-hero .datetime-display .date-part i {
            font-size: 1.2rem;
        }
        
        .hello-hero .datetime-display .time-part {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.3rem;
            font-weight: 600;
        }
        
        .hello-hero .datetime-display .time-part .blink {
            animation: blink 1s step-end infinite;
        }
        
        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0; }
        }
        
        /* Info Cards */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .info-card {
            background: white;
            border-radius: 1.25rem;
            padding: 1.5rem;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            text-align: center;
        }
        
        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-color: #f5576c;
        }
        
        .info-card .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin: 0 auto 1rem;
        }
        
        .info-card .card-icon.pink {
            background: #fff5f5;
            color: #f5576c;
        }
        
        .info-card .card-icon.blue {
            background: #ebf8ff;
            color: #0d6efd;
        }
        
        .info-card .card-icon.green {
            background: #f0fff4;
            color: #48bb78;
        }
        
        .info-card .card-icon.purple {
            background: #faf5ff;
            color: #805ad5;
        }
        
        .info-card .card-number {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            display: block;
        }
        
        .info-card .card-label {
            color: #718096;
            font-size: 0.9rem;
            font-weight: 500;
        }
        
        /* Message Cards */
        .message-card {
            background: white;
            border-radius: 1.25rem;
            padding: 1.5rem 2rem;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            display: flex;
            align-items: center;
            gap: 1.5rem;
            transition: all 0.3s ease;
        }
        
        .message-card:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }
        
        .message-card .message-icon {
            font-size: 2.5rem;
            color: #f5576c;
            flex-shrink: 0;
        }
        
        .message-card .message-content {
            flex: 1;
        }
        
        .message-card .message-content h5 {
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 0.25rem;
        }
        
        .message-card .message-content p {
            color: #718096;
            margin: 0;
        }
        
        /* Quick Links */
        .quick-links {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            margin-top: 1rem;
        }
        
        .quick-links .btn-custom {
            padding: 0.6rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .quick-links .btn-custom:hover {
            transform: translateY(-2px);
        }
        
        .quick-links .btn-primary-custom {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }
        
        .quick-links .btn-primary-custom:hover {
            box-shadow: 0 6px 25px rgba(245, 87, 108, 0.4);
            color: white;
        }
        
        .quick-links .btn-outline-custom {
            background: transparent;
            color: #4a5568;
            border: 2px solid #e2e8f0;
        }
        
        .quick-links .btn-outline-custom:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            color: #4a5568;
        }
        
        /* Fun Facts */
        .fun-facts {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1.5rem;
            padding: 1.5rem;
            background: #f7fafc;
            border-radius: 1rem;
        }
        
        .fun-facts .fact-item {
            text-align: center;
        }
        
        .fun-facts .fact-item .fact-emoji {
            font-size: 1.5rem;
            display: block;
            margin-bottom: 0.25rem;
        }
        
        .fun-facts .fact-item .fact-text {
            font-size: 0.85rem;
            color: #718096;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .hello-hero {
                padding: 2rem 1.5rem;
                text-align: center;
            }
            
            .hello-hero h1 {
                font-size: 2rem;
            }
            
            .hello-hero .subtitle {
                font-size: 1rem;
                margin-left: auto;
                margin-right: auto;
            }
            
            .hello-hero .datetime-display {
                flex-direction: column;
                align-items: center;
                gap: 0.5rem;
            }
            
            .info-grid {
                grid-template-columns: 1fr 1fr;
            }
            
            .message-card {
                flex-direction: column;
                text-align: center;
                padding: 1.5rem;
            }
            
            .quick-links {
                justify-content: center;
            }
            
            .fun-facts {
                grid-template-columns: 1fr 1fr;
            }
        }
        
        @media (max-width: 480px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .fun-facts {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="hello-hero">
        <div class="hero-content">
            <div class="greeting-badge">
                <span class="wave">👋</span>
                Welcome to UBS Intern Training
            </div>
            
            <h1>
                Hello from 
                <span class="highlight">UBS University</span>
            </h1>
            
            <p class="subtitle">
                Your journey to mastering Grails and building enterprise-grade applications 
                starts here. We're excited to have you on board!
            </p>
            
            <div class="datetime-display">
                <div class="date-part">
                    <i class="bi bi-calendar3"></i>
                    <span id="currentDate"><g:formatDate format="EEEE, MMMM dd, yyyy" date="${new Date()}"/></span>
                </div>
                <span style="opacity:0.3;">|</span>
                <div class="time-part">
                    <i class="bi bi-clock"></i>
                    <span id="currentTime"></span>
                    <span class="blink">:</span>
                    <span id="currentSeconds"></span>
                </div>
            </div>
        </div>
    </div>

    <!-- Info Cards -->
    <div class="info-grid">
        <div class="info-card">
            <div class="card-icon pink">
                <i class="bi bi-people"></i>
            </div>
            <span class="card-number">${studentCount ?: 0}</span>
            <span class="card-label">Total Students</span>
        </div>
        
        <div class="info-card">
            <div class="card-icon blue">
                <i class="bi bi-book"></i>
            </div>
            <span class="card-number">${courseCount ?: 0}</span>
            <span class="card-label">Total Courses</span>
        </div>
        
        <div class="info-card">
            <div class="card-icon green">
                <i class="bi bi-journal"></i>
            </div>
            <span class="card-number">${enrollmentCount ?: 0}</span>
            <span class="card-label">Total Enrollments</span>
        </div>
        
        <div class="info-card">
            <div class="card-icon purple">
                <i class="bi bi-clock-history"></i>
            </div>
            <span class="card-number" id="uptime">Loading...</span>
            <span class="card-label">System Uptime</span>
        </div>
    </div>

    <!-- Message Card -->
    <div class="message-card mb-4">
        <div class="message-icon">
            <i class="bi bi-chat-dots-fill"></i>
        </div>
        <div class="message-content">
            <h5>Welcome to the Training Program!</h5>
            <p>
                This is your first Grails application. Explore the features, build your skills, 
                and don't hesitate to ask questions. Happy coding!
            </p>
        </div>
        <div class="quick-links">
            <g:link controller="student" action="index" class="btn-custom btn-primary-custom">
                <i class="bi bi-arrow-right"></i> Get Started
            </g:link>
        </div>
    </div>

    <!-- Fun Facts & Additional Info -->
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body p-4">
                    <h5 class="fw-bold mb-3">
                        <i class="bi bi-lightbulb-fill text-warning me-2"></i>
                        Did You Know?
                    </h5>
                    <div class="fun-facts">
                        <div class="fact-item">
                            <span class="fact-emoji">🎓</span>
                            <span class="fact-text">Grails uses Groovy</span>
                        </div>
                        <div class="fact-item">
                            <span class="fact-emoji">⚡</span>
                            <span class="fact-text">Convention over Configuration</span>
                        </div>
                        <div class="fact-item">
                            <span class="fact-emoji">🚀</span>
                            <span class="fact-text">Rapid Development</span>
                        </div>
                        <div class="fact-item">
                            <span class="fact-emoji">🔒</span>
                            <span class="fact-text">Built-in Security</span>
                        </div>
                        <div class="fact-item">
                            <span class="fact-emoji">📦</span>
                            <span class="fact-text">GORM ORM Framework</span>
                        </div>
                        <div class="fact-item">
                            <span class="fact-emoji">🌐</span>
                            <span class="fact-text">RESTful by Default</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body p-4">
                    <h5 class="fw-bold mb-3">
                        <i class="bi bi-link-45deg text-primary me-2"></i>
                        Quick Links
                    </h5>
                    <div class="d-flex flex-column gap-2">
                        <g:link controller="student" action="index" class="text-decoration-none text-secondary py-1 hover-link">
                            <i class="bi bi-people me-2 text-primary"></i> View Students
                        </g:link>
                        <g:link controller="course" action="index" class="text-decoration-none text-secondary py-1 hover-link">
                            <i class="bi bi-book me-2 text-success"></i> View Courses
                        </g:link>
                        <g:link controller="enrollment" action="index" class="text-decoration-none text-secondary py-1 hover-link">
                            <i class="bi bi-journal me-2 text-warning"></i> View Enrollments
                        </g:link>
                        <g:link controller="dashboard" action="index" class="text-decoration-none text-secondary py-1 hover-link">
                            <i class="bi bi-speedometer2 me-2 text-info"></i> Go to Dashboard
                        </g:link>
                    </div>
                    <style>
                        .hover-link:hover {
                            color: #0d6efd !important;
                            transform: translateX(5px);
                            transition: all 0.3s ease;
                        }
                    </style>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Live Clock
        function updateClock() {
            const now = new Date();
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            const seconds = String(now.getSeconds()).padStart(2, '0');
            
            const timeElement = document.getElementById('currentTime');
            const secondsElement = document.getElementById('currentSeconds');
            
            if (timeElement) timeElement.textContent = hours + ':' + minutes;
            if (secondsElement) secondsElement.textContent = seconds;
        }
        
        updateClock();
        setInterval(updateClock, 1000);
        
        // Simulate uptime
        function formatUptime(seconds) {
            const days = Math.floor(seconds / 86400);
            const hours = Math.floor((seconds % 86400) / 3600);
            const minutes = Math.floor((seconds % 3600) / 60);
            
            if (days > 0) {
                return days + 'd ' + hours + 'h ' + minutes + 'm';
            } else if (hours > 0) {
                return hours + 'h ' + minutes + 'm';
            } else {
                return minutes + 'm';
            }
        }
        
        // Start uptime counter from a base value
        let uptimeSeconds = 3600; // 1 hour
        const uptimeElement = document.getElementById('uptime');
        
        if (uptimeElement) {
            uptimeElement.textContent = formatUptime(uptimeSeconds);
            setInterval(() => {
                uptimeSeconds++;
                uptimeElement.textContent = formatUptime(uptimeSeconds);
            }, 1000);
        }
    </script>
</body>
</html>