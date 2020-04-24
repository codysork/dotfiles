# Oh My zsh
export ZSH="/home/cody/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
plugins=(git python sudo)
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Preferred editor
export EDITOR='nvim'
alias vim="nvim" 

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Colors
autoload -U colors && colors

# Path Modifications
export CDPATH=$HOME

# Useful Aliases
alias h="history | tail"
alias hg="history | grep"
alias mv="mv -i"
alias pip-upgrade="sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U"
eval $(thefuck --alias)
alias please="sudo" # add some humor to your shell
alias rm='rm -i'

# Aliases only useful to me
alias todo="sh ~/Scripts/todo/todo.sh"

# Custom variables only useful to me
fan_model="GS65_8RF"
pcc_server="syccuxas01.pcc.edu"
cody_server="45.79.90.254"
