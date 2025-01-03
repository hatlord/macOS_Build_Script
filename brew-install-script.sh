#!/bin/sh

# Homebrew Script for MacOS
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

#Change system settings
echo "Changing system settings"
defaults write com.apple.finder ShowPathbar -bool true #shows path in finder
defaults write com.apple.finder ShowStatusBar -bool true #shows status bar (number of files/space remaining)
chflags nohidden ~/Library #unhide files in Library
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton #enables right mouse click
defaults write -g AppleKeyboardUIMode -int 2 #tab to navigate prompts

#install xcode
xcode-select --install

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#update brew
brew update

# Install GNU core utilities (those that come with OS X are outdated)
echo "Installing GNU Core Utilities"
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed 
brew install gnu-tar
brew install gnu-indent
brew install gnu-which
brew install grep
brew install wget

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
    tty-command
    tty-prompt
    nokogiri
    colorize
    threadify
    trollop
    tiny_tds
    text-table
    optimist
    searchpass
    caxlsx
    roo
)
sudo gem install ${RUBY_GEMS[@]}

#Dev Tools
echo "Dev Tools"
brew install git
brew install atom --cask
brew install sublime-text --cask

#Testing Tools
echo "Installing Testing Tools"
brew install netcat
brew install burp-suite --cask
brew install owasp-zap --cask
brew install zenmap --cask
# brew cask install metasploit - not sure i want this on my base OS
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
brew install slack --cask
brew install --cask microsoft-teams

#Web Tools
echo "Installing Browsers"
brew install google-chrome --cask
brew install firefox --cask
brew install caskroom/versions/firefoxdeveloperedition --cask

#Menu bar organisation
brew install --cask dozer

#Install MAS - this tool installs applications from the Apple app store - you must be signed into the apple account first!
brew install mas #https://github.com/mas-cli/mas
#Install apps using mas - note - comment out any you dont own!
echo "Installing app store apps"
mas install 1295203466 #Microsoft RDP
mas install 470158793 #keka
mas install 1116599239 #nordvpn
mas install 411643860 #daisy disk
mas install 604275546 #xml notepad
mas install 441258766 #magnet
mas install 1274495053 #microsoft to-do
mas install 425424353 #the unarchiver
mas install 775737590 #iA Writer
mas install 1289197285 #mindnode
mas install 1451685025 #wireguard
mas install 497799835 #xcode 
mas install 1408727408 #wifi explorer lite
mas install 1333542190 #1password
mas install 406056744 #evernote
mas install 405843582 #alfred

# Core Functionality
echo "Installing Core Apps"
brew install alfred --cask
brew install dropbox --cask
brew install iterm2 --cask
brew install vmware-fusion --cask
brew install java
brew install spotify --cask
brew install whatsapp --cask
brew install bartender --cask
brew install cyberduck --cask
brew install viscosity --cask
brew install skitch --cask
brew install citrix-receiver --cask
brew install carbon-copy-cloner --cask

#brew cleanup
brew cleanup

#Install Oh My ZSH
echo "Installing OhMyZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#Install PowerLevel Theme:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#Set Theme in zshrc
echo '"ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
#Install Powerlevel Fonts
echo "Installing Powerlevel Fonts"
cd ~/Library/Fonts && { 
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
    cd -; }

#Install hashcat - note, dont change the directory, doing so might break things. 6.2.3 was chosen to avoid Intel GPU issues on Monterey
echo "Installing hashcat"
wget https://github.com/hashcat/hashcat/archive/refs/tags/v6.2.3.tar.gz -P ~/
cd ~/ && tar -xvf v6.2.3.tar.gz
cd ~/hashcat-6.2.3 && make clean && make -s
echo "Hashcat installed in your home directory - please add it to your path if needed"
echo "Remember to run hashcat with -D2 and -O"


