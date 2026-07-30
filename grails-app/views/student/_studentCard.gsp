<div class="card mb-3 shadow-sm">
  <div class="card-body">
    <h5 class="card-title">${student.name}</h5>
    <p class="card-text mb-1"><strong>Email:</strong> ${student.email}</p>
    <p class="card-text mb-1"><strong>Student Number:</strong> ${student.studentNumber}</p>
    <g:link controller="student" action="show" id="${student.id}" class="btn btn-sm btn-primary">
        View Details
    </g:link>
  </div>
</div>