<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Enrollments</title>
</head>
<body>
<h1>Enrollments</h1>
<table border="1" class="table table-striped table-sm">
<thead>
    <tr>
        <th>Student</th>
        <th>Course</th>
        <th>Grade</th>
        <th>Enrolled At</th>
    </tr>
</thead>
<tbody>
    <g:each in="${enrollmentList}" var="e">
        <tr>
            <td>${e.student?.name}</td>
            <td>${e.course?.title}</td>
            <td>${e.grade}</td>
            <td><g:formatDate date="${e.enrollAt}" format="dd-MM-yyyy"/></td>
        </tr>
    </g:each>
</tbody>
</table>
<br>
<g:link action="create" class="btn btn-primary">Add New Enrollment</g:link>
</body>
</html>