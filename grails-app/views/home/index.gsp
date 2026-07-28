<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Home</title>
</head>
<body>
    <h1>Welcome to University App</h1>

    <ul>
        <li><g:link controller="hello" action="index">Hello Page</g:link></li>
        <li><g:link controller="student" action="index">Students</g:link></li>
        <li><g:link controller="course" action="index">Courses</g:link></li>
        <li><g:link controller="enrollment" action="index">Enrollments</g:link></li>
    </ul>
</body>
</html>