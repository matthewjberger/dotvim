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
