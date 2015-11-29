# Install dependencies
sudo apt-get install -y ack-grep
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev
sudo apt-get install -y golang

# Create a symbolic link to the vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# Initialize and update submodules
cd ~/.vim
git submodule init
git submodule update --init --recursive

# Install powerline fonts
git clone https://github.com/powerline/fonts.git ~/.vim/fonts
cd ~/.vim/fonts
./install.sh

# Set font manually
#gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline Regular 12"
#gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false

echo "If vim-airline doesn't look right, you may have to go into your terminal properties
and make sure that \"Use the system fixed width font\" under the General tab is unchecked."
rm -rf ~/.vim/fonts

# Install Vim-Plug and plugins
cd ~/.vim
git submodule init
git submodule update
vim +PlugInstall +qa
