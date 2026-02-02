# Hostel Maintenance System (HMS)

A robust Java EE web application designed to streamline the process of reporting and tracking maintenance issues in a hostel environment. 

## 🚀 Features
- **Student Dashboard**: Real-time overview of total, pending, in-progress, and resolved complaints.
- **Complaint Management**: Dynamic interface for students to raise issues across various categories (Electrical, Plumbing, etc.).
- **Secure Authentication**: Session-based login and logout system with error feedback and cache control.
- **Responsive UI**: Built with a modern aesthetic using Bootstrap 5 and custom CSS for a seamless user experience.

## 🛠️ Tech Stack
- **Backend**: Java Servlets, JSP (JavaServer Pages)
- **Database**: MySQL 8.0
- **Architecture**: DAO (Data Access Object) Design Pattern
- **Server**: Apache Tomcat v9.0
- **Frontend**: HTML5, CSS3, Bootstrap 5, Google Fonts

## 📂 Project Structure
- `src/main/java`: Contains Servlets and DAO logic.
- `src/main/webapp`: Contains JSP files and the `WEB-INF` configuration.
- `database/`: Contains the `Schema.sql` script for environment setup.

## 📋 Setup Instructions
1. **Database Setup**: Import the `Schema.sql` file into your MySQL server to create the `hostel_maintenance_db` and required tables.
2. **Driver**: Ensure the `mysql-connector-java` JAR is present in your `WEB-INF/lib` folder.
3. **Configuration**: Update your `db.properties` file with your MySQL username and password.
4. **Deploy**: Run the project on Apache Tomcat v9.0 via Spring Tool Suite (STS) or Eclipse.

## 🔑 Test Credentials
- **Student Login**: `shubham@test.com` / `shubh123`
- **Alternative Student**: `student@test.com` / `stud123`
