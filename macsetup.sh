#!/bin/bash
## A script to set up a new mac with standard brew stuff + lots of apps
## The above line tells shell to use bash
## do this to make the script executable for the user
# chmod u+x macsetup.sh

# helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }

echo_ok "Install starting. You may be asked for your password (for sudo)."

# install command-line tools from xcode (without installing xcode)
xcode-select --install

echo_warn "Making /usr/local writeable, and creating /usr/local/bin"
sudo chown -R $(whoami) /usr/local
mkdir -p /usr/local/bin

cd ~

# Setup homebrew
if hash brew &> /dev/null; then
    echo_ok "Homebrew already installed"
    brew update
else
    echo_warn "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo_warn "Installing standard homebrew libraries"

brew tap  homebrew/python
brew tap  homebrew/science
brew install  git pandoc wget youtube-dl
brew install  autoconf automake cmake doxygen gcc glib graphviz gtk+ jpeg
brew install  libpng libtool libyaml mpfr ninja numpy python valgrind

# setup homebrew caskroom, to install GUI apps (binaries)
brew cask install caskroom/cask/brew-cask

echo_warn "Installing apps..."
# Mostly standard apps
brew cask install osxfuse
brew install homebrew/fuse/sshfs
brew cask install  xquartz
brew cask install  java
brew cask install  keepingyouawake # alternative to caffeine
brew cask install  sublime-text # best text editor ever.
brew cask install  visual-studio-code # MSFT version of sublime, <3Joao
brew cask install  karabiner-elements # keymapping
brew cask install  flux # adjust screen to be eye-friendly
brew cask install  google-chrome
brew cask install  firefox
brew cask install  iterm2 # best terminal
# brew cask install  nvalt # notational velocity fork, to be tested
brew cask install  notational-velocity # great for notes
brew cask install  vlc # video
brew cask install  the-unarchiver # unzip and untar
brew cask install  skype
brew cask install  dropbox
brew cask install  mactex # tex, latex
brew cask install  apptrap # proper uninstallation of apps
brew cask install  spectacle # must launch, and add to self-startup manually

brew tap caskroom/fonts 
brew cask install  font-inconsolata # my favourite font for coding

read -p "Do you want to install microsoft office 2011 for Mac? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew cask install  microsoft-office-2011
fi

read -p "Do you want to use the fish shell instead of bash? (y/n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install  fish
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells # add to shells
    chsh -s /usr/local/bin/fish # make default
    # make folder colors readable on dark background
    set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD 
    echo_ok "to switch back to bash, use chsh -s /bin/bash"
fi

read -p "Do you want to change settings too? (if no, you will proceed to installation only)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo_warn "Disabling Photos from auto-starting when plugging in a camera."
    defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

    echo_warn "Expanding save and print dialogs by default"
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

    echo_warn "Always showing scroll bars"
    defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

    echo_warn "Using oldschool (unnatural) scrolling direction (for trackpad)"
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

    echo_warn "Turning off auto-spell globally"
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

    echo_warn "Cleaning up and customizing the dock."
    defaults delete com.apple.dock persistent-apps # unpin apps
    defaults delete com.apple.dock persistent-others # unpin more apps
    defaults write com.apple.dock pinning -string start # place at left
    defaults write com.apple.dock mineffect scale # just scale minimizing windows
    killall Dock

    echo_warn "Tell Chrome to use system dialog for printing"
    defaults write com.google.Chrome DisablePrintPreview -boolean true
fi

echo_ok "You will have to startup some apps manually once (like spectacle)"
echo_ok "You have to manually set which apps automatically start on startup"