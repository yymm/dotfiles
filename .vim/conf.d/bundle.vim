"---------
"neobundle
"---------

if !1 | finish | endif

if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:

NeoBundle 'Shougo/neocomplete.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc.vim.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'terryma/vim-multiple-cursors.git'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'daisuzu/rainbowcyclone.vim.git'
NeoBundle 'https://bitbucket.org/ludovicchabant/vim-lawrencium', {'type': 'hg'}
NeoBundle 'mattn/emmet-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'koron/codic-vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'kannokanno/previm'
NeoBundle 'LeafCage/yankround.vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
