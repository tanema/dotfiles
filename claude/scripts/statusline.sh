#!/usr/bin/env zsh
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir')

branch=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree &>/dev/null 2>&1; then
	git_status='\033[32m'
	if [[ -n "$(git -C "$cwd" --no-optional-locks status --porcelain -unormal --ignore-submodules=dirty)" ]]; then
		git_status='\033[35m'
	fi
	branch="$git_status($(git -C "$cwd" --no-optional-locks symbolic-ref --quiet --short HEAD 2>/dev/null))"
fi

used_int=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
bars=(█ ▇ ▆ ▅ ▄ ▃ ▂ ▁ _ 🪦)
status_bar=${bars[$(( used_int >= 90 ? 10 : used_int / 10 + 1 ))]}

echo -e "\033[1m$status_bar $used_int% \033[34m${cwd/#$HOME/~}$branch\033[0m"
