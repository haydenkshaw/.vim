# Hayden Shaw's Vim configuration
This is a set of [Vim](http://www.vim.org/about.php) plug-ins and configuration I like to use to develop things. I use this on [OS X El Capitan](https://en.wikipedia.org/wiki/OS_X_El_Capitan) using [MacVim](https://github.com/macvim-dev/macvim) and [Windows 10](https://en.wikipedia.org/wiki/Windows_10) using [Gvim](http://www.vim.org/download.php#pc). 

Feel free to use/ridicule it.

## Installation
### Windows 10 
I used [Chocolatey](https://chocolatey.org/) to install Gvim and PHP 7.

**Step-by-step**:
 1. Install Chocolatey; [instructions](https://chocolatey.org)
 2. Install Vim using Chocolatey; [instructions](https://chocolatey.org/packages/vim)
 3. Install Git using Chocolatey; [instructions](https://chocolatey.org/packages/git)
 4. Clone this repository using the following command:
 ```
 git clone https://github.com/haydenkshaw/.vim.git %USERPROFILE%/.vim
 ```
 
 5. Set up symlinks using the following command:
 ```
 call %USERPROFILE%/.vim/windows_symlink_setup.cmd`
 ```

 6. Install and update Vim plugins using the following command:
 ```
 git checkout %USERPROFILE%/.vim
 ```
 7. (Optional) Enable PHP syntax checking by installing PHP using Chocolatey; [instructions](https://chocolatey.org/packages/php)
 8. (Optional) Enable JS syntax checking by installing [JSHint](https://www.npmjs.com/package/jshint):
   1. Install Node.js using Chocolatey; [instructions](https://chocolatey.org/packages/nodejs)
   2. Install JSHint using NPM by using the following command:
   ```
   npm install jshint
   ```
 9. (Optional) Install font [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)

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
 10. (Optional `brew install node && npm install -g jshint`)
 11. (Optional `brew install ruby`)
 

## Other people's Vim configuration's to take ideas from
 - https://github.com/spf13/spf13-vim
 - https://github.com/amix/vimrc
 - https://github.com/scrooloose/nerdtree/commit/677a83b2b63fda1c52205acd39973fe1b44e8b54
