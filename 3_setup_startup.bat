@echo off
echo Setting up Windows startup...
echo.

if not exist "dist\v1\v1.exe" (
    echo ERROR: Executable not found!
    echo Please run "2_build_exe.bat" first to create the executable
    pause
    exit /b 1
)

echo Creating permanent installation directory...
set "INSTALL_DIR=%USERPROFILE%\ChargerMonitor"
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

echo Copying files to permanent location...
xcopy "dist\v1\*" "%INSTALL_DIR%\" /E /I /Y

if %errorlevel% neq 0 (
    echo ERROR: Failed to copy files
    pause
    exit /b 1
)

echo Creating startup shortcut...
set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%STARTUP_DIR%\ChargerMonitor.lnk'); $Shortcut.TargetPath = '%INSTALL_DIR%\v1.exe'; $Shortcut.WorkingDirectory = '%INSTALL_DIR%'; $Shortcut.Save()"

if %errorlevel% neq 0 (
    echo ERROR: Failed to create startup shortcut
    pause
    exit /b 1
)

echo.
echo ✅ Setup completed successfully!
echo.
echo Installation details:
echo - Program installed to: %INSTALL_DIR%
echo - Startup shortcut created in: %STARTUP_DIR%
echo.
echo The charger monitor will now start automatically when Windows boots.
echo.
echo To test: Restart your computer or run the executable manually
echo To uninstall: Run "4_uninstall.bat"
echo.
pause