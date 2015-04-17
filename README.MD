Installation:

    git clone https://github.com/matthewjberger/DotVim.git ~/.vim

Create symbolic links:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

To update individual plugins, navigate to bundle/pluginName and type:

    git pull origin master

To update all plugins:

    git submodule foreach git pull origin master

Adding pathogen bundle submodules (self):

    git submodule add (git url) bundle/pluginName

To verify that ruby is installed and vim has ruby support:

    ruby -v
    vim --version | grep "ruby"

Compiling command-t plugin:

    cd ~/.vim/bundle/command-t/ruby/command-t/
    ruby extconf.rb
    make
