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

/////////////////////////////////////////////////////////////////////////////////////////////////////

# Spring Security Domain Classes Documentation

## User.groovy

| Field | Type | Description |
|---|---|---|
| `username` | String | Unique login identifier (used as email: admin@ubs.com) |
| `password` | String | Encrypted password (auto-hashed via `encodePassword()` before insert/update) |
| `enabled` | boolean | Whether the account is active (default: true) |
| `accountExpired` | boolean | Whether the account has expired |
| `accountLocked` | boolean | Whether the account is locked (e.g., after failed login attempts) |
| `passwordExpired` | boolean | Whether the password needs to be changed |

**Key methods:**
- `getAuthorities()` — Returns the Set of Roles assigned to this user (via UserRole)
- `encodePassword()` — Automatically hashes the password before saving (triggered by `beforeInsert`/`beforeUpdate`)

---

## Role.groovy

| Field | Type | Description |
|---|---|---|
| `authority` | String | The role name (e.g., "ROLE_ADMIN", "ROLE_USER") — must be unique |

**Purpose:** Represents a permission level/group that can be assigned to users.

---

## UserRole.groovy

| Field | Type | Description |
|---|---|---|
| `user` | User | Reference to the User |
| `role` | Role | Reference to the Role |

**Purpose:** Join table (many-to-many) connecting Users to Roles — a user can have multiple roles, and a role can be assigned to multiple users.

**Key methods:**
- `create(user, role)` — Assigns a role to a user
- `remove(user, role)` — Removes a role from a user
- `exists(userId, roleId)` — Checks if a user already has a specific role