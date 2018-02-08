echo "When been asked for selection, Select 1, 1, YES, and 1"
read -n 1 -s -r -p "Press any key to continue"

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
