#!/bin/bash

SRC_DIR="$(pwd)"

printInfo() {
    local msg=$1

    echo "[*]" $msg
}

# Function to prompt and copy config with backup
copy_config() {
    local name=$1
    local src=$2
    local dest=$3

    read -p "[?] Do you want to copy the $name config? (y/n): " answer
    case $answer in
        [Yy]* )
            if [ -e "$dest" ]; then
                printInfo "Backing up existing $name config..."
                cp -r "$dest" "${dest}.bak"
            fi
            printInfo "Copying $name config..."
            mkdir -p "$(dirname "$dest")"
            cp -r "$src" "$dest"
            ;;
        * )
            printInfo "Skipped $name config."
            ;;
    esac
}

# Copy bat config
copy_config "bat" "$SRC_DIR/bat" "$HOME/.config/bat"

# Copy kitty config
copy_config "kitty" "$SRC_DIR/kitty" "$HOME/.config/kitty"

# Copy .zshrc
copy_config ".zshrc" "$SRC_DIR/.zshrc" "$HOME/.zshrc"

# download needed plugins
printInfo "Downloading git repos..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

printInfo "Installation script completed."
