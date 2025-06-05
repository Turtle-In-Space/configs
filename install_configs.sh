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

echo "[*] Done."
