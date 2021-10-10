#!/bin/bash
rm README.md
rm setup.sh
rm -rf .git

# Terminal colors
red_color=`tput setaf 1`
green_color=`tput setaf 2`
yellow_color=`tput setaf 3`
blue_color=`tput setaf 4`
magenta_color=`tput setaf 5`
jjcyan_color=`tput setaf 6`
reset_color=`tput sgr0`

red() {  printf "${red_color}* $1 \n${reset}"; }

# for headers (like h1 in html)
green() {  printf "${green_color}* $1 \n${reset_color}"; }
yellow() {  printf "${yellow_color}* $1 \n${reset_color}"; }
# reset back to home directory
blue() { printf "${blue_color}* $1 \n${reset_color}"; }
magenta() {  printf "${magenta_color}* $1 \n${reset_color}"; }
cyan() {  printf "${cyan_color}* $1 \n${reset_color}"; }

blue 'updating and upgrading apt'
sudo apt update && sudo apt upgrade -y --allow-downgrades

blue 'installing timeshift'
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt-get update
sudo apt-get install -y timeshift
red 'Run timeshift to configure. I recommend enabling daily, weekly, and monthly backups.'


blue 'chmoding personalbin'
cd .personalbin
chmod +x gc gd gi gp
cd ..



blue 'personalizing background'
mkdir -p ~/Pictures/Wallpapers
cp lelouch.jpg ~/Pictures/Wallpapers
eval LELOUCH_URL='file://$HOME/Pictures/Wallpapers/lelouch.jpg'
gsettings set org.gnome.desktop.background picture-uri $LELOUCH_URL

printf '\n'
green 'installing dev tools'
printf '\n'


blue 'installing pip'
sudo apt install -y python3-pip

blue 'installing asdf'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
. $HOME/.asdf/asdf.sh

blue 'installing python 3.8.10'
asdf plugin add python
asdf install python 3.8.10
asdf global python 3.8.10

blue 'installing nodejs latest'
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

blue 'installing go latest'
asdf plugin add golang
asdf install golang latest
asdf global golang latest

blue 'installing rust latest'
asdf plugin add rust
asdf install rust latest
asdf global rust latest

blue 'installing autokey'
sudo apt install -y autokey-gtk

blue 'installing vim'
sudo apt install -y vim

blue 'installing magic wormhole'
pip3 install magic-wormhole
asdf reshim

blue 'installing git'
sudo apt install -y git

blue 'installing xclip'
sudo apt install -y xclip

blue 'installing konsole'
sudo apt install -y konsole
rsync -av .local-custom/* ~/.local
rm -rf .local-custom

blue 'installing fish'
sudo apt install -y fish
sudo usermod -s `which fish` $USER

blue 'installing docker'
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli docker-compose containerd.io    
sudo docker run hello-world
# setup docker non root in the future?


blue 'installing vscode'
sudo apt install -y snapd
sudo snap install code --classic
sudo snap install code-insiders --classic
sudo cp /var/lib/snapd/desktop/applications/*.desktop /usr/share/applications/

blue 'installing hub'
sudo snap install hub --classic


blue 'installing brave'
sudo apt install -y apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

blue 'merging .config folder'
rsync -av .config-custom/* ~/.config/
rm -rf .config-custom

blue 'merging .ssh folder'
rsync -av .ssh-custom/* ~/.ssh/
rm -rf .ssh-custom

# blue 'personalizing gnome theme'
# sudo apt install -y gnome-themes-extra gtk2-engines-murrine gnome-tweaks
# git clone https://github.com/vinceliuice/Orchis-theme.git theme
# ./theme/install.sh -t grey
# rm -rf theme
# red 'Open "tweaks" and select "Orchis-dark-compact" under Appearance/Themes/Applications'

blue 'adding pop os shortcuts, custom keyboard shortcuts, and other goodies'
dconf load /org/gnome/ < gnome.ini
rm gnome.ini

sudo apt autoremove -y