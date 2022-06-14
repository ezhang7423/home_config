# aliases
alias c 'xclip -selection clipboard'
alias start 'xdg-open'
alias l 'ls -hal'
alias hal 'ls -hal'
alias v 'source venv/bin/activate.fish'
alias rl 'source ~/.rl/bin/activate.fish'
alias run_py 'nodemon -x "python3 main.py" -e py'
alias f 'cd $FIRST_PATH'

bind \e, begin-selection
bind \e. end-selection


# variables
export EDITOR='/usr/bin/vim'
export D4RL_SUPPRESS_IMPORT_ERROR=1

set -x -p PATH ~/.local/bin ~/.personalbin ~/.cargo/bin ~/flutter/bin ~/.npm-global/bin
set FIRST_PATH (pwd -P)
set -x -p LD_LIBRARY_PATH /home/ezipe/.mujoco/mjpro150/bin /home/ezipe/.mujoco/mujoco210/bin

# functions
function swap
    set TMPFILE tmp.$fish_pid
    mv $argv[1] $TMPFILE && mv $argv[2] $argv[1] && mv $TMPFILE $argv[2]
end

eval (ssh-agent -c > /dev/null)
# set -x TERM xterm-256color
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
set -Ux SSH_AGENT_PID $SSH_AGENT_PID
set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK


source ~/.asdf/asdf.fish


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/ezipe/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
test -n "$TMUX" && conda deactivate
conda activate base

