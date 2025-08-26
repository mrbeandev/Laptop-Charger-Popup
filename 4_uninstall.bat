@echo off
echo Uninstalling Charger Monitor...
echo.

set "INSTALL_DIR=%USERPROFILE%\ChargerMonitor"
set "STARTUP_SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\ChargerMonitor.lnk"

echo Removing startup shortcut...
if exist "%STARTUP_SHORTCUT%" (
    del "%STARTUP_SHORTCUT%"
    echo ✅ Startup shortcut removed
) else (
    echo ⚠️  Startup shortcut not found
)

echo Removing installation directory...
if exist "%INSTALL_DIR%" (
    rmdir /s /q "%INSTALL_DIR%"
    echo ✅ Installation directory removed
) else (
    echo ⚠️  Installation directory not found
)

echo Cleaning up virtual environment...
if exist "venv" (
    rmdir /s /q "venv"
    echo ✅ Virtual environment removed
) else (
    echo ⚠️  Virtual environment not found
)

echo Cleaning up build files...
if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"
if exist "*.spec" del "*.spec" >nul 2>&1

echo.
echo ✅ Complete uninstall finished!
echo.
echo Removed:
echo - Windows startup shortcut
echo - Installation directory: %INSTALL_DIR%
echo - Virtual environment and build files
echo.
echo Your system Python is completely clean - no packages were affected!
echo You can safely delete this project folder if you no longer need it.
echo.
pause