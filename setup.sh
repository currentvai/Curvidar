#!/bin/bash
# ------------------------------------------------------------------------
# Tool Name    : Curvidar - Termux YouTube Downloader
# Author       : Current Vai ♚
# GitHub       : https://github.com/currentvai/Curvidar
# Description  : Installs yt-dlp, ffmpeg, and sets up auto YouTube URL handler.
# License      : MIT
# Copyright    : © $(date +%Y) Current Vai ♚ | All rights reserved.
# ------------------------------------------------------------------------

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

    echo -e "\e[1;34mDeveloped By Current Vai ♚ | Curvidar v1.0\e[0m"
    echo -e "\e[1;33m© Copyright $(date +%Y) — All Rights Reserved.\e[0m"

    echo -e "\n\e[91m📅 $(date +"%A, %d %B %Y") | ⏰ $(date +"%I:%M %p")\e[0m"
}

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
    sleep 2
}

# Function to install required packages
install_pkgs() {
    echo "Updating package lists..."
    pkg update -y && pkg upgrade -y
    
    pkgs=(python mpv aria2 ffmpeg git)
    for pkg in "${pkgs[@]}"; do
        if command -v $pkg >/dev/null 2>&1; then
            echo "$pkg is already installed."
        else
            echo "Installing $pkg..."
            pkg install $pkg -y
        fi
    done
    
    echo "Updating package lists and upgrading all packages..."
    pkg update -y && pkg upgrade -y # এই কমান্ডটিই python এবং pip আপগ্রেড করবে

    pkgs=(python mpv aria2 ffmpeg git)
    for pkg in "${pkgs[@]}"; do
        if command -v $pkg >/dev/null 2>&1; then
            echo "$pkg is already installed."
        else
            echo "Installing $pkg..."
            pkg install $pkg -y
        fi
    done

    # pip install --upgrade pip লাইনটি এখান থেকে সরিয়ে দেওয়া হয়েছে।
    # এটি অপ্রয়োজনীয় এবং ক্ষতিকর।

    echo "Installing/Updating yt-dlp..."
    pip install --upgrade yt-dlp
}

# Function to setup termux-url-opener
setup_tuo() {
    echo "Setting up URL opener and config..."
    bin_dir="$HOME/bin"
    tuo_file="$bin_dir/termux-url-opener"
    ytdir="$HOME/storage/shared/YouTube"
    config_dir="$HOME/.config/yt-dlp"
    config_file="$config_dir/config"

    mkdir -p "$bin_dir"
    mkdir -p "$ytdir"
    mkdir -p "$config_dir"

    # Backup existing files if they exist
    [ -f "$tuo_file" ] && mv "$tuo_file" "$tuo_file.bak"
    [ -f "$config_file" ] && mv "$config_file" "$config_file.bak"

    # Copy new files from the current script directory
    cp "termux-file-opener" "$tuo_file"
    cp "config" "$config_file"

    # Make the url opener executable
    chmod +x "$tuo_file"

    echo "URL opener setup complete."
}

# --- Main Execution ---
clear
setup_storage
install_pkgs
setup_tuo

echo -e "\n\e[1;32m✅ Setup complete! You can now download YouTube videos by sharing the URL to Termux.\e[0m"
echo -e "\e[1;33mPlease restart Termux for all changes to take effect.\e[0m"
