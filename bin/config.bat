@echo off

REM Switch to root folder
pushd %~dp0..
set ROOT_DIR=%CD%
set BIN_DIR=%CD%\bin
set VIM_DIR=%HOMEPATH%

echo %VIM_DIR%

echo "Copy _vimrc file"
copy "%ROOT_DIR%\_vimrc" "%VIM_DIR%"

echo "Copy plugin, doc, etc."
robocopy "%ROOT_DIR%\vimfiles" "%VIM_DIR%\vimfiles" /E

REM return to previous folder
popd

