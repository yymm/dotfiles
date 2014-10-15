DOT_FILES=( .zshrc .zshrc.env .gitconfig .screenrc .vimrc .vim .tmux.conf .tmux-powerline)

for file in ${DOT_FILES[@]}
do
	ln -s -i $HOME/dotfiles/$file $HOME/$file
done

# Neobundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"

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

askYesOrNo ">>> GUI?"
if [ $? -eq 0 ]; then
	ls -s -i $HOME/dotfiles/.vimperatorrc $HOME/.vimperatorrc
	ls -s -i $HOME/dotfiles/.vimperator $HOME/.vimperator
fi
