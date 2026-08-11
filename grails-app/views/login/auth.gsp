<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login - UBS University System</title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Global Reset */
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        
        .login-wrapper {
            min-height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
        }
        
        .login-card {
            border: none;
            border-radius: 1.5rem;
            overflow: hidden;
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.98);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.2);
        }
        
        .login-header {
            background: linear-gradient(135deg, #1a2a6c 0%, #0d6efd 50%, #00d2ff 100%);
            color: white;
            padding: 2.5rem 2rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .login-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -30%;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .login-header::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -20%;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .login-header .logo-wrapper {
            position: relative;
            z-index: 1;
        }
        
        .login-header .logo-wrapper img {
            max-height: 80px;
            margin-bottom: 0.5rem;
            filter: brightness(0) invert(1);
            transition: transform 0.3s ease;
        }
        
        .login-header .logo-wrapper img:hover {
            transform: scale(1.05);
        }
        
        .login-header .brand-text {
            position: relative;
            z-index: 1;
        }
        
        .login-header .brand-text h2 {
            font-weight: 800;
            letter-spacing: 2px;
            margin-bottom: 0.25rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .login-header .brand-text .subtitle {
            font-weight: 300;
            opacity: 0.9;
            font-size: 0.9rem;
        }
        
        .login-header .brand-text .divider-line {
            width: 50px;
            height: 3px;
            background: white;
            margin: 0.5rem auto;
            border-radius: 10px;
        }
        
        .login-body {
            padding: 2.5rem 2.5rem 2rem;
        }
        
        .login-body .welcome-text {
            font-size: 0.95rem;
            color: #6c757d;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .login-body .welcome-text i {
            color: #0d6efd;
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
            color: #0d6efd;
            font-size: 0.9rem;
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
        
        .input-group-custom .form-control {
            padding-left: 2.8rem;
            padding-right: 1rem;
            padding-top: 0.65rem;
            padding-bottom: 0.65rem;
            border-radius: 0.75rem;
            border: 2px solid #e2e8f0;
            background: #f7fafc;
            transition: all 0.3s ease;
        }
        
        .input-group-custom .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
            background: #ffffff;
        }
        
        .input-group-custom .form-control:focus ~ .input-icon,
        .input-group-custom .form-control:focus + .input-icon {
            color: #0d6efd;
        }
        
        .input-group-custom .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #a0aec0;
            cursor: pointer;
            z-index: 10;
            transition: color 0.3s ease;
        }
        
        .input-group-custom .password-toggle:hover {
            color: #4a5568;
        }
        
        .form-check-custom {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-check-custom .form-check-input {
            width: 18px;
            height: 18px;
            border-radius: 4px;
            border: 2px solid #e2e8f0;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .form-check-custom .form-check-input:checked {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        
        .form-check-custom .form-check-label {
            color: #4a5568;
            font-size: 0.9rem;
            cursor: pointer;
        }
        
        .btn-login {
            background: linear-gradient(135deg, #0d6efd 0%, #0a4fc2 100%);
            border: none;
            padding: 0.75rem;
            border-radius: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(13, 110, 253, 0.3);
            color: white;
            width: 100%;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(13, 110, 253, 0.4);
            color: white;
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        .btn-login i {
            margin-right: 0.5rem;
        }
        
        .login-footer {
            text-align: center;
            padding-top: 1.5rem;
            border-top: 1px solid #e2e8f0;
            margin-top: 1.5rem;
        }
        
        .login-footer .footer-links {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
            flex-wrap: wrap;
        }
        
        .login-footer .footer-links a {
            color: #6c757d;
            font-size: 0.8rem;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .login-footer .footer-links a:hover {
            color: #0d6efd;
        }
        
        .alert-custom {
            border-radius: 0.75rem;
            border: none;
            padding: 0.75rem 1rem;
            background: #fff5f5;
            border-left: 4px solid #fc8181;
            color: #742a2a;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .alert-custom i {
            font-size: 1.2rem;
            color: #fc8181;
        }
        
        .alert-custom-success {
            background: #f0fff4;
            border-left: 4px solid #48bb78;
            color: #22543d;
        }
        
        .alert-custom-success i {
            color: #48bb78;
        }
        
        .alert-custom .close-btn {
            margin-left: auto;
            background: none;
            border: none;
            color: inherit;
            font-size: 1.2rem;
            cursor: pointer;
            opacity: 0.5;
            transition: opacity 0.3s ease;
        }
        
        .alert-custom .close-btn:hover {
            opacity: 1;
        }
        
        .copyright-text {
            color: #a0aec0;
            font-size: 0.8rem;
            margin-top: 1.5rem;
            text-align: center;
        }
        
        .copyright-text i {
            margin: 0 0.25rem;
        }
        
        /* Animation */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .login-card {
            animation: fadeInUp 0.6s ease-out;
        }
        
        /* Loading Spinner */
        .btn-login .spinner {
            display: none;
        }
        
        .btn-login.loading .spinner {
            display: inline-block;
        }
        
        .btn-login.loading .btn-text {
            display: none;
        }
        
        @media (max-width: 768px) {
            .login-body {
                padding: 1.5rem;
            }
            
            .login-header {
                padding: 2rem 1.5rem;
            }
            
            .login-header .logo-wrapper img {
                max-height: 60px;
            }
            
            .login-footer .footer-links {
                flex-direction: column;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
<div class="login-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5 col-xl-4">
                <div class="card login-card">
                    <!-- Header -->
                    <div class="login-header">
                        <div class="logo-wrapper">
                            <asset:image src="logo.png" alt="UBS Logo" />
                        </div>
                        <div class="brand-text">
                            <h2>UBS</h2>
                            <div class="divider-line"></div>
                            <p class="subtitle">Student Management System</p>
                        </div>
                    </div>
                    
                    <!-- Body -->
                    <div class="login-body">
                        <div class="welcome-text">
                            <i class="bi bi-shield-lock me-1"></i>
                            Welcome back! Please login to your account
                        </div>
                        
                        <!-- Flash Messages -->
                        <g:if test="${flash.message}">
                            <div class="alert alert-custom mb-3 ${flash.messageType ?: 'alert-danger'}">
                                <i class="bi bi-exclamation-circle"></i>
                                <span>${flash.message}</span>
                                <button type="button" class="close-btn" onclick="this.parentElement.remove()">
                                    <i class="bi bi-x"></i>
                                </button>
                            </div>
                        </g:if>
                        
                        <!-- Login Form -->
                        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                            <!-- Username Field -->
                            <div class="mb-3">
                                <label for="username" class="form-label-custom">
                                    <i class="bi bi-envelope"></i>
                                    Email Address
                                </label>
                                <div class="input-group-custom">
                                    <i class="bi bi-envelope input-icon"></i>
                                    <input type="text" 
                                           class="form-control" 
                                           name="username" 
                                           id="username"
                                           placeholder="you@ubs.edu" 
                                           autofocus="autofocus"
                                           required />
                                </div>
                            </div>
                            
                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="password" class="form-label-custom">
                                    <i class="bi bi-lock"></i>
                                    Password
                                </label>
                                <div class="input-group-custom">
                                    <i class="bi bi-lock input-icon"></i>
                                    <input type="password" 
                                           class="form-control" 
                                           name="password" 
                                           id="password"
                                           placeholder="Enter your password" 
                                           required />
                                    <button type="button" class="password-toggle" onclick="togglePasswordVisibility()">
                                        <i class="bi bi-eye" id="passwordToggleIcon"></i>
                                    </button>
                                </div>
                            </div>
                            
                            <!-- Remember Me -->
                            <div class="form-check-custom">
                                <input type="checkbox" class="form-check-input" name="remember-me" id="remember_me" />
                                <label class="form-check-label" for="remember_me">
                                    <i class="bi bi-check-circle me-1"></i>
                                    Remember me
                                </label>
                                <a href="#" class="ms-auto text-decoration-none small" style="color: #0d6efd;">
                                    Forgot Password?
                                </a>
                            </div>
                            
                            <!-- Login Button -->
                            <button type="submit" class="btn btn-login" id="loginButton">
                                <i class="bi bi-box-arrow-in-right"></i>
                                <span class="btn-text">Log In</span>
                                <span class="spinner">
                                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                    Logging in...
                                </span>
                            </button>
                            
                            <!-- Footer Links -->
                            <div class="login-footer">
                                <div class="footer-links">
                                    <a href="#"><i class="bi bi-question-circle"></i> Help</a>
                                    <a href="#"><i class="bi bi-shield"></i> Privacy</a>
                                    <a href="#"><i class="bi bi-file-text"></i> Terms</a>
                                    <a href="#"><i class="bi bi-envelope"></i> Contact</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <!-- Copyright -->
                <p class="copyright-text">
                    <i class="bi bi-c-circle"></i> 2026 UBS Intern Training. All rights reserved.
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    // Toggle password visibility
    function togglePasswordVisibility() {
        const passwordField = document.getElementById('password');
        const toggleIcon = document.getElementById('passwordToggleIcon');
        
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.className = 'bi bi-eye-slash';
        } else {
            passwordField.type = 'password';
            toggleIcon.className = 'bi bi-eye';
        }
    }
    
    // Auto-dismiss flash messages after 5 seconds
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert-custom');
        alerts.forEach(alert => {
            setTimeout(() => {
                if (alert) {
                    alert.style.transition = 'opacity 0.5s ease';
                    alert.style.opacity = '0';
                    setTimeout(() => alert.remove(), 500);
                }
            }, 5000);
        });
        
        // Add loading state to login button
        const loginForm = document.getElementById('loginForm');
        const loginButton = document.getElementById('loginButton');
        
        if (loginForm) {
            loginForm.addEventListener('submit', function(e) {
                // Show loading state
                loginButton.classList.add('loading');
                loginButton.disabled = true;
                
                // Allow form to submit
                setTimeout(() => {
                    // This will only run if the form submission doesn't redirect immediately
                    loginButton.classList.remove('loading');
                    loginButton.disabled = false;
                }, 10000);
            });
        }
    });
</script>
</body>
</html>