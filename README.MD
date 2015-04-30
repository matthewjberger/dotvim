#Vim Dot Files

##Installation:

Clone the Repo:

    git clone https://github.com/matthewjberger/DotVim.git ~/.vim

Create symbolic links:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

##Helpful Commands

Adding vim bundles as git submodules for use with pathogen:

    git submodule add (git url) bundle/pluginName

Removing git submodules:

    git submodule deinit bundle/(submodule name)
    git rm bundle/(submodule name)
    rm -rf .git/modules/bundle/(submodule name)

To update individual plugins, navigate to bundle/pluginName and type:

    git pull origin master

To update all plugins:

    git submodule foreach git pull origin master

To verify that ruby is installed and vim has ruby support:

    ruby -v
    vim --version | grep "ruby"

Compiling command-t plugin:

    cd ~/.vim/bundle/command-t/ruby/command-t/
    ruby extconf.rb
    make

Compile YouCompleteMe for C++ and Go code completion:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer --gocode-completer

List available plugins:

    git submodule | sed 's/.*bundle\///'| awk '{print $2}'


