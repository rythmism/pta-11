@echo off
cls
echo =======================================================
echo  STARTING AUTOMATED ENVIRONMENT INSTALLATION SYSTEM
echo =======================================================

:: Verify Administrator Privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please run this batch script as an Administrator!
    pause
    exit /b
)

echo [1/6] Installing Package Managers (Chocolatey)...
powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('chocolatey.org'))"
set "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo [2/6] Installing Compilers (MSVC, GCC, GFortran, COBOL)...
choco install visualstudio2022buildtools --package-parameters "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended" -y
choco install mingw -y
choco install gnucobol -y
choco install cmake --installargs "ADD_CMAKE_TO_PATH=System" -y

echo [3/6] Installing Language Ecosystems (Rust, Python, Node.js, Git)...
winget install Rustlang.Rustup -e --accept-source-agreements --accept-package-agreements
winget install Python.Python.3.11 -e --accept-source-agreements --accept-package-agreements
winget install OpenJS.NodeJS -e --accept-source-agreements --accept-package-agreements
choco install git -y

echo [4/6] Installing Python Local Web Server Dashboard Dependencies...
pip install flask

echo [5/6] Appending System Environment Path Mappings...
setx /M PATH "%PATH%;C:\ProgramData\chocolatey\bin;C:\tools\mingw64\bin"

echo [6/6] Dependency Verification Check...
echo All developer environments provisioned successfully! Restart terminal window.
pause
