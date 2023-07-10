#!/bin/sh

printf "### Updating system..."
sudo pacman -Syu
printf "### Install building tools..."
sudo pacman -S git gcc make pkg-config
printf "### Install mutimedia tools..."
sudo pacman -S ffmpeg mpv yt-dlp sxiv mpd
printf "### Installing system monitoring tools..."
sudo pacman -S htop
printf "### Installing general apps..."
sudo pacman -S sxhkd xdotool maim neovim firefox xclip thunar
printf "### Installing rofi..."
sudo pacman -S rofi

printf "### Installing & setting suckless..."
mkdir -p .config/suckless
cd .config/suckless
## dwm-flexipatch
git clone --depth=1 https://github.com/bakkeby/dwm-flexipatch.git
## sl-status
git clone --depth=1 https://git.suckless.org/slstatus
## dmenu-flexipatch
git clone --depth=1 https://github.com/bakkeby/dmenu-flexipatch.git
## themes for suckless software
git clone --depth=1 https://github.com/plasmoduck/themes.git
su
touch /usr/share/xsessions/dwm.desktop
echo "[Desktop Entry]" >> /usr/share/xsessions/dwm.desktop
echo "Encoding=UTF-8" >> /usr/share/xsessions/dwm.desktop
echo "Name=dwm" >> /usr/share/xsessions/dwm.desktop
echo "Comment=Dynamic window manager" >> /usr/share/xsessions/dwm.desktop
echo "Exec=dwm" >> /usr/share/xsessions/dwm.desktop
echo "Type=XSession" >> /usr/share/xsessions/dwm.desktop
su ahmad
cd

printf "### Installing sddm..."
sudo pacman -S sddm
sudo systemctl enable sddm.service

