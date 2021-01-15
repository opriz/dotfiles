mkdir -p ~/dotfiles-backup
mv ~/.vimrc ~/dotfiles-backup 2> /dev/null
mv ~/.tmux.conf ~/dotfiles-backup 2> /dev/null
ln -s $(pwd)/vimrc ~/.vimrc 2> /dev/null
ln -s $(pwd)/tmux.conf ~/.tmux.conf 2> /dev/null
