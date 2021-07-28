# TODO: add asdf

# Home

This contains all my personalization for a custom linux distribuition

## Installation

```bash
cd ~
git clone git@github.com:ezhang7423/home_config.git tmp
cp -a tmp/. .
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

## Backing up Pop! os shortcuts

Backup
`dconf dump /org/gnome/shell/extensions/pop-shell/ > pop-shell.ini`

Restore:

`dconf load /org/gnome/shell/extensions/pop-shell/ < pop-shell.ini`

## ssh-keys

Manually cp from your usb
