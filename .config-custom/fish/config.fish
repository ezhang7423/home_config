# aliases
alias c 'xclip -selection clipboard'
alias start 'xdg-open'
alias l 'ls -hal'
alias hal 'ls -hal'
alias v 'source venv/bin/activate.fish'
alias rl 'source ~/.rl/bin/activate.fish'
alias run_py 'nodemon -x "python3 main.py" -e py'
alias f 'cd $FIRST_PATH'

# variables
export EDITOR='/usr/bin/vim'
set -x -p PATH ~/.local/bin ~/.personalbin ~/.cargo/bin ~/flutter/bin ~/.npm-global/bin
set FIRST_PATH (pwd -P)

# function fish_prompt
#     history -a
#     history -r
# end

source ~/.asdf/asdf.fish