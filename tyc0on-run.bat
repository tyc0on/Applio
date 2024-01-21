@echo off
setlocal
title Applio

set "SCRIPT_DIR=%~dp0"
set "ENV_PATH=%SCRIPT_DIR%env"

if not exist "%ENV_PATH%\Scripts\activate.bat" (
    echo Virtual environment not found. Please recreate the environment.
    pause
    exit /b 1
)

call "%ENV_PATH%\Scripts\activate"
"%ENV_PATH%\Scripts\python.exe" "%SCRIPT_DIR%app.py" --open
pause
