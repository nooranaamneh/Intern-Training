<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main"/>
    <title>Enrollments</title>
</head>
<body>

<h1>Enrollments</h1>

<table border="1">
    <tr>
        <th>Student</th>
        <th>Course</th>
        <th>Grade</th>
    </tr>

    <g:each in="${enrollmentList}" var="e">
        <tr>
            <td>${e.student?.name}</td>
            <td>${e.course?.title}</td>
            <td>${e.grade}</td>
        </tr>
    </g:each>

</table>

<br>

<g:link action="create">Add New Enrollment</g:link>

</body>
</html>