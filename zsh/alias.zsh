# ZSH
zup='source ~/dotfiles/zsh/.zshrc'

# NEOVIM
alias nv='nvim .'

# COLORS
alias grep='grep --color=auto'

# CD
alias ..='cd ..'

# LS
alias l='clear && ls --color -lh'
alias la='ls --color -ah'
alias ll='ls --color -lah'

# RM
alias rm='rm -I'

# NETWORK
alias ipv4="ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d' ' -f6 | cut -d/ -f1" 
alias ipv6="ip addr show | grep 'inet6 ' | cut -d ' ' -f6 | sed -n '2p'" 
alias ipvp='curl ifconfig.me/ip'
alias conusn="nmcli dev wifi connect 'eduroam' --ask"
alias conesp="nmcli dev wifi connect 'Espen' --ask"

# PACMAN / YAY
alias gib='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias paclocal="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | bat)'"
alias pacremote="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"

# Journalctl
alias error='journalctl -b -p err'

# MISC
alias kbl='hyprctl switchxkblayout tuxedo-keyboard next'
alias ubuntu='distrobox enter quartus'
alias ctfenv='source ~/dev/ctf/.venv/bin/activate'
alias fe='nnn -a -P p'
