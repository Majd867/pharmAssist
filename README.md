# PharmAssist 💊
**Pharmacy Management System (Flutter + Laravel)**

PharmAssist is a modern **pharmacy management system** designed to simplify daily pharmacy operations.
It provides secure authentication, role-based access, inventory management, billing, and statistics
in a single integrated platform.

---

## 🔐 Authentication & Authorization

- Login using **username and password**
- A secure **authentication token** is generated after login
- All API requests are authorized using this token
- Two user roles are supported:
    - **Admin**
    - **Employee**
- Features are displayed based on user role

---

## 🏠 Main Page Features

From the main page, users can access:

- **Customer Orders**
- **Return Medication**
- **Order Supplies**

---

## 📂 Navigation Drawer

The application includes a dynamic **side drawer menu**.

### 👑 Admin Drawer Items

Admins have access to:

- Profile Page
- Income Statistics
- Employee Management
- Language Selection (Arabic / English)
- Privacy Policy
- Terms & Conditions
- Contact Information
- Logout

### 👨‍⚕️ Employee Drawer Items

Employees can access:

- Profile Page
- Language Selection (Arabic / English)
- Privacy Policy
- Terms & Conditions
- Contact Information
- Logout

> **Note:** Employee Management and Income Statistics are hidden for employees.

---

## 📦 Inventory Management

The inventory module allows users to:

- View all available medicines
- See detailed information for each medicine:
    - Name
    - Category
    - Quantity
    - Price
    - Expiry date
- Search medicines using the search bar
- Filter medicines by categories such as:
    - Pain Relief
    - Antibiotics
    - Supplements
    - Others

---

## 🧾 Billing System

PharmAssist includes a complete billing system:

- Customer Orders Bills
- Supply Orders Bills
- Organized invoice history
- Clear and structured bill records

---

## 🌐 Multi-Language Support

- Supports **Arabic** and **English**
- Language can be changed from the drawer
- Interface updates instantly after language change

---

## 🛠️ Technology Stack

### Frontend (Mobile Application)
- Flutter
- REST API integration

### Backend
- Laravel
- RESTful API
- Token-based authentication
- Role-based authorization

---

## 🔗 System Architecture

- Flutter communicates with Laravel via **REST APIs**
- Laravel handles:
    - Authentication
    - Authorization
    - Business logic
    - Database management
- Flutter handles:
    - User interface
    - User interaction
    - State management

---


