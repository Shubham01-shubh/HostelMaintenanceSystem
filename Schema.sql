CREATE DATABASE hostel_maintenance_db;
USE hostel_maintenance_db;

-- 1. Users Table (Aligned with LoginServlet)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('STUDENT', 'ADMIN'))
);

-- 2. Categories Table (Aligned with ComplaintDAO)
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- 3. Status Master Table
CREATE TABLE complaint_status_master (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
);

-- 4. Complaints Table (Core Logic)
CREATE TABLE complaints (
    complaint_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(150),
    description TEXT,
    room_no VARCHAR(10),
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

-- 5. Technicians Table
CREATE TABLE technicians (
    technician_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    location VARCHAR(100)
);

-- 6. Skill Master Table
CREATE TABLE skill_master (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE NOT NULL
);

-- 7. Technician Skills (Junction Table)
CREATE TABLE technician_skills (
    technician_id INT,
    skill_id INT,
    PRIMARY KEY (technician_id, skill_id),
    FOREIGN KEY (technician_id) REFERENCES technicians(technician_id),
    FOREIGN KEY (skill_id) REFERENCES skill_master(skill_id)
);

-- 8. Service Assignment Table
CREATE TABLE service_assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT UNIQUE,
    technician_id INT,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (complaint_id) REFERENCES complaints(complaint_id),
    FOREIGN KEY (technician_id) REFERENCES technicians(technician_id)
);

-- 9. Complaint Status Log Table
CREATE TABLE complaint_status_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    complaint_id INT,
    old_status_id INT,
    new_status_id INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (complaint_id) REFERENCES complaints(complaint_id),
    FOREIGN KEY (old_status_id) REFERENCES complaint_status_master(status_id),
    FOREIGN KEY (new_status_id) REFERENCES complaint_status_master(status_id)
);

-- ================= INSERTING INITIAL DATA =================

INSERT INTO categories (name) VALUES 
('Electrical'), ('Plumbing'), ('Network'), ('Room Maintenance');

INSERT INTO complaint_status_master VALUES
(1, 'RAISED'), (2, 'ASSIGNED'), (3, 'IN_PROGRESS'), (4, 'RESOLVED'), (5, 'CLOSED');

INSERT INTO skill_master (skill_name) VALUES
('Electrical'), ('Plumbing'), ('Network'), ('Room Maintenance');

-- Test Users (Login: student@test.com / stud123)
INSERT INTO users (name, email, phone, role, password) VALUES 
('John Doe', 'student@test.com', '9876543210', 'STUDENT', 'stud123'),
('Admin User', 'admin@test.com', '1234567890', 'ADMIN', 'admin123');


INSERT INTO users (name, email, phone, role, password) 
VALUES ('Shubham Khandagale', 'shubham@test.com', '8169188883', 'STUDENT', 'shubh123');