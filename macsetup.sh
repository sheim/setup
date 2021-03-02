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

cd ~

# Setup homebrew
if hash brew &> /dev/null; then
  echo_ok "Homebrew already installed"
  brew update
else
  echo_warn "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo_warn "Installing standard homebrew libraries"

brew install git wget youtube-dl htop fdupes ultralist julia
brew install ffmpeg imagemagick ghostscript git-lfs git-latexdiff
brew install bibutils cmake libmagic librsvg nmap p7zip pandoc pandoc-citeproc
brew install pandoc-crossref pdf2svg pdftk-java rbenv source-highlight sshfs
# exercism fish gnu-sed go jansson katago node opencv openjdk@11
# autoconf automake cmake doxygen gcc glib graphviz gtk+ jpeg gdb
# libpng libtool libyaml mpfr ninja numpy python valgrind jansson

# setup homebrew caskroom, to install GUI apps (binaries)
# brew cask install caskroom/cask/brew-cask
# Deprecated! Brew cask is now integral to brew

echo_warn "Installing apps..."
# Mostly standard apps
brew install osxfuse
brew install xquartz
brew install java
brew install sublime-text # best text editor until vscode
brew install visual-studio-code # new best text editor evah, <3 Joao
brew install google-chrome
brew install firefox
brew install iterm2 # best terminal
brew install nvalt # fork of notational-velocity, a little less pretty but better markdown support
brew install vlc # video
brew install the-unarchiver # unzip and untar
brew install skype
brew install dropbox
brew install zoom.us
# brew install apptrap # proper uninstallation of apps # NO LONGER NEEDED since I only install things with brew :D
brew install spotify
brew install cgoban # client for playing go on KGS
brew install sabaki
# brew install flip4mac # handy for wmv videos (mostly for powerpoint)
brew install mattermost # collaboration tool
# brew install inkscape
# brew install handbrake
brew install garmin-express
brew install boostnote
brew install nordvpn  
brew install papers  # ReadCube Papers app
brew install obs  # Screen-recording
# brew install zotero
brew install adobe-acrobat-reader
brew install meld # pretty powerful diff gui
brew install transmission
brew install whatsapp
brew install blender
brew install slack
# brew install grammarly
# install some widgets
brew install sensiblesidebuttons  # enables side-buttons on some mice
brew install monitorcontrol  # widget to control external monitor brightness
brew install dozer # minimalistic icon bar
brew install keepingyouawake # alternative to caffeine
brew install karabiner-elements # keymapping
# brew install flux # adjust screen to be eye-friendly, now built-in to mac
brew install spectacle # must launch, and add to self-startup manually

brew tap caskroom/fonts 
brew install font-inconsolata # my favourite font for coding
brew install font-inconsolata-for-powerline
brew install font-hack-nerd-font
brew install font-fontawesome
brew install font-nimbus-sans-l

brew install mactex-no-gui # tex, latex. This takes a long time, do separately
brew install opendetex # better detexify, install _after_ mactex

# Set up git settings
# On Macs, Finder creates in every folder a .DS_Store file. This can get annoying if you mistakenly add it to your git local repository with a `git add --all`, so let's add this to .gitignore_global
echo ".DS_Store" >> ~/.gitignore_global
echo "._.DS_Store" >> ~/.gitignore_global
echo "**/.DS_Store" >> ~/.gitignore_global
echo "**/._.DS_Store" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
# Use diff3 format, for much easier conflict merging
git config --global merge.conflictstyle diff3
# Use keychain to manage your passwords DEPRECATED
# This should be done automatically by homebrew now
# git config --global credential.helper osxkeychain

# use Sublime as standard git editor
git config --global core.editor subl

# read -p "Do you want to change settings too?" -n 1 -r
# echo
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
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
  # defaults write com.apple.dock pinning -string start # place at left
  defaults write com.apple.dock mineffect scale # just scale minimizing windows instead of fancy minimize
  killall Dock # restart dock

  echo_warn "Tell Chrome to use system dialog for printing"
  defaults write com.google.Chrome DisablePrintPreview -boolean true
# fi

echo_ok "You will have to startup some apps manually once (like spectacle)"
echo_ok "You have to manually set which apps automatically start on startup, under 'preferences > users & groups > login items'"
echo_ok "You should set up your `git config --global user.name and user.email`"

# read -p "Do you want to use the fish shell instead of bash? (y/n)" -n 1 -r
# echo
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
# macOS has now switched the default shell to zsh, which should be just as good
  brew install fish
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells # add to shells
  chsh -s /usr/local/bin/fish # make default
  # make folder colors readable on dark background
  set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD 
  # get oh-my-fish
  curl -L https://get.oh-my.fish | fish
  omf install agnoster
  echo_ok "to switch back to bash, use chsh -s /bin/bash"
# fi