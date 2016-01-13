DOT_FILES=( .zshrc .zshrc.env .gitconfig .screenrc .vimrc .vim .tmux.conf .tmux-powerline .hgrc)

for file in ${DOT_FILES[@]}
do
	ln -s -i $HOME/dotfiles/$file $HOME/$file
done

# Neobundle
[ ! -d ~/.vim/bundle ] && git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
[ ! -d ~/.vim/bundle/vimproc.vim ] && git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim

case "${OSTYPE}" in
# Mac(Unix)
darwin*)0
    cd ~/.vim/bundle/vimproc.vim && make -f make_mac.mak
    ;;  
# Linux
linux*)
    cd ~/.vim/bundle/vimproc.vim && make -f make_unix.mak
    ;;  
esac

vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
