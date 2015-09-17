#Vim Dot Files

This is my vim configuration.
I use junegunn's vim-plug for plugin management.

##Installation:

Install dependencies, clone the repo, and install plugins:

    bash -c 'sudo apt-get install exuberant-ctags
    sudo apt-get install build-essential cmake
    sudo apt-get install python-dev
    git clone https://github.com/matthewjberger/DotVim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update
    vim +PlugInstall +qa'
