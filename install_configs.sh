#!/bin/bash

# Define source directory (assumes script is run from the directory containing these files)
SRC_DIR="$(pwd)"

# Copy bat config
echo "[*] Copying bat config..."
cp -r "$SRC_DIR/bat/"* ~/.config/bat/

# Copy kitty config
echo "[*] Copying kitty config..."
cp -r "$SRC_DIR/kitty/"* ~/.config/kitty/

# Copy .zshrc
echo "[*] Copying .zshrc..."
cp "$SRC_DIR/.zshrc" ~/.zshrc

# Install needed plugins
echo "[*] Installing needed plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "[*] Done."
