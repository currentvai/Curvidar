# Curvidar
A simple one-command script to set up Termux for easy YouTube video/audio downloads via the share menu.
# Curvidar: Termux YouTube Downloader

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Works On](https://img.shields.io/badge/works%20on-Termux-green)
[![Author](https://img.shields.io/badge/Author-Current%20Vai%20%E2%99%9A-blue)](https://github.com/currentvai)

**Curvidar** is a one-command script to set up your Termux for downloading YouTube videos and audio with an interactive menu, just by sharing a link.

This script installs all necessary tools like `yt-dlp`, `ffmpeg`, and `aria2c`, and then configures the `termux-url-opener` for a seamless experience.

## Features
-   🚀 **One-Command Setup**: Run one script and you are ready to go.
-   🎬 **Interactive Menu**: Choose video quality (1080p, 720p, 480p) or audio format (m4a, mp3).
-   ⚡️ **Fast Downloads**: Uses `aria2c` for accelerated, multi-connection downloads.
-   🎵 **Audio & Video**: Download both video and audio-only files.
-   🖼️ **Metadata & Thumbnails**: Automatically embeds metadata and thumbnails.
-   📁 **Organized**: All downloads are saved to the `storage/shared/YouTube` folder.

## Installation

Just copy and paste this single command into your Termux terminal. It will automatically download the repository and run the setup script.

```bash
pkg update -y && pkg upgrade -y && pkg install git -y && git clone https://github.com/currentvai/Curvidar.git && cd Curvidar && chmod +x setup.sh && ./setup.sh

This command will handle everything from cloning the repository to setting up the tools.
How to Use
After the setup is complete, follow these simple steps:
Open the YouTube app.
Find the video you want to download.
Tap the Share button.
From the app list, select Termux.
An interactive menu will appear in Termux. Choose your desired format.
The download will start automatically in your storage/shared/YouTube folder.
Disclaimer
This tool is for personal and educational use only. Please respect the copyright of content creators. The developer is not responsible for any misuse of this script.
License
This project is licensed under the MIT License.

**Developed by Current Vai ♚.**

Copyright (c) 2024 Current Vai ♚
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
