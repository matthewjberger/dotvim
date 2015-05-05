# Install dependencies
sudo apt-get install ack-grep
sudo apt-get install silversearcher-ag
sudo apt-get install exuberant-ctags
sudo apt-get install golang

# Create a symbolic link to the vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# Initialize and update submodules
cd ~/.vim
git submodule init
git submodule update --init --recursive

# Build the YouCompletMe code completion plugin
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --gocode-completer

# Build the vimproc plugin
cd ~/.vim/bundle/vimproc
make

# Install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.vim/powerlinefonts
cd ~/.vim/powerlinefonts
./install.sh
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 12"
echo "If vim-airline doesn't look right, you may have to go into your terminal properties
and make sure that \"Use the system fixed width font\" under the General tab is unchecked."
