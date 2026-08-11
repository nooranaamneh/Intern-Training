<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
 <head>
  <meta name="layout" content="main"/>
  <title>Dashboard - UBS University</title>
  
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  
  <style>
   /* Dashboard Specific Styles */
   .dashboard-hero {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 1.5rem;
    padding: 2rem 2.5rem;
    color: white;
    position: relative;
    overflow: hidden;
    margin-bottom: 2rem;
    box-shadow: 0 10px 40px rgba(102, 126, 234, 0.25);
   }
   
   .dashboard-hero::before {
    content: '';
    position: absolute;
    top: -30%;
    right: -10%;
    width: 350px;
    height: 350px;
    background: rgba(255, 255, 255, 0.08);
    border-radius: 50%;
    animation: float 20s ease-in-out infinite;
   }
   
   .dashboard-hero::after {
    content: '';
    position: absolute;
    bottom: -40%;
    left: -5%;
    width: 250px;
    height: 250px;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 50%;
    animation: float 25s ease-in-out infinite reverse;
   }
   
   @keyframes float {
    0%, 100% { transform: translate(0, 0) rotate(0deg); }
    50% { transform: translate(30px, -20px) rotate(10deg); }
   }
   
   .dashboard-hero .hero-content {
    position: relative;
    z-index: 1;
   }
   
   .dashboard-hero h1 {
    font-weight: 800;
    letter-spacing: -0.5px;
    margin-bottom: 0.25rem;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    gap: 0.75rem;
   }
   
   .dashboard-hero p {
    opacity: 0.9;
    margin: 0;
    font-size: 1rem;
   }
   
   .dashboard-hero .breadcrumb-custom {
    display: flex;
    gap: 0.5rem;
    align-items: center;
    font-size: 0.85rem;
    opacity: 0.8;
    margin-top: 0.5rem;
   }
   
   .dashboard-hero .breadcrumb-custom a {
    color: white;
    text-decoration: none;
   }
   
   .dashboard-hero .breadcrumb-custom a:hover {
    text-decoration: underline;
   }
   
   /* Stats Cards */
   .stat-card {
    border: none;
    border-radius: 1.25rem;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
    position: relative;
   }
   
   .stat-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.15);
   }
   
   .stat-card .card-body {
    padding: 1.5rem;
    position: relative;
    z-index: 1;
   }
   
   .stat-card .stat-icon {
    position: absolute;
    right: 1.5rem;
    top: 1.5rem;
    font-size: 2.5rem;
    opacity: 0.15;
    transition: all 0.3s ease;
   }
   
   .stat-card:hover .stat-icon {
    opacity: 0.25;
    transform: scale(1.1) rotate(5deg);
   }
   
   .stat-card .stat-number {
    font-size: 2.5rem;
    font-weight: 800;
    color: #2d3748;
    margin-bottom: 0.25rem;
    line-height: 1.2;
   }
   
   .stat-card .stat-label {
    font-size: 0.9rem;
    font-weight: 600;
    color: #718096;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 0.5rem;
   }
   
   .stat-card .stat-change {
    display: inline-flex;
    align-items: center;
    gap: 0.3rem;
    font-size: 0.8rem;
    font-weight: 600;
    padding: 0.2rem 0.6rem;
    border-radius: 50rem;
   }
   
   .stat-card .stat-change.positive {
    background: #c6f6d5;
    color: #22543d;
   }
   
   .stat-card .stat-change.negative {
    background: #fed7d7;
    color: #742a2a;
   }
   
   .stat-card .stat-change.neutral {
    background: #e2e8f0;
    color: #4a5568;
   }
   
   .stat-card.blue {
    background: linear-gradient(135deg, #ebf8ff, #bee3f8);
   }
   
   .stat-card.blue .stat-icon {
    color: #0d6efd;
   }
   
   .stat-card.green {
    background: linear-gradient(135deg, #f0fff4, #c6f6d5);
   }
   
   .stat-card.green .stat-icon {
    color: #48bb78;
   }
   
   .stat-card.purple {
    background: linear-gradient(135deg, #faf5ff, #e9d5ff);
   }
   
   .stat-card.purple .stat-icon {
    color: #805ad5;
   }
   
   .stat-card.orange {
    background: linear-gradient(135deg, #fffbeb, #fefcbf);
   }
   
   .stat-card.orange .stat-icon {
    color: #ed8936;
   }
   
   .stat-card.pink {
    background: linear-gradient(135deg, #fff5f5, #fed7d7);
   }
   
   .stat-card.pink .stat-icon {
    color: #f5576c;
   }
   
   /* Chart Cards */
   .chart-card {
    border: none;
    border-radius: 1.25rem;
    overflow: hidden;
    box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    height: 100%;
   }
   
   .chart-card:hover {
    box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.12);
   }
   
   .chart-card .card-header {
    background: transparent;
    border-bottom: 1px solid #f0f0f0;
    padding: 1.25rem 1.5rem;
   }
   
   .chart-card .card-header .card-title {
    font-weight: 700;
    color: #2d3748;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 0.5rem;
   }
   
   .chart-card .card-header .card-title i {
    color: #667eea;
   }
   
   .chart-card .card-body {
    padding: 1.5rem;
   }
   
   /* Activity List */
   .activity-list {
    list-style: none;
    padding: 0;
    margin: 0;
   }
   
   .activity-list li {
    display: flex;
    align-items: flex-start;
    gap: 0.75rem;
    padding: 0.6rem 0;
    border-bottom: 1px solid #f0f0f0;
   }
   
   .activity-list li:last-child {
    border-bottom: none;
   }
   
   .activity-list li .activity-icon {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.8rem;
    flex-shrink: 0;
    margin-top: 0.1rem;
   }
   
   .activity-list li .activity-icon.blue {
    background: #ebf8ff;
    color: #0d6efd;
   }
   
   .activity-list li .activity-icon.green {
    background: #f0fff4;
    color: #48bb78;
   }
   
   .activity-list li .activity-icon.purple {
    background: #faf5ff;
    color: #805ad5;
   }
   
   .activity-list li .activity-icon.orange {
    background: #fffbeb;
    color: #ed8936;
   }
   
   .activity-list li .activity-content {
    flex: 1;
   }
   
   .activity-list li .activity-content .activity-text {
    font-weight: 500;
    color: #2d3748;
    font-size: 0.9rem;
   }
   
   .activity-list li .activity-content .activity-time {
    font-size: 0.75rem;
    color: #a0aec0;
   }
   
   /* Quick Links */
   .quick-links-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: 0.75rem;
   }
   
   .quick-links-grid .quick-link-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 1rem;
    border-radius: 0.75rem;
    background: #f7fafc;
    transition: all 0.3s ease;
    text-decoration: none;
    color: #4a5568;
    border: 1px solid transparent;
   }
   
   .quick-links-grid .quick-link-item:hover {
    background: #edf2f7;
    border-color: #667eea;
    transform: translateY(-3px);
    text-decoration: none;
    color: #2d3748;
   }
   
   .quick-links-grid .quick-link-item i {
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
   }
   
   .quick-links-grid .quick-link-item .link-label {
    font-size: 0.75rem;
    font-weight: 500;
    text-align: center;
   }
   
   /* Responsive */
   @media (max-width: 768px) {
    .dashboard-hero {
     padding: 1.5rem;
     text-align: center;
    }
    
    .dashboard-hero h1 {
     font-size: 1.5rem;
     justify-content: center;
    }
    
    .dashboard-hero .breadcrumb-custom {
     justify-content: center;
    }
    
    .stat-card .stat-number {
     font-size: 2rem;
    }
    
    .stat-card .stat-icon {
     font-size: 2rem;
     right: 1rem;
     top: 1rem;
    }
    
    .quick-links-grid {
     grid-template-columns: repeat(2, 1fr);
    }
   }
   
   @media (max-width: 480px) {
    .quick-links-grid {
     grid-template-columns: 1fr;
    }
   }
  </style>
 </head>
 <body>
  <!-- Hero Section -->
  <div class="dashboard-hero">
   <div class="hero-content">
    <h1>
     <i class="bi bi-speedometer2"></i>
     Dashboard
    </h1>
    <p>Overview of your university management system</p>
    <div class="breadcrumb-custom">
     <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
     <span>/</span>
     <span>Dashboard</span>
    </div>
   </div>
  </div>

  <!-- Stats Cards -->
  <div class="row g-4 mb-4">
   <div class="col-12 col-sm-6 col-xl-3">
    <div class="card stat-card blue">
     <div class="card-body">
      <div class="stat-icon">
       <i class="bi bi-people"></i>
      </div>
      <div class="stat-label">Total Students</div>
      <div class="stat-number">${studentCount ?: 0}</div>
      <div class="stat-change positive">
       <i class="bi bi-arrow-up"></i> 12% from last month
      </div>
     </div>
    </div>
   </div>
   
   <div class="col-12 col-sm-6 col-xl-3">
    <div class="card stat-card green">
     <div class="card-body">
      <div class="stat-icon">
       <i class="bi bi-book"></i>
      </div>
      <div class="stat-label">Total Courses</div>
      <div class="stat-number">${courseCount ?: 0}</div>
      <div class="stat-change positive">
       <i class="bi bi-arrow-up"></i> 5% from last month
      </div>
     </div>
    </div>
   </div>
   
   <div class="col-12 col-sm-6 col-xl-3">
    <div class="card stat-card purple">
     <div class="card-body">
      <div class="stat-icon">
       <i class="bi bi-journal"></i>
      </div>
      <div class="stat-label">Total Enrollments</div>
      <div class="stat-number">${enrollmentCount ?: 0}</div>
      <div class="stat-change positive">
       <i class="bi bi-arrow-up"></i> 8% from last month
      </div>
     </div>
    </div>
   </div>
   
   <div class="col-12 col-sm-6 col-xl-3">
    <div class="card stat-card orange">
     <div class="card-body">
      <div class="stat-icon">
       <i class="bi bi-star"></i>
      </div>
      <div class="stat-label">Average GPA</div>
      <div class="stat-number">${avgGpa ?: '3.2'}</div>
      <div class="stat-change positive">
       <i class="bi bi-arrow-up"></i> 0.3 from last month
      </div>
     </div>
    </div>
   </div>
  </div>

  <!-- Charts and Activity Section -->
  <div class="row g-4">
   <!-- Recent Activity -->
   <div class="col-lg-6">
    <div class="card chart-card">
     <div class="card-header">
      <h5 class="card-title">
       <i class="bi bi-clock-history"></i>
       Recent Activity
      </h5>
     </div>
     <div class="card-body">
      <ul class="activity-list">
       <li>
        <div class="activity-icon blue">
         <i class="bi bi-person-plus"></i>
        </div>
        <div class="activity-content">
         <div class="activity-text">New student enrolled: <strong>John Doe</strong></div>
         <div class="activity-time">2 minutes ago</div>
        </div>
       </li>
       <li>
        <div class="activity-icon green">
         <i class="bi bi-book"></i>
        </div>
        <div class="activity-content">
         <div class="activity-text">New course added: <strong>Advanced Mathematics</strong></div>
         <div class="activity-time">15 minutes ago</div>
        </div>
       </li>
       <li>
        <div class="activity-icon purple">
         <i class="bi bi-star"></i>
        </div>
        <div class="activity-content">
         <div class="activity-text">Grade updated for <strong>Jane Smith</strong> in Physics</div>
         <div class="activity-time">1 hour ago</div>
        </div>
       </li>
       <li>
        <div class="activity-icon orange">
         <i class="bi bi-journal"></i>
        </div>
        <div class="activity-content">
         <div class="activity-text">New enrollment: <strong>Alice Johnson</strong> in Chemistry</div>
         <div class="activity-time">3 hours ago</div>
        </div>
       </li>
       <li>
        <div class="activity-icon blue">
         <i class="bi bi-person"></i>
        </div>
        <div class="activity-content">
         <div class="activity-text">Student profile updated: <strong>Bob Williams</strong></div>
         <div class="activity-time">5 hours ago</div>
        </div>
       </li>
      </ul>
     </div>
    </div>
   </div>
   
   <!-- Quick Links -->
   <div class="col-lg-6">
    <div class="card chart-card">
     <div class="card-header">
      <h5 class="card-title">
       <i class="bi bi-link-45deg"></i>
       Quick Links
      </h5>
     </div>
     <div class="card-body">
      <div class="quick-links-grid">
       <g:link controller="student" action="index" class="quick-link-item">
        <i class="bi bi-people text-primary"></i>
        <span class="link-label">Students</span>
       </g:link>
       <g:link controller="course" action="index" class="quick-link-item">
        <i class="bi bi-book text-success"></i>
        <span class="link-label">Courses</span>
       </g:link>
       <g:link controller="enrollment" action="index" class="quick-link-item">
        <i class="bi bi-journal text-warning"></i>
        <span class="link-label">Enrollments</span>
       </g:link>
       <g:link controller="student" action="create" class="quick-link-item">
        <i class="bi bi-person-plus text-info"></i>
        <span class="link-label">Add Student</span>
       </g:link>
       <g:link controller="course" action="create" class="quick-link-item">
        <i class="bi bi-book-plus text-danger"></i>
        <span class="link-label">Add Course</span>
       </g:link>
       <g:link controller="enrollment" action="create" class="quick-link-item">
        <i class="bi bi-journal-plus text-purple"></i>
        <span class="link-label">Enroll Student</span>
       </g:link>
      </div>
     </div>
    </div>
   </div>
  </div>

  <!-- Recent Enrollments Table -->
  <div class="row g-4 mt-2">
   <div class="col-12">
    <div class="card chart-card">
     <div class="card-header">
      <h5 class="card-title">
       <i class="bi bi-table"></i>
       Recent Enrollments
      </h5>
     </div>
     <div class="card-body p-0">
      <g:if test="${recentEnrollments}">
       <div class="table-responsive">
        <table class="table table-hover mb-0">
         <thead>
          <tr>
           <th>Student</th>
           <th>Course</th>
           <th>Grade</th>
           <th>Enrolled At</th>
           <th>Status</th>
          </tr>
         </thead>
         <tbody>
          <g:each in="${recentEnrollments}" var="enrollment">
           <tr>
            <td>${enrollment.student?.name}</td>
            <td>${enrollment.course?.title}</td>
            <td>
             <g:if test="${enrollment.grade != null}">
              <span class="badge bg-success bg-opacity-10 text-success rounded-pill">
               ${enrollment.grade}%
              </span>
             </g:if>
             <g:else>
              <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill">
               Not Graded
              </span>
             </g:else>
            </td>
            <td><g:formatDate date="${enrollment.enrollAt}" format="dd MMM yyyy"/></td>
            <td>
             <span class="badge bg-success rounded-pill">
              <i class="bi bi-check-circle"></i> Active
             </span>
            </td>
           </tr>
          </g:each>
         </tbody>
        </table>
       </div>
      </g:if>
      <g:else>
       <div class="text-center py-4">
        <i class="bi bi-journal fs-1 text-muted"></i>
        <p class="text-muted mt-2">No recent enrollments</p>
       </div>
      </g:else>
     </div>
    </div>
   </div>
  </div>

  <script>
   // Animate numbers on load
   document.addEventListener('DOMContentLoaded', function() {
    const numbers = document.querySelectorAll('.stat-number');
    numbers.forEach(num => {
     const target = parseInt(num.textContent);
     if (target > 0) {
      let current = 0;
      const increment = Math.ceil(target / 30);
      const interval = setInterval(() => {
       current += increment;
       if (current >= target) {
        current = target;
        clearInterval(interval);
       }
       num.textContent = current;
      }, 30);
     }
    });
   });
  </script>
 </body>
</html>