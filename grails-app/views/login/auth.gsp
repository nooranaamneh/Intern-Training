<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login - UBS University System</title>
    <style>
        .login-wrapper {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
        }
        .login-header {
            background: linear-gradient(135deg, #0d6efd 0%, #0a4fc2 100%);
            color: #4a3f2f;
            padding: 2.5rem 2rem;
            text-align: center;
        }
        .login-header h2 {
            font-weight: 800;
            letter-spacing: 2px;
            margin-bottom: 0.25rem;
        }
        .login-body {
            padding: 2rem 2.5rem 2.5rem;
        }
        .btn-login {
            background: linear-gradient(135deg, #0d6efd 0%, #0a4fc2 100%);
            border: none;
            padding: 0.65rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .btn-login:hover {
            opacity: 0.9;
        }
        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.15);
        }
    </style>
</head>
<body>
<div class="login-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-lg-4">
                <div class="card login-card shadow-lg">
                    <div class="login-header">
    <asset:image src="logo.png" alt="UBS Logo" style="max-height: 300px; margin-bottom: 40px;"/>
    </div>
                    <div class="login-body">

                        <g:if test="${flash.message}">
                            <div class="alert alert-danger py-2">${flash.message}</div>
                        </g:if>

                        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                            <div class="mb-3">
                                <label for="username" class="form-label fw-semibold">Email</label>
                                <input type="text" class="form-control" name="username" id="username"
                                       placeholder="you@ubs.com" autofocus="autofocus"/>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label fw-semibold">Password</label>
                                <input type="password" class="form-control" name="password" id="password"
                                       placeholder="••••••••"/>
                            </div>

                            <div class="mb-4 form-check">
                                <input type="checkbox" class="form-check-input" name="remember-me" id="remember_me"/>
                                <label class="form-check-label" for="remember_me">Remember me</label>
                            </div>

                            <button type="submit" class="btn btn-login btn-primary w-100 text-white">Log In</button>
                        </form>

                    </div>
                </div>
                <p class="text-center text-muted mt-3 small">UBS Intern Training &copy; 2026</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>