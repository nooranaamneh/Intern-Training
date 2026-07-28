<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Update Grade</title>
</head>
<body>
    <h1>Update Grade</h1>

    <p>Student: ${enrollment.student.name}</p>
    <p>Course: ${enrollment.course.title}</p>

    <g:form controller="enrollment" action="updateGrade" id="${enrollment.id}">
        <label>Grade:</label>
        <input type="number" name="grade" value="${enrollment.grade}"/>
        <button type="submit">Save Grade</button>
    </g:form>
</body>
</html>