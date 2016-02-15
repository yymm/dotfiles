"
" VIM setting
"

"Not vi! It is VIM!
set nocompatible
"row number
set number
"cursorline
set cursorline
"show title
set title
"display rular
set ruler
"display command on status line
set showcmd
"bracket match high lighting
set noshowmatch
"always status line
set laststatus=2
"ok backspace
"indent : ok
"eol    : ok
"start  : insert mode ok backspace
set backspace=indent,eol,start
"tab size
set ts=4 sw=4 sts=0
"auto indent
set autoindent
set cindent
"tab is tab not space
set noexpandtab
"no buckup file
set nobackup
"no swap file
set noswapfile
"no undofile
set noundofile
"Syntax HighLight
syntax on
"change color by my way
hi Comment ctermfg=darkcyan
hi Directory ctermfg=darkcyan
hi SpecialKey ctermfg=darkcyan
hi Constant ctermfg=red
hi WarningMsg ctermfg=red
hi LineNr ctermfg=darkgray
hi CursorLine term=None cterm=None ctermbg=black
hi Special ctermfg=magenta
hi Preproc ctermfg=magenta
hi Title ctermfg=magenta
hi Search ctermbg=green
hi Search ctermfg=black
hi DiffChange ctermfg=black
hi DifAdd ctermfg=black
"colorTest key mapping
command! HighLightList so $VIMRUNTIME/syntax/hitest.vim
command! ColorList so $VIMRUNTIME/syntax/colortest.vim
"no beep
set vb t_vb=
"ClipBoard
"set clipboard&
"set clipboard+=unnamed
"set clipboard+=autoselect
"set clipboard=unnamed
" search setting
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>
set wrapscan
set ignorecase
set incsearch
"change display mapping
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"nowrap
set nowrap
"autoload on other editor
set autoread
"not save, but change buffer
set hidden
"edit vimrc mapping
nmap ,rc [vimrc]
nnoremap <silent> [vimrc] :<C-u>e $MYVIMRC<CR>
nnoremap <silent> [vimrc]v :<C-u>vs $MYVIMRC<CR>
nnoremap <silent> [vimrc]s :<C-u>sp $MYVIMRC<CR>
nnoremap <silent> [vimrc]r :<C-u>source $MYVIMRC<CR>
"auto update vimrc
augroup vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" tabnew mapping : tn
nnoremap <silent> tn :<C-u>tabnew<CR>
" return current mapping : <Space> + cd
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
	if a:directory == ''
		lcd %:p:h
	else
		execute 'lcd' . a:directory
	endif
	if a:bang == ''
		pwd
	endif
endfunction
"Change current directory.
nnoremap <silent> <Space> cd :<C-u>CD<CR>
"row number hide setting
nnoremap <silent> setnon :<C-u>set nonumber<CR>
nnoremap <silent> setn :<C-u>set number<CR>
"vimdiff command : Diff
"vimdiff
command! -nargs=1 -complete=file Diff vertical diffsplit <args>
"vertical size adjust '<' '>'
nnoremap <silent>< <C-w><
nnoremap <silent>> <C-w>>
"horizonal size adjust '+' '-'
noremap <silent>+ <C-w>+
noremap <silent>- <C-w>-
"file update on focus out
augroup vimrc-checktime
	autocmd!
	autocmd WinEnter * checktime
augroup END
" cursor wrap setting
set whichwrap+=h,l,<,>,[,],b,s,~
" Tab page jump
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" 
highlight JpSpace cterm=underline ctermfg=Red guifg=Red
au BufRead,BufNew * match JpSpace /　/
" enable to * normal mode
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" popup menu color setting
hi Pmenu ctermbg=6
hi PmenuSel ctermbg=5
hi PmenuSbar ctermbg=0
"hi PmenuThumb ctermbg=5

" encoding setting
set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf8
set fileencodings=utf-8,euc-jp,ucs-bom,iso-2022-jp,sjis,cp932,latin

"
" for Python
"
augroup Python_Coding
	au FileType python call s:python_setting()
augroup END

function! s:python_setting()
	"indent
	setl autoindent
	setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
	setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
	"PEP 8 high lighting too long
	set textwidth=0
	if exists('&colorcolumn')
		set colorcolumn&
		set colorcolumn=+1
		setl textwidth=80
	endif
	setl textwidth=80
	setl colorcolumn=80
	"close index
	setl foldmethod=indent
	setl foldlevel=99
	" pyflakes
	"let pyflakes_use_quickfix=0
