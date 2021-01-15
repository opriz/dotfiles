mkdir -p ~/dotfiles-backup
cp ~/.vimrc ~/dotfiles-backup 2> /dev/null
cp ~/.tmux.conf ~/dotfiles-backup 2> /dev/null
ln -s vimrc ~/.vimrc 2> /dev/null
ln -s tmux.conf ~/.tmux.conf 2> /dev/null
