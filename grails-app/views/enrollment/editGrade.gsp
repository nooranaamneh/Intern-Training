<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Update Grade - UBS University</title>
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Grade Page Specific Styles */
        .grade-hero {
            background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);
            border-radius: 1.5rem;
            padding: 2rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(161, 140, 209, 0.25);
        }
        
        .grade-hero::before {
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
        
        .grade-hero::after {
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
        
        .grade-hero .hero-content {
            position: relative;
            z-index: 1;
        }
        
        .grade-hero h1 {
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 0.25rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .grade-hero p {
            opacity: 0.9;
            margin: 0;
            font-size: 1rem;
        }
        
        .grade-hero .breadcrumb-custom {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            font-size: 0.85rem;
            opacity: 0.8;
            margin-top: 0.5rem;
        }
        
        .grade-hero .breadcrumb-custom a {
            color: white;
            text-decoration: none;
        }
        
        .grade-hero .breadcrumb-custom a:hover {
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
            max-width: 700px;
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
            background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);
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
        
        /* Enrollment Info Card */
        .enrollment-info {
            background: linear-gradient(135deg, #f7fafc, #edf2f7);
            border-radius: 1rem;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #e2e8f0;
        }
        
        .enrollment-info .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
        }
        
        .enrollment-info .info-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .enrollment-info .info-item .info-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            flex-shrink: 0;
        }
        
        .enrollment-info .info-item .info-icon.student {
            background: #ebf8ff;
            color: #0d6efd;
        }
        
        .enrollment-info .info-item .info-icon.course {
            background: #f0fff4;
            color: #48bb78;
        }
        
        .enrollment-info .info-item .info-icon.grade {
            background: #faf5ff;
            color: #805ad5;
        }
        
        .enrollment-info .info-item .info-label {
            font-size: 0.75rem;
            color: #718096;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
        }
        
        .enrollment-info .info-item .info-value {
            font-weight: 600;
            color: #2d3748;
        }
        
        /* Form Labels */
        .form-label-custom {
            font-weight: 600;
            color: #2d3748;
            font-size: 0.95rem;
            margin-bottom: 0.4rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-label-custom i {
            color: #a18cd1;
        }
        
        .form-label-custom .required {
            color: #e53e3e;
            font-weight: 700;
        }
        
        /* Grade Input */
        .grade-input-wrapper {
            position: relative;
        }
        
        .grade-input-wrapper .grade-prefix {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            font-weight: 700;
            color: #a0aec0;
            font-size: 1rem;
            z-index: 5;
        }
        
        .grade-input-wrapper .form-control {
            padding-left: 2.5rem;
            border: 2px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            background: #f7fafc;
        }
        
        .grade-input-wrapper .form-control:focus {
            border-color: #a18cd1;
            box-shadow: 0 0 0 4px rgba(161, 140, 209, 0.15);
            background: #ffffff;
        }
        
        .grade-input-wrapper .form-control.is-invalid {
            border-color: #fc8181;
            background: #fff5f5;
        }
        
        .grade-input-wrapper .form-control.is-invalid:focus {
            box-shadow: 0 0 0 4px rgba(252, 129, 129, 0.15);
        }
        
        .grade-input-wrapper .form-control.is-valid {
            border-color: #48bb78;
            background: #f0fff4;
        }
        
        .grade-input-wrapper .form-control.is-valid:focus {
            box-shadow: 0 0 0 4px rgba(72, 187, 120, 0.15);
        }
        
        /* Grade Range Display */
        .grade-range {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
            margin-top: 0.5rem;
        }
        
        .grade-range .range-item {
            padding: 0.2rem 0.6rem;
            border-radius: 0.5rem;
            font-size: 0.7rem;
            font-weight: 600;
            background: #f7fafc;
            border: 1px solid #e2e8f0;
            color: #4a5568;
        }
        
        .grade-range .range-item.excellent {
            background: #c6f6d5;
            border-color: #48bb78;
            color: #22543d;
        }
        
        .grade-range .range-item.good {
            background: #fefcbf;
            border-color: #f6ad55;
            color: #744210;
        }
        
        .grade-range .range-item.average {
            background: #fed7d7;
            border-color: #fc8181;
            color: #742a2a;
        }
        
        /* Grade Preview */
        .grade-preview {
            margin-top: 1rem;
            padding: 1rem 1.25rem;
            border-radius: 0.75rem;
            background: #f7fafc;
            border: 2px dashed #e2e8f0;
            text-align: center;
            display: none;
        }
        
        .grade-preview.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .grade-preview .preview-grade {
            font-size: 2.5rem;
            font-weight: 800;
            color: #2d3748;
        }
        
        .grade-preview .preview-label {
            font-size: 0.85rem;
            color: #718096;
        }
        
        .grade-preview .preview-status {
            display: inline-block;
            padding: 0.2rem 1rem;
            border-radius: 50rem;
            font-size: 0.8rem;
            font-weight: 600;
            margin-top: 0.25rem;
        }
        
        .grade-preview .preview-status.excellent {
            background: #c6f6d5;
            color: #22543d;
        }
        
        .grade-preview .preview-status.good {
            background: #fefcbf;
            color: #744210;
        }
        
        .grade-preview .preview-status.average {
            background: #fed7d7;
            color: #742a2a;
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
            background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);
            border: none;
            padding: 0.75rem 2.5rem;
            border-radius: 0.75rem;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            color: white;
            box-shadow: 0 0.25rem 0.75rem rgba(161, 140, 209, 0.4);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-save:hover {
            transform: translateY(-3px);
            box-shadow: 0 0.5rem 1.5rem rgba(161, 140, 209, 0.5);
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
            text-decoration: none;
        }
        
        .btn-cancel:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            text-decoration: none;
            color: #4a5568;
        }
        
        .btn-view {
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
            text-decoration: none;
        }
        
        .btn-view:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            text-decoration: none;
            color: #4a5568;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .grade-hero {
                padding: 1.5rem;
                text-align: center;
            }
            
            .grade-hero h1 {
                font-size: 1.5rem;
                justify-content: center;
            }
            
            .grade-hero .breadcrumb-custom {
                justify-content: center;
            }
            
            .form-card {
                padding: 1.25rem;
            }
            
            .enrollment-info .info-grid {
                grid-template-columns: 1fr;
                gap: 0.5rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .form-actions .btn {
                width: 100%;
                justify-content: center;
            }
            
            .grade-range {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <div class="grade-hero">
        <div class="hero-content">
            <h1>
                <i class="bi bi-pencil-square"></i>
                Update Grade
            </h1>
            <p>Update the grade for this enrollment</p>
            <div class="breadcrumb-custom">
                <a href="${createLink(uri: '/')}"><i class="bi bi-house"></i> Home</a>
                <span>/</span>
                <a href="${createLink(controller: 'enrollment', action: 'index')}">Enrollments</a>
                <span>/</span>
                <span>Update Grade</span>
            </div>
        </div>
    </div>

    <!-- Form Card -->
    <div class="form-card">
        <div class="form-header">
            <div class="form-icon">
                <i class="bi bi-star"></i>
            </div>
            <div>
                <h3>Grade Management</h3>
                <div class="subtitle">Update the grade for this student enrollment</div>
            </div>
        </div>

        <!-- Enrollment Information -->
        <div class="enrollment-info">
            <div class="info-grid">
                <div class="info-item">
                    <div class="info-icon student">
                        <i class="bi bi-person"></i>
                    </div>
                    <div>
                        <div class="info-label">Student</div>
                        <div class="info-value">${enrollment.student.name}</div>
                    </div>
                </div>
                <div class="info-item">
                    <div class="info-icon course">
                        <i class="bi bi-book"></i>
                    </div>
                    <div>
                        <div class="info-label">Course</div>
                        <div class="info-value">${enrollment.course.title}</div>
                    </div>
                </div>
                <div class="info-item">
                    <div class="info-icon grade">
                        <i class="bi bi-star"></i>
                    </div>
                    <div>
                        <div class="info-label">Current Grade</div>
                        <div class="info-value">
                            ${enrollment.grade ?: 'Not graded yet'}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Grade Form -->
        <g:form controller="enrollment" action="updateGrade" id="${enrollment.id}" class="needs-validation" novalidate="novalidate">
            <div class="mb-4">
                <label for="grade" class="form-label-custom">
                    <i class="bi bi-star-fill"></i>
                    Grade <span class="required">*</span>
                </label>
                <div class="grade-input-wrapper">
                    <span class="grade-prefix">%</span>
                    <input 
                        type="number" 
                        name="grade" 
                        id="grade" 
                        value="${enrollment.grade}" 
                        class="form-control" 
                        placeholder="Enter grade (0-100)"
                        min="0" 
                        max="100" 
                        step="0.01"
                        required="required"
                        autofocus="autofocus"
                    />
                </div>
                
                <!-- Grade Range Guide -->
                <div class="grade-range">
                    <span class="range-item excellent">A: 90-100</span>
                    <span class="range-item good">B: 80-89</span>
                    <span class="range-item good">C: 70-79</span>
                    <span class="range-item average">D: 60-69</span>
                    <span class="range-item average">F: 0-59</span>
                </div>
                
                <div class="form-text-custom mt-2">
                    <i class="bi bi-info-circle text-muted"></i>
                    Enter a grade between 0 and 100
                </div>
            </div>

            <!-- Grade Preview -->
            <div class="grade-preview" id="gradePreview">
                <div class="preview-label">Grade Preview</div>
                <div class="preview-grade" id="previewGrade">--</div>
                <div class="preview-status" id="previewStatus">Not set</div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="submit" class="btn-save" id="saveButton">
                    <i class="bi bi-check-circle"></i>
                    Update Grade
                </button>
                <g:link controller="enrollment" action="show" id="${enrollment.id}" class="btn-view">
                    <i class="bi bi-eye"></i>
                    View Enrollment
                </g:link>
                <g:link controller="enrollment" action="index" class="btn-cancel">
                    <i class="bi bi-x-circle"></i>
                    Cancel
                </g:link>
            </div>
        </g:form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const gradeInput = document.getElementById('grade');
            const previewGrade = document.getElementById('previewGrade');
            const previewStatus = document.getElementById('previewStatus');
            const previewContainer = document.getElementById('gradePreview');
            const saveButton = document.getElementById('saveButton');
            
            function getGradeStatus(grade) {
                if (grade === null || grade === undefined || grade === '') {
                    return { text: 'Not set', class: '' };
                }
                
                const g = parseFloat(grade);
                if (isNaN(g)) return { text: 'Invalid', class: 'average' };
                
                if (g >= 90) return { text: 'Excellent', class: 'excellent' };
                if (g >= 80) return { text: 'Good', class: 'good' };
                if (g >= 70) return { text: 'Average', class: 'good' };
                if (g >= 60) return { text: 'Below Average', class: 'average' };
                return { text: 'Needs Improvement', class: 'average' };
            }
            
            function updatePreview() {
                const value = gradeInput.value;
                
                if (value && value.trim() !== '') {
                    const grade = parseFloat(value);
                    if (!isNaN(grade) && grade >= 0 && grade <= 100) {
                        previewGrade.textContent = grade + '%';
                        const status = getGradeStatus(grade);
                        previewStatus.textContent = status.text;
                        previewStatus.className = 'preview-status ' + status.class;
                        previewContainer.classList.add('active');
                        gradeInput.classList.remove('is-invalid');
                        gradeInput.classList.add('is-valid');
                        saveButton.disabled = false;
                        return;
                    }
                }
                
                previewContainer.classList.remove('active');
                gradeInput.classList.remove('is-valid');
                if (value && value.trim() !== '') {
                    gradeInput.classList.add('is-invalid');
                } else {
                    gradeInput.classList.remove('is-invalid');
                }
                saveButton.disabled = true;
            }
            
            gradeInput.addEventListener('input', updatePreview);
            
            // Initial update
            updatePreview();
            
            // Form validation
            const form = document.querySelector('.needs-validation');
            form.addEventListener('submit', function(event) {
                const grade = parseFloat(gradeInput.value);
                if (isNaN(grade) || grade < 0 || grade > 100) {
                    event.preventDefault();
                    event.stopPropagation();
                    gradeInput.classList.add('is-invalid');
                } else {
                    gradeInput.classList.remove('is-invalid');
                    gradeInput.classList.add('is-valid');
                }
                form.classList.add('was-validated');
            });
        });
    </script>
</body>
</html>