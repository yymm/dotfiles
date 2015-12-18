"---------
"neobundle
"---------

filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

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
NeoBundle 'majutsushi/tagbar'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
