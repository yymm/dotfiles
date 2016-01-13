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
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc.vim.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'daisuzu/rainbowcyclone.vim.git'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'koron/codic-vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'LeafCage/yankround.vim.git'
NeoBundle 'majutsushi/tagbar'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
