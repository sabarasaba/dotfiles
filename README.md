# My dotfiles.

Works on *nix, optimized for OS X.

Managed using [Stow](http://www.gnu.org/software/stow/), so you can pick and
choose which programs to install.


---
## Philosophy

Initially I tried entirely automating the entire install process, but quickly
found it wasn't worth the maintenance. Starting from scratch happens so rarely
for me that each time I was fiddling with the bootstrap scripts to work around
a random issue (often due to a new version of OSX).

Instead, it's simpler to install stuff by hand, and manage only the
configuration files (dotfiles) in this repo.


---
## Install steps on a clean OSX machine:

1. Make hidden files/folder [visible in Finder](http://apple.stackexchange.com/questions/99213/is-it-possible-to-always-show-hidden-dotfiles-in-open-save-dialogs):
      `defaults write -g AppleShowAllFiles -bool true`

2. `git clone git@github.com:sabarasaba/dotfiles.git ~/.dotfiles`
  - If cloning to a server without a Github-connected SSH key use 'https' instead:
      `git clone https://github.com/sabarasaba/dotfiles.git ~/.dotfiles`

3. Install desired binaries using your favorite package manager:
  - If on OSX, use Homebrew:
    1. Install [Homebrew](http://brew.sh/).
    2. Install [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle): `$ brew tap Homebrew/bundle`
    3. `$ brew bundle --file=~/.dotfiles/homebrew/.Brewfile`
    After the `.Brewfile` is symlinked into ``~/.Brewfile`, just use `$ brew bundle --global`.
  - Make sure Stow gets installed, we'll use this later to symlink the dotfiles.
  - Ruby:
    1. Use [`rvm`](http://rvm.io/) instead of Homebrew. Much easier to manage
    gemsets, ruby versions, etc.
  - Node:
    1. Use [`n`](https://github.com/tj/n) instead of Homebrew for
    managing Node.

4. Make bash the default shell:
  1. `$ sudo vim /etc/shells`
  2. Append the path to bash - Homebrew sticks it in `/usr/local/bin/bash`
  3. Save and exit
  4. `$ chsh -s /usr/local/bin/bash`

5. Now use `stow` to symlink the various config files:
  - `$ cd ~/.dotfiles/`
  - `$ stow PACKAGE_NAME` will symlink all the files inside of the package_name's folder into the parent directory (in this case, the user's home folder.)
  - Stow thoughtfully raises an error if the symlink destination already exists. For example, installing ZSH creates a default `~/.zshrc` and `~/.zshlogin`. Just delete these default files before stowing your customized versions.
  - If using a different OS than OS X, some packages may store their config files at a different location. For example, the fonts folder. Just specify the full destination path for Stow.
  - More info:
     - http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
     - http://taihen.org/managing-dotfiles-with-gnu-stow/
     - http://kianmeng.org/blog/2014/03/08/using-gnu-stow-to-manage-your-dotfiles/
  - Several config files aren't `stow`able--review the list below


---
##List of config files

 - bash
 - git
 - Homebrew Brewfile - stowable, `brew bundle --global` will use $HOME/.Brewfile
 - nvim - Neovim. No need to stow as it respects `$XDG_CONFIG_HOME`
 - python - not stowable, use `pip install -r ~/.dotfiles/python/requirements.txt`
 - ruby
 - tmux - #TODO
 - vim - for when Neovim isn't available
 - vimify - `.inputrc` and `.editrc` make vim commands work in many interactive
    shells, for example the mysql and postgres shells

---

## License

Copyright 2021 Ignacio Rivas
Licensed under the MIT License
