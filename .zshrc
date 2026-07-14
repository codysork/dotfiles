# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

#-----------#
# Oh My Zsh #
#-----------#

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# OMZ Theme
ZSH_THEME="robbyrussell"

# OMZ Plugins Chosen
plugins=(git ssh zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#--------------------#
# User configuration #
#--------------------#

# Defaults
export EDITOR='nvim'

# Aliases
alias todo='todo.sh'

#--------------------#
# Ending Boilerplate #
#--------------------#

eval "$(zoxide init zsh)"
