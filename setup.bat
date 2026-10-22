@echo off
setlocal
cd /d "%~dp0"
echo === Wallet Portal setup ===
echo (Right-click this file and choose Run as administrator if MongoDB install is needed)
echo.

where winget >nul 2>&1
if errorlevel 1 (
  echo winget not found. Update Windows App Installer from Microsoft Store, then run again.
  pause & exit /b 1
)

where node >nul 2>&1
if %errorlevel%==0 (
  echo [SKIP] Node.js already installed.
) else (
  echo [INSTALL] Node.js ...
  winget install -e --id OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements
  echo.
  echo Node.js installed. Close this window and run setup.bat once more.
  pause & exit /b 0
)

sc query MongoDB >nul 2>&1
if %errorlevel%==0 (
  echo [SKIP] MongoDB already installed.
) else (
  where mongod >nul 2>&1
  if %errorlevel%==0 (
    echo [SKIP] MongoDB already installed.
  ) else (
    echo [INSTALL] MongoDB Server ...
    winget install -e --id MongoDB.Server --accept-package-agreements --accept-source-agreements
  )
)

if not exist backend\.env (
  copy backend\.env.example backend\.env >nul
  echo [CREATED] backend\.env  - open it and change JWT_SECRET and ADMIN_PASSWORD
)

if exist backend\node_modules (
  echo [SKIP] Backend packages already installed.
) else (
  echo [INSTALL] Backend packages ...
  pushd backend & call npm install & popd
)

if exist frontend\node_modules (
  echo [SKIP] Frontend packages already installed.
) else (
  echo [INSTALL] Frontend packages ...
  pushd frontend & call npm install & popd
)

echo.
echo === Setup finished. Edit backend\.env, then double-click start.bat ===
pause
