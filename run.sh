DOT_FILES=( .zshrc .zshrc.env .gitconfig .screenrc .vimrc .vim .tmux.conf .tmux-powerline .hgrc )

for file in ${DOT_FILES[@]}
do
	ln -nfs -i $HOME/.dotfiles/$file $HOME/$file
done
