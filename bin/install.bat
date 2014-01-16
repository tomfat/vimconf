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
set BUNDLE_DIR=%ROOT_DIR%\bundle

echo "----Create vimfiles directory"
mkdir %VIM_FILES%
mkdir %AUTOLOAD_DIR%
mkdir %BUNDLE_DIR%

REM pathogen is plugin used to manage other plugin in a neat way
echo "----Install pathogen"
git submodule add git://github.com/tpope/vim-pathogen.git pathogen

pushd %BUNDLE_DIR%
echo "----Install delimitmate"
git submodule add git://github.com/Raimondi/delimitMate.git delmitmate

echo "----Install desert color schema"
git submodule add git://github.com/vim-scripts/desert.vim.git desert

echo "----Install nerdtree"
git submodule add git://github.com/scrooloose/nerdtree.git nerdtree

echo "----Install taglist"
git submodule add git://github.com/vim-scripts/taglist.vim.git targlist

echo "----Install jsbeautify"
git submodule add git://github.com/maksimr/vim-jsbeautify.git jsbeautify

REM return to ROOT_DIR
popd
git submodule update --init --recursive

echo "----Create link for _vimrc file"
mklink "%VIM_DIR%\_vimrc" "%ROOT_DIR%\_vimrc" 

echo "----Create link for pathogen"
mklink "%AUTOLOAD_DIR%\pathogen.vim" "%ROOT_DIR%\pathogen\autoload\pathogen.vim" 

echo "----Create link for other plugins"
mklink /D "%VIM_FILES%\bundle" "%ROOT_DIR%\bundle" 

REM Return to previous folder
popd
