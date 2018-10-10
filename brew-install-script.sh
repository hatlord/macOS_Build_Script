#!/bin/sh

# Homebrew Script for MacOS
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#update brew
brew update

# Install GNU core utilities (those that come with OS X are outdated)
echo "Installing GNU Core Utilities"
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

#Programming Languages
echo "Programming Languages"
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
    optimist
)
gem install ${RUBY_GEMS[@]}

#Dev Tools
echo "Dev Tools"
brew install git
brew cask install github-desktop
brew cask install atom
brew cask install sublime-text
brew cask install osxfuse
brew install sshfs
#its better to just download the docker DMG. Saves a lot of fannying around
# brew install docker
# brew install docker-compose
# brew install docker-machine

#Testing Tools
echo "Installing Testing Tools"
brew install netcat
brew cask install burp-suite
brew cask install owasp-zap
brew cask install zenmap
brew cask install metasploit
brew install sqlmap
brew install hydra
brew install john-jumbo
brew install ophcrack
brew install testssl
brew install sslscan
brew install ike-scan
brew install nikto
brew install telnet

#Communication Apps
echo "Communications Apps"
brew cask install slack
brew cask install adium
brew cask install skype-for-business

#Web Tools
echo "Installing Browsers"
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
brew cask install cyberduck
brew cask install viscosity
brew cask install skitch
brew cask install citrix-receiver
brew cask install carbon-copy-cloner
brew cask install vyprvpn
brew cask install vmware-fusion8 #could be changed to whatever version you need - 'brew cask search vmware'
