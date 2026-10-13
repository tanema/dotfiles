# Prompt setup. Features include:
# - Arrow that changes color based on the last error status
# - Current directory name
# - Current git branch
# - Current git status
prompt_git_precmd() {
	local ref branch git_status
	PROMPT_GIT_STATUS=""

	builtin cd "$(pwd)"
	ref=$(=git --no-optional-locks symbolic-ref --quiet HEAD 2>/dev/null)
	case $? in
		0)   ;;
		128) return ;;
		*)   ref=$(=git --no-optional-locks rev-parse --short HEAD 2>/dev/null) || return ;;
	esac
   
	branch=${ref#refs/heads/}
	if [[ -n $branch ]]; then
		PROMPT_GIT_STATUS="%F{cyan}%B(${branch}) "
		git_status="$(LC_ALL=C =git --no-optional-locks status 2>&1)"
		if [[ "$git_status" =~ 'new file:|deleted:|modified:|renamed:|Untracked files:' ]]; then
			PROMPT_GIT_STATUS+="%F{yellow}%B✗ "
		else
			PROMPT_GIT_STATUS+="%F{green}%B✓ "
		fi
	fi
}

add-zsh-hook precmd prompt_git_precmd
PROMPT='%(?:%F{green}:%F{red})%B➜ %B%F{blue}%B%1~ $PROMPT_GIT_STATUS%f%b'
