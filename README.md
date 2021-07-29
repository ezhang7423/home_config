# TODO: add asdf

# Home

This contains all my personalization for a custom linux distribuition

## Installation

If on ubuntu, run this first:

```bash
sudo add-apt-repository ppa:system76/pop
sudo apt update
sudo apt install -y pop-desktop
sudo reboot
```

To install my settings:

```bash
cd ~
git clone git@github.com:ezhang7423/home_config.git tmp
cp -a tmp/. .
sudo ./setup.sh
# rm -rf tmp if satisfied
```

## Items

- Konsole w/ autokey
- Pop! OS keyboard shortcuts
- Fish Shortcuts

## Key software (in order of installation)

(handled by setup.sh)

- Timeshift
- Konsole
- Fish
- Docker
- VS Code
- Brave browser

(user does this manually)

- Autokey
- VS Code preferences

### App development

- Flutter
- Android Studio

## Backing up custom gnome settings

Backup
`dconf dump /org/gnome/ > gnome.ini`

Restore:

`dconf load /org/gnome/ < gnome.ini`

## ssh-keys

Manually cp from your usb

https://stackoverflow.com/questions/7927750/specify-an-ssh-key-for-git-push-for-a-given-domain

for personal and work projects
