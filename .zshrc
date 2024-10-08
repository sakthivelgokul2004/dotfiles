

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


## Oh My Zsh Setting 
ZSH_THEME="robbyrussell"

zstyle ':omz:alpha:lib:git' async-prompt no
## Zinit Setting
# Must Load OMZ Git library 
zi snippet OMZL::git.zsh 
# Load Git plugin from OMZ 
zi snippet OMZP::git 
zi cdclear -q # <- forget completions provided up to this moment

setopt promptsubst

# Load Prompt
zi snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme 
## Oh My Zsh Setting
# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# Add in snippets
#zinit snippet OMZP::archlinux
#zinit snippet OMZP::sudo
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
#zinit snippet OMZP::command-not-found
# Load completions
autoload -Uz compinit && compinit
 bindkey -v
bindkey -s ^q  "tmux-sessionizer\n"

zinit cdreplay -q


#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias tmuxa='tmux-sessionizer'

# Shell integrations
eval "$(fzf --zsh)"



export GPG_TTY=$(tty)

# Created by `pipx` on 2024-06-29 15:56:17
export PATH="$PATH:/home/sakthivel/.local/bin"
 export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/.config/emacs/bin:$PATH"
