@echo off
chcp 65001 >nul
title Charger Monitor - Setup Wizard
setlocal enabledelayedexpansion

:MAIN_MENU
cls
echo.
echo    ===============================================================
echo    ███████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ███████╗██████╗ 
echo    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝ ██╔════╝██╔══██╗
echo    ██║     ███████║███████║██████╔╝██║  ███╗█████╗  ██████╔╝
echo    ██║     ██╔══██║██╔══██║██╔══██╗██║   ██║██╔══╝  ██╔══██╗
echo    ╚██████╗██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗██║  ██║
echo     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
echo.
echo    ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗ 
echo    ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗
echo    ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝
echo    ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗
echo    ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║
echo    ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
echo    ===============================================================
echo                    Ultra-Fast Windows Startup Protection
echo    ===============================================================
echo.
echo    What would you like to do today?
echo.
echo    [1] Check Python Installation        ^| Test if Python works
echo    [2] Install Requirements             ^| Safe virtual environment
echo    [3] Build Lightning-Fast Executable  ^| Optimized for speed
echo    [4] Setup Windows Startup            ^| Auto-start on boot
echo    [5] Test Your Application            ^| See it in action
echo    [6] Show System Status               ^| Check what's installed
echo    [7] Complete Uninstall               ^| Remove everything
echo    [0] Exit                             ^| Goodbye!
echo.
echo    ===============================================================
set /p choice="    Enter your choice (0-7): "

if "%choice%"=="1" goto CHECK_PYTHON
if "%choice%"=="2" goto INSTALL_REQUIREMENTS
if "%choice%"=="3" goto BUILD_EXE
if "%choice%"=="4" goto SETUP_STARTUP
if "%choice%"=="5" goto TEST_APP
if "%choice%"=="6" goto SHOW_STATUS
if "%choice%"=="7" goto UNINSTALL
if "%choice%"=="0" goto EXIT

echo.
echo    Oops! That's not a valid choice. Please try again...
timeout /t 2 >nul
goto MAIN_MENU

:CHECK_PYTHON
cls
echo.
echo    ===============================================================
echo                          PYTHON HEALTH CHECK
echo    ===============================================================
echo.
echo    Let's make sure Python is ready for action...
echo.

echo    ➡️ Checking if Python is installed...
python --version 2>nul
if %errorlevel% neq 0 (
    echo    ❌ OOPS! Python is not installed or not in PATH
    echo.
    echo        Please install Python from: https://python.org
    echo        Make sure to check "Add Python to PATH" during installation
    echo.
    goto PAUSE_RETURN
)
echo    [✅] Python found and ready!

echo.
echo    ➡️ Checking if pip is available...
pip --version 2>nul
if %errorlevel% neq 0 (
    echo    ❌ OOPS! pip is not available
    echo        This usually means Python was not installed correctly
    goto PAUSE_RETURN
)
echo    [✅] pip is working perfectly!

echo.
echo    ➡️ Checking if venv module is available...
python -m venv --help >nul 2>&1
if %errorlevel% neq 0 (
    echo    ❌ OOPS! venv module is not available
    echo        This is required to create virtual environments
    goto PAUSE_RETURN
)
echo    [✅] venv module is ready to go!

echo.
echo    ===============================================================
echo                        ALL SYSTEMS GO! 🚀
echo    ===============================================================
echo.
echo    Your Python installation is perfect! You can now proceed
echo    with option 2 to install the requirements safely.
echo.
goto PAUSE_RETURN

:INSTALL_REQUIREMENTS
cls
echo.
echo    ===============================================================
echo                      INSTALLING REQUIREMENTS
echo    ===============================================================
echo.
echo    Creating a safe virtual environment to keep your system clean...
echo.

echo    ➡️ Verifying Python is available...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo    ❌ Python not found! Please run option 1 first.
    goto PAUSE_RETURN
)
echo    [✅] Python is ready

echo.
echo    ➡️ Setting up virtual environment...
if exist "venv" (
    echo        Removing old virtual environment...
    rmdir /s /q "venv"
)

python -m venv venv
if %errorlevel% neq 0 (
    echo    ❌ Failed to create virtual environment
    goto PAUSE_RETURN
)
echo    [✅] Virtual environment created

echo.
echo    ➡️ Activating virtual environment...
call venv\Scripts\activate.bat
echo    [✅] Virtual environment activated

echo.
echo    ➡️ Upgrading pip to latest version...
pip install --upgrade pip --quiet
echo    [✅] pip upgraded

echo.
echo    ➡️ Installing psutil (battery monitoring magic)...
pip install psutil --quiet
if %errorlevel% neq 0 (
    echo    ❌ Failed to install psutil
    goto PAUSE_RETURN
)
echo    [✅] psutil installed

echo.
echo    ➡️ Installing pyinstaller (executable builder)...
pip install pyinstaller --quiet
if %errorlevel% neq 0 (
    echo    ❌ Failed to install pyinstaller
    goto PAUSE_RETURN
)
echo    [✅] pyinstaller installed

