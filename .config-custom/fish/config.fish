# alaises
alias c 'xclip -selection clipboard'
alias start 'xdg-open'
alias l 'ls -hal'
alias hal 'ls -hal'
alias f 'cd $FIRST_PATH'
alias s 'wormhole send'
alias r 'wormhole receive'
alias ipython 'ipython --no-confirm-exit'


bind \e, begin-selection
bind \e. end-selection


# variables
export EDITOR='/usr/bin/vim'
set PATH   ~/.local/bin  ~/.personalbin  ~/.cargo/bin ~/flutter/bin ~/.npm-global/bin $PATH

set FIRST_PATH (pwd -P)
set -x -p LD_LIBRARY_PATH /home/ezipe/.mujoco/mjpro150/bin /home/ezipe/.mujoco/mujoco210/bin /usr/lib/nvidia

# function fish_prompt
#     history -a
#     history -r
# end

direnv hook fish | source

eval (ssh-agent -c > /dev/null)
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -Ux SSH_AGENT_PID $SSH_AGENT_PID
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK


if test -z "$SCRIPTED"
    set -gx SCRIPTED nested
    set now (date +%Y-%m-%d-%H:%M:%S)
    exec script /home/ezipe/.log/$now.txt
end


function swap
    set TMPFILE tmp.$fish_pid
    mv $argv[1] $TMPFILE && mv $argv[2] $argv[1] && mv $TMPFILE $argv[2]
end
