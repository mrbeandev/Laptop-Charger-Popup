@echo off
echo Setting up virtual environment and installing packages...
echo This keeps your system Python clean and avoids conflicts!
echo.

echo Checking if Python is available...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python from https://python.org
    pause
    exit /b 1
)

echo Creating virtual environment...
if exist "venv" (
    echo Virtual environment already exists, removing old one...
    rmdir /s /q "venv"
)

python -m venv venv
if %errorlevel% neq 0 (
    echo ERROR: Failed to create virtual environment
    echo Make sure Python venv module is available
    pause
    exit /b 1
)

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Installing required packages in virtual environment...
pip install --upgrade pip
pip install psutil
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to install psutil
    pause
    exit /b 1
)

pip install pyinstaller
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to install pyinstaller
    pause
    exit /b 1
)

echo.
echo ✅ Virtual environment created and packages installed successfully!
echo.
echo What was installed:
echo - Created isolated Python environment in 'venv' folder
echo - Installed psutil (for battery monitoring)
echo - Installed pyinstaller (for creating executable)
echo.
echo Your system Python is completely untouched!
echo You can now run "2_build_exe.bat" to create the executable
echo.
pause