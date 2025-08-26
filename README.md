# Charger Monitor - Windows Setup Guide

A lightweight Python application that displays a fullscreen popup reminder when your laptop is not connected to a charger. Features ultra-fast startup and minimal resource usage.

## Quick Setup (No Technical Knowledge Required)

Just double-click the batch files in order:

0. **`0_test_python.bat`** - (Optional) Test if Python is properly installed
1. **`1_install_requirements.bat`** - Creates virtual environment and installs packages
2. **`2_build_exe.bat`** - Creates the executable (optimized for speed)
3. **`3_setup_startup.bat`** - Adds to Windows startup
4. **`4_uninstall.bat`** - Removes everything (if needed later)

## Prerequisites

- Python 3.6 or higher installed on Windows
- Internet connection (for downloading packages)

## Safe Installation

This project uses **virtual environments** to keep your system clean:

- ✅ No conflicts with existing Python packages
- ✅ Your system Python remains untouched
- ✅ Easy complete removal
- ✅ Isolated dependencies

## Manual Setup (Advanced Users)

### Step 1: Create Virtual Environment and Install Requirements

```bash
python -m venv venv
venv\Scripts\activate
pip install psutil pyinstaller
```

### Step 2: Build Optimized Executable

```bash
pyinstaller --onedir --noconsole --optimize=2 --strip --exclude-module=matplotlib --exclude-module=numpy --exclude-module=pandas --exclude-module=scipy --exclude-module=PIL --exclude-module=cv2 v1.py
```

### Step 3: Setup Startup

1. Copy `dist\v1\` folder to permanent location
2. Create shortcut to `v1.exe` in startup folder (`shell:startup`)

## Features

- **Ultra-fast startup** (~0.1-0.3 seconds)
- **Lightweight** - Only essential components
- **Smart detection** - Exits immediately if charger already connected
- **Auto-close** - Disappears when charger is plugged in
- **Manual override** - "Proceed Anyway" button for emergencies
- **Safe installation** - Uses virtual environment to avoid conflicts

## How It Works

- Monitors battery status every second
- Shows fullscreen warning when charger disconnected
- Automatically closes when charger reconnected
- Runs silently in background until needed

## File Structure

```text
ChargerMonitor/
├── v1.py                          # Main Python script
├── README.md                      # This guide
├── requirements.txt               # Python dependencies
├── LICENSE                        # MIT License
├── .gitignore                     # Git ignore rules
├── 0_test_python.bat             # Test Python installation
├── 1_install_requirements.bat     # Create venv and install packages
├── 2_build_exe.bat               # Build optimized executable
├── 3_setup_startup.bat           # Setup Windows startup
├── 4_uninstall.bat               # Complete removal
├── venv/                         # Virtual environment (auto-created)
├── build/                        # Build files (auto-generated)
└── dist/v1/                      # Final executable folder
    ├── v1.exe                    # Main executable
    └── [supporting files]        # Required libraries
```

## Troubleshooting

**Python not found**: Run `0_test_python.bat` to check your Python installation

**Build fails**: Ensure you ran `1_install_requirements.bat` first

**Slow startup**: Use the provided batch files (they include speed optimizations)

**Doesn't start on boot**: Check Windows startup folder for the shortcut

## Uninstall

Simply run `4_uninstall.bat` to remove everything completely, including the virtual environment.

## Technical Notes

- Uses isolated virtual environment for clean installation
- Uses `--onedir` build for fastest startup (vs `--onefile`)
- Excludes unnecessary modules to reduce size and load time
- Optimized bytecode compilation with `--optimize=2`
- No external dependencies beyond Python standard library + psutil

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Contributing

Feel free to submit issues and pull requests to improve this tool.