# API Endpoints Documentation

## Student Endpoints

| Method | URL | Params | Response | Status Codes |
|---|---|---|---|---|
| GET | `/api/students` | `?name=`, `?email=`, `?max=`, `?offset=` | `{total, page, data: [Student]}` | 200 |
| GET | `/api/students/:id` | — | `Student` object | 200, 404 |
| POST | `/api/students` | Body: `{name, email, studentNumber}` | Created `Student` | 201, 422 |
| PUT | `/api/students/:id` | Body: `{name, email, studentNumber}` | Updated `Student` | 200, 404, 422 |
| DELETE | `/api/students/:id` | — | Empty | 204, 404 |
| GET | `/api/students/:id/details` | — | `{studentName, email, courses: [String]}` | 200, 404 |
| GET | `/api/students/:id/courses` | — | `[{id, title, code}]` | 200, 404 |
| GET | `/api/students/:id/gpa` | — | `{studentId, gpa}` | 200, 404 |

## Course Endpoints

| Method | URL | Params | Response | Status Codes |
|---|---|---|---|---|
| GET | `/api/courses` | `?max=`, `?offset=` | `[Course]` | 200 |
| GET | `/api/courses/:id` | — | `Course` object | 200, 404 |
| POST | `/api/courses` | Body: `{title, code, creditHours}` | Created `Course` | 201, 422 |
| PUT | `/api/courses/:id` | Body: `{title, code, creditHours}` | Updated `Course` | 200, 404, 422 |
| DELETE | `/api/courses/:id` | — | Empty | 204, 404 |

## Enrollment Endpoints

| Method | URL | Params | Response | Status Codes |
|---|---|---|---|---|
| GET | `/api/enrollments` | `?max=`, `?offset=` | `[Enrollment]` | 200 |
| GET | `/api/enrollments/:id` | — | `Enrollment` object | 200, 404 |
| POST | `/api/enrollments` | Body: `{student, course, grade}` | Created `Enrollment` | 201, 422 |
| PUT | `/api/enrollments/:id` | Body: `{grade}` | Updated `Enrollment` | 200, 404, 422 |
| DELETE | `/api/enrollments/:id` | — | Empty | 204, 404 |