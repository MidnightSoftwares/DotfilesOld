export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="midnight"

# Case sensitivity
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History date format
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(
  archlinux
  colored-man-pages
  extract
  git
  npm
  # sudo
  tmux
  vi-mode
  # web-search
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# NPM
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
