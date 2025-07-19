#!/usr/bin/env bash
set -e

echo "🚀 Installing godlike rig..."

# Update
sudo apt update && sudo apt install -y zoxide fzf bat ripgrep fd-find

# Symlink fd
if [ ! -f /usr/local/bin/fd ]; then
  sudo ln -s $(which fdfind) /usr/local/bin/fd
fi

# Install Neovim
sudo apt install -y neovim

# Install kickstart.nvim rig
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim

# Inject zoxide + aliases in ~/.zshrc
cat << 'EOF' >> ~/.zshrc

# Godlike Rig Additions
eval "$(zoxide init zsh)"
alias zi='zoxide zi'
alias z='zoxide cd'
alias cat='batcat --style=plain' # if bat installed as batcat
EOF

echo "✅ Godlike rig installation complete. Please restart your terminal or run: source ~/.zshrc"
