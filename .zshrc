if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth"1"
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git

autoload -U compinit && compinit
zinit cdreplay -q
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -e
bindkey '^[[Z' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_save_no_dups hist_ignore_dups hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons -lah $realpath'

alias c="clear"
alias cls="clear && ls"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias reload="source ~/.zshrc"

# --- FILE MANAGEMENT (EZA & NAVIGATION) ---
alias ls="eza --icons=always"
alias ll="eza -l -g --icons=always --git"
alias la="eza -a -l -g --icons=always --git"
alias lt="eza --tree --level=2 --icons=always"
alias ltt="eza --tree --level=3 --icons=always"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias dg="cd ~/Desktop"
alias d42="cd ~/Desktop/CPP-Modules"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"

# --- GIT COMMANDS (FAST & FULL) ---
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpf="git push --force"
alias gl="git pull"
alias gcl="git clone"
alias gb="git branch"
alias gco="git checkout"
alias gd="git diff"
alias glo="git log --oneline --graph --all"
alias gundo="git reset --soft HEAD~1"

# --- MAKEFILE (42 SPECIAL) ---
alias m="make"
alias mc="make clean"
alias mf="make fclean"
alias mr="make re"
alias mra="make re && ./a.out"
alias mclean="make clean && rm -rf *.o"

# --- TMUX ---
alias t="tmux"
alias ta="tmux attach"
alias tn="tmux new -s"
alias tk="tmux kill-session -t"
alias tl="tmux ls"

# --- FZF & ZOXIDE ---
eval "$(zoxide init zsh)"
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --preview-window=right:60%:border-rounded"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border=rounded \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# --- PATHS ---
export PATH="$HOME/.local/bin:$PATH"
export PATH="/Users/hmstr./.antigravity/antigravity/bin:$PATH"
export PATH="$PATH:/Users/hmstr./.lmstudio/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
