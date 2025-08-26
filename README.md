# ⚡ Charger Monitor - Ultra-Fast Windows Protection

A lightning-fast Python application that protects your laptop battery by showing a fullscreen warning when your charger is disconnected. Features ultra-optimized startup (~0.1-0.3 seconds) and minimal resource usage.

## 🚀 Quick Setup (No Technical Knowledge Required)

Just double-click **`setup.bat`** and follow the beautiful interactive wizard:

```
===============================================================
███████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ███████╗██████╗
██╔════╝██║  ██║██╔══██╗██╔══██╗██╔════╝ ██╔════╝██╔══██╗
██║     ███████║███████║██████╔╝██║  ███╗█████╗  ██████╔╝
██║     ██╔══██║██╔══██║██╔══██╗██║   ██║██╔══╝  ██╔══██╗
╚██████╗██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗██║  ██║
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝

███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗
████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗
██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝
██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗
██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║
╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
===============================================================
            Ultra-Fast Windows Startup Protection
===============================================================
```

**Menu Options:**

1. **Check Python Installation** 🐍 - Test if Python works
2. **Install Requirements** 📦 - Smart virtual environment setup
3. **Build Lightning-Fast Executable** ⚡ - Ultra-optimized build
4. **Setup Windows Startup** 🎯 - Auto-start protection
5. **Test Your Application** 🧪 - See it in action
6. **Show System Status** 📊 - Check installation status
7. **Complete Uninstall** 🗑️ - Clean removal (if needed)

## Prerequisites

-   Python 3.6 or higher installed on Windows
-   Internet connection (for downloading packages)

## 🛡️ Smart & Safe Installation

The setup wizard uses **intelligent virtual environments** to keep your system pristine:

-   ✅ **Smart Reuse** - Reuses existing virtual environments instead of deleting them
-   ✅ **Package Detection** - Only installs missing packages for faster setup
-   ✅ **Zero Conflicts** - No interference with existing Python packages
-   ✅ **System Protection** - Your system Python remains completely untouched
-   ✅ **Clean Removal** - Complete uninstall removes everything
-   ✅ **IDE Friendly** - Works even when Python files are open in your IDE

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

## ✨ Features

### ⚡ **Performance Optimized**

-   **Lightning startup** (~0.1-0.3 seconds) - Faster than most apps
-   **Minimal footprint** - Only essential components included
-   **Optimized build** - Uses `--onedir` for maximum speed
-   **Smart exclusions** - Removes heavy unused modules

### 🧠 **Intelligent Behavior**

-   **Smart detection** - Exits immediately if charger already connected
-   **Auto-close** - Disappears when charger is plugged in
-   **Battery monitoring** - Real-time status checking
-   **Manual override** - "Proceed Anyway" button for emergencies

### 🔧 **Developer Friendly**

-   **Safe installation** - Isolated virtual environment
-   **Smart package management** - Reuses existing installations
-   **IDE compatible** - No file locking issues
-   **Easy debugging** - Clear error messages and status reporting

## How It Works

-   Monitors battery status every second
-   Shows fullscreen warning when charger disconnected
-   Automatically closes when charger reconnected
-   Runs silently in background until needed

## File Structure

```text
ChargerMonitor/
├── v1.py                          # Main Python script
├── README.md                      # This guide
├── requirements.txt               # Python dependencies
├── LICENSE                        # MIT License
├── .gitignore                     # Git ignore rules
├── setup.bat                      # All-in-one setup wizard
├── venv/                         # Virtual environment (auto-created)
├── build/                        # Build files (auto-generated)
└── dist/v1/                      # Final executable folder
    ├── v1.exe                    # Main executable
    └── [supporting files]        # Required libraries
```

## 🔧 Troubleshooting

| Issue                          | Solution                                                        |
| ------------------------------ | --------------------------------------------------------------- |
| **Python not found**           | Use option 1 in `setup.bat` to check your Python installation   |
| **Build fails**                | Use option 2 in `setup.bat` to install requirements first       |
| **Slow startup**               | The setup wizard includes all speed optimizations automatically |
| **Doesn't start on boot**      | Check Windows startup folder for the shortcut                   |
| **"Access denied" errors**     | The new smart setup avoids file locking issues completely       |
| **Virtual environment issues** | Setup now reuses existing venv instead of deleting it           |

### 💡 **Pro Tips**

-   Run `setup.bat` multiple times safely - it's smart about reusing installations
-   The setup wizard works even when your IDE has Python files open
-   Use option 6 to check what's installed and working
-   Option 7 provides complete clean removal if needed

## Uninstall

Simply run `setup.bat` and choose option 7 to remove everything completely, including the virtual environment.

## 🔬 Technical Details

### **Build Optimizations**

-   **`--onedir` build** - Fastest startup (vs `--onefile`)
-   **`--optimize=2`** - Maximum bytecode optimization
-   **`--strip`** - Removes debug symbols for smaller size
-   **Module exclusions** - Removes matplotlib, numpy, pandas, scipy, PIL, cv2
-   **Smart virtual environment** - Reuses existing installations

### **Performance Specs**

-   **Startup time**: ~0.1-0.3 seconds (lightning fast!)
-   **Memory usage**: Minimal footprint
-   **Dependencies**: Only Python standard library + psutil
-   **Build time**: ~30-60 seconds on average systems

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Feel free to submit issues and pull requests to improve this tool!

**Author:** [mrbeandev](https://t.me/mrbeandev)  
**Contact:** [@mrbeandev](https://t.me/mrbeandev)

---

⚡ **Stay charged and productive!** ⚡
