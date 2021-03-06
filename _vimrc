set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Init pathogen
call pathogen#infect()
call pathogen#helptags()

if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

"colorscheme desert
"if has("gui_running")
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    colorscheme solarized
"endif

set nu
set nobackup
filetype on
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
set showtabline=2

"Set search ignore case
set ignorecase
set smartcase

"Set indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"Set font for gvim
if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


"Set windows size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif

"----------------------------
"Configure plug-ins
"----------------------------

"Configure tag list
"nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Close_On_Select = 1
"let Tlist_Use_Right_Window   = 1
"let Tlist_WinWidth = 40

"Configure NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeWinSize=40
:let NERDTreeIgnore = ['\.o$','\.ko$']
"autocmd VimEnter * NERDTree

"Configure DelimitMate
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_expand_space = 0
let delimitMate_quotes = "\" ' ` *"

"Configure Js beautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html  noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css  noremap <buffer> <c-f> :call CSSBeautify()<cr>

"Configure Close Tag
autocmd FileType html, htmldjango, jinjahtml, eruby, mako let b:closetag_html_style=1
autocmd FileType html, xhtml, xml, htmldjango, jinjahtml, eruby, mako source ~/.vim/bundle/closetag/plugin/closetag.vim

"Configure tagbar
let g:tagbar_usearrows = 1
nnoremap <silent> <F12> :TagbarToggle<CR>

"Configure nerdcommenter

"Configure mouse
set mouse-=a
