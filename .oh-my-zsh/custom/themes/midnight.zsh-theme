ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[magenta]%}NORMAL%{$reset_color%}"

PROMPT='%{${fg[green]}%}%3~%{${reset_color}%} $(git_prompt_info) %{${fg_bold[blue]}%}%#%{${reset_color}%} '
RPS1='$(vi_mode_prompt_info)'
