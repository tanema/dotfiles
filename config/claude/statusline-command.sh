#!/usr/bin/env bash
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir')
branch=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --quiet --short HEAD 2>/dev/null)
fi
git_status="🍗"
if [[ -n "$(git --no-optional-locks status --porcelain -unormal --ignore-submodules=dirty)" ]]; then
  git_status="🍖"
fi

BLUE='\033[34m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'
BOLD='\033[1m'

dir="$(printf "${BOLD}${BLUE}%s${RESET}" "${cwd/#$HOME/~}")"
model=$(echo "$input" | jq -r '.model.display_name' | xargs printf "${GREEN}%s${RESET}")
used_int=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
BAR_WIDTH=10
FILLED=$((used_int * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))
BAR=""
[ "$FILLED" -gt 0 ] && printf -v FILL "%${FILLED}s" && BAR="${FILL// /▓}"
[ "$EMPTY" -gt 0 ] && printf -v PAD "%${EMPTY}s" && BAR="${BAR}${PAD// /░}"


git_branch=""
if [[ -n "$branch" ]]; then
  git_branch="$(printf "${CYAN}(%s)${RESET}" "$branch")"
fi

status_bar="$(printf "${GREEN}%s${RESET}" "$BAR")"
if (( used_int >= 75 )); then
  status_bar="$(printf "${YELLOW}%s${RESET}" "$BAR")"
fi

echo "[$model] $status_bar $used_int% 📁 $dir $git_branch $git_status"
