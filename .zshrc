# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not in the machine
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# --- THEME ENABLED (This gives you the Oh My Posh look) ---
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting 
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-autosuggestions 
zinit light Aloxaf/fzf-tab 
zinit snippet OMZP::git

# load completions
autoload -U compinit && compinit
zinit cdreplay -q

# --- LOAD THEME CONFIGURATION ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^[[Z' autosuggest-accept 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# Workaround for ghostty config being sourced as a script
alias theme=':'
alias font-size=':'
alias background-blur-radius=':'
alias mouse-hide-while-typing=':'
alias window-decoration=':'
alias keybind=':'
alias background-opacity=':'
alias window-width=':'
alias window-height=':'
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons -lah $realpath'

# Aliases
alias c="clear"
alias cls="clear & ls"
alias ls="eza --icons -lah"
alias lst='eza -T'
alias z="zathura"
alias zed="zed"

# Path Setup
PATH=~/.console-ninja/.bin:$PATH
if command -v go &> /dev/null; then
  PATH=$PATH:$(go env GOPATH)/bin
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(zoxide init zsh)"

# Shortcuts
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias t="tmux"
alias ta="tmux attach"
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias tl="tmux ls"

# opencode
export PATH=/home/ux-hmstr/.opencode/bin:$PATH
