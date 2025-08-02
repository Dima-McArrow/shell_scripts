#!/usr/bin/bash

# Optional: customize FZF appearance
export FZF_DEFAULT_OPTS=""

# Show interactive git log using fzf
git log \
  --graph \
  --color=always \
  --pretty=format:"%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(dim green)(%cr) %C(bold yellow)<%an>%C(reset)" |
  fzf \
    --ansi \
    --no-sort \
    --reverse \
    --tiebreak=index \
    --bind=ctrl-r:toggle-sort \
    --preview="echo {} | grep -oE '[a-f0-9]{7,}' | head -1 | xargs git show --color=always"
