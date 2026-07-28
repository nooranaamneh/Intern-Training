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
    <h1>Create Enrollment</h1>
    <g:form action="save">
      <div>
        <label>Student</label>
        <g:select name="student.id" from="${Student.list()}" optionKey="id" optionValue="name" />
      </div>
      <br>
      <div>
        <label>Course</label>
        <g:select name="course.id" from="${Course.list()}" optionKey="id" optionValue="title" />
      </div>
      <br>
      <g:submitButton name="save" value="Save"/>
    </g:form>
  </body>
</html>