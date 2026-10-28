# ENV-Variables
export PATH=$PATH:~/.local/bin
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Initiate Zinit 
source ~/.config/zsh/.zinit/bin/zinit.zsh

# Options
setopt correct
setopt interactivecomments
setopt sharehistory
setopt histignoredups
setopt extendedglob

bindkey -v

autoload -Uz compinit
compinit

# Prompt
source "${ZDOTDIR}"/prompt.zsh

## Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# JK escape insert-mode
#function vi-jk-escape() {
#	zle vi-cmd-mode
#}

#zle -N vi-jk-escape

#bindkey -M viins 'jk' vi-jk-escape

# Aliases and Funcions
source "${HOME}"/.config/zsh/alias.zsh
source "${HOME}"/.config/zsh/functions.zsh

autoload -Uz promptinit
promptinit

# NNN
export NNN_FIFO=/tmp/nnn.fifo nnn
export NNN_PLUG='p:preview-tui'
export NNN_SPLIT='v'
export NNN_SPLITSIZE=40
export NNN_PREVIEWIMGPROG='icat'
#export NNN_PLUG='p:preview-tui'

