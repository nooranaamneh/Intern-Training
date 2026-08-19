# Data Base Schema

User 
     - id (PK)
     - username
     - password
     - enabled, accountExpired, accountLocked, passwordExpired (fields from security plugin)

Role
     - id (PK)
     - authority (ROLE_ADMIN, ROLE_USER)

UserRole (join table)
      - PK: composite (user_id, role_id)
      - user_id (FK)
      - role_id (FK)

Task 
      - id (PK)
      - title
      - description (nullable)
      - deadline
      - status: enum (TO_DO, IN_PROGRESS, DONE)
      - user_id (FK → User.id)

Relationships 
              - User (1) —— (many) Task
              - User (1) —— (many) UserRole (many) —— (1) Role