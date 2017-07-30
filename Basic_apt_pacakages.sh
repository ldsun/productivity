#!/bin/bash

#apt-get softwares

INSTALL_MODE=$1

echo 'apt-geting'
sudo apt-get -qq update

# Fundamental packages
sudo apt-get -qq install build-essential zsh vim htop terminator gparted git curl openssh-server screen sshfs nfs-common -y
sudo apt-get -qq install python-dev python-pip python-all-dev openjdk-8-jdk cmake -y
sudo apt-get -qq install compiz-plugins compizconfig-settings-manager -y

# development packages
sudo apt-get -qq install libopencv-dev python-opencv libatlas-base-dev libopenblas-dev gfortran -y
sudo apt-get -qq install libboost-all-dev libpcap-dev libglew-dev -y

# pip get
echo 'piping'
sudo pip install -U ujson requests pymysql numpy pandas scipy scikit-learn


# Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Copy above commands into a file and run
#====================================================================
# Zsh 
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# == Open a terminal (not terminator) and run:

# Copy below commands into a file and run in terminator
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
mkdir -p .config/fontconfig/conf.d
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
sudo apt-get install dconf-cli

git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
cd ~/.solarized
echo "===== Select 1 1 YES 1 ====="
./install.sh

# Install plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/psprint/zsh-navigation-tools
cd ~

# replace the default theme
sed -i 's/ZSH_THEME.*/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i '/^plugins/s/)$/ zsh-autosuggestions zsh-navigation-tools zsh-syntax-highlighting zsh-history-substring-search compleat)/' ~/.zshrc
echo "eval \`dircolors ~/.dir_colors/dircolors\`" >> ~/.zshrc

# Restart terminator and change Terminator's preference
echo "Restart termintor and change terminator's preference"
