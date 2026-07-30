<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="university.Student" %>
<%@ page import="university.Course" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Create Enrollment</title>
  </head>
  <body>
    <h1>Create Enrollment</h1><br>
    <g:form action="save">
      <div class="mb-3">
        <label for="student.id" class="form-label">Student </label>
        <g:select name="student.id" from="${Student.list()}" optionKey="id" optionValue="name" class="form-select"/>
      </div>
      <div class="mb-3">
        <label for="course.id" class="form-label">Course </label>
        <g:select name="course.id" from="${Course.list()}" optionKey="id" optionValue="title" class="form-select" />
      </div>
      <g:submitButton name="save" value="Save" class="btn btn-primary"/>
    </g:form>
  </body>
</html>