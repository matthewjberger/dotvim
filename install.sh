ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --gocode-completer
cd ~/.vim/bundle/vimproc
make
