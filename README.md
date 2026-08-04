# University Management System

A Grails web application for managing students, courses, and enrollments — built as part of UBS Intern Training.

## Features

- Full CRUD for Students, Courses, and Enrollments
- MySQL database integration
- Bootstrap 5 styled UI
- Dashboard with statistics
- REST API with JSON responses (`/api/students`, `/api/courses`, `/api/enrollments`)
- API filtering, pagination, and metadata
- GPA calculation per student

## Tech Stack

- Grails 7.2.1
- Groovy 4.0.32
- MySQL
- Bootstrap 5

## API Documentation

See `API_ENDPOINTS.md` for full endpoint documentation.

Postman collection: `postman_collection.json`

## Setup

1. Clone the repo
2. Configure `application.yml` with your MySQL credentials
3. Run `grails run-app`
4. Visit `http://localhost:8080`