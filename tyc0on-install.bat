@echo off
setlocal
title Install Dependencies

set "SCRIPT_DIR=%~dp0"
set "ENV_PATH=%SCRIPT_DIR%env"

if not exist "%ENV_PATH%\Scripts\activate.bat" (
    echo Virtual environment not found. Please recreate the environment.
    pause
    exit /b 1
)

call "%ENV_PATH%\Scripts\activate"
echo Installing requirements...
"%ENV_PATH%\Scripts\python.exe" -m pip install -r "%SCRIPT_DIR%requirements.txt"
if %ERRORLEVEL% neq 0 (
    echo Failed to install requirements.
    pause
    exit /b 1
)
echo Requirements installed successfully.
pause
