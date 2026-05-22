-- ========== DATABASE SETUP ==========
-- Create database
CREATE DATABASE IF NOT EXISTS inbio_portfolio;
USE inbio_portfolio;

-- ========== USERS TABLE ==========
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255),
    role VARCHAR(100) DEFAULT 'Member',
    profile_image VARCHAR(500),
    provider VARCHAR(50) DEFAULT 'email',
    banned TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_banned (banned)
);

-- ========== ADMIN USERS TABLE ==========
CREATE TABLE IF NOT EXISTS admin_users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username)
);

-- ========== PORTFOLIO TABLE ==========
CREATE TABLE IF NOT EXISTS portfolio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(100) DEFAULT 'projects',
    description TEXT,
    image VARCHAR(500),
    tags JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category (category)
);

-- ========== MUSIC TABLE ==========
CREATE TABLE IF NOT EXISTS music (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    data_url LONGTEXT,
    duration VARCHAR(20),
    featured TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_featured (featured)
);

-- ========== SKILLS TABLE ==========
CREATE TABLE IF NOT EXISTS skills (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type ENUM('design', 'development') DEFAULT 'development',
    level INT DEFAULT 50,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_type (type)
);

-- ========== EDUCATION TABLE ==========
CREATE TABLE IF NOT EXISTS education (
    id INT PRIMARY KEY AUTO_INCREMENT,
    school VARCHAR(255) NOT NULL,
    degree VARCHAR(255) NOT NULL,
    year VARCHAR(50),
    rating DECIMAL(3,1) DEFAULT 0,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========== EXPERIENCE TABLE ==========
CREATE TABLE IF NOT EXISTS experience (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date VARCHAR(100),
    title VARCHAR(255) NOT NULL,
    company VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========== BLOGS TABLE ==========
CREATE TABLE IF NOT EXISTS blogs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    excerpt TEXT,
    image VARCHAR(500),
    read_time INT DEFAULT 5,
    date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_date (date)
);

-- ========== REVIEWS TABLE ==========
CREATE TABLE IF NOT EXISTS reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(255),
    rating INT DEFAULT 5,
    text TEXT NOT NULL,
    avatar VARCHAR(500),
    approved TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_approved (approved),
    INDEX idx_user_id (user_id)
);

-- ========== MESSAGES TABLE ==========
CREATE TABLE IF NOT EXISTS messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    subject VARCHAR(255),
    message TEXT NOT NULL,
    read TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_read (read),
    INDEX idx_created (created_at)
);

-- ========== TIMELINE TABLE ==========
CREATE TABLE IF NOT EXISTS timeline (
    id INT PRIMARY KEY AUTO_INCREMENT,
    year VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    details TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========== PRICING TABLE ==========
CREATE TABLE IF NOT EXISTS pricing (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price VARCHAR(50) NOT NULL,
    period VARCHAR(50) DEFAULT 'month',
    featured TINYINT(1) DEFAULT 0,
    features JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========== INSERT DEFAULT ADMIN USER ==========
-- Username: admin
-- Password: password123
INSERT IGNORE INTO admin_users (username, password, email) VALUES 
('admin', '$2y$10$YIjlrPNoS0b.wvN3kh4h.eYDxJfIB1ZK8L8mN4O5P6Q7R8S9T0U1V', 'admin@inbio.com');

-- ========== INSERT SAMPLE DATA ==========
INSERT IGNORE INTO portfolio (title, category, description, image, tags) VALUES 
('E-Commerce Platform', 'projects', 'Full-stack e-commerce solution', 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400', '["React","Node.js"]'),
('AWS Architect', 'certificates', 'AWS Solutions Architect Certification', 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=400', '["AWS","Cloud"]'),
('React Dashboard', 'techstack', 'Expert in React ecosystem', 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=400', '["React","TypeScript"]');

INSERT IGNORE INTO skills (name, type, level) VALUES 
('React', 'development', 95),
('JavaScript', 'development', 90),
('Node.js', 'development', 88),
('Python', 'development', 82),
('Figma', 'design', 92),
('Photoshop', 'design', 85),
('Illustrator', 'design', 78);

INSERT IGNORE INTO education (school, degree, year, rating, description) VALUES 
('University of Studies', 'Bachelor in Computer Science', '1997 - 2001', 4.8, 'Lorem ipsum dolor sit amet.'),
('Technical Institute', 'Diploma', '2001 - 2004', 4.5, 'Ut enim ad minim veniam.'),
('Engineering University', 'BSE In CSE', '2004 - 2008', 4.9, 'Duis aute irure dolor.');

INSERT IGNORE INTO experience (date, title, company, description) VALUES 
('2020 - Present', 'Tech Lead', 'Innovation Labs', 'Architecting scalable solutions.'),
('2016 - 2020', 'Senior Developer', 'Plugin Development', 'Led team of 5 developers.'),
('2008 - 2016', 'Full Stack Developer', 'Rainbow-Themes', 'Developed multiple projects.');

INSERT IGNORE INTO reviews (name, role, rating, text, approved) VALUES 
('Sarah Johnson', 'CEO, TechStart', 5, 'Exceptional work! The attention to detail was outstanding.', 1),
('Michael Chen', 'Product Manager', 5, 'A true professional who delivers quality work.', 1);
