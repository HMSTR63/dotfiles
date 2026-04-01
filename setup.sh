#!/bin/bash

# --- CONFIGURATION ---
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
CONFIG_DIR="$HOME/.config"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting dotfiles auto-installation...${NC}"

# Ensure we're in the right place
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${RED}❌ Error: $DOTFILES_DIR not found. Please clone your dotfiles repo to ~/dotfiles first.${NC}"
    exit 1
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo -e "${BLUE}📦 Backups will be stored in $BACKUP_DIR${NC}"

# --- HOMEBREW ---
if ! command -v brew &> /dev/null; then
    echo -e "${BLUE}🍺 Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to path for the rest of the script
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo -e "${GREEN}✅ Homebrew already installed.${NC}"
fi

# --- TAPS ---
echo -e "${BLUE}🔨 Adding Homebrew Taps...${NC}"
brew tap nikitabobko/tap          # Aerospace
brew tap FelixKratz/formulae      # Borders
brew tap homebrew/cask-fonts      # Fonts (legacy, but staying safe)

# --- FORMULAE (CLI TOOLS) ---
echo -e "${BLUE}🛠️ Installing CLI Tools...${NC}"
packages=(
    neovim
    tmux
    zoxide
    fzf
    fd
    bat
    eza
    ripgrep
    borders
    node
    bun
    pcre2
)

for pkg in "${packages[@]}"; do
    if brew list "$pkg" &>/dev/null; then
        echo -e "${GREEN}✅ $pkg already installed.${NC}"
    else
        echo -e "${BLUE}📥 Installing $pkg...${NC}"
        brew install "$pkg"
    fi
done

# --- CASKS (GUI APPS) ---
echo -e "${BLUE}🪟 Installing GUI Apps...${NC}"
casks=(
    ghostty
    aerospace
    brave-browser
    discord
    spotify
    raycast
    font-jetbrains-mono-nerd-font
)

for cask in "${casks[@]}"; do
    if brew list --cask "$cask" &>/dev/null; then
        echo -e "${GREEN}✅ $cask already installed.${NC}"
    else
        echo -e "${BLUE}📥 Installing $cask...${NC}"
        brew install --cask "$cask"
    fi
done

# --- NVM SETUP ---
if [ ! -d "$HOME/.nvm" ]; then
    echo -e "${BLUE}📥 Installing NVM...${NC}"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# --- SYMLINKING LOGIC ---
setup_link() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ]; then
        echo -e "${GREEN}✅ Link already exists: $dest${NC}"
        return
    fi

    if [ -e "$dest" ]; then
        echo -e "${BLUE}🔄 Backing up existing $dest to $BACKUP_DIR${NC}"
        mv "$dest" "$BACKUP_DIR/"
    fi

    echo -e "${BLUE}🔗 Linking $dest -> $src${NC}"
    ln -s "$src" "$dest"
}

echo -e "${BLUE}🔗 Creating Symlinks...${NC}"
mkdir -p "$CONFIG_DIR"

# Root level dotfiles
setup_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
setup_link "$DOTFILES_DIR/.aerospace.toml" "$HOME/.aerospace.toml"

# Special case for .p10k.zsh (move to repo if exists in home but not in repo)
if [ -f "$HOME/.p10k.zsh" ] && [ ! -f "$DOTFILES_DIR/.p10k.zsh" ]; then
    echo -e "${BLUE}📂 Moving .p10k.zsh into your dotfiles repository for backup...${NC}"
    mv "$HOME/.p10k.zsh" "$DOTFILES_DIR/"
fi
if [ -f "$DOTFILES_DIR/.p10k.zsh" ]; then
    setup_link "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
fi

# .config directories
configs=("borders" "ghostty" "nvim" "tmux" "opencode" "Leader Key")
for conf in "${configs[@]}"; do
    setup_link "$DOTFILES_DIR/.config/$conf" "$CONFIG_DIR/$conf"
done

# --- PLUGINS & POST-INSTALL ---
# Tmux Plugin Manager (TPM)
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    echo -e "${BLUE}📥 Installing TPM...${NC}"
    mkdir -p "$HOME/.config/tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# Opencode Bun Install
if [ -d "$DOTFILES_DIR/.config/opencode" ]; then
    echo -e "${BLUE}📦 Running bun install for opencode...${NC}"
    cd "$DOTFILES_DIR/.config/opencode" && bun install
fi

echo -e "${GREEN}✨ Installation Complete!${NC}"
echo -e "${BLUE}📋 Manual steps remaining:${NC}"
echo -e "1. Restart Ghostty/Terminal to apply Zsh changes."
echo -e "2. In Tmux, press ${BLUE}Prefix + I${NC} to install plugins."
echo -e "3. Open Raycast and ensure the ${BLUE}Leader Key${NC} config is active."
echo -e "4. Enjoy your perfect workstation! 🚀"
