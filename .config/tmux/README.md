# ~/.config/tmux/tmux.conf

## Install
Once everything has been installed it's time to run TPM, install first:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Run
`Ctrl+I`

# My Tmux Keybindings

**Prefix Key:** `Ctrl + a` (All commands start with this unless marked "No Prefix")

## 🪟 Window & Tab Management
| Keybinding | Action |
| :--- | :--- |
| `Shift + Left` | **Previous Window** (No Prefix) |
| `Shift + Right` | **Next Window** (No Prefix) |
| `c` | **New Window** |
| `w` | **List Windows** (Interactive menu) |
| `r` | **Rename Window** |
| `Ctrl + a` | **Jump to Last Active Window** |

## 🔳 Pane Management
| Keybinding | Action |
| :--- | :--- |
| `Alt + Left` | **Select Left Pane** (No Prefix) |
| `Alt + Right` | **Select Right Pane** (No Prefix) |
| `Alt + Up` | **Select Up Pane** (No Prefix) |
| `Alt + Down` | **Select Down Pane** (No Prefix) |
| `v` | **Vertical Split** |
| `s` | **Horizontal Split** |
| `z` | **Zoom Pane** (Toggle fullscreen) |
| `c` | **Kill Pane** |
| `f` | **Toggle Floating Pane** (Floax) |
| `*` | **Sync Panes** (Type in all panes at once) |

## 💼 Session Management
| Keybinding | Action |
| :--- | :--- |
| `o` | **SessionX Manager** (Fuzzy finder for sessions) |
| `S` | **Standard Session List** |
| `$` | **Rename Current Session** |
| `d` | **Detach Session** (Run in background) |

## 🛠️ Utility & Plugins
| Keybinding | Action |
| :--- | :--- |
| `R` | **Reload Config** |
| `K` | **Clear Screen** |
| `u` | **URL Hunter** (Extract & open URLs) |
| `Space` | **Thumbs** (Quick copy hints) |
| `[` | **Enter Copy Mode** (Vi keys to navigate) |
| `y` | **Yank** (Copy selection in Copy Mode) |