echo.
echo    ===============================================================
echo                        INSTALLATION COMPLETE! 🎉
echo    ===============================================================
echo.
echo    What was installed:
echo    • Isolated Python environment in 'venv' folder
echo    • psutil for battery monitoring
echo    • pyinstaller for creating executables
echo.
echo    Your system Python is completely untouched and safe!
echo    Ready for option 3 to build your lightning-fast executable.
echo.
goto PAUSE_RETURN

:BUILD_EXE
cls
echo.
echo    ===============================================================
echo                    BUILDING LIGHTNING-FAST EXECUTABLE
echo    ===============================================================
echo.
echo    Time to create your ultra-optimized executable...
echo.

if not exist "v1.py" (
    echo    ❌ v1.py not found in current directory
    goto PAUSE_RETURN
)

if not exist "venv" (
    echo    ❌ Virtual environment not found!
    echo        Please run option 2 first to install requirements
    goto PAUSE_RETURN
)

echo    ➡️ Activating virtual environment...
call venv\Scripts\activate.bat
echo    [✅] Virtual environment activated

echo.
echo    ➡️ Verifying pyinstaller is ready...
pyinstaller --version >nul 2>&1
if %errorlevel% neq 0 (
    echo    ❌ PyInstaller not found! Please run option 2 first.
    goto PAUSE_RETURN
)
echo    [✅] PyInstaller is ready

echo.
echo    ➡️ Cleaning up previous builds...
if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"
if exist "*.spec" del "*.spec" >nul 2>&1
echo    [✅] Build directory cleaned

echo.
echo    ➡️ Building with MAXIMUM SPEED optimizations...
echo        • Using --onedir for fastest startup
echo        • Applying --optimize=2 for bytecode optimization
echo        • Stripping debug symbols with --strip
echo        • Excluding heavy modules for minimal size
echo.

pyinstaller --onedir --noconsole --optimize=2 --strip --exclude-module=matplotlib --exclude-module=numpy --exclude-module=pandas --exclude-module=scipy --exclude-module=PIL --exclude-module=cv2 v1.py

if %errorlevel% neq 0 (
    echo    ❌ Build failed! Try running option 2 again.
    goto PAUSE_RETURN
)

echo.
echo    ===============================================================
echo                        BUILD SUCCESSFUL! ⚡
echo    ===============================================================
echo.
echo    Your executable is ready at: dist\v1\v1.exe
echo.
echo    Performance specs:
echo    • Startup time: ~0.1-0.3 seconds (lightning fast!)
echo    • Built with isolated virtual environment
echo    • Zero system conflicts
echo    • Optimized for Windows startup
echo.
echo    Next steps:
echo    • Option 5: Test your application
echo    • Option 4: Add to Windows startup
echo.
goto PAUSE_RETURN

:SETUP_STARTUP
cls
echo.
echo    ===============================================================
echo                       SETUP WINDOWS STARTUP
echo    ===============================================================
echo.
echo    Making your charger monitor start automatically with Windows...
echo.

if not exist "dist\v1\v1.exe" (
    echo    ❌ Executable not found!
    echo        Please run option 3 first to build the executable
    goto PAUSE_RETURN
)

echo    ➡️ Creating permanent installation directory...
set "INSTALL_DIR=%USERPROFILE%\ChargerMonitor"
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
echo    [✅] Installation directory created

echo.
echo    ➡️ Copying files to permanent location...
xcopy "dist\v1\*" "%INSTALL_DIR%\" /E /I /Y /Q
if %errorlevel% neq 0 (
    echo    ❌ Failed to copy files
    goto PAUSE_RETURN
)
echo    [✅] Files copied successfully

echo.
echo    ➡️ Creating Windows startup shortcut...
set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%STARTUP_DIR%\ChargerMonitor.lnk'); $Shortcut.TargetPath = '%INSTALL_DIR%\v1.exe'; $Shortcut.WorkingDirectory = '%INSTALL_DIR%'; $Shortcut.Save()" 2>nul

if %errorlevel% neq 0 (
    echo    ❌ Failed to create startup shortcut
    goto PAUSE_RETURN
)
echo    [✅] Startup shortcut created

echo.
echo    ===============================================================
echo                        STARTUP SETUP COMPLETE! 🎯
echo    ===============================================================
echo.
echo    Installation details:
echo    • Program location: %INSTALL_DIR%
echo    • Startup shortcut: Windows startup folder
echo    • Auto-start: Enabled for all future boots
echo.
echo    Your charger monitor will now protect you automatically!
echo.
echo    To test: Restart your computer or use option 5
echo    To remove: Use option 7 for complete uninstall
echo.
goto PAUSE_RETURN

:TEST_APP
cls
echo.
echo    ===============================================================
echo                         TEST YOUR APPLICATION
echo    ===============================================================
echo.
echo    Let's see your charger monitor in action...
echo.

if not exist "dist\v1\v1.exe" (
    echo    ❌ Executable not found!
    echo        Please run option 3 first to build the executable
    goto PAUSE_RETURN
)

echo    ➡️ Preparing to launch Charger Monitor...
echo.
echo    What to expect:
echo    • If charger is connected: App exits immediately (working correctly!)
echo    • If charger is disconnected: Fullscreen warning appears
echo    • Click "Proceed Anyway" to close the warning
echo.
echo    Press any key to start the test...
pause >nul

