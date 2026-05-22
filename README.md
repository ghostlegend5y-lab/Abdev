# ABDEV - Personal Portfolio & Admin Dashboard

## 📋 Project Overview
ABDEV is a modern, full-stack personal portfolio website with a powerful admin dashboard for managing content. Built with HTML, CSS, JavaScript, PHP, and MySQL.

## 🎯 Features

### Frontend
- ✅ Responsive hero section with call-to-action
- ✅ About section with image gallery
- ✅ Education & Experience timeline
- ✅ Skills showcase with progress bars
- ✅ Portfolio grid with filtering
- ✅ Testimonial/Review section
- ✅ Blog listing
- ✅ Contact form
- ✅ Music player
- ✅ Dark/Light theme toggle
- ✅ User authentication (Email, Google OAuth)

### Admin Dashboard
- ✅ Portfolio management (CRUD)
- ✅ Music library upload & management
- ✅ Skills management (Design & Development)
- ✅ Education records
- ✅ Experience timeline
- ✅ Blog post management
- ✅ User management (ban/unban)
- ✅ Review approval system
- ✅ Settings panel
- ✅ Data export/import
- ✅ Admin theme customization

### Backend (PHP/MySQL)
- ✅ REST API with complete CRUD operations
- ✅ User authentication (BCrypt password hashing)
- ✅ Admin session management
- ✅ Google OAuth integration
- ✅ File upload handling
- ✅ Input validation & sanitization
- ✅ CORS support
- ✅ Database abstraction layer

## 🛠 Installation & Setup

### Prerequisites
- PHP 7.4+
- MySQL 5.7+
- Apache/Nginx with mod_rewrite

### Step 1: Database Setup
```bash
# Import the database schema
mysql -u root -p < database_setup.sql
```

### Step 2: Configuration
Edit `config.php` with your database credentials:
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', 'your_password');
define('DB_NAME', 'inbio_portfolio');
```

### Step 3: File Permissions
```bash
# Create uploads directory
mkdir uploads
chmod 755 uploads

# Set proper permissions for PHP files
chmod 644 *.php
```

### Step 4: Default Admin Credentials
- **Username:** `admin`
- **Password:** `password123`

⚠️ **IMPORTANT:** Change these credentials immediately after first login!

## 🚀 Usage

### Frontend Access
```
http://localhost/index.html
```

### Admin Dashboard
```
http://localhost/admin.html
```

### Login Page
```
http://localhost/login.html
```

## 📁 File Structure
```
ABDEV/
├── index.html              # Main portfolio page
├── admin.html              # Admin dashboard
├── login.html              # User login/register
├── admin_login.html        # Admin login
├── config.php              # Database config & helpers
├── api.php                 # REST API endpoints
├── login_handler.php       # User authentication
├── check_admin_session.php # Admin session check
├── get_data.php            # Data retrieval endpoint
├── database_setup.sql      # Database schema
├── uploads/                # User file uploads
└── README.md              # This file
```

## 🔌 API Endpoints

### Public Endpoints
```
GET  /get_data.php                 - Get all portfolio data
POST /api.php?action=contact       - Submit contact form
POST /api.php?action=save_review   - Submit review
POST /login_handler.php?action=login    - User login
POST /login_handler.php?action=register - User registration
```

### Admin Endpoints (Protected)
```
POST /api.php?action=save_portfolio    - Create portfolio item
POST /api.php?action=update_portfolio  - Update portfolio item
DELETE /api.php?action=delete_portfolio&id=1 - Delete portfolio

POST /api.php?action=save_music        - Upload music
POST /api.php?action=update_music      - Update music
DELETE /api.php?action=delete_music&id=1 - Delete music

POST /api.php?action=save_skill        - Add skill
POST /api.php?action=update_skill      - Update skill
DELETE /api.php?action=delete_skill&id=1 - Delete skill

POST /api.php?action=save_education    - Add education
POST /api.php?action=update_education  - Update education
DELETE /api.php?action=delete_education&id=1 - Delete education

POST /api.php?action=save_experience   - Add experience
POST /api.php?action=update_experience - Update experience
DELETE /api.php?action=delete_experience&id=1 - Delete experience

POST /api.php?action=save_blog         - Create blog post
POST /api.php?action=update_blog       - Update blog post
DELETE /api.php?action=delete_blog&id=1 - Delete blog

POST /api.php?action=approve_review&id=1 - Approve review
DELETE /api.php?action=delete_review&id=1 - Delete review

POST /api.php?action=ban_user&id=1     - Ban user
POST /api.php?action=unban_user&id=1   - Unban user
```

## 🔐 Security Features

- ✅ BCrypt password hashing
- ✅ Session timeout (1 hour default)
- ✅ IP address verification for sessions
- ✅ Input sanitization & validation
- ✅ SQL injection prevention (prepared statements)
- ✅ CORS headers configured
- ✅ File upload validation
- ✅ Admin route protection

## 🎨 Customization

### Change Primary Color
Edit `:root` in CSS files:
```css
--primary: #a855f7;
```

### Session Timeout
Edit in `config.php`:
```php
define('SESSION_TIMEOUT', 3600); // Change to desired seconds
```

### Upload Limits
Edit in `config.php`:
```php
define('MAX_FILE_SIZE', 50 * 1024 * 1024); // 50MB
```

## 🐛 Troubleshooting

### Database Connection Error
- Check MySQL is running
- Verify credentials in `config.php`
- Ensure database exists: `CREATE DATABASE inbio_portfolio;`

### Upload Not Working
- Check `uploads/` folder exists and is writable
- Verify file permissions: `chmod 755 uploads/`
- Check max upload size in php.ini

### Admin Session Issues
- Clear browser cookies
- Check PHP session settings
- Verify `.htaccess` is working if using Apache

## 📝 Database Tables

| Table | Purpose |
|-------|---------|
| `users` | User accounts & profiles |
| `admin_users` | Admin credentials |
| `portfolio` | Portfolio items |
| `music` | Music library |
| `skills` | Skills (design & dev) |
| `education` | Education records |
| `experience` | Work experience |
| `blogs` | Blog posts |
| `reviews` | Client testimonials |
| `messages` | Contact form submissions |
| `timeline` | Career milestones |
| `pricing` | Pricing plans |

## 🚦 Status Codes

| Code | Meaning |
|------|---------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Server Error |

## 📧 Contact & Support

For issues or questions:
- Email: abdilelisa120@gmail.com
- Phone: +251 943035305
- Location: Ambo, ET

## 📄 License
This project is proprietary and confidential.

---

**Last Updated:** May 22, 2026
**Version:** 1.0.0
