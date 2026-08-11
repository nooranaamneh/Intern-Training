<div class="card mb-4 shadow-lg border-0 rounded-4 overflow-hidden hover-card">
  <div class="card-body p-4">
    <!-- Header with avatar -->
    <div class="d-flex align-items-center mb-3">
      <div class="flex-shrink-0">
        <div class="avatar-circle bg-primary bg-gradient text-white d-flex align-items-center justify-content-center" style="width: 50px; height: 50px; border-radius: 50%; font-size: 20px; font-weight: 600;">
          ${student.name?.charAt(0)?.toUpperCase() ?: 'S'}
        </div>
      </div>
      <div class="flex-grow-1 ms-3">
        <h5 class="card-title mb-0 fw-bold text-primary">${student.name}</h5>
        <small class="text-muted">Student ID: ${student.studentNumber}</small>
      </div>
      <div>
        <span class="badge bg-success bg-opacity-10 text-success px-3 py-2 rounded-pill">
          <i class="bi bi-check-circle-fill me-1"></i>Active
        </span>
      </div>
    </div>

    <!-- Divider -->
    <hr class="my-3">

    <!-- Student details -->
    <div class="row g-3 mb-3">
      <div class="col-md-6">
        <div class="d-flex align-items-center p-2 rounded-3 bg-light">
          <div class="icon-box me-3 text-primary">
            <i class="bi bi-envelope-fill fs-5"></i>
          </div>
          <div>
            <small class="text-muted d-block">Email</small>
            <span class="fw-semibold">${student.email}</span>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="d-flex align-items-center p-2 rounded-3 bg-light">
          <div class="icon-box me-3 text-primary">
            <i class="bi bi-person-badge-fill fs-5"></i>
          </div>
          <div>
            <small class="text-muted d-block">Student Number</small>
            <span class="fw-semibold">${student.studentNumber}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Action buttons -->
    <div class="d-flex gap-2 mt-3">
      <g:link controller="student" action="show" id="${student.id}" class="btn btn-primary btn-sm px-4 py-2 rounded-pill fw-semibold shadow-sm">
        <i class="bi bi-eye me-1"></i> View Details
      </g:link>
      <g:link controller="student" action="edit" id="${student.id}" class="btn btn-outline-secondary btn-sm px-3 py-2 rounded-pill">
        <i class="bi bi-pencil me-1"></i> Edit
      </g:link>
    </div>
  </div>
</div>

<!-- Custom CSS for enhancements -->
<style>
  .hover-card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .hover-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.175) !important;
  }
  
  .avatar-circle {
    box-shadow: 0 0 0 3px rgba(13, 110, 253, 0.15);
  }
  
  .icon-box {
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .bg-light {
    background-color: #f8f9fa !important;
  }
  
  .btn-primary {
    background: linear-gradient(135deg, #0d6efd, #0a58ca);
    border: none;
  }
  
  .btn-primary:hover {
    background: linear-gradient(135deg, #0a58ca, #084298);
    transform: scale(1.02);
  }
  
  .badge.bg-success {
    background-color: #d1e7dd !important;
    color: #0f5132 !important;
  }
  
  .rounded-4 {
    border-radius: 1rem !important;
  }
  
  .card {
    border: 1px solid rgba(0, 0, 0, 0.05);
  }
</style>

<!-- Add Bootstrap Icons CDN (if not already included) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">