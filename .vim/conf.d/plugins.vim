"
" Plug-in
"

"-----------
"neocomplete
"-----------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" no completion moving cursor on inser mode
let g:neocomplete_enable_insert_char_pre = 1

"----------
"neosnippet
"----------

" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif

"
" REF : http://kazuph.hateblo.jp/entry/2013/01/19/193745
"

" <TAB>: completion.                                         
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"   
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ---------
" unite.vim
" ---------

let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> fy :<C-u>Unite history/yank<CR>

"--------
"vimfiler
"--------

call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ 'auto_expand' : 1,
      \ 'parent' : 0,
      \ })
"default explore -> vimfiler
let g:vimfiler_as_default_explorer = 1
"buffer directory
nnoremap <silent> fe :<C-u>VimFilerBufferDir -quit<CR>
"IDE like
nnoremap <silent> fi :<C-u>VimFilerBufferDir -split -simple -winwidth=100 -no-quit<CR>
" Nerdtree like
nnoremap <C-e> :VimFiler -buffer-name=explorer -split -winwidth=100 -toggle -no-quit<Cr>
"key mapping
augroup vimrc
	autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
	nnoremap <silent><buffer><expr> s vimfiler#do_switch_action('vsplit')
	nnoremap <silent><buffer><expr> v vimfiler#do_switch_action('split')
	nnoremap <silent><buffer><expr> t vimfiler#do_action('tabopen')
endfunction
" Textmate icons
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

"--------
"vimshell
"--------

nnoremap <silent> vs :<C-u>VimShell<CR>
nnoremap <silent> vp :<C-u>VimShellPop<CR>

let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

"-----------------
"smooth-scroll.vim
"-----------------

"<C-d>：half down
"<C-u>：half up
"<C-f>：down
"<C-b>：up
"refer help
"map <C-u> <C-y>2<C-y>2<C-y>2<C-y>2<C-y>2<C-y><C-y>
"map <C-d> <C-e>2<C-e>2<C-e>2<C-e>2<C-e>2<C-e><C-e>


"------------------
"NERD_commenter.vim
"------------------

"invalid default
let g:NERDCreateDefaultMappings = 0
"Ctrl+x -> comment out
nmap <C-x> <Plug>NERDCommenterToggle
vmap <C-x> <Plug>NERDCommenterToggle

"-------------
"yankround.vim
"-------------

nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


" ------------------
" regular expression
" ------------------

nnoremap /  /\v
" need vim 7.4 later
"set regexpengine=0

" -----------
" vim-airline
" -----------

"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0

" --------------------------------------------------------------------------------
" restpreview with w3m
"
" requirements
" * w3m : text web browser
" * restview : simple reStructuredText viewer (pypi package)
" ref
" http://prepro.wordpress.com/2012/06/10/vimw3mでrestructuredtextの環境を構築する/
" TODO
" webapi.vimとvimprocを使って非同期プロセスでバックエンド起動しておければ最高
" --------------------------------------------------------------------------------

"function! RestWatch()
    "" TODO バックエンドで起動する
    "" !restview -l 9999 . &
    "" TODO 事前にプロセスとwindow情報を確認する。今は固定
    "" let restview_pid = !pgrep -n -f restview
    "" echo !lsof -Fc -a -i -p restview_pid
    ":W3mSplit http://localhost:9999
    ":wincmd L
"endfunction
 
"function! RestW3mReload()
    ":wincmd w
    ":W3mReload
    ":wincmd w
"endfunction
 
"command! -nargs=0 RestWatch call RestWatch()
"command! -nargs=0 RestReload call RestW3mReload()
 
"autocmd BufWritePost *.rst silent call RestW3mReload()

" --------------
" rainbowcyclone
" --------------

nnoremap ,/ :RC!/

" -------------
" Unite outline
" -------------
"let g:unite_split_rule = 'botleft'
"noremap ,u <ESC>:Unite -vertical -winwidth=40 outline<Return>

" --------
" jedi.vim
" --------
" not set vim options
let g:jedi#auto_vim_configuration = 0
" Jedi selects the first line of the completion menu
let g:jedi#popup_select_first = 0
" rename_command is same quickrun
let g:jedi#rename_command = '<Leader>R'
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
autocmd  FileType python let b:did_ftplugin = 1

" --------
" anzu.vim
" --------
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
" format = (num/all)
let g:anzu_status_format = "(%i/%l)"
" vim-anzu on airline's statusline
let g:airline_section_c = '%F %{anzu#search_status()}'
" disable whitespace
let g:airline#extensions#whitespace#enabled = 0

" ------
" previm
" ------
let g:previm_open_cmd = 'open -a Firefox'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" ---------
" Syntastic
" ---------
let g:syntastic_c_include_dirs = [ '../inc', '../src', 'inc', 'src' ]                                                                                                                                                                                                           
let g:syntastic_cpp_include_dirs = [ '../inc', '../src', 'inc', 'src' ]
let g:syntastic_perl_lib_path = [ '/usr/local/lib/perl5/auto' ]
