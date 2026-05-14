#!/usr/bin/env bash
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
dir=$(basename "$cwd")

model=$(echo "$input" | jq -r '.model.display_name // ""')

used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Git branch
branch=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --quiet --short HEAD 2>/dev/null)
fi

# Build output with ANSI colors matching Dracula theme
output=""

# Directory in blue/bold
output+="$(printf '\033[1;34m%s\033[0m' "$dir")"

# Git branch in cyan if present
if [[ -n "$branch" ]]; then
  output+=" $(printf '\033[1;36m(%s)\033[0m' "$branch")"
fi

# Model in magenta
if [[ -n "$model" ]]; then
  output+=" $(printf '\033[35m%s\033[0m' "$model")"
fi

# Context usage in green (or yellow >75%)
if [[ -n "$used" ]]; then
  used_int=$(printf '%.0f' "$used")
  if (( used_int >= 75 )); then
    output+=" $(printf '\033[1;33mctx:%d%%\033[0m' "$used_int")"
  else
    output+=" $(printf '\033[32mctx:%d%%\033[0m' "$used_int")"
  fi
fi

printf '%s' "$output"
