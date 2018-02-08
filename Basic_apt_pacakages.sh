#!/bin/bash

echo 'apt-geting'
sudo apt-get -qq update

# Fundamental packages
sudo apt-get -qq install build-essential zsh vim htop terminator gparted git curl openssh-server screen sshfs nfs-common -y
sudo apt-get -qq install python-dev python-pip python-all-dev openjdk-8-jdk cmake -y

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

