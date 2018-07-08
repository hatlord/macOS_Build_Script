#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#update brew
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

#Programming Languages
brew install ruby
brew install python
brew install python3

#Install Ruby Gems
echo "Installing Ruby gems"
RUBY_GEMS=(
    bundler
    tty
    nokogiri
    colorize
    threadify
    trollop
    tiny_tds
    text-table
)
gem install ${RUBY_GEMS[@]}

#Dev Tools
brew install git
brew cask install github-desktop
brew cask install atom
brew cask install sublime-text

#Testing Tools
brew install netcat
brew cask install burp-suite
brew cask install owasp-zap
brew cask install zenmap
brew cask install metasploit

#Communication Apps
brew cask install slack

#Web Tools
brew cask install google-chrome
brew cask install firefox
brew cask install caskroom/versions/firefoxdeveloperedition

# Core Functionality
echo "Installing Core Apps"
brew cask install alfred
brew cask install dropbox
brew cask install iterm2
brew cask install java
brew cask install evernote
brew cask install 1password
brew cask install spotify
brew cask install whatsapp
brew cask install path-finder
brew cask install bartender
brew cask install vmware-fusion8 #could be changed to whatever version you need - 'brew cask search vmware'
