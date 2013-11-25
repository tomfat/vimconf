@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate.
	goto eof
    )


REM Switch to root folder
pushd %~dp0..
set ROOT_DIR=%CD%
set BIN_DIR=%CD%\bin
set VIM_DIR=%programfiles(x86)%\Vim

echo %VIM_DIR%

echo "Copy _vimrc file"
copy "%ROOT_DIR%\_vimrc" "%VIM_DIR%"

echo "Copy plugin, doc, etc."
robocopy "%ROOT_DIR%\vimfiles" "%VIM_DIR%\vimfiles" /E

REM return to previous folder
popd

:eof
