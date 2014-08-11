local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%} $(collapse_pwd) %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

collapse_pwd() {
	local result=${1:-$PWD}
	if [[ $result = */* ]]; then
		result="${result%/*}"
	fi
	if [[ $result = "$HOME"/* ]]; then
		result="~/${result#$HOME/}"
	fi
	if [[ $result = "/Users" ]]; then
		result=""
	fi
	if [[ $result = "/Users/$USER" ]]; then
		result="~"
	fi
	echo "$result"
}