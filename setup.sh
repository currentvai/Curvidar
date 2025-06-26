#!/bin/bash
# ------------------------------------------------------------------------
# Tool Name    : Curvidar - Termux YouTube Downloader (Smart Installer)
# Author       : Current Vai ♚
# GitHub       : https://github.com/currentvai/Curvidar
# Description  : Installs yt-dlp, ffmpeg, and sets up auto YouTube URL handler.
# License      : MIT
# Copyright    : © $(date +%Y) Current Vai ♚ | All rights reserved.
# ------------------------------------------------------------------------

# --- Configuration for Smart Installer ---
CONFIG_DIR="$HOME/.config/curvidar"
FLAG_FILE="$CONFIG_DIR/installed.flag"

# --- Banner Function ---
display_banner() {
    echo -e "\e[1;36m"
    echo ' ██████╗██╗   ██╗██████╗ ██████╗ ███████╗███╗   ██╗████████╗    ██╗   ██╗ █████╗ ██╗'
    echo '██╔════╝██║   ██║██╔══██╗██╔══██╗██╔════╝████╗  ██║╚══██╔══╝    ██║   ██║██╔══██╗██║'
    echo '██║     ██║   ██║██████╔╝██████╔╝█████╗  ██╔██╗ ██║   ██║       ██║   ██║███████║██║'
    echo '██║     ██║   ██║██╔══██╗██╔══██╗██╔══╝  ██║╚██╗██║   ██║       ╚██╗ ██╔╝██╔══██║██║'
    echo '╚██████╗╚██████╔╝██║  ██║██║  ██║███████╗██║ ╚████║   ██║        ╚████╔╝ ██║  ██║██║'
    echo ' ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝         ╚═══╝  ╚═╝  ╚═╝╚═╝'
    echo -e "\e[0m"
    echo -e "\e[1;34mDeveloped By Current Vai ♚ | Curvidar v1.1\e[0m"
    echo -e "\e[1;33m© Copyright $(date +%Y) — All Rights Reserved.\e[0m"
    echo -e "\n\e[91m📅 $(date +"%A, %d %B %Y") | ⏰ $(date +"%I:%M %p")\e[0m"
}

# --- Check if already installed ---
if [ -f "$FLAG_FILE" ]; then
    clear
    display_banner
    echo -e "\n\e[1;32m✅ Curvidar is already installed!\e[0m"
    echo -e "\nWhat do you want to do?"
    echo "  [1] Re-install everything (Overwrite current setup)"
    echo "  [2] Update yt-dlp only"
    echo "  [3] Uninstall Curvidar"
    echo "  [q] Quit"
    read -p $'\nChoose an option: ' choice

    case $choice in
        1)
            echo "Starting re-installation..."
            rm -rf "$CONFIG_DIR" # ফ্ল্যাগ ফাইল মুছে ফেলি যেন ইনস্টলেশন হয়
            ;;
        2)
            echo "Updating yt-dlp..."
            pip install --upgrade yt-dlp
            echo "✅ yt-dlp updated."
            exit 0
            ;;
        3)
            echo "Uninstalling Curvidar..."
            rm -f "$HOME/bin/termux-url-opener"
            rm -rf "$HOME/.config/yt-dlp"
            rm -rf "$CONFIG_DIR"
            echo "✅ Uninstalled successfully."
            exit 0
            ;;
        *)
            echo "Exiting."
            exit 0
            ;;
    esac
fi

# --- Installation Functions ---

# Redefine clear to include banner
declare -f clear >/dev/null && unalias clear 2>/dev/null
clear() {
    command clear
    display_banner
}

# Function to setup storage
setup_storage() {
    echo "Setting up storage permission..."
    termux-setup-storage
}

# Function to install required packages
install_pkgs() {
    echo "Updating and upgrading base packages..."
    pkg update -y && pkg upgrade -y
    
    pkgs=(python mpv aria2 ffmpeg git)
    echo "Installing required tools: ${pkgs[*]}..."
    for pkg in "${pkgs[@]}"; do
        # pkg install -y কমান্ডটি নিজে থেকেই চেক করে নেয় ইনস্টল করা আছে কিনা।
        pkg install $pkg -y
    done
    
    echo "Installing/Updating yt-dlp..."
    pip install --upgrade yt-dlp
}

# Function to setup termux-url-opener
setup_tuo() {
    echo "Setting up URL opener and config..."
    bin_dir="$HOME/bin"
    tuo_file="$bin_dir/termux-url-opener"
    ytdir="$HOME/storage/shared/YouTube"
    config_dir_yt="$HOME/.config/yt-dlp"
    
    # Configuration and Flag directories
    mkdir -p "$bin_dir" "$ytdir" "$config_dir_yt" "$CONFIG_DIR"

    cp "termux-file-opener" "$tuo_file"
    cp "config" "$config_dir_yt/config"
    chmod +x "$tuo_file"
}

# --- Main Execution ---
clear
setup_storage
install_pkgs
setup_tuo

# Create the flag file to mark installation as complete
touch "$FLAG_FILE"

echo -e "\n\e[1;32m✅ Setup complete! You can now download YouTube videos by sharing the URL to Termux.\e[0m"
echo -e "\e[1;33mPlease restart Termux for all changes to take effect.\e[0m"
