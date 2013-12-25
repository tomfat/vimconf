@echo off

REM Switch to root folder
pushd %~dp0..
set ROOT_DIR=%CD%
set BIN_DIR=%CD%\bin
set VIM_DIR=%HOMEPATH%
REM set VIM_DIR=%CD%\test
REM in windows vim plugin are placed under vimfiles folder
set VIM_FILES=%VIM_DIR%\vimfiles
set AUTOLOAD_DIR=%VIM_FILES%\autoload
set BUNDLE_DIR=%VIM_FILES%\bundle

echo "----Create vimfiles directory"
mkdir %VIM_FILES%
mkdir %AUTOLOAD_DIR%
mkdir %BUNDLE_DIR%

echo "----Copy _vimrc file"
copy "%ROOT_DIR%\_vimrc" "%VIM_DIR%"

REM Install plugins
REM Switch to vimfiles directory
pushd %VIM_FILES%

REM pathogen is plugin used to manage other plugin in a neat way
echo "----Install pathogen"
git clone git://github.com/tpope/vim-pathogen.git pathogen
echo "Copy pathogen"
copy "pathogen\autoload" "%VIM_FILES%\autoload"

REM all other plugin will be installed under bundle folder.

REM Switch to bundle directory
pushd %BUNDLE_DIR%

echo "----Install delimitmate"
git clone git://github.com/Raimondi/delimitMate.git delmitmate

echo "----Install desert color schema"
git clone git://github.com/vim-scripts/desert.vim.git desert

echo "----Install nerdtree"
git clone git://github.com/scrooloose/nerdtree.git nerdtree

echo "----Install taglist"
git clone git://github.com/vim-scripts/taglist.vim.git targlist

REM return to previous folder
popd
popd
popd

