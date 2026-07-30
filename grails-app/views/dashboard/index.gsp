<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
 <head>
  <meta name="layout" content="main"/>
  <title>DashBoard</title>
 </head>
 <body>
  <div class="container">
   <h1 class="mb-4">DashBoard</h1>
   <div class="row g-4">
    <div class="col-12 col-md-4">
     <div class="card text-center shadow-sm">
      <div class="card-body">
       <h5 class="card-title">Total Students</h5>
       <p class="display-4">${studentCount}</p>
      </div>
     </div>
    </div>
    <div class="col-12 col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Courses</h5>
                        <p class="display-4">${courseCount}</p>
                    </div>
                </div>
            </div>
    
    <div class="col-12 col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Enrollments</h5>
                        <p class="display-4">${enrollmentCount}</p>
                    </div>
                </div>
            </div>
   </div>
  </div>
 </body>
</html>