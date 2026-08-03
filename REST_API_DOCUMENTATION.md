# REST API Documentation — Student Endpoints

Base URL: `http://localhost:8080/api/students`

---

## 1. Index — Get All Students

**Method:** `GET`  
**URL:** `/api/students`  
**Body:** None

**Response (200 OK):**
```json
[
  {
    "id": 2,
    "name": "aya",
    "email": "aya@gmail.com",
    "studentNumber": "1242325",
    "enrollments": [{"id": 21}, {"id": 22}, {"id": 17}]
  }
]
```

---

## 2. Show — Get One Student

**Method:** `GET`  
**URL:** `/api/students/2`  
**Body:** None

**Response (200 OK):**
```json
{
  "id": 2,
  "name": "aya",
  "email": "aya@gmail.com",
  "studentNumber": "1242325",
  "enrollments": [...]
}
```

---

## 3. Create — Add New Student

**Method:** `POST`  
**URL:** `/api/students`  
**Body (raw JSON):**
```json
{
  "name": "Fresh Student",
  "email": "freshstudent@example.com",
  "studentNumber": "5555555"
}


**Response (201 Created):**
```json
{
  "id": 13,
  "name": "Fresh Student",
  "email": "freshstudent@example.com",
  "studentNumber": "5555555",
  "enrollments": null
}
```

---

## 4. Update — Edit Existing Student

**Method:** `PUT`  
**URL:** `/api/students/13`  
**Body (raw JSON):**
```json
{
  "name": "Updated Fresh Student",
  "email": "freshstudent@example.com",
  "studentNumber": "5555555"
}
```

**Response (200 OK):**
```json
{
  "id": 13,
  "name": "Updated Fresh Student",
  "email": "freshstudent@example.com",
  "studentNumber": "5555555",
  "enrollments": []
}
```


## 5. Delete — Remove Student

**Method:** `DELETE`  
**URL:** `/api/students/13`  
**Body:** None

**Response:** `204 No Content`