@echo off
echo Building fast-startup executable using virtual environment...
echo.

if not exist "v1.py" (
    echo ERROR: v1.py not found in current directory
    pause
    exit /b 1
)

if not exist "venv" (
    echo ERROR: Virtual environment not found!
    echo Please run "1_install_requirements.bat" first
    pause
    exit /b 1
)

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Verifying pyinstaller is available...
pyinstaller --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: PyInstaller not found in virtual environment
    echo Please run "1_install_requirements.bat" first
    pause
    exit /b 1
)

echo Cleaning previous builds...
if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"
if exist "*.spec" del "*.spec"

echo.
echo Building executable with optimizations...
echo Using virtual environment Python: %VIRTUAL_ENV%
pyinstaller --onedir --noconsole --optimize=2 --strip --exclude-module=matplotlib --exclude-module=numpy --exclude-module=pandas --exclude-module=scipy --exclude-module=PIL --exclude-module=cv2 v1.py

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Build failed!
    echo Try running "1_install_requirements.bat" again
    pause
    exit /b 1
)

echo.
echo ✅ Build completed successfully!
echo.
echo Your executable is located at: dist\v1\v1.exe
echo Built using isolated virtual environment - no system conflicts!
echo.
echo Next steps:
echo 1. Test the executable by running: dist\v1\v1.exe
echo 2. Run "3_setup_startup.bat" to add it to Windows startup
echo.
pause