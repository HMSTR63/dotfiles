# 🌑 HMSTR63/dotfiles

> **Brutalist. Minimalist. Engineered for Performance.**

A highly optimized collection of macOS dotfiles designed for low-level software engineers who live in the terminal. This setup prioritizes speed, efficiency, and a "Black & White" aesthetic with cyan accents.

---

## 🛠️ The Tech Stack

### 🐚 Shell & CLI (`Zsh`)
- **Plugin Manager**: [Zinit](https://github.com/zdharma-continuum/zinit) — for lightning-fast loading of plugins.
- **Prompt**: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — configured for a lean, informative display.
- **Modern Replacements**:
  - `eza` (Modern `ls`)
  - `bat` (Modern `cat`)
  - `fzf` (Fuzzy finder)
  - `zoxide` (Smart `cd`)
  - `fd` (Modern `find`)

### ⚡ Window Management & Terminal
- **[AeroSpace](https://github.com/nikitabobko/AeroSpace)**: An i3-like tiling window manager for macOS.
- **[Ghostty](https://github.com/mitchellh/ghostty)**: The next-generation GPU-accelerated terminal.
- **[JankyBorders](https://github.com/FelixKratz/JankyBorders)**: Clean cyan borders for active windows to enhance visual focus.

### 📝 Editor & Multiplexer
- **[Neovim](https://github.com/neovim/neovim)**: Fully featured [LazyVim](https://www.lazyvim.org/) configuration with LSP support for C++, Node.js, and more.
- **[Tmux](https://github.com/tmux/tmux)**: Enhanced session management with Catppuccin theme and floating window support (`tmux-floax`).

### 🔧 Extensions & Special Tools
- **[Leader Key](https://github.com/HMSTR63/dotfiles/tree/main/.config/Leader%20Key)**: Custom Raycast configuration for instant access to applications and system tools.
- **[Opencode](https://github.com/opencode-ai/sdk)**: Integration for AI-assisted development (Node.js/Bun).

---

## 🚀 Installation (macOS Only)

This repository includes a robust **auto-installation script** that handles dependency management (via Homebrew), configuration symlinking, and plugin bootstrapping.

### 1. Clone the repository
```bash
git clone https://github.com/HMSTR63/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the setup script
```bash
chmod +x setup.sh && ./setup.sh
```

### 3. Post-install manual steps
- **Tmux**: Open tmux (`t`) and press `Prefix + I` to install plugins.
- **Font**: Ensure you set your terminal font to **JetBrainsMono Nerd Font** (installed by the script).

---

## 🎯 For Who?

This repository is tailored for:
- **Low-level Software Engineers**: Optimized for C++, Makefile workflows, and memory-safe development.
- **42 School Students**: Includes specific aliases for `CPP-Modules`, `ft_IRC`, and 42 Makefile flags (`mc`, `mf`, `mr`).
- **Minimalists**: People who want a "distraction-free" environment where everything is accessible via two or three keystrokes.
- **Power Users**: Those who prefer tiling window managers (AeroSpace) and modal editing (Neovim).

---

## 📦 Backups & Safety
The `setup.sh` script automatically creates a timestamped backup of your existing `.config` and `.zshrc` files in `~/dotfiles_backup_XXX/` before making any changes.

---

*“Everything in order. Everything auto.”* — **HMSTR63**
