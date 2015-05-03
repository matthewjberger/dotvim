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

Compile YouCompleteMe for C++ and Go code completion:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer --gocode-completer

List installed plugins from vim:

    <leader>ll

Ignore changes to git submodules:

    git config --global --replace-all alias.st 'git status --ignore-submodules=all'