endfunction

"
" for fortran
"
augroup Fortran_Coding
	au FileType fortran call s:fortran_setting()
augroup END

function! s:fortran_setting()
	setl colorcolumn=6
endfunction

"
" golang
"
set rtp+=$GOROOT/misc/vim

"
" coffee
"
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" " インデントを設定
autocmd FileType coffee     setlocal sw=4 sts=4 ts=4 et

"
" tagbar
"
nmap <F10> :TagbarToggle<CR>

"
" Plugins
"
set runtimepath+=~/.vim/
runtime! conf.d/*.vim

"
" BlockDiff
" http://www.vim.org/scripts/script.php?script_id=2048
"

" Vim BlockDiff-Plugin
"
" Author: Timo Teifel
" Email: timo dot teifel at teifel dot net
" Version: 1.1
" Date: 23 Oct 2007
" Licence: GPL v2.0
"
" Usage:
"   - Select first block
"   - Depending on the configuration, select:
"       - Menu Tools->BlockDiff-> This\ is\ Block\ 1
"       - Popup-Menu    -> This\ is\ Block\ 1
"       - :BlockDiff1
"       - ,d1
"   - select second block (may be in another file, but in the same
"     Vim window)
"       - Menu Tools->BlockDiff-> This\ is\ Block\ 2,\ start\ diff
"       - Popup-Menu    -> This\ is\ Block\ 2,\ start\ diff
"       - :BlockDiff2
"       - ,d2
"   - Script opens a new tab, splits it and shows the diff between
"     the two blocks.
"   - Close the tab when done 
" 
" History:
"   V1.0: Initial upload
"   V1.1: Added commands and inclusion guard, Thanks to Ingo Karkat


" Avoid installing twice or when in compatible mode 
if exists('g:loaded_blockdiff') || (v:version < 700) 
finish 
endif 
let g:loaded_blockdiff = 1


let s:save_cpo = &cpo
set cpo&vim

" ---------- Configuration ----------------------------------------------------
" uncomment one or more of these blocks:


" Create menu entry:
    vmenu 40.352.10 &Tools.Bloc&kDiff.This\ is\ Block\ &1 :call BlockDiff_GetBlock1()<CR>
    vmenu 40.352.20 &Tools.Bloc&kDiff.This\ is\ Block\ &2,\ start\ diff :call BlockDiff_GetBlock2()<CR>


" Create popup-menu-entry:
    "vmenu PopUp.BlockDiff.This\ is\ Block\ 1 :call BlockDiff_GetBlock1()<CR>
    "vmenu PopUp.BlockDiff.This\ is\ Block\ 2,\ start\ diff :call BlockDiff_GetBlock2()<CR>

" Shortcuts
    "vmap ,d1 :call BlockDiff_GetBlock1()<CR>
    "vmap ,d2 :call BlockDiff_GetBlock2()<CR>

" Commands 
    command! -range BlockDiff1 :<line1>,<line2>call BlockDiff_GetBlock1() 
    command! -range BlockDiff2 :<line1>,<line2>call BlockDiff_GetBlock2()


" ---------- Code -------------------------------------------------------------
fun! BlockDiff_GetBlock1() range
  let s:regd = @@
  " copy selected block into unnamed register
  exe a:firstline . "," . a:lastline . "y"
  " save block for later use in variable
  let s:block1 = @@
  " restore unnamed register
  let @@ = s:regd
endfun

fun! BlockDiff_GetBlock2() range
  let s:regd = @@
  exe a:firstline . "," . a:lastline . "y"

  " Open new tab, paste second selected block
  tabnew
  normal P
  " to prevent 'No write since last change' message:
  se buftype=nowrite
  diffthis

  " vsplit left for first selected block
  lefta vnew
  " copy first block into unnamed register & paste
  let @@ = s:block1
  normal P
  se buftype=nowrite

  " start diff
  diffthis

  " restore unnamed register
  let @@ = s:regd
endfun


let &cpo = s:save_cpo
unlet s:save_cpo

" indent highlight
hi SpecialKey ctermfg=darkmagenta
set list listchars=tab:¦_
