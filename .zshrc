# Oh My zsh
export ZSH="/home/cody/.oh-my-zsh"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
plugins=(git python sudo)
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Colors
autoload -U colors && colors

# Path Modifications
export CDPATH=$HOME

# Useful Aliases
alias h="history | tail"
alias hg="history | grep"
alias pip-upgrade="sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U"
eval $(thefuck --alias)
alias rm='rm -i'

# Aliases only useful to me
alias clock="vim ~/Sync/Todo/clock.txt"
alias cooleroff="sudo isw -b off"
alias cooleron="sudo isw -b on"
alias habits="vim ~/Sync/Todo/habits.txt"
alias keycolors="msi-perkeyrgb -m gs65"
alias pluck-bm-import="cat ~/.bookmarks.txt | sed '/\(^#.*$\)|\(^$\)/d' | sed 's/&\[.*\] \| *+.*$//g' | xargs -I {} echo 'Allow {}' | pluck import -"
alias pluck-scripts-exec="ls -1 ~/Scripts/pluckeye-scripts/ | sed 's/~\/.*\/.*\///g' | dmenu | xargs -I {} sh '{}'"
alias todo="sh ~/Scripts/todo/todo.sh"
alias todoedit="vim ~/Sync/Todo/todo.txt"

# Custom variables only useful to me
fan_model="GS65_8RF"
pcc_server="syccuxas01.pcc.edu"
cody_server="45.79.90.254"
