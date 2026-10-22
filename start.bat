@echo off
cd /d "%~dp0"
net start MongoDB >nul 2>&1
start "Backend" cmd /k "cd backend && npm start"
start "Frontend" cmd /k "cd frontend && npm run dev"
timeout /t 6 >nul
start http://localhost:5173
