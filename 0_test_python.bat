@echo off
echo Testing Python installation...
echo.

echo Checking if Python is installed and accessible...
python --version
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: Python is not installed or not in PATH
    echo.
    echo Please install Python from: https://python.org
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
)

echo.
echo Checking if pip is available...
pip --version
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: pip is not available
    echo This usually means Python was not installed correctly
    echo.
    pause
    exit /b 1
)

echo.
echo Checking if venv module is available...
python -m venv --help >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: venv module is not available
    echo This is required to create virtual environments
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ All checks passed!
echo.
echo Your Python installation is ready for Charger Monitor setup.
echo You can now run "1_install_requirements.bat" to continue.
echo.
pause