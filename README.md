Installation

    git clone git@github.com:DorianZheng/dotfiles.git

Vim plugin Vundle is installed as git submodules. Check these out by
running the commands:

    cd dotfiles
    git submodule init
    git submodule update

Where possible, Vim plugins are installed by Vundle. check these out by
running the commands:

    vim +PluginInstall +qall

Create symlinks:

    ln -s ~/dotfiles/bash/bashrc ~/.bashrc

    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    
    ln -s ~/dotfiles/gtk ~/.gtkrc-2.0

    ln -s ~/dotfiles/irbrc ~/.irbrc
    ln -s ~/dotfiles/ctags ~/.ctags
    ln -s ~/dotfiles/jshintrc ~/.jshintrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

    ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
    ln -s ~/dotfiles/git/global-gitignore ~/.gitignore

I put Vim's backup and swap files in `~/tmp`, so that directory must exist. To
be sure, run: 

    mkdir ~/tmp

# VIM #

My preferences for Vim are stored in `dotfiles/vimrc` and `dotfiles/gvimrc`
respectively. All plugins and scripts are stored in the `dotfiles/vim`
directory.

## Adding Plugin Bundles ##


### Ctags

    sudo apt-get install exuberant-ctags

### YouCompleteMe

Compiling YCM with semantic support for C-family languages:
    
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    ./install.sh --clang-completer
    (for me YCM server crashed with its own libclang, so I reinstall YCM with system libclang. 
    Just replace ./install.sh --clang-completer with ./install.sh --clang-completer --system-clang)

### winmanager

fix bug

    " modify ~/dotfiles/vim/bundle/winmanager/plugin/winmanager.vim configure file
    function! <SID>ToggleWindowsManager()
	    if IsWinManagerVisible()
		    call s:CloseWindowsManager()
	    else
		    call s:StartWindowsManager()
		    exe 'q' "####添加此行
	    end
    endfunction

### Command-t

The command-t extension require Vim with ruby support, and furthermore, the
ruby code depends on a C extension for extra speed. The usual pathogen
installation proceedure didn't work for me, but I followed these steps to make
it work:

    cd ~/dotfiles/vim/bundle/command-t/ruby/command-t
    ruby extconf.rb
    make

That did the trick.

# RUBY #

My preferences for IRB customisations are stored in `dotfiles/irbrc`. To get
the most from these, you should install the [interactive_editor][i_editor] and
[awesome_print][ap] gems, by running:

    gem install interactive_editor awesome_print

# REFERENCE #

Some references:[interactive_editor][i_editor]



[jsbun]: http://github.com/pangloss/vim-javascript.git
[ap]: http://github.com/michaeldv/awesome_print
[i_editor]: http://github.com/jberkel/interactive_editor
[ref_dotfiles]: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles
