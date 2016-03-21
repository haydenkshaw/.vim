# Hayden Shaw's Vim configuration
This is a set of [Vim](http://www.vim.org/about.php) plug-ins and configuration I like to use to develop things. I use this on [OS X El Capitan](https://en.wikipedia.org/wiki/OS_X_El_Capitan) using [MacVim](https://github.com/macvim-dev/macvim) and [Windows 10](https://en.wikipedia.org/wiki/Windows_10) using [Gvim](http://www.vim.org/download.php#pc). 

Feel free to use/ridicule it.

## Installation
### Windows 10 
I used [Chocolatey](https://chocolatey.org/) to install Gvim and PHP 7.

**Step-by-step**:
 1. Install Chocolatey
 2. Install Gvim (using chocolatey)
 3. Ensure git is installed
 3. Clone this repo into your home directory
 4. `git submodule init`
 5. `git submodule update`
 6. Sym link .vimrc to my repo's vimrc
 7. (Optional install PHP 7 using Chocolately)

### OS X El Capitan
I used brew to install MacVim and PHP 7.

**Step-by-step**:
 1. `brew install macvim`
 2. Ensure git is installed
 3. git clone to home dir
 4. `git submodule init && git submodule update`
 5. `ln -s ~/.vim/.vimrc ~/.vimrc`
 6. `ln -h ~/.vim/git_hooks/post-merge ~/.vim/.git/hooks/post-merge`
 7. `ln -h ~/.vim/git_hooks/post-checkout ~/.vim/.git/hooks/post-checkout`
 8. (Optional `brew install php70 --with-pear`)
 9. (Optional install font [Source Code Pro](https://github.com/adobe-fonts/source-code-pro))
 

## Other people's Vim configuration's to take ideas from
 - https://github.com/spf13/spf13-vim
 - https://github.com/amix/vimrc
 - https://github.com/scrooloose/nerdtree/commit/677a83b2b63fda1c52205acd39973fe1b44e8b54
 - 
 
## To add to this readem:
 - Optional Google Closure-compiler linting instructions [executable here](https://developers.google.com/closure/compiler/docs/gettingstarted_app#the-hello-world-of-the-closure-compiler-application)
 - or using Brew for mac


