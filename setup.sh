#!/bin/sh

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# install apps

brew install tree
brew install git
brew install wget

brew tap caskroom/cask
brew tap caskroom/versions

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

# random stuff
installcask skype
installcask telegram-desktop
installcask slack
installcask day-o # enhances default time widget in topbar
installcask teamviewer
installcask ccleaner
installcask vlc
installcask transmission
installcask libreoffice
installcask cakebrew

# browsers
installcask google-chrome
installcask opera
installcask firefox
installcask firefoxdeveloperedition

# editors
installcask sublime-text
installcask atom
installcask visual-studio-code
installcask

# devtools
installcask iterm2
installcask virtualbox
installcask vagrant
installcask tunnelblick
installcask filezilla
installcask zeplin

# install powerline fonts
mkdir ~/tmp && cd ~/tmp
git clone https://github.com/powerline/fonts.git
cd fonts
sh -c ./install.sh
cd ~/tmp && rm -rf ./fonts

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Set zsh as default shell
chsh -s /bin/zsh
