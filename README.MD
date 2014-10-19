Installation:

    git clone https://github.com/Odin366/DotVim.git ~/.vim

Create symbolic links:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

To update individual plugins, navigate to bundle/pluginName and type:

    git pull origin master

To update all plugins:

    git submodule foreach git pull origin master

