# EduTrack - Full-Stack Academic Portal

A full-stack, enterprise-grade web application built **strictly** using:
* **Frontend**: HTML5 & CSS3 (Zero JavaScript)
* **Database**: SQL (DDL Schema, DML Seed, Query Engine & Dumps)
* **Backend**: Java SE (`com.sun.net.httpserver.HttpServer`)
* **No external languages or frameworks used.**

## 🌟 Key Features

1. **Executive Dashboard (`/`)**:
   - Live metrics: Total Students, Active Count, Average GPA, Course counts.
   - Recently enrolled students table with academic standing badges.
   - Quick navigation shortcuts.
2. **Students Directory (`/students`)**:
   - Multi-criteria filtering (search by name/email, department dropdown, status filter).
   - Dynamic data table displaying student and academic details.
   - Profile view, inline editing, and deletion via pure HTML forms.
3. **Student Registration & Editing (`/students/new`, `/students/edit`)**:
   - Pure HTML5 form validation.
   - Form submission via HTTP POST directly to the Java backend.
4. **Academic Course Catalog (`/courses`)**:
   - Course cards with credit hours, departments, and faculty instructors.
   - Form to add courses to the SQL database.
5. **Live SQL Studio (`/sql-studio`)**:
   - SQL editor for supported `SELECT`, `INSERT`, `UPDATE`, and `DELETE` statements.
   - Results table and schema viewer.

## 📁 Project Architecture

```text
EduTrack/
├── sql/
│   ├── schema.sql
│   ├── seed.sql
│   └── queries.sql
├── web/css/style.css
├── src/com/edutrack/
│   ├── Main.java
│   ├── model/
│   ├── database/
│   ├── handler/
│   └── view/
├── data/database.sql
├── build.bat
├── run.bat
├── run.ps1
└── README.md
```

## 🚀 How to Run

**Requirements:** Install a JDK and make sure `java` and `javac` are available on PATH, or set `JAVA_HOME`.

- Windows Command Prompt: run `run.bat`.
- PowerShell: run `./run.ps1`.
- To compile only: run `build.bat`.

Then open [http://localhost:8080](http://localhost:8080).

> The launch scripts expect the complete Java source tree under `src/`. The project description also specifies SQL and CSS assets under `sql/` and `web/`; those source files must be present before the application can be built.

## SQL Schema Overview

The described database contains three relational tables:

- **departments**: `id`, `name`, `code`, `head`
- **courses**: `id`, `course_code`, `title`, `department_id`, `credits`, `instructor`
- **students**: `id`, `first_name`, `last_name`, `email`, `phone`, `department_id`, `enrollment_year`, `gpa`, `status`, `created_at`

## Technology Constraints

- Semantic HTML5 and CSS3 for the frontend.
- Java SE HTTP server and Java application logic.
- SQL schema, seed data, queries, and persisted database dump.
- No JavaScript or external frameworks, as specified in the project brief.
