<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="university.Student" %>
<%@ page import="university.Course" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Create Enrollment - UBS University</title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Enrollment Form Specific Styles */
        .enrollment-hero {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            border-radius: 1.5rem;
            padding: 2rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(253, 160, 133, 0.25);
        }
        
        .enrollment-hero::before {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }
        
        .enrollment-hero::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -5%;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }
        
        .enrollment-hero .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .enrollment-hero h1 {
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.25rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .enrollment-hero p {
            opacity: 0.9;
            margin: 0;
            font-size: 1rem;
        }
        
        .enrollment-hero .breadcrumb-custom {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            font-size: 0.85rem;
            opacity: 0.8;
            margin-top: 0.5rem;
        }
        
        .enrollment-hero .breadcrumb-custom a {
            color: white;
            text-decoration: none;
        }
        
        .enrollment-hero .breadcrumb-custom a:hover {
            text-decoration: underline;
        }
        
        /* Form Card */
        .form-card {
            background: #ffffff;
            border-radius: 1.25rem;
            padding: 2rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.04);
            transition: all 0.3s ease;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-card:hover {
            box-shadow: 0 0.75rem 2rem rgba(0, 0, 0, 0.12);
        }
        
        .form-card .form-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .form-card .form-header .form-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            flex-shrink: 0;
        }
        
        .form-card .form-header h3 {
            font-weight: 700;
            color: #2d3748;
            margin: 0;
        }
        
        .form-card .form-header .subtitle {
            color: #718096;
            font-size: 0.85rem;
        }
        
        .form-label-custom {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.9rem;
            margin-bottom: 0.4rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-label-custom i {
            color: #fda085;
            font-size: 1rem;
        }
        
        .form-label-custom .required {
            color: #e53e3e;
            font-weight: 700;
        }
        
        .form-select-custom {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.7rem 1rem;
            transition: all 0.3s ease;
            background: #f7fafc;
            font-size: 0.95rem;
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%234a5568' d='M6 8L1 3h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            padding-right: 2.5rem;
        }
        
        .form-select-custom:focus {
            border-color: #fda085;
            box-shadow: 0 0 0 4px rgba(253, 160, 133, 0.15);
            background: #ffffff;
        }
        
        .form-select-custom option {
            padding: 0.5rem;
        }
        
        .form-select-custom:disabled {
            background: #f7fafc;
            cursor: not-allowed;
        }
        
        .form-text-custom {
            font-size: 0.8rem;
            color: #718096;
            margin-top: 0.3rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }
        
        .form-text-custom i {
            font-size: 0.9rem;
        }
        
        /* Selected Items Preview */
        .selection-preview {
            background: #f7fafc;
            border-radius: 0.75rem;
            padding: 1rem 1.25rem;
            margin-top: 0.5rem;
            display: none;
            border: 2px dashed #e2e8f0;
        }
        
        .selection-preview.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .selection-preview .preview-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.4rem 0;
        }
        
        .selection-preview .preview-item .preview-icon {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: 700;
            color: white;
            flex-shrink: 0;
        }
        
        .selection-preview .preview-item .preview-icon.student {
            background: linear-gradient(135deg, #f6d365, #fda085);
        }
        
        .selection-preview .preview-item .preview-icon.course {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }
        
        .selection-preview .preview-item .preview-label {
            font-weight: 500;
            color: #2d3748;
        }
        
        .selection-preview .preview-item .preview-value {
            color: #718096;
            font-size: 0.9rem;
        }
        
        /* Form Actions */
        .form-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 2px solid #f0f0f0;
            flex-wrap: wrap;
        }
        
        .btn-save {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(253, 160, 133, 0.4);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-save:hover {
            transform: translateY(-3px);
            box-shadow: 0 0.5rem 1.5rem rgba(253, 160, 133, 0.5);
            color: white;
        }
        
        .btn-save:active {
            transform: translateY(0);
        }
        
        .btn-save:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }
        
        .btn-cancel {
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            color: #4a5568;
            background: transparent;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-cancel:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            text-decoration: none;
            color: #4a5568;
        }
        
        /* Stats Bar */
        .stats-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .stats-bar .stat-card {
            background: white;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .stats-bar .stat-card:hover {
            border-color: #fda085;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        
        .stats-bar .stat-card .stat-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2d3748;
            display: block;
        }
        
        .stats-bar .stat-card .stat-label {
            font-size: 0.75rem;
            color: #718096;
            font-weight: 500;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .enrollment-hero {
                padding: 1.5rem;
                text-align: center;
            }
            
            .enrollment-hero h1 {
                font-size: 1.5rem;
                justify-content: center;
            }
            
            .enrollment-hero .breadcrumb-custom {
                justify-content: center;
            }
            
            .form-card {
                padding: 1.25rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .form-actions .btn {
                width: 100%;
                justify-content: center;
            }
            
            .stats-bar {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>
  </head>
  <body>
    <!-- Hero Section -->
    <div class="enrollment-hero">
        <div class="hero-content">
            <h1>
                <i class="bi bi-journal-plus"></i>
                Create Enrollment
            </h1>
            <p>Enroll a student in a course by selecting from the dropdowns below</p>
            <div class="breadcrumb-custom">
                <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
                <span>/</span>
                <a href="${createLink(controller: 'enrollment', action: 'index')}">Enrollments</a>
                <span>/</span>
                <span>Create</span>
            </div>
        </div>
    </div>

    <!-- Stats Bar -->
    <div class="stats-bar">
        <div class="stat-card">
            <span class="stat-number">${Student.count()}</span>
            <span class="stat-label">Available Students</span>
        </div>
        <div class="stat-card">
            <span class="stat-number">${Course.count()}</span>
            <span class="stat-label">Available Courses</span>
        </div>
        <div class="stat-card">
            <span class="stat-number">${university.Enrollment.count()}</span>
            <span class="stat-label">Total Enrollments</span>
        </div>
    </div>

    <!-- Form Card -->
    <div class="form-card">
        <div class="form-header">
            <div class="form-icon">
                <i class="bi bi-person-plus"></i>
            </div>
            <div>
                <h3>Enroll Student</h3>
                <div class="subtitle">Fill in the details to create a new enrollment</div>
            </div>
        </div>

        <g:form action="save" class="needs-validation" novalidate="novalidate">
            <!-- Student Selection -->
            <div class="mb-4">
                <label for="student.id" class="form-label-custom">
                    <i class="bi bi-person"></i>
                    Student <span class="required">*</span>
                </label>
                <g:select 
                    name="student.id" 
                    from="${Student.list()}" 
                    optionKey="id" 
                    optionValue="name" 
                    class="form-select form-select-custom" 
                    id="studentSelect"
                    noSelection="['': '-- Select Student --']"
                    required="required"
                />
                <div class="form-text-custom">
                    <i class="bi bi-info-circle"></i>
                    Select a student from the list above
                </div>
            </div>

            <!-- Course Selection -->
            <div class="mb-4">
                <label for="course.id" class="form-label-custom">
                    <i class="bi bi-book"></i>
                    Course <span class="required">*</span>
                </label>
                <g:select 
                    name="course.id" 
                    from="${Course.list()}" 
                    optionKey="id" 
                    optionValue="title" 
                    class="form-select form-select-custom" 
                    id="courseSelect"
                    noSelection="['': '-- Select Course --']"
                    required="required"
                />
                <div class="form-text-custom">
                    <i class="bi bi-info-circle"></i>
                    Select a course from the list above
                </div>
            </div>

            <!-- Selection Preview -->
            <div class="selection-preview" id="selectionPreview">
                <div class="preview-item">
                    <div class="preview-icon student">
                        <i class="bi bi-person"></i>
                    </div>
                    <div>
                        <div class="preview-label">Student</div>
                        <div class="preview-value" id="previewStudent">Not selected</div>
                    </div>
                </div>
                <div class="preview-item">
                    <div class="preview-icon course">
                        <i class="bi bi-book"></i>
                    </div>
                    <div>
                        <div class="preview-label">Course</div>
                        <div class="preview-value" id="previewCourse">Not selected</div>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="submit" class="btn-save" id="saveButton">
                    <i class="bi bi-check-circle"></i>
                    Enroll Student
                </button>
                <g:link controller="enrollment" action="index" class="btn-cancel">
                    <i class="bi bi-x-circle"></i>
                    Cancel
                </g:link>
            </div>
        </g:form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const studentSelect = document.getElementById('studentSelect');
            const courseSelect = document.getElementById('courseSelect');
            const previewStudent = document.getElementById('previewStudent');
            const previewCourse = document.getElementById('previewCourse');
            const previewContainer = document.getElementById('selectionPreview');
            const saveButton = document.getElementById('saveButton');
            
            // Student options data (for display)
            const studentOptions = {};
            document.querySelectorAll('#studentSelect option').forEach(option => {
                if (option.value) {
                    studentOptions[option.value] = option.text;
                }
            });
            
            // Course options data (for display)
            const courseOptions = {};
            document.querySelectorAll('#courseSelect option').forEach(option => {
                if (option.value) {
                    courseOptions[option.value] = option.text;
                }
            });
            
            function updatePreview() {
                const studentId = studentSelect.value;
                const courseId = courseSelect.value;
                let hasSelection = false;
                
                if (studentId) {
                    previewStudent.textContent = studentOptions[studentId] || 'Selected';
                    hasSelection = true;
                } else {
                    previewStudent.textContent = 'Not selected';
                }
                
                if (courseId) {
                    previewCourse.textContent = courseOptions[courseId] || 'Selected';
                    hasSelection = true;
                } else {
                    previewCourse.textContent = 'Not selected';
                }
                
                if (hasSelection) {
                    previewContainer.classList.add('active');
                } else {
                    previewContainer.classList.remove('active');
                }
                
                // Enable/disable save button
                saveButton.disabled = !(studentId && courseId);
            }
            
            studentSelect.addEventListener('change', updatePreview);
            courseSelect.addEventListener('change', updatePreview);
            
            // Initial update
            updatePreview();
        });
    </script>
  </body>
</html>