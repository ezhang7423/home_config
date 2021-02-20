#!/bin/bash



# Terminal colors
red_color=`tput setaf 1`
green_color=`tput setaf 2`
yellow_color=`tput setaf 3`
blue_color=`tput setaf 4`
magenta_color=`tput setaf 5`
cyan_color=`tput setaf 6`
reset_color=`tput sgr0`

red() {  echo "${red_color}* $1 \n${reset}"; }

# for headers (like h1 in html)
green() {  echo "${green}* $1 \n${reset}"; }
yellow() {  echo "${yellow}* $1 \n${reset}"; }
# reset back to home directory
blue() { cd ~; echo "${blue}* $1 \n${reset}"; }
magenta() {  echo "${magenta}* $1 \n${reset}"; }
cyan() {  echo "${cyan}* $1 \n${reset}"; }


blue 'installing timeshift'
sudo apt update && sudo apt upgrade -y 
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt-get update
sudo apt-get install timeshift
red 'Run timeshift to configure. I recommend enabling daily, weekly, and monthly backups.'


blue 'chmoding personalbin'
cd .personalbin
chmod +x gc gd gi gp

blue 'adding pop os shortcuts'
`dconf load /org/gnome/shell/extensions/pop-shell/ < pop-shell.ini`
rm pop-shell.ini

blue 'personalizing background'
mkdir -p ~/Pictures/Wallpapers
mv lelouch.jpg ~/Pictures/Wallpapers
eval LELOUCH_URL='file://$HOME/Pictures/Wallpapers/lelouch.jpg'
gsettings set org.gnome.desktop.background picture-uri $LELOUCH_URL


green 'installing dev tools'

blue 'installing git'
sudo apt install -y git

blue 'installing xclip'
sudo apt install -y xclip

blue 'installing konsole'
sudo apt install -y konsole

blue 'installing fish'
sudo apt install -y fish

blue 'installing docker'
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli docker-compose containerd.io    
sudo docker run hello-world
# setup docker non root in the future?

blue 'installing vscode'
sudo apt install -y snap
sudo snap install code --classic

blue 'installing brave'
sudo apt install apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

blue 'personalizing gnome theme'
sudo apt install -y gnome-themes-extra gtk2-engines-murrine gnome-tweaks
git clone git@github.com:vinceliuice/Orchis-theme.git theme
./theme/install.sh -t grey
rm -rf theme
red 'Open "tweaks" and select "Orchis-dark-compact" under Appearance/Themes/Applications'


# Remove .git (do this after stable)
# rm -rf .git

