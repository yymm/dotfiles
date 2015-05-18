DOT_FILES=( .zshrc .zshrc.env .gitconfig .screenrc .vimrc .vim .tmux.conf .tmux-powerline .hgrc )

for file in ${DOT_FILES[@]}
do
	ln -s -i $HOME/dotfiles/$file $HOME/$file
done

# Neobundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
[ ! -d ~/.vim/bundle/vimproc.vim ] && git clone git@github.com:Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim

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

function askYesOrNo {
  MSG=$1
  while :
  do
    echo -n "${MSG} y/N: "
    read ans
    case $ans in
    [yY]) return 0 ;;
    [nN]) return 1 ;;
    esac
  done
}

#askYesOrNo ">>> GUI?"
#if [ $? -eq 0 ]; then
#	ln -s -i $HOME/dotfiles/.vimperatorrc $HOME/.vimperatorrc
#	ln -s -i $HOME/dotfiles/.vimperator $HOME/.vimperator
#fi
