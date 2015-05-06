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

# Build the YouCompleteMe code completion plugin
$dir="~/.vim/bundle/YouCompleteMe"
if [ -d "$dir" ]; then
    cd $dir
    ./install.sh --clang-completer --gocode-completer
fi

# Build the vimproc plugin
$dir="~/.vim/bundle/vimproc"
if [ -d "$dir" ]; then
    cd $dir
    make
fi

# Install powerline fonts
$dir="~/.vim/powerlinefonts"
git clone https://github.com/powerline/fonts.git $dir
if [ -d "$dir"]; then
    cd $dir
    ./install.sh
    gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ubuntu Mono derivative Powerline 12"
    echo "If vim-airline doesn't look right, you may have to go into your terminal properties
    and make sure that \"Use the system fixed width font\" under the General tab is unchecked."
    rm -rf $dir
fi
