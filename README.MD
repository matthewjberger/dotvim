#Vim Dot Files

This is my vim configuration.
I use junegunn's vim-plug for plugin management.

##Installation:

Clone the Repo and install plugins:

    bash -c 'git clone https://github.com/matthewjberger/DotVim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update
    vim +PlugInstall +qa'
