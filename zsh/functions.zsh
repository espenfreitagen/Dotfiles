# FZF

## FZF_DEFAULT_OPTS
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --preview="bat --color=always {}"
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#121212,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#ff0000,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" 
  --border-label="" 
  --preview-window="border-rounded" 
  --prompt="> " 
  --margin="1%"
  --marker=">" 
  --pointer="->" 
  --separator="─" 
  --scrollbar="│"'

## Jump to Location
lfe(){
  local dir
  dir=$(fd . --type d --hidden --exclude .cache | fzf)
  [[ -n $dir ]] && cd "$dir" && clear && ls -lah
}

## Jump to Location from /
lfer() {
    local dir
    dir=$(fd / --type d --hidden --eclude .cache | fzf)
    [[ -n $dir ]] && "$dir"
}

## Find File and Edit
lff() {
  local file
  file=$(fd --type f --hidden --exclude .cache | fzf)
  [[ -n $file ]] && $EDITOR "$file"
}

## Live Grep
### Usage = lfg <content to find>
lfg(){
  local file
  file=$(rg --files-with-matches "$1" | fzf)
  nvim "$file"
}

## Jump to Project
lpj() {
    local dir
    dir=$(fd . ~/dev --type d --max-depth 2 | fzf) || return
    cd "$dir"
}

## Jump to School-subject
lfs() {
    local dir
    dir=$(fd . ~/skole --type d --max-depth 2 | fzf) || return
    cd "$dir"
}

## Find Aliases
fap(){
  local command
  command=$(alias | fzf)
  [[ -n $command ]] && echo "$command"
}

# Python

## Activate venv or create if nonexisting 
venvme() {
  local venv_dir=".venv"

  if [ ! -d "$venv_dir" ]; then
    echo "Creating virtual environment in $PWD/$venv_dir"
    python -m venv "$venv_dir" || { echo "Failed to create venv"; return 1; }
  fi

  if [ -f "$venv_dir/bin/activate" ]; then
    source "$venv_dir/bin/activate"
    echo "Activated venv: $venv_dir"
  else
    echo "Activation script not found!"
    return 1
  fi
}
