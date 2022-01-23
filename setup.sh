DOT_FILES=(.bashrc .bash_profile .vimrc .zshrc .gvimrc .gitconfig)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
