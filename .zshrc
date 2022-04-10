if [ $SSH_CLIENT ]; then
    export TERM=vt100
fi

export PATH=$PATH:~/.local/bin:~/.cargo/bin
export PATH=$PATH:~/.local/bin:~/.node_modules

# Oh My zsh
export ZSH="/home/cody/.oh-my-zsh"
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
plugins=(git pip python sudo virtualenv)
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Default applications
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=brave

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Avoid dangerous commands
export HISTIGNORE="rm*"

# Colors
autoload -U colors && colors

# Path Modifications
export CDPATH=$HOME

# Useful Aliases
alias ls='exa'
alias mv="mv -i"
alias pip-upgrade="sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U"
eval $(thefuck --alias)
alias please="sudo" # add some humor to your shell
alias rm='rm -i'
alias vim='nvim'

# Aliases only useful to me
alias t="reset; sh ~/00_Code/01_Scripts/todo/todo.sh ls"
alias todo="sh ~/00_Code/01_Script/todo/todo.sh"

# Custom variables only useful to me
export fan_model="GS65_8RF"
export psu_server="csork@linux.cecs.pdx.edu"
export lab_server="csork@cs202lab.cs.pdx.edu"
export cody_public_server="45.79.90.254"
export cody_private_server="74.207.245.104"

# Requires jmp script
#source "/home/cody/30-39 Code/31 Scripts/31.02 jmp/"
