#Vim Dot Files

This is my vim configuration.
I use tpope's vim-pathogen and git submodules for plugin management.

##Installation:

Clone the Repo:

    git clone https://github.com/matthewjberger/DotVim.git ~/.vim

Create symbolic links:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
