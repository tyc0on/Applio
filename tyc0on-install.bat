@echo off
setlocal
title Install Dependencies

set "SCRIPT_DIR=%~dp0"
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%
set "ENV_PATH=%SCRIPT_DIR%\env"
set "ENV_ZIP=%SCRIPT_DIR%\env.zip"

if not exist "%ENV_PATH%\Scripts\activate.bat" (
    if exist "%ENV_ZIP%" (
        echo Extracting env.zip...
        tar -xf "%ENV_ZIP%" -C "%SCRIPT_DIR%"
        if %ERRORLEVEL% neq 0 (
            echo Failed to extract env.zip.
            pause
            exit /b 1
        )
    ) else (
        echo Virtual environment not found and env.zip is missing. Please provide env.zip.
        pause
        exit /b 1
    )
)

call "%ENV_PATH%\Scripts\activate"
echo Installing requirements...
"%ENV_PATH%\Scripts\python.exe" -m pip install -r "%SCRIPT_DIR%\requirements.txt"
if %ERRORLEVEL% neq 0 (
    echo Failed to install requirements.
    pause
    exit /b 1
)
echo Requirements installed successfully.
pause
