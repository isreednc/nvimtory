# 🛠️ My Neovim Config

## 🧠 Features

- 🪄 Written in **Lua**
- 🎨 Custom color scheme (Gruvbox)
- 🧩 Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🔍 Fuzzy finding with Telescope
- 🧠 LSP `nvim-lspconfig`

## ⚙️ Setup

```bash
# 1. Optional: Back up existing config
mv ~/.config/nvim ~/.config/nvim_backup_$(date +%Y%m%d_%H%M%S)

# 2. Remove current config
rm -rf ~/.config/nvim

# 3. Install nvimtory
git clone https://github.com/yourusername/hypervim ~/.config/nvim
```

### 📥 Install JetBrains Mono font:

- [Download from JetBrains](https://www.jetbrains.com/lp/mono/)
- Or install via package manager:

```bash
# macOS (Homebrew)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Ubuntu / Debian
sudo apt install fonts-jetbrains-mono

# Arch Linux
sudo pacman -S ttf-jetbrains-mono