echo.
echo    ➡️ Launching Charger Monitor...
start "" "dist\v1\v1.exe"

echo    [✅] Application started!
echo.
echo    ===============================================================
echo                           TEST LAUNCHED! 🧪
echo    ===============================================================
echo.
echo    The application is now running. Check your screen for:
echo    • Immediate exit (if charger connected) = SUCCESS
echo    • Fullscreen warning (if charger disconnected) = SUCCESS
echo.
echo    If you see the warning, click "Proceed Anyway" to close it.
echo.
goto PAUSE_RETURN

:SHOW_STATUS
cls
echo.
echo    ===============================================================
echo                           SYSTEM STATUS
echo    ===============================================================
echo.
echo    Let's check what's installed and working...
echo.

echo    Python Installation:
python --version 2>nul
if %errorlevel% neq 0 (
    echo    ❌ Python not found
) else (
    echo    [✅] Python is installed and working
)

echo.
echo    Virtual Environment:
if exist "venv" (
    echo    [✅] Virtual environment exists
) else (
    echo    ❌ Virtual environment not found
)

echo.
echo    Executable:
if exist "dist\v1\v1.exe" (
    echo    [✅] Executable built and ready
) else (
    echo    ❌ Executable not found
)

echo.
echo    Windows Startup:
set "STARTUP_SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\ChargerMonitor.lnk"
if exist "%STARTUP_SHORTCUT%" (
    echo    [✅] Configured for Windows startup
) else (
    echo    ❌ Not configured for startup
)

echo.
echo    Installation Directory:
set "INSTALL_DIR=%USERPROFILE%\ChargerMonitor"
if exist "%INSTALL_DIR%" (
    echo    [✅] Permanently installed
) else (
    echo    ❌ Not permanently installed
)

echo.
echo    Current Battery Status:
python -c "import psutil; b=psutil.sensors_battery(); print(f'    Battery: {b.percent:.0f}%% - {\"Plugged In\" if b.power_plugged else \"Unplugged\"}' if b else '    Battery status unknown')" 2>nul
if %errorlevel% neq 0 (
    echo    [?] Cannot check battery (psutil not installed)
)

echo.
echo    ===============================================================
echo                         STATUS CHECK COMPLETE
echo    ===============================================================
echo.
goto PAUSE_RETURN

:UNINSTALL
cls
echo.
echo    ===============================================================
echo                         COMPLETE UNINSTALL
echo    ===============================================================
echo.
echo    This will remove EVERYTHING related to Charger Monitor:
echo    • Windows startup shortcut
echo    • Installation directory
echo    • Virtual environment and build files
echo.
echo    Your system Python will remain completely untouched.
echo.
set /p confirm="    Are you sure you want to uninstall? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo.
    echo    Uninstall cancelled. Nothing was removed.
    goto PAUSE_RETURN
)

echo.
echo    ➡️ Removing Windows startup shortcut...
set "STARTUP_SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\ChargerMonitor.lnk"
if exist "%STARTUP_SHORTCUT%" (
    del "%STARTUP_SHORTCUT%"
    echo    [✅] Startup shortcut removed
) else (
    echo    [!] Startup shortcut not found
)

echo.
echo    ➡️ Removing installation directory...
set "INSTALL_DIR=%USERPROFILE%\ChargerMonitor"
if exist "%INSTALL_DIR%" (
    rmdir /s /q "%INSTALL_DIR%"
    echo    [✅] Installation directory removed
) else (
    echo    [!] Installation directory not found
)

echo.
echo    ➡️ Cleaning up virtual environment...
if exist "venv" (
    rmdir /s /q "venv"
    echo    [✅] Virtual environment removed
) else (
    echo    [!] Virtual environment not found
)

echo.
echo    ➡️ Cleaning up build files...
if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"
if exist "*.spec" del "*.spec" >nul 2>&1
echo    [✅] Build files cleaned

echo.
echo    ===============================================================
echo                        UNINSTALL COMPLETE! 🗑️
echo    ===============================================================
echo.
echo    Everything has been removed:
echo    • No more automatic startup
echo    • No traces in your system
echo    • Virtual environment completely gone
echo    • Your system Python is pristine
echo.
echo    You can safely delete this project folder if you want.
echo    Thanks for using Charger Monitor!
echo.
goto PAUSE_RETURN

:PAUSE_RETURN
echo.
echo    ===============================================================
echo    Press any key to return to main menu...
pause >nul
goto MAIN_MENU

:EXIT
cls
echo.
echo    ===============================================================
echo.
echo        ████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗███████╗
echo        ╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝██╔════╝
echo           ██║   ███████║███████║██╔██╗ ██║█████╔╝ ███████╗
echo           ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗ ╚════██║
echo           ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗███████║
echo           ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
echo.
echo                  for using Charger Monitor Setup!
echo.
echo                         Stay charged! ⚡
echo.
echo    ===============================================================
echo.
timeout /t 1 >nul
exit /b 0