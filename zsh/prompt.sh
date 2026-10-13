# Prompt setup. Features include:
# - Arrow that changes color based on the last error status
# - Current directory name
# - Current git branch
# - Current git status
prompt_git_precmd() {
	branch=$(=gut branch)
	if [[ -n $branch ]] && [[ -n "$(=gut dirty)" ]]; then
		PROMPT_GIT_STATUS="%F{red}%B(${branch}) "
	elif [[ -n $branch ]]; then
		PROMPT_GIT_STATUS="%F{green}%B(${branch}) "
	else 
		PROMPT_GIT_STATUS=""
	fi
}

add-zsh-hook precmd prompt_git_precmd
PROMPT='%(?:%F{green}:%F{red})%B➜ %B%F{blue}%B%1~ $PROMPT_GIT_STATUS%f%b'
