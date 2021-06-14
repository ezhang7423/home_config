# Home

This contains all my personalization for a custom linux distribuition

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

https://stackoverflow.com/questions/7927750/specify-an-ssh-key-for-git-push-for-a-given-domain

for personal and work projects