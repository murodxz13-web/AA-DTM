# Project Overview

This project is a comprehensive web application designed to facilitate task management.

# Features
- User authentication with JWT
- Task creation, updating, and deletion
- Real-time updates

# Tech Stack
- **Backend**: FastAPI
- **Database**: PostgreSQL
- **Authentication**: JWT
- **Frontend**: Flutter

# Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/murodxz13-web/AA-DTM.git
   ```
2. Navigate to the project directory:
   ```bash
   cd AA-DTM
   ```
3. Set up the database:
   - Create a PostgreSQL database and user.
   - Configure the database settings in the application.
4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
5. Run the backend server:
   ```bash
   uvicorn app.main:app --reload
   ```
6. Run the Flutter app:
   ```bash
   flutter run
   ```

Enjoy task management!